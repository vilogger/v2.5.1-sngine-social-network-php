{strip}

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]><script src="{$system['system_url']}/includes/assets/js/plugins/html5shiv/html5shiv.min.js"></script><![endif]-->

<!-- Initialize -->
<script type="text/javascript">
    /* initialize vars */
    var site_title = "{$system['system_title']}";
    var site_path = "{$system['system_url']}";
    var ajax_path = site_path+"/includes/ajax/";
    var uploads_path = "{$system['system_uploads']}";
    var current_page = "{$page}";
    var secret = "{$secret}";
    var min_data_heartbeat = "{$system['data_heartbeat']*1000}";
    var min_chat_heartbeat = "{$system['chat_heartbeat']*1000}";
    var chat_enabled = {if $system['chat_enabled']}true{else}false{/if};
    var geolocation_enabled = {if $system['geolocation_enabled']}true{else}false{/if};
    var daytime_msg_enabled = {if $daytime_msg_enabled}true{else}false{/if};
    var notifications_sound = {if $user->_data['notifications_sound']}true{else}false{/if};
    var currency = "{$system['system_currency']}";
    var stripe_key = {if $system['stripe_mode'] == "live"}"{$system['stripe_live_publishable']}"{else}"{$system['stripe_test_publishable']}"{/if}
</script>
<script type="text/javascript">
    /* i18n for JS */
    var __ = [];
    __["Describe your item (optional)"] = "{__('Describe your item (optional)')}";
    __["Ask something"] = "{__('Ask something')}";
    __["Verification Requset"] = "{__('Verification Requset')}";
    __["Add Friend"] = "{__('Add Friend')}";
    __["Friends"] = "{__('Friends')}";
    __["Friend Request Sent"] = "{__('Friend Request Sent')}";
    __["Following"] = "{__('Following')}";
    __["Follow"] = "{__('Follow')}";
    __["Pending"] = "{__('Pending')}";
    __["Remove"] = "{__('Remove')}";
    __["Error"] = "{__('Error')}";
    __["Success"] = "{__('Success')}";
    __["Loading"] = "{__('Loading')}";
    __["Like"] = "{__('Like')}";
    __["Unlike"] = "{__('Unlike')}";
    __["Joined"] = "{__('Joined')}";
    __["Join"] = "{__('Join')}";
    __["Going"] = "{__('Going')}";
    __["Interested"] = "{__('Interested')}";
    __["Delete"] = "{__('Delete')}";
    __["Delete Cover"] = "{__('Delete Cover')}";
    __["Delete Picture"] = "{__('Delete Picture')}";
    __["Delete Post"] = "{__('Delete Post')}";
    __["Delete Comment"] = "{__('Delete Comment')}";
    __["Delete Conversation"] = "{__('Delete Conversation')}";
    __["Share Post"] = "{__('Share Post')}";
    __["Report"] = "{__('Report')}";
    __["Block User"] = "{__('Block User')}";
    __["Unblock User"] = "{__('Unblock User')}";
    __["Mark as Available"] = "{__('Mark as Available')}";
    __["Mark as Sold"] = "{__('Mark as Sold')}";
    __["Save Post"] = "{__('Save Post')}";
    __["Unsave Post"] = "{__('Unsave Post')}";
    __["Boost Post"] = "{__('Boost Post')}";
    __["Unboost Post"] = "{__('Unboost Post')}";
    __["Pin Post"] = "{__('Pin Post')}";
    __["Unpin Post"] = "{__('Unpin Post')}";
    __["Verify"] = "{__('Verify')}";
    __["Decline"] = "{__('Decline')}";
    __["Boost"] = "{__('Boost')}";
    __["Unboost"] = "{__('Unboost')}";
    __["Mark as Paid"] = "{__('Mark as Paid')}";
    __["Read more"] = "{__('Read more')}";
    __["Read less"] = "{__('Read less')}";
    __["Monthly Average"] = "{__('Monthly Average')}";
    __["Jan"] = "{__('Jan')}";
    __["Feb"] = "{__('Feb')}";
    __["Mar"] = "{__('Mar')}";
    __["Apr"] = "{__('Apr')}";
    __["May"] = "{__('May')}";
    __["Jun"] = "{__('Jun')}";
    __["Jul"] = "{__('Jul')}";
    __["Aug"] = "{__('Aug')}";
    __["Sep"] = "{__('Sep')}";
    __["Oct"] = "{__('Oct')}";
    __["Nov"] = "{__('Nov')}";
    __["Dec"] = "{__('Dec')}";
    __["Users"] = "{__('Users')}";
    __["Pages"] = "{__('Pages')}";
    __["Groups"] = "{__('Groups')}";
    __["Events"] = "{__('Events')}";
    __["Posts"] = "{__('Posts')}";
    __["Are you sure you want to delete this?"] = "{__('Are you sure you want to delete this?')}";
    __["Are you sure you want to remove your cover photo?"] = "{__('Are you sure you want to remove your cover photo?')}";
    __["Are you sure you want to remove your profile picture?"] = "{__('Are you sure you want to remove your profile picture?')}";
    __["Are you sure you want to delete this post?"] = "{__('Are you sure you want to delete this post?')}";
    __["Are you sure you want to share this post?"] = "{__('Are you sure you want to share this post?')}";
    __["Are you sure you want to delete this comment?"] = "{__('Are you sure you want to delete this comment?')}";
    __["Are you sure you want to delete this conversation?"] = "{__('Are you sure you want to delete this conversation?')}";
    __["Are you sure you want to report this?"] = "{__('Are you sure you want to report this?')}";
    __["Are you sure you want to block this user?"] = "{__('Are you sure you want to block this user?')}";
    __["Are you sure you want to unblock this user?"] = "{__('Are you sure you want to unblock this user?')}";
    __["Are you sure you want to delete your account?"] = "{__('Are you sure you want to delete your account?')}";
    __["Are you sure you want to verify this request?"] = "{__('Are you sure you want to verify this request?')}";
    __["Are you sure you want to decline this request?"] = "{__('Are you sure you want to decline this request?')}";
    __["Are you sure you want to approve this request?"] = "{__('Are you sure you want to approve this request?')}";
    __["There is something that went wrong!"] = "{__('There is something that went wrong!')}";
    __["There is no more data to show"] = "{__('There is no more data to show')}";
    __["This has been shared to your Timeline"] = "{__('This has been shared to your Timeline')}";
