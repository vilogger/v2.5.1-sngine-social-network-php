<li class="dropdown js_live-notifications">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-bell fa-lg"></i>
        <span class="label {if $user->_data['user_live_notifications_counter'] == 0}hidden{/if}">
            {$user->_data['user_live_notifications_counter']}
        </span>
    </a>
    <div class="dropdown-menu dropdown-widget with-arrow js_dropdown-keepopen">
        <div class="dropdown-widget-header">
            {__("Notifications")}

            <label class="switch sm pull-right flip" for="notifications_sound">
                <input type="checkbox" class="js_notifications-sound-toggle" name="notifications_sound" id="notifications_sound" {if $user->_data['notifications_sound']}checked{/if}>
                <span class="slider round"></span>
            </label>
            <div class="pull-right flip mr5 fw-normal">
                {__("Alert Sound")}
            </div>
        </div>
        <div class="dropdown-widget-body">
            <div class="js_scroller" style="height: 280px;">
                {if count($user->_data['notifications']) > 0}
                    <ul>
                        {foreach $user->_data['notifications'] as $notification}
                        {include file='__feeds_notification.tpl'}
                        {/foreach}
                    </ul>
                {else}
                    <p class="text-center text-muted mt10">
                        {__("No notifications")}
                    </p>
                {/if}
            </div>
        </div>
        <a class="dropdown-widget-footer" href="{$system['system_url']}/notifications">{__("See All")}</a>
    </div>
</li>