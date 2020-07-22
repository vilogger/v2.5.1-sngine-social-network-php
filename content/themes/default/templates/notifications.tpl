{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="container mt20 offcanvas">
    <div class="row">

        <!-- side panel -->
        <div class="col-xs-12 visible-xs-block offcanvas-sidebar">
            {include file='_sidebar.tpl'}
        </div>
        <!-- side panel -->

        <div class="col-xs-12 offcanvas-mainbar">
            <div class="row">
                <!-- left panel -->
                <div class="col-sm-8">
                    <!-- notifications -->
                    <div class="panel panel-default">
                        <div class="panel-heading light">
                            <div class="mt5">
                                <strong>{__("Your Notifications")}</strong>
                            </div>
                        </div>
                        <div class="panel-body">
                            <ul>
                                {foreach $user->_data['notifications'] as $notification}
                                {include file='__feeds_notification.tpl'}
                                {/foreach}
                            </ul>

                            {if count($user->_data['notifications']) >= $system['max_results']}
                            <!-- see-more -->
                            <div class="alert alert-info see-more js_see-more" data-get="notifications">
                                <span>{__("See More")}</span>
                                <div class="loader loader_small x-hidden"></div>
                            </div>
                            <!-- see-more -->
                            {/if}

                        </div>
                    </div>
                    <!-- notifications -->
                </div>
                <!-- left panel -->

                <div class="col-sm-4">
                {include file='_ads.tpl'}
                {include file='_widget.tpl'}
                </div>
            </div>
        </div>

    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}