</script>
<!-- Initialize -->

<!-- Dependencies Libs [jQuery|Bootstrap|Mustache] -->
<script src="{$system['system_url']}/includes/assets/js/jquery/jquery-3.2.1.min.js" {if !$user->_logged_in}defer{/if}></script>
<script src="{$system['system_url']}/includes/assets/js/bootstrap/bootstrap.min.js" {if !$user->_logged_in}defer{/if}></script>
<script src="{$system['system_url']}/includes/assets/js/mustache/mustache.min.js" {if !$user->_logged_in}defer{/if}></script>
<!-- Dependencies Libs [jQuery|Bootstrap|Mustache] -->

<!-- Dependencies Plugins -->
<script src="{$system['system_url']}/includes/assets/js/plugins/fastclick/fastclick.min.js" {if !$user->_logged_in}defer{/if}></script>

<script src="{$system['system_url']}/includes/assets/js/plugins/jquery.form/jquery.form.min.js" {if !$user->_logged_in}defer{/if}></script>
<script src="{$system['system_url']}/includes/assets/js/plugins/jquery.inview/jquery.inview.min.js" {if !$user->_logged_in}defer{/if}></script>
<script src="{$system['system_url']}/includes/assets/js/plugins/jquery.slimscroll/jquery.slimscroll.min.js" {if !$user->_logged_in}defer{/if}></script>

<script src="{$system['system_url']}/includes/assets/js/plugins/autosize/autosize.min.js" {if !$user->_logged_in}defer{/if}></script>
<script src="{$system['system_url']}/includes/assets/js/plugins/readmore/readmore.min.js" {if !$user->_logged_in}defer{/if}></script>
<script src="{$system['system_url']}/includes/assets/js/plugins/moment/moment-with-locales.min.js" {if !$user->_logged_in}defer{/if}></script>

<script src="{$system['system_url']}/includes/assets/js/plugins/mediaelementplayer/mediaelement-and-player.min.js" {if !$user->_logged_in}defer{/if}></script>
<link rel="stylesheet" type='text/css' href="{$system['system_url']}/includes/assets/js/plugins/mediaelementplayer/mediaelementplayer.min.css">

{if $user->_logged_in}
    {if $system['geolocation_enabled']}
        <script src="{$system['system_url']}/includes/assets/js/plugins/jquery.geocomplete/jquery.geocomplete.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?libraries=places&key={$system['geolocation_key']}"></script>
    {/if}
    
    <script src="{$system['system_url']}/includes/assets/js/plugins/bootstrap.select/bootstrap-select.min.js"></script>
    <link rel="stylesheet" type='text/css' href="{$system['system_url']}/includes/assets/js/plugins/bootstrap.select/bootstrap-select.min.css">

    <script src="{$system['system_url']}/includes/assets/js/plugins/bootstrap.datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <link rel="stylesheet" type='text/css' href="{$system['system_url']}/includes/assets/js/plugins/bootstrap.datetimepicker/bootstrap-datetimepicker.min.css">

    <script src="{$system['system_url']}/includes/assets/js/plugins/noty/noty.min.js"></script>
    <link rel="stylesheet" type='text/css' href="{$system['system_url']}/includes/assets/js/plugins/noty/noty.css">

    <script src="{$system['system_url']}/includes/assets/js/plugins/magnific-popup/magnific-popup.min.js"></script>
    <link rel="stylesheet" type='text/css' href="{$system['system_url']}/includes/assets/js/plugins/magnific-popup/magnific-popup.css">

    <script src="{$system['system_url']}/includes/assets/js/plugins/tinymce/tinymce.min.js"></script>
    
    <script src="https://checkout.stripe.com/checkout.js"></script>
{/if}

{if $system['reCAPTCHA_enabled']}
<script src='https://www.google.com/recaptcha/api.js' {if !$user->_logged_in}defer{/if}></script>
{/if}
<!-- Dependencies Plugins -->

