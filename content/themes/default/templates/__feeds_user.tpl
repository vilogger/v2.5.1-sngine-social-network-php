{if $_parent == "profile"}<li class="col-sm-12 col-md-6"><div class="data-container-wrapper">{else}<li class="feeds-item" data-id="{$_user['id']}">{/if}
    <div class="data-container {if $_small}small{/if}">
        <a href="{$system['system_url']}/{$_user['user_name']}{if $_search}?ref=qs{/if}">
            <img class="data-avatar" src="{$_user['user_picture']}" alt="{$_user['user_firstname']} {$_user['user_lastname']}">
        </a>
        <div class="data-content">
            <div class="pull-right flip">
                {if $_connection == "request"}
                <div class="btn btn-primary js_friend-accept" data-uid="{$_user['user_id']}">{__("Confirm")}</div>
                <div class="btn btn-default js_friend-decline" data-uid="{$_user['user_id']}">{__("Delete Request")}</div>

                {elseif $_connection == "add"}
                <div class="btn btn-success btn-sm js_friend-add" data-uid="{$_user['user_id']}">
                    <i class="fa fa-user-plus"></i> {if $_tpl != "list"}{__("Add")}{else}{__("Add Friend")}{/if}
                </div>

                {elseif $_connection == "cancel"}
                <div class="btn btn-default btn-sm js_friend-cancel" data-uid="{$_user['user_id']}">
                    <i class="fa fa-user-plus"></i> {__("Friend Request Sent")}
                </div>
                
                {elseif $_connection == "remove"}
                <div class="btn btn-default btn-delete js_friend-remove" data-uid="{$_user['user_id']}">
                    <i class="fa fa-check fa-fw"></i> {__("Friends")}
                </div>

                {elseif $_connection == "follow"}
                <button type="button" class="btn btn-default js_follow" data-uid="{$_user['user_id']}">
                    <i class="fa fa-rss"></i>
                    {__("Follow")}
                </button>

                {elseif $_connection == "unfollow"}
                <button type="button" class="btn btn-default js_unfollow" data-uid="{$_user['user_id']}">
                    <i class="fa fa-check"></i>
                    {__("Following")}
                </button>

                {elseif $_connection == "blocked"}
                <div class="btn btn-danger js_unblock-user" data-uid="{$_user['user_id']}">
                    <i class="fa fa-trash fa-fw"></i> {__("Unblock")}
                </div>

                {elseif $_connection == "page_invite"}
                <div class="btn btn-info btn-sm js_page-invite" data-id={$_user['node_id']} data-uid="{$_user['user_id']}">
                    <i class="fa fa-user-plus"></i> {__("Invite")}
                </div>

                {elseif $_connection == "group_invite"}
                <div class="btn btn-info btn-sm js_group-invite" data-id={$_user['node_id']} data-uid="{$_user['user_id']}">
                    <i class="fa fa-user-plus"></i> {__("Add")}
                </div>

                {elseif $_connection == "group_request"}
                <div class="btn btn-primary js_group-request-accept" data-id={$_user['node_id']} data-uid="{$_user['user_id']}">{__("Approve")}</div>
                <div class="btn btn-danger js_group-request-decline" data-id={$_user['node_id']} data-uid="{$_user['user_id']}">{__("Decline")}</div>

                {elseif $_connection == "event_invite"}
                <div class="btn btn-info btn-sm js_event-invite" data-id={$_user['node_id']} data-uid="{$_user['user_id']}">
                    <i class="fa fa-user-plus"></i> {__("Invite")}
                </div>
                {/if}
            </div>
            <div>
                <span class="name js_user-popover" data-uid="{$_user['user_id']}">
                    <a href="{$system['system_url']}/{$_user['user_name']}{if $_search}?ref=qs{/if}">{$_user['user_firstname']} {$_user['user_lastname']}</a>
                </span>
                {if $_user['user_verified']}
                    <i data-toggle="tooltip" data-placement="top" title='{__("Verified User")}' class="fa fa-check-circle fa-fw verified-badge"></i>
                {/if}
                {if $_user['user_subscribed']}
                    <i data-toggle="tooltip" data-placement="top" title='{__("Pro User")}' class="fa fa-bolt fa-fw pro-badge"></i>
                {/if}
            </div>
            {if $_connection != "me" && $_user['mutual_friends_count'] > 0}
                <div>
                    <span class="text-underline" data-toggle="modal" data-url="users/mutual_friends.php?uid={$_user['user_id']}">{$_user['mutual_friends_count']} {__("mutual friends")}</span>
                </div>
            {/if}
        </div>
    </div>
{if $_parent == "profile"}</div></li>{else}</li>{/if}