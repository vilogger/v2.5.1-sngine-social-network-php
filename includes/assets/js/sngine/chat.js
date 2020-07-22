/**
 * chat js
 * 
 * @package Sngine
 * @author Zamblek
 */

// initialize API URLs
api['chat/initialize'] = ajax_path+"chat/initialize.php";
api['chat/live'] = ajax_path+"chat/live.php";
api['chat/settings'] = ajax_path+"users/settings.php?edit=chat";
api['messages/post'] = ajax_path+"chat/post.php";
api['messages/get'] = ajax_path+"chat/get.messages.php";
api['conversation/check'] = ajax_path+"chat/check.conversation.php";
api['conversation/get'] = ajax_path+"chat/get.conversation.php";
api['conversation/reaction'] = ajax_path+"chat/reaction.php";


// reconstruct chat-widgets
function reconstruct_chat_widgets() {
    if($(window).width() < 970) {
        return;
    }
    $('.chat-widget').each(function(index) {
        $(this).attr('style', '');
        offset = (index*200) + (index*10) + 10;
        if($(this).prevAll('.chat-box.opened').length > 0) {
            offset += $(this).prevAll('.chat-box.opened').length*100;
        }
        if($('html').attr('dir') == 'RTL') {
            $(this).css('left', offset);
        } else {
            $(this).css('right', offset);
        }
    });
}


// chat box
function chat_box(ids, name, conversation_id, multiple, name_list) {
    /* open the #chat_key */
    var chat_key_value = 'chat_'+ids;
    var chat_key = '#' + chat_key_value;
    /* check if this #chat_key already exists */
    if($(chat_key).length == 0) {
        /* construct a new one */
        $('body').append(render_template('#chat-box', {'chat_key_value': chat_key_value, 'ids': ids, 'name': name, 'conversation_id': conversation_id, 'multiple': multiple, 'name_list': name_list}));
        $(chat_key).find('.chat-widget-content').toggle();
        $(chat_key).find('textarea').focus();
        /* initialize the plugins */
        initialize();
        /* reconstruct chat-widgets */
        reconstruct_chat_widgets();
        /* get conversation messages */
        if(conversation_id == false) {
            /* ids in this case will be just a single number */
            var data = {'ids': ids};
        } else {
            var data = {'ids': ids, 'conversation_id': conversation_id};
        }
        $.getJSON(api['messages/get'], data, function(response) {
            /* check the response */
            if(!response) return;
            if(response.callback) {
                eval(response.callback);
                /* remove the chat-box */
                $(chat_key).remove();
            } else {
                if(response.conversation_id) {
                    $(chat_key).attr("data-cid", response.conversation_id);
                }
                if(response.user_online !== undefined && response.user_online) {
                    $(chat_key).find(".js_chat-box-status").removeClass("fa-user-secret").addClass("fa-circle");
                }
                if(response.messages) {
                    $(chat_key).find(".js_scroller:first").html(response.messages).slimScroll({scrollTo : $(chat_key).prop("scrollHeight") + "px"});
                }
            }
        })
        .fail(function() {
            /* remove the chat-box */
            $(chat_key).remove();
            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
        });
    } else {
        /* open chat-box with that chat_key that already exists if not opened */
        if(!$(chat_key).hasClass('opened')) {
            $(chat_key).addClass('opened').find('.chat-widget-content').toggle();
        }
        $(chat_key).find('textarea').focus();
        /* reconstruct chat-widgets */
        reconstruct_chat_widgets();
    }
}


