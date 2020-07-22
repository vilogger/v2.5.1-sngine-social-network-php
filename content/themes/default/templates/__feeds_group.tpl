{if !($_tpl == "profile_groups" || $_tpl == "list")}
    <li class="col-md-3 col-sm-6">
        <div class="box">
            <a class="box-picture" href="{$system['system_url']}/groups/{$_group['group_name']}" style="background-image:url('{$_group['group_picture']}');"></a>
            <div class="box-content">
                <a href="{$system['system_url']}/groups/{$_group['group_name']}" class="title">
                    {$_group['group_title']}
                </a>
                <div class="text clearfix">
                    <div class="pull-right flip">
                        {if $_group['i_joined'] == "approved"}
                            <button type="button" class="btn btn-default btn-delete js_leave-group" data-id="{$_group['group_id']}" data-privacy="{$_group['group_privacy']}">
                                <i class="fa fa-check"></i>
                                {__("Joined")}
                            </button>
                        {elseif $_group['i_joined'] == "pending"}
                            <button type="button" class="btn btn-default btn-delete js_leave-group" data-id="{$_group['group_id']}" data-privacy="{$_group['group_privacy']}">
                                <i class="fa fa-clock-o"></i>
                                {__("Pending")}
                            </button>
                        {else}
                            <button type="button" class="btn btn-success js_join-group" data-id="{$_group['group_id']}" data-privacy="{if $user->_data['user_id'] == $_group['group_admin']}public{else}{$_group['group_privacy']}{/if}">
                                <i class="fa fa-user-plus"></i>
                                {__("Join")}
                            </button>
                        {/if}
                    </div>
                    <div>
                        {$_group['group_members']} {__("Members")}
                    </div>
                </div>
            </div>
        </div>
    </li>
{else}
    {if $_tpl == "profile_groups"}<li class="col-sm-12 col-md-6"><div class="data-container-wrapper">{else}<li class="feeds-item">{/if}
        <div class="data-container {if $_small}small{/if}">
            <a href="{$system['system_url']}/groups/{$_group['group_name']}{if $_search}?ref=qs{/if}">
                <img class="data-avatar" src="{$_group['group_picture']}" alt="{$_group['group_title']}">
            </a>
            <div class="data-content">
                <div class="pull-right flip">
                    {if $_group['i_joined'] == "approved"}
                        <button type="button" class="btn btn-default btn-delete js_leave-group" data-id="{$_group['group_id']}" data-privacy="{$_group['group_privacy']}">
                            <i class="fa fa-check"></i>
                            {__("Joined")}
                        </button>
                    {elseif $_group['i_joined'] == "pending"}
                        <button type="button" class="btn btn-default btn-delete js_leave-group" data-id="{$_group['group_id']}" data-privacy="{$_group['group_privacy']}">
                            <i class="fa fa-clock-o"></i>
                            {__("Pending")}
                        </button>
                    {else}
                        <button type="button" class="btn btn-success js_join-group" data-id="{$_group['group_id']}" data-privacy="{if $user->_data['user_id'] == $_group['group_admin']}public{else}{$_group['group_privacy']}{/if}">
                            <i class="fa fa-user-plus"></i>
                            {__("Join")}
                        </button>
                    {/if}
                </div>
                <div>
                    <span class="name">
                        <a href="{$system['system_url']}/groups/{$_group['group_name']}{if $_search}?ref=qs{/if}">{$_group['group_title']}</a>
                    </span>
                    <div>{$_group['group_members']} {__("Members")}</div>
                </div>
            </div>
        </div>
    {if $_tpl == "profile_groups"}</div></li>{else}</li>{/if}
{/if}