/**
 * admin js
 * 
 * @package Sngine
 * @author Zamblek
 */

// initialize API URLs
api['admin/delete']  = ajax_path+"admin/delete.php";
api['admin/test']  = ajax_path+"admin/test.php";
api['admin/verify']  = ajax_path+"admin/verify.php";
api['admin/withdraw']  = ajax_path+"admin/withdraw.php";


$(function() {

	// run DataTable
    $('.js_dataTable').DataTable();


    // run metisMenu
    $(".js_metisMenu").metisMenu();


    // run colorpicker plugin
    $('.js_colorpicker').colorpicker();


    // run admin deleter
    $('body').on('click', '.js_admin-deleter', function () {
        var handle = $(this).data('handle');
        var id = $(this).data('id');
        var node = $(this).data('node');
        confirm(__['Delete'], __['Are you sure you want to delete this?'], function() {
            $.post(api['admin/delete'], {'handle': handle, 'id': id, 'node': node}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    window.location.reload();
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });


    // run admin tester
    $('body').on('click', '.js_admin-tester', function () {
        var _this = $(this);
        var _parent = _this.parents('form');
        var error =  _parent.find('.alert.alert-danger');
        var success =  _parent.find('.alert.alert-success');
        var handle = _this.data('handle');
        _this.button('loading');
        $.post(api['admin/test'], {'handle': handle}, function(response) {
            _this.button('reset');
            /* handle response */
            if(response.error) {
                if(success.is(":visible")) success.hide(); // hide previous alert
                error.html(response.message).slideDown();
            } else if(response.success) {
                if(error.is(":visible")) error.hide(); // hide previous alert
                success.html(response.message).slideDown();
            } else {
                eval(response.callback);
            }
        }, 'json')
        .fail(function() {
            _this.button('reset');
            /* handle error */
            if(success.is(":visible")) success.hide(); // hide previous alert
            error.html(__['There is something that went wrong!']).slideDown();
        });
    });


    // run admin verify & unverify
    $('body').on('click', '.js_admin-verify', function () {
        var handle = $(this).data('handle');
        var id = $(this).data('id');
        confirm(__['Verify'], __['Are you sure you want to verify this request?'], function() {
            $.post(api['admin/verify'], {'handle': handle, 'id': id}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    window.location.reload();
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });
    $('body').on('click', '.js_admin-unverify', function () {
        var id = $(this).data('id');
        confirm(__['Decline'], __['Are you sure you want to decline this request?'], function() {
            $.post(api['admin/verify'], {'handle': 'decline', 'id': id}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    window.location.reload();
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });


    // run admin withdraw
    $('body').on('click', '.js_admin-withdraw', function () {
        var handle = $(this).data('handle');
        var id = $(this).data('id');
        if(handle == "approve") {
            var _title = __['Mark as Paid'];
            var _message = __['Are you sure you want to approve this request?'];
        } else {
            var _title = __['Decline'];
            var _message = __['Are you sure you want to decline this request?'];
        }
        confirm(_title, _message, function() {
            $.post(api['admin/withdraw'], {'handle': handle, 'id': id}, function(response) {
                /* check the response */
                if(response.callback) {
                    eval(response.callback);
                } else {
                    window.location.reload();
                }
            }, 'json')
            .fail(function() {
                modal('#modal-message', {title: __['Error'], message: __['There is something that went wrong!']});
            });
        });
    });


    // handle input dependencies
    /* custom fields */
    $('#js_field-type').on('change', function() {
        if($(this).val() == "selectbox") {
            $('#js_select-options').fadeIn();
        } else {
            $('#js_select-options').hide();
        }
    });


});