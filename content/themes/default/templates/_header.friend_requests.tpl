<li class="dropdown js_live-requests">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-users fa-lg"></i>
        <span class="label {if $user->_data['user_live_requests_counter'] == 0}hidden{/if}">
            {$user->_data['user_live_requests_counter']}
        </span>
    </a>
    <div class="dropdown-menu dropdown-widget with-arrow js_dropdown-keepopen">
        <div class="dropdown-widget-header">
            {__("Friend Requests")}
        </div>
        <div class="dropdown-widget-body">
            <div class="js_scroller">
                {if count($user->_data['friend_requests']) > 0}
                    <ul>
                        {foreach $user->_data['friend_requests'] as $_user}
                        {include file='__feeds_user.tpl' _connection="request"}
                        {/foreach}
                    </ul>
                {else}
                    <p class="text-center text-muted mt10">
                        {__("No new requests")}
                    </p>
                {/if}
                
                <!-- People You May Know -->
                <div class="title">
                    {__("People You May Know")}
                </div>
                
                {if count($user->_data['new_people']) > 0}
                    <ul>
                        {foreach $user->_data['new_people'] as $_user}
                        {include file='__feeds_user.tpl' _connection="add"}
                        {/foreach}
                    </ul>
                {else}
                    <p class="text-center text-muted mt10">
                        {__("No people available")}
                    </p>
                {/if}
                <!-- People You May Know -->
            </div>
        </div>
        <a class="dropdown-widget-footer" href="{$system['system_url']}/people/friend_requests">{__("See All")}</a>
    </div>
</li>