<!-- Sngine [JS] -->
<script src="{$system['system_url']}/includes/assets/js/sngine/core.js" {if !$user->_logged_in}defer{/if}></script>
{if $user->_logged_in}
    <script src="{$system['system_url']}/includes/assets/js/sngine/user.js"></script>
    <script src="{$system['system_url']}/includes/assets/js/sngine/post.js"></script>
    <script src="{$system['system_url']}/includes/assets/js/sngine/chat.js"></script>
{/if}
<!-- Sngine [JS] -->

{if $page == "admin"}
    <!-- Dependencies Plugins -->
    <script src="{$system['system_url']}/includes/assets/js/plugins/bootstrap.colorpicker/bootstrap-colorpicker.min.js"></script>
    <link rel="stylesheet" type='text/css' href="{$system['system_url']}/includes/assets/js/plugins/bootstrap.colorpicker/bootstrap-colorpicker.min.css">

    <script src="{$system['system_url']}/includes/assets/js/plugins/metisMenu/metisMenu.min.js"></script>
    <link rel="stylesheet" type='text/css' href="{$system['system_url']}/includes/assets/js/plugins/metisMenu/metisMenu.min.css">

    <script src="{$system['system_url']}/includes/assets/js/plugins/dataTables/jquery.dataTables.min.js"></script>
    <script src="{$system['system_url']}/includes/assets/js/plugins/dataTables/dataTables.bootstrap.min.js"></script>
    <link rel="stylesheet" type='text/css' href="{$system['system_url']}/includes/assets/js/plugins/dataTables/dataTables.bootstrap.min.css">
    <!-- Dependencies Plugins [JS] -->

    <!-- Sngine [JS] -->
    <script src="{$system['system_url']}/includes/assets/js/sngine/admin.js"></script>
    <!-- Sngine [JS] -->

    <!-- Admin Charts -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    {if $view == "dashboard"}
        <script>
           $(function () {
            Highcharts.setOptions();
            $('#admin-chart-dashboard').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: __["Monthly Average"]
                },
                xAxis: {
                    categories: [
                        __["Jan"],
                        __["Feb"],
                        __["Mar"],
                        __["Apr"],
                        __["May"],
                        __["Jun"],
                        __["Jul"],
                        __["Aug"],
                        __["Sep"],
                        __["Oct"],
                        __["Nov"],
                        __["Dec"]
                    ],
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: "{'Y'|date}"
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{literal}{point.key}{/literal}</span><table>',
                    pointFormat: '<tr><td style="color:{literal}{series.color}{/literal};padding:0">{literal}{series.name}{/literal}: </td>' +
                        '<td style="padding:0"><b>{literal}{point.y}{/literal}</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: [{
                    name: __["Users"],
                    data: [{','|implode:$chart['users']}]

                }, {
                    name: __["Pages"],
                    data: [{','|implode:$chart['pages']}]

                }, {
                    name: __["Groups"],
                    data: [{','|implode:$chart['groups']}]

                }, {
                    name: __["Events"],
                    data: [{','|implode:$chart['events']}]

                }, {
                    name: __["Posts"],
                    data: [{','|implode:$chart['posts']}]

                }]
            });
        });
        </script>
    {/if}
    {if $view == "packages" && $sub_view == "earnings"}
        <script>
           $(function () {
            Highcharts.setOptions();
            $('#admin-chart-earnings').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: __["Monthly Average"]
                },
                xAxis: {
                    categories: [
                        __["Jan"],
                        __["Feb"],
                        __["Mar"],
                        __["Apr"],
                        __["May"],
                        __["Jun"],
                        __["Jul"],
                        __["Aug"],
                        __["Sep"],
                        __["Oct"],
                        __["Nov"],
                        __["Dec"]
                    ],
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: "{'Y'|date}"
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{literal}{point.key}{/literal}</span><table>',
                    pointFormat: '<tr><td style="color:{literal}{series.color}{/literal};padding:0">{literal}{series.name}{/literal}: </td>' +
                        '<td style="padding:0"><b>{literal}{point.y}{/literal}</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: [
                    {foreach $rows as $key => $value}
                        {
                            name: "{$key}",
                            data: [{','|implode:$value['months_sales']}]
                        },
                    {/foreach}
                ]
            });
            
        });
        </script>
    {/if}
    <!-- Admin Charts -->
{/if}

<!-- DayTime Messages -->
{if $page == "index" && $user->_logged_in && $view == ""}
    <script>
        $(function() {
            if(daytime_msg_enabled) {
                var now = new Date();
                var hours = now.getHours();
                if ( hours >= 5 && hours <= 11 ) {
                    $(render_template('#message-morning')).insertAfter('.publisher').fadeIn();
                } else if ( hours >= 12 && hours <= 18 ) {
                    $(render_template('#message-afternoon')).insertAfter('.publisher').fadeIn();
                } else if ( hours >= 19 || hours <= 4 ) {
                    $(render_template('#message-evening')).insertAfter('.publisher').fadeIn();
                }
            }
        });
    </script>
{/if}
<!-- DayTime Messages -->

{/strip}