// chat heartbeat
function chat_heartbeat() {
    /* check if chat disabled */
    if(!chat_enabled && window.location.pathname.indexOf("messages") == -1) return;
    /* prepare client opened chat boxes with its last messages */
    var chat_boxes_opened_client = {}; // we use "objects" because JS don't support user-indexed array ;)
    $.each($('.chat-box:not(.fresh)'), function(i,chat_box) {
        if(!$(chat_box).data('sending')) {
            chat_boxes_opened_client[$(chat_box).data('cid')] = $(chat_box).find('.conversation:last').attr('id'); // object = {"cid": "last_message", ....}
        }
    });
    /* check if messages page is opened & there is a loaded converstaion */
    if(window.location.pathname.indexOf("messages") != -1 && $('.panel-messages').data('cid') !== undefined) {
        /* add the current loaded converstion */
        var opened_thread = {};
        if(!$('.panel-messages').data('sending')) {
            opened_thread['conversation_id'] = $('.panel-messages').data('cid');
            opened_thread['last_message_id'] = $('.panel-messages').find('.conversation:last').attr('id');
        }
        /* prepare data */
        var data = {'chat_enabled': $('body').data('chat-enabled'), 'chat_boxes_opened_client': JSON.stringify(chat_boxes_opened_client), 'opened_thread': JSON.stringify(opened_thread)};
    } else {
        /* prepare data */
        var data = {'chat_enabled': $('body').data('chat-enabled'), 'chat_boxes_opened_client': JSON.stringify(chat_boxes_opened_client)};
    }
    /* post to the server and get updates */
    $.post(api['chat/live'], data, function(response) {
        if(response.callback) {
            eval(response.callback);
        } else {
            /* [1] [update] master chat widget (online users) */
            if(response.master) {
                $("body").attr("data-chat-enabled", response.master.chat_enabled);
                $(".js_chat-widget-master").find(".chat-widget-head").html(response.master.head);
                $(".js_chat-widget-master").find(".js_scroller").html(response.master.content);
                $(".chat-sidebar-content").find(".js_scroller").html(response.master.sidebar);
                $('.chat-sidebar-filter').keyup();
            }
            /* [2] [get] closed chat boxes */
            if(response.chat_boxes_closed !== undefined) {
                $.each(response.chat_boxes_closed, function(i,conversation) {
                    $('.chat-box[data-cid="'+conversation+'"]').remove();
                });
                /* reconstruct chat-widgets */
                reconstruct_chat_widgets();
                
            }
            /* [3] [get] opened chat boxes */
            if(response.chat_boxes_opened) {
                $.each(response.chat_boxes_opened, function(i,conversation) {
                    chat_box(conversation.ids, conversation.name, conversation.conversation_id, conversation.multiple_recipients, conversation.name_list);
                });
            }
            /* [4] [get] updated chat boxes */
            if(response.chat_boxes_updated) {
                
                $.each(response.chat_boxes_updated, function(i,conversation) {
                    /* check single user's chat status (online|offline) */
                    if(!conversation['multiple_recipients']) {
                        /* update single user's chat status */
                        if(conversation['user_online']) {
                            $("#chat_"+conversation['ids']).find(".js_chat-box-status").removeClass("fa-user-secret").addClass("fa-circle");
                        } else {
                            $("#chat_"+conversation['ids']).find(".js_chat-box-status").removeClass("fa-circle").addClass("fa-user-secret");
                        }
                    }
                    if(conversation['messages']) {
                        if(window.location.pathname.indexOf("messages") == -1 || $('.panel-messages[data-cid="'+conversation['conversation_id']+'"]').length == 0) {
                            var chat_box_widget = $("#chat_"+conversation['ids']);
                            chat_box_widget.find(".js_scroller:first ul").append(conversation['messages']);
                            chat_box_widget.find(".js_scroller:first").slimScroll({scrollTo : chat_box_widget.find(".js_scroller:first").prop("scrollHeight") + "px"});
                            if(!conversation['is_me']) {
                                if(!chat_box_widget.hasClass("opened")) {
                                    chat_box_widget.addClass("new").find(".js_chat-box-label").text(conversation['messages_count']);
                                }
                                $("#chat_sound")[0].play();
                            }
                        }
                    }
                });
            }
            /* [5] [get] new chat boxes */
            if(response.chat_boxes_new) {
                $.each(response.chat_boxes_new, function(i,conversation) {
                    if(!(window.location.pathname.indexOf("messages") != -1 && $('.panel-messages[data-cid="'+conversation['conversation_id']+'"]').length > 0)) {
                        chat_box(conversation.ids, conversation.name, conversation.conversation_id, conversation.multiple_recipients, conversation.name_list);
                        $("#chat_sound")[0].play();
                    }
                });
            }
            /* [6] [get] updated thread */
            if(response.thread_updated) {
                if(window.location.pathname.indexOf("messages") != -1) {
                    var converstaion_widget = $('.panel-messages[data-cid="'+response.thread_updated['conversation_id']+'"]');
                    if(converstaion_widget.length > 0) {
                        converstaion_widget.find(".js_scroller:first ul").append(response.thread_updated['messages']);
                        converstaion_widget.find(".js_scroller:first").slimScroll({scrollTo : converstaion_widget.find(".js_scroller:first").prop("scrollHeight") + "px"});
                        $("#chat_sound")[0].play();
                    }   
                }
            }
        }
        setTimeout('chat_heartbeat();',min_chat_heartbeat);
    }, 'json');
}


$(function() {

    // initialize chat but not messages
    if(chat_enabled) {
        $.post(api['chat/initialize'], function(response) {
            /* check the response */
            if(!response) return;
            /* check if there is a callback */
            if(response.callback) {
                eval(response.callback);
            } else {
                $.each(response, function(i,conversation) {
                    chat_box(conversation.ids, conversation.name, conversation.conversation_id, conversation.multiple_recipients, conversation.name_list);
                });
            }
        }, 'json');
    }
    
    // start chat heartbeat
    chat_heartbeat();

    // start new chat-box
    $('body').on('click', '.js_chat-start', function(e) {
        /* get data from (header conversation feeds || master online widget) */
        /* mandatory  */
        var uid = $(this).data('uid');
        var name = $(this).data('name');
        /* optional (case: conversation feeds) */
        var conversation_id = $(this).data('cid') || false;
        var multiple = ($(this).data('multiple') == "true")? true: false;
        var name_list = $(this).data('name-list') || name;
        /* check if (create a new conversation || load previous conversation) */
        if(uid === undefined) {
            if(!chat_enabled || $(window).width() < 970) { // Desktops (≥992px)
                return;
            } else {
                e.preventDefault();
                /* open fresh chat-box */
                /* check if there is any fresh chat-box already exists */
                if($('.chat-box.fresh').length == 0) {
                    /* construct a new one */
                    $('body').append(render_template('#chat-box-new'));
                    $('.chat-box.fresh').find('.chat-widget-content').toggle();
                    /* initialize the main plugins */
                    initialize();
                    /* reconstruct chat-widgets */
                    reconstruct_chat_widgets();
                } else {
                    /* open fresh chat-box that already exists if not opened */
                    if(!$('.chat-box.fresh').hasClass('opened')) {
                        $('.chat-box.fresh').addClass('opened');
                        $('.chat-box.fresh').find('.chat-widget-content').toggle();
                    }
                }
            }
        } else {
            /* load previous conversation */
            /* check if the viewer in the messages page & open already conversation */
            if(window.location.pathname.indexOf("messages") != -1 && conversation_id) {
                e.preventDefault();
                $(".js_conversation-container").html('<div class="loader loader_medium pr10"></div>');
                $.getJSON(api['conversation/get'], {'conversation_id': conversation_id}, function(response) {
                    /* check the response */
                    if(response.callback) {
                        eval(response.callback);
                    } else {
                        $(".js_conversation-container").html(response.conversation);
                    }
                })
                .fail(function() {
                    modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
                });
            } else {
                if(!chat_enabled || $(window).width() < 970) { // Desktops (≥992px)
                    if(conversation_id) {
                        return;
                    } else {
                        e.preventDefault();
                        $.getJSON(api['conversation/check'], {'uid': uid}, function(response) {
                            /* check the response */
                            if(!response) return;
                            if(response.callback) {
                                eval(response.callback);
                            } else {
                                if(response.conversation_id) {
                                    window.location = site_path + "/messages/" + response.conversation_id;
                                } else {
                                    window.location = site_path + "/messages/new";
                                }
                            }
                        })
                        .fail(function() {
                            modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
                        });
                    }
                } else {
                    e.preventDefault();
                    /* load chat-box */
                    chat_box(uid, name, conversation_id, multiple, name_list);
                }
            }
        }
    });

    // post message
    $('body').on('keydown', '.js_post-message', function(event) {
        if(event.keyCode == 13 && event.shiftKey == 0) {
            event.preventDefault();
            var _this = $(this);
            var message = _this.val();
            var widget = _this.parents('.chat-widget, .panel-messages');
            var conversation_id = widget.data('cid');
            var attachments = widget.find('.chat-attachments');
            /* check if there is current (sending) process */
            if(widget.data('sending')) {
            	return false;
            }
            /* get photo from widget data */
            var photo = widget.data('photo');
            /* check if message is empty */
            if(is_empty(message) && !photo) {
                return;
            }
            /* check if posting the message to (new || existed) conversation */
            if(widget.hasClass('fresh')) {
                /* post the message to -> a new conversation */
                /* check recipients */
                if(widget.find('.tags li').length == 0) {
                    return;
                }
                /* get recipients */
                var recipients = [];
                $.each(widget.find('.tags li'), function(i,tag) {
                    recipients.push($(tag).data('uid'));
                });
                var data = {'message': message, 'photo': JSON.stringify(photo), 'recipients': JSON.stringify(recipients)};
            } else {
                if(conversation_id === undefined) {
                    /* post the message to -> a new conversation */
                    /* get recipients */
                    var recipients = [];
                    recipients.push(widget.data('uid'));
                    var data = {'message': message, 'photo': JSON.stringify(photo), 'recipients': JSON.stringify(recipients)};
                } else {
                    /* post the message to -> already existed conversation */
                    var data = {'message': message, 'photo': JSON.stringify(photo), 'conversation_id': conversation_id};
                }
            }
            /* add currenet sending process to widget data */
            widget.data('sending', true);
            $.post(api['messages/post'], data, function(response) {
                /* check the response */
                if(!response) return;
                /* check if there is a callback */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    if(widget.hasClass('fresh')) {
                        if(window.location.pathname.indexOf("messages") != -1) {
                            window.location.replace(site_path+'/messages/'+response.conversation_id);
                        } else {
                            widget.remove();
                            chat_box(response.ids, response.name, response.conversation_id, response.multiple_recipients, response.name_list);
                            widget = $('#chat_'+response.ids);
                        }
                    } else {
                        if(conversation_id === undefined) {
                            widget.attr("data-cid", response.conversation_id);
                        }
                        if(window.location.pathname.indexOf("messages") != -1) {
                            /* messages page */
                            _this.focus().val('').height(parseInt(_this.css('line-height'))*3);
                        } else {
                            /* in messages page */
                            _this.focus().val('').height(_this.css('line-height'));
                        }
                    }
                    widget.find(".js_scroller:first ul").append(render_template('#chat-message', {'message': response.message, 'image': response.image, 'id': response.last_message_id, 'time': moment.utc().format("YYYY-MM-DD H:mm:ss")}));
                    widget.find(".js_scroller:first").slimScroll({scrollTo : widget.find(".js_scroller:first").prop("scrollHeight") + "px"});
                    attachments.hide();
                    attachments.find('li.item').remove();
                    widget.removeData('photo')
                    widget.find('.x-form-tools-attach').show();
                    /* remove widget sending data */
            		widget.removeData('sending');
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        }
    });
    /* chat attachment remover */
    $('body').on('click', '.js_chat-attachment-remover', function() {
        var widget = $(this).parents('.chat-widget, .panel-messages');
        var attachments = widget.find('.chat-attachments');
        var item = $(this).parents('li.item');
        /* remove the attachment from widget data */
        widget.removeData('photo')
        /* remove the attachment item */
        item.remove();
        /* hide attachments */
        attachments.hide();
        /* show widget form tools */
        widget.find('.x-form-tools-attach').show();
    });

    // toggle chat-widget
    $('body').on('click', '.chat-widget-head', function() {
        var widget = $(this).parents('.chat-widget');
        /* check if widget is master & chat disabled */
        if(widget.hasClass('js_chat-widget-master') && $('body').attr('data-chat-enabled') != 1) {
            return;
        }
        /* check if close || open */
        if(widget.hasClass('opened')) {
            /* close */
            widget.removeClass('opened');
            /* rearrange chat-widgets if widget is chat-box */
            if(widget.hasClass('chat-box')) {
                widget.nextAll('.chat-box').each(function(index) {
                    var right = parseInt($(this).css('right')) - 100; /* 100px is the increased value in width of opened chat-widget */
                    $(this).css('right', right);
                });
            }
        } else {
            /* open */
            /* rearrange chat-widgets if widget is chat-box */
            if(widget.hasClass('chat-box')) {
                widget.nextAll('.chat-box').each(function(index) {
                    var right = parseInt($(this).css('right')) + 100;
                    $(this).css('right', right);
                });
            }
            widget.addClass('opened');
        }
        /* toggle widget content */
        widget.find('.chat-widget-content').toggle();
        /* scroll to latest message if has class new */
        if(widget.hasClass('new')) {
            widget.find(".js_scroller:first").slimScroll({scrollTo : widget.find(".js_scroller:first").prop("scrollHeight") + "px"});
            widget.removeClass('new');
        }
    });
    // close chat-widget
    $('body').on('click', '.js_chat-box-close', function() {
        var widget = $(this).parents('.chat-widget');
        widget.remove();
        /* reconstruct chat-widgets */
        reconstruct_chat_widgets();
        /* unset from session */
        if(widget.data('cid') !== undefined) {
            $.post(api['conversation/reaction'], {'do': 'close', 'conversation_id': widget.data('cid')}, function(response) {
                if(response.callback) {
                    eval(response.callback);
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        }
    });
    // delete conversation
    $('body').on('click', '.js_delete-conversation', function() {
        confirm(__['Delete Conversation'], __['Are you sure you want to delete this conversation?'], function() {
            $.post(api['conversation/reaction'], {'do': 'delete', 'conversation_id': $('.panel-messages').data('cid')}, function(response) {
                if(response.callback) {
                    eval(response.callback);
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });

    // adjust x-form-tools position for chat-form
    $(document).on('keyup', '.chat-form textarea', function() {
        var scrollHeight = $(this).parent()[0].scrollHeight;
        var clientHeight = $(this).parent()[0].clientHeight;
        var direction = ($('html').attr('dir') === undefined || $('html').attr('dir') == 'LTR')? 'right' : 'left';
        if( scrollHeight > clientHeight ) {
            $(this).parents('.chat-form').find('.x-form-tools').css(direction, '21px'); 
        } else {
            $(this).parents('.chat-form').find('.x-form-tools').css(direction, '7px');
        }
    });
    // reconstruct chat widgets when window load & resize
    $(window).bind("resize", function() {
        reconstruct_chat_widgets();
    });



    $('body').on('keyup', '.chat-sidebar-filter', function(event) {
        var search = $(this).val().toLowerCase();

        $('.chat-sidebar-content ul > li').each(function () {
            var item  = $(this).text().toLowerCase();
            (item.indexOf( search ) != -1) ? $(this).show() : $(this).hide();
        });
    });

    $('.dropdown-menu.dropdown-menu-checkbox > li > a')
    .each(function( index ){
        if ( !$('> .fa', this).length ){
        $(this).prepend('<i class="fa fa-check dropdown-item-check"></i>');
      }else{
        if ( $(this).parent().hasClass('dropdown-item-checkbox') ){
          $('> .fa', this).addClass('dropdown-item-check');
        }
      }
    })
    .click(function(e){
        var item = $(this).parent();
        if ( item.hasClass('dropdown-item-checkbox') )  {
            item.toggleClass('checked');
            var isChecked = item.hasClass('checked') ? 1 : 0;

            if ( item.data('param') ){
                var data = [];
                    data[ item.data('param') ] = isChecked;

                $.post(api['chat/settings'], $.extend({}, data ), function(response) {
                    if(response.success) {
                        if ( item.hasClass('checked') ){
                            $('.chat-sidebar-content').removeClass('chat-sidebar-disabled');
                        }else{
                            $('.chat-sidebar-content').addClass('chat-sidebar-disabled');
                        }

                        $('body').data('chat-enabled', isChecked);

                    }else{
                        modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
                    }
                }, 'json')
                .fail(function() {
                    modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
                });
            }
        }
    });

});