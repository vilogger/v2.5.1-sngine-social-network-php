{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="container {if $user->_logged_in}offcanvas{/if}">
    <div class="row">

        <!-- left panel -->
        {if $user->_logged_in}
            <div class="hidden-sm col-md-2 offcanvas-sidebar mt20">
                {include file='_sidebar.tpl'}
            </div>
        {/if}
        <!-- left panel -->

        <!-- right panel -->
        <div class="col-xs-12 {if $user->_logged_in}col-md-10 offcanvas-mainbar{/if}">

            <!-- profile-header -->
            <div class="profile-header">
                <!-- profile-cover -->
                <div {if $group['group_cover_id']} class="profile-cover-wrapper js_lightbox" data-id="{$group['group_cover_id']}" data-image="{$system['system_uploads']}/{$group['group_cover']}" data-context="album" {else} class="profile-cover-wrapper" {/if}  {if $group['group_cover']} style="background-image:url('{$system['system_uploads']}/{$group['group_cover']}');" {/if}>
                    {if $user->_data['user_id'] == $group['group_admin']}
                        <div class="profile-cover-change">
                            <i class="fa fa-camera js_x-uploader" data-handle="cover-group" data-id="{$group['group_id']}"></i>
                        </div>
                        <div class="profile-cover-delete {if !$group['group_cover']}x-hidden{/if}">
                            <i class="fa fa-trash js_delete-cover" data-handle="cover-group" data-id="{$group['group_id']}" title='{__("Delete Cover")}'></i>
                        </div>
                        <div class="profile-cover-change-loader">
                            <div class="loader loader_large"></div>
                        </div>
                    {/if}
                </div>
                <!-- profile-cover -->

                <!-- profile-avatar -->
                <div class="profile-avatar-wrapper">
                    <img {if $group['group_picture_id']} class="js_lightbox" data-id="{$group['group_picture_id']}" data-image="{$group['group_picture']}" data-context="album" {/if} src="{$group['group_picture']}" alt="{$group['group_title']}">
                    {if $user->_data['user_id'] == $group['group_admin']}
                        <div class="profile-avatar-change">
                            <i class="fa fa-camera js_x-uploader" data-handle="picture-group" data-id="{$group['group_id']}"></i>
                        </div>
                        <div class="profile-avatar-delete {if $group['group_picture_default']}x-hidden{/if}">
                            <i class="fa fa-trash js_delete-picture" data-handle="picture-group" data-id="{$group['group_id']}" title='{__("Delete Picture")}'></i>
                        </div>
                        <div class="profile-avatar-change-loader">
                            <div class="loader loader_medium"></div>
                        </div>
                    {/if}
                </div>
                <!-- profile-avatar -->

                <!-- profile-name -->
                <div class="profile-name-wrapper">
                    <a href="{$system['system_url']}/groups/{$group['group_name']}">{$group['group_title']}</a>
                    {if $group['group_privacy'] == "public"}
                        <i data-toggle="tooltip" data-placement="top" title='{__("Public Group")}' class="fa fa-globe fa-fw privacy-badge"></i>
                    {elseif $group['group_privacy'] == "closed"}
                        <i data-toggle="tooltip" data-placement="top" title='{__("Closed Group")}' class="fa fa-unlock-alt fa-fw privacy-badge"></i>
                    {elseif $group['group_privacy'] == "secret"}
                        <i data-toggle="tooltip" data-placement="top" title='{__("Secret Group")}' class="fa fa-lock fa-fw privacy-badge"></i>
                    {/if}
                </div>
                <!-- profile-name -->

                <!-- profile-buttons -->
                <div class="profile-buttons-wrapper">
                    {if $group['i_joined'] == "approved"}
                        <button type="button" class="btn btn-default btn-delete js_leave-group" data-id="{$group['group_id']}" data-privacy="{$group['group_privacy']}">
                            <i class="fa fa-check"></i>
                            {__("Joined")}
                        </button>
                    {elseif $group['i_joined'] == "pending"}
                        <button type="button" class="btn btn-default btn-delete js_leave-group" data-id="{$group['group_id']}" data-privacy="{$group['group_privacy']}">
                            <i class="fa fa-clock-o"></i>
                            {__("Pending")}
                        </button>
                    {else}
                        <button type="button" class="btn btn-success js_join-group" data-id="{$group['group_id']}" data-privacy="{if $user->_data['user_id'] == $group['group_admin']}public{else}{$group['group_privacy']}{/if}">
                            <i class="fa fa-user-plus"></i>
                            {__("Join")}
                        </button>
                    {/if}
                    {if $user->_data['user_id'] == $group['group_admin']}
                        <a href="{$system['system_url']}/groups/{$group['group_name']}/settings" class="btn btn-default">
                            <i class="fa fa-cog"></i> {__("Settings")}
                        </a>
                    {else}
                        <button class="btn btn-default js_report" data-handle="group" data-id="{$group['group_id']}">
                            <i class="fa fa-flag"></i> {__("Report")}
                        </button>
                    {/if}
                </div>
                <!-- profile-buttons -->

                <!-- profile-tabs -->
                <div class="profile-tabs-wrapper">
                    <ul class="nav">
                        {if $group['group_privacy'] == "closed" && $group['i_joined'] != "approved" && $group['group_admin'] != $user->_data['user_id']}
                            <li>
                                <a href="{$system['system_url']}/groups/{$group['group_name']}">
                                    {__("About")}
                                </a>
                            </li>
                        {else}
                            <li>
                                <a href="{$system['system_url']}/groups/{$group['group_name']}">
                                    {__("Timeline")}
                                </a>
                            </li>
                            <li class="middle-tabs">
                                <a href="{$system['system_url']}/groups/{$group['group_name']}/photos">
                                    {__("Photos")}
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    {__("More")}
                                    <i class="caret"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="middle-tabs-alt">
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li>
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/albums">{__("Albums")}</a>
                                    </li>
                                    <li>
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/members">{__("Members")}</a>
                                    </li>
                                    {if $group['i_joined'] == "approved"}
                                        <li>
                                            <a href="{$system['system_url']}/groups/{$group['group_name']}/invites">{__("Invite Friends")}</a>
                                        </li>
                                    {/if}
                                </ul>
                            </li>
                        {/if}
                    </ul>
                </div>
                <!-- profile-tabs -->
            </div>
            <!-- profile-header -->

            <!-- profile-content -->
            <div class="row">
                <!-- profile-buttons alt -->
                <div class="col-sm-12">
                    <div class="panel panel-default profile-buttons-wrapper-alt">
                        <div class="panel-body">
                            {if $group['i_joined'] == "approved"}
                                <button type="button" class="btn btn-default btn-delete js_leave-group" data-id="{$group['group_id']}" data-privacy="{$group['group_privacy']}">
                                    <i class="fa fa-check"></i>
                                    {__("Joined")}
                                </button>
                            {elseif $group['i_joined'] == "pending"}
                                <button type="button" class="btn btn-default btn-delete js_leave-group" data-id="{$group['group_id']}" data-privacy="{$group['group_privacy']}">
                                    <i class="fa fa-clock-o"></i>
                                    {__("Pending")}
                                </button>
                            {else}
                                <button type="button" class="btn btn-success js_join-group" data-id="{$group['group_id']}" data-privacy="{if $user->_data['user_id'] == $group['group_admin']}public{else}{$group['group_privacy']}{/if}">
                                    <i class="fa fa-user-plus"></i>
                                    {__("Join")}
                                </button>
                            {/if}

                            <div class="pull-right flip">
                                {if $user->_data['user_id'] == $group['group_admin']}
                                    <a href="{$system['system_url']}/groups/{$group['group_name']}/settings" class="btn btn-default">
                                        <i class="fa fa-cog"></i> {__("Settings")}
                                    </a>
                                {else}
                                    <button class="btn btn-default js_report" data-handle="group" data-id="{$group['group_id']}">
                                        <i class="fa fa-flag"></i> {__("Report")}
                                    </button>
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
                <!-- profile-buttons alt -->

                <!-- view content -->
                {if $view == ""}
                    <!-- right panel -->
                    <div class="col-sm-4 col-md-push-8">
                        <!-- about -->
                        <div class="panel panel-default">
                            <div class="panel-body">
                                {if !is_empty($group['group_description'])}
                                    <div class="about-bio">
                                        {$group['group_description']}
                                    </div>
                                {/if}
                                <ul class="about-list">
                                    <li>
                                        <div class="about-list-item">
                                            {if $group['group_privacy'] == "public"}
                                                <i class="fa fa-globe fa-fw fa-lg"></i>
                                                {__("Public Group")}
                                            {elseif $group['group_privacy'] == "closed"}
                                                <i class="fa fa-unlock-alt fa-fw fa-lg"></i>
                                                {__("Closed Group")}
                                            {elseif $group['group_privacy'] == "secret"}
                                                <i class="fa fa-lock fa-fw fa-lg"></i>
                                                {__("Secret Group")}
                                            {/if}
                                        </div>
                                    </li>
                                    <li>
                                        <div class="about-list-item">
                                            <i class="fa fa-users fa-fw fa-lg"></i>
                                            <a href="{$system['system_url']}/groups/{$group['group_name']}/members">{$group['group_members']} {__("members")}</a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- about -->

                        <!-- invite friends -->
                        {if $group['i_joined'] == "approved" && $group['invites']}
                            <div class="panel panel-default">
                                <div class="panel-heading light no_border">
                                    <div class="pull-right flip">
                                        <small><a href="{$system['system_url']}/groups/{$group['group_name']}/invites">{__("See All")}</a></small>
                                    </div>
                                    <strong class="text-muted">{__("Invite Friends")}</strong>
                                </div>
                                <div class="panel-body ptb5 plr5">
                                    <ul>
                                        {foreach $group['invites'] as $_user}
                                        {include file='__feeds_user.tpl' _connection=$_user["connection"] _small=true}
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        {/if}
                        <!-- invite friends -->

                        <!-- photos -->
                        {if $group['photos']}
                            <div class="panel panel-default panel-photos">
                                <div class="panel-heading">
                                    <a href="{$system['system_url']}/groups/{$group['group_name']}/photos">{__("Photos")}</a>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        {foreach $group['photos'] as $photo}
                                            {include file='__feeds_photo.tpl' _context="photos" _small=true}
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        {/if}
                        <!-- photos -->
                    </div>
                    <!-- right panel -->

                    <!-- left panel -->
                    <div class="col-sm-8 col-md-pull-4">
                        <!-- group requests -->
                        {if $user->_data['user_id'] == $group['group_admin'] && $group['total_requests'] > 0}
                            <div class="alert alert-info">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span>&times;</span></button>
                                <div class="icon"><i class="fa fa-info-circle fa-2x"></i></div>
                                <div class="text middle">
                                    <a href="{$system['system_url']}/groups/{$group['group_name']}/settings/requests" class="alert-link">
                                        {$group['total_requests']} {if $group['total_requests'] == 1}{__("person")}{else}{__("persons")}{/if} {__("wants to join this group")}
                                    </a>
                                </div>
                            </div>
                        {/if}
                        <!-- group requests -->

                        <!-- publisher -->
                        {if $user->_logged_in && $group['i_joined'] == "approved"}
                            {include file='_publisher.tpl' _handle="group" _id=$group['group_id']}
                        {/if}
                        <!-- publisher -->

                        <!-- pinned post -->
                        {if $pinned_post}
                            {include file='_pinned_post.tpl' post=$pinned_post _get="posts_group"}
                        {/if}
                        <!-- pinned post -->

                        <!-- posts -->
                        {include file='_posts.tpl' _get="posts_group" _id=$group['group_id']}
                        <!-- posts -->
                    </div>
                    <!-- left panel -->
                {elseif $view == "photos"}
                    <!-- photos -->
                    <div class="col-xs-12">
                        <div class="panel panel-default panel-photos">
                            <div class="panel-heading with-icon with-nav">
                                <!-- panel title -->
                                <div class="mb20">
                                    <i class="fa fa-picture-o pr5 panel-icon"></i>
                                    <strong>{__("Photos")}</strong>
                                </div>
                                <!-- panel title -->

                                <!-- panel nav -->
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/photos">
                                            <strong class="pr5">{__("Photos")}</strong>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/albums">{__("Albums")}</a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="panel-body">
                                {if count($group['photos']) > 0}
                                    <ul class="row">
                                        {foreach $group['photos'] as $photo}
                                            {include file='__feeds_photo.tpl' _context="photos"}
                                        {/foreach}
                                    </ul>
                                    {if count($group['photos']) >= $system['min_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more js_see-more" data-get="photos" data-id="{$group['group_id']}" data-type='group'>
                                            <span>{__("See More")}</span>
                                            <div class="loader loader_small x-hidden"></div>
                                        </div>
                                        <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$group['group_title']} {__("doesn't have photos")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- photos -->
                {elseif $view == "albums"}
                    <!-- albums -->
                    <div class="col-xs-12">
                        <div class="panel panel-default panel-albums">
                            <div class="panel-heading with-icon with-nav">
                                <!-- panel title -->
                                <div class="mb20">
                                    <i class="fa fa-picture-o pr5 panel-icon"></i>
                                    <strong>{__("Photos")}</strong>
                                </div>
                                <!-- panel title -->

                                <!-- panel nav -->
                                <ul class="nav nav-tabs">
                                    <li>
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="active">
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/albums">
                                            <strong class="pr5">{__("Albums")}</strong>
                                        </a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="panel-body">
                                {if count($group['albums']) > 0}
                                    <ul class="row">
                                        {foreach $group['albums'] as $album}
                                        {include file='__feeds_album.tpl'}
                                        {/foreach}
                                    </ul>
                                    {if count($group['albums']) >= $system['max_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more js_see-more" data-get="albums" data-id="{$group['group_id']}" data-type='group'>
                                            <span>{__("See More")}</span>
                                            <div class="loader loader_small x-hidden"></div>
                                        </div>
                                        <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$group['group_title']} {__("doesn't have albums")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- albums -->
                {elseif $view == "album"}
                    <!-- albums -->
                    <div class="col-xs-12">
                        <div class="panel panel-default panel-albums">
                            <div class="panel-heading with-icon with-nav">
                                <!-- back to albums -->
                                <div class="pull-right flip">
                                    <a href="{$system['system_url']}/groups/{$group['group_name']}/albums" class="btn btn-default btn-sm">
                                        <i class="fa fa-arrow-circle-left"></i> {__("Back to Albums")}
                                    </a>
                                </div>
                                <!-- back to albums -->
                                
                                <!-- panel title -->
                                <div class="mb20">
                                    <i class="fa fa-picture-o pr5 panel-icon"></i>
                                    <strong>{__("Photos")}</strong>
                                </div>
                                <!-- panel title -->

                                <!-- panel nav -->
                                <ul class="nav nav-tabs">
                                    <li>
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="active">
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/albums">
                                            <strong class="pr5">{__("Albums")}</strong>
                                        </a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="panel-body">
                            {include file='_album.tpl'}
                            </div>
                        </div>
                    </div>
                    <!-- albums -->
                {elseif $view == "members"}
                    <!-- members -->
                    <div class="col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading with-icon with-nav">

                                <!-- panel title -->
                                <div class="mb20">
                                    <i class="fa fa-users pr5 panel-icon"></i>
                                    <strong>{__("Members")}</strong>
                                </div>
                                <!-- panel title -->

                                <!-- panel nav -->
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/members">
                                            <strong class="pr5">{__("Members")}</strong>
                                            <span class="label label-info ml5">{$group['group_members']}</span>
                                        </a>
                                    </li>
                                    {if $group['i_joined'] == "approved"}
                                        <li>
                                            <a href="{$system['system_url']}/groups/{$group['group_name']}/invites">
                                                <strong class="pr5">{__("Invites")}</strong>
                                            </a>
                                        </li>
                                    {/if}
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="panel-body">
                                {if $group['group_members'] > 0}
                                    <ul class="row">
                                        {foreach $group['members'] as $_user}
                                        {include file='__feeds_user.tpl' _connection=$_user["connection"] _parent="profile"}
                                        {/foreach}
                                    </ul>

                                    {if $group['group_members'] >= $system['max_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more js_see-more" data-get="group_members" data-id="{$group['group_id']}">
                                            <span>{__("See More")}</span>
                                            <div class="loader loader_small x-hidden"></div>
                                        </div>
                                        <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$group['group_title']} {__("doesn't have members")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- members -->
                {elseif $view == "invites"}
                    <!-- invites -->
                    <div class="col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading with-icon with-nav">

                                <!-- panel title -->
                                <div class="mb20">
                                    <i class="fa fa-users pr5 panel-icon"></i>
                                    <strong>{__("Members")}</strong>
                                </div>
                                <!-- panel title -->

                                <!-- panel nav -->
                                <ul class="nav nav-tabs">
                                    <li>
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/members">
                                            <strong class="pr5">{__("Members")}</strong>
                                            <span class="label label-info ml5">{$group['group_members']}</span>
                                        </a>
                                    </li>
                                    <li class="active">
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/invites">
                                            <strong class="pr5">{__("Invites")}</strong>
                                        </a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="panel-body">
                                {if $group['invites']}
                                    <ul class="row">
                                        {foreach $group['invites'] as $_user}
                                        {include file='__feeds_user.tpl' _connection=$_user["connection"] _parent="profile"}
                                        {/foreach}
                                    </ul>

                                    {if $group['invites'] >= $system['max_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more js_see-more" data-get="group_invites" data-id="{$group['group_id']}">
                                            <span>{__("See More")}</span>
                                            <div class="loader loader_small x-hidden"></div>
                                        </div>
                                        <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {__("No friends to invite")}
                                    </p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- invites -->
                {elseif $view == "settings"}
                    <div class="col-sm-3">
                        <div class="panel panel-default">
                            <div class="panel-body with-nav">
                                <ul class="side-nav">
                                    <li {if $sub_view == ""}class="active"{/if}>
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/settings"><i class="fa fa-cog fa-fw fa-lg pr10"></i> {__("Group Settings")}</a>
                                    </li>
                                    {if $group['group_privacy'] != "public"}
                                        <li {if $sub_view == "requests"}class="active"{/if}>
                                            <a href="{$system['system_url']}/groups/{$group['group_name']}/settings/requests"><i class="fa fa-user-plus fa-fw fa-lg pr10"></i> {__("Member Requests")}</a>
                                        </li>
                                    {/if}
                                    <li {if $sub_view == "delete"}class="active"{/if}>
                                        <a href="{$system['system_url']}/groups/{$group['group_name']}/settings/delete"><i class="fa fa-trash fa-fw fa-lg pr10"></i> {__("Delete Group")}</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-9">
                        <!-- edit -->
                        <div class="panel panel-default">
                            {if $sub_view == ""}
                                <div class="panel-heading with-icon">
                                    <!-- panel title -->
                                    <i class="fa fa-cog pr5 panel-icon"></i>
                                    <strong>{__("Group Settings")}</strong>
                                    <!-- panel title -->
                                </div>
                                <div class="panel-body">
                                    <form class="js_ajax-forms" data-url="pages_groups_events/create.php?type=group&do=edit&id={$group['group_id']}">
                                        <div class="form-group">
                                            <label for="title">{__("Name Your Group")}</label>
                                            <input type="text" class="form-control" name="title" id="title" placeholder='{__("Name of your group")}' value="{$group['group_title']}">
                                        </div>
                                        <div class="form-group">
                                            <label for="username">{__("Web Address")}</label>
                                            <div class="input-group">
                                                <span class="input-group-addon">{$system['system_url']}/groups/</span>
                                                <input type="text" class="form-control" name="username" id="username" value="{$group['group_name']}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="privacy">{__("Select Privacy")}</label>
                                            <select class="form-control selectpicker" name="privacy">
                                                <option {if $group['group_privacy'] == "public"}selected{/if} value="public" data-content="<div class='option'><div class='icon'><i class='fa fa-globe fa-2x'></i></div><div class='text'><b>{__('Public Group')}</b><br>{__('Anyone can see the group, its members and their posts')}.
                                                </div></div>">{__("Public Group")}</option>
                                                <option {if $group['group_privacy'] == "closed"}selected{/if} value="closed" data-content="<div class='option'><div class='icon'><i class='fa fa-unlock-alt fa-2x'></i></div><div class='text'><b>{__('Closed Group')}</b><br>{__('Only members can see posts')}.
                                                </div></div>">{__("Closed Group")}</option>
                                                <option {if $group['group_privacy'] == "secret"}selected{/if} value="secret" data-content="<div class='option'><div class='icon'><i class='fa fa-lock fa-2x'></i></div><div class='text'><b>{__('Secret Group')}</b><br>{__('Only members can find the group and see posts')}.
                                                </div></div>">{__("Secret Group")}</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="description">{__("About")}</label>
                                            <textarea class="form-control" name="description" id="description">{$group['group_description']}</textarea>
                                        </div>

                                        <button type="submit" class="btn btn-primary">{__("Save")}</button>

                                        <!-- error -->
                                        <div class="alert alert-danger mb0 mt10 x-hidden" role="alert"></div>
                                        <!-- error -->
                                    </form>
                                </div>
                            {elseif $sub_view == "requests"}
                                <div class="panel-heading with-icon">
                                    <!-- panel title -->
                                    <i class="fa fa-user-plus pr5 panel-icon"></i>
                                    <strong>{__("Member Requests")}</strong>
                                    <!-- panel title -->
                                </div>
                                <div class="panel-body">
                                    {if $group['requests']}
                                        <ul class="row">
                                            {foreach $group['requests'] as $_user}
                                            {include file='__feeds_user.tpl' _connection=$_user["connection"]}
                                            {/foreach}
                                        </ul>

                                        {if $group['requests'] >= $system['max_results']}
                                            <!-- see-more -->
                                            <div class="alert alert-info see-more js_see-more" data-get="group_requests" data-id="{$group['group_id']}">
                                                <span>{__("See More")}</span>
                                                <div class="loader loader_small x-hidden"></div>
                                            </div>
                                            <!-- see-more -->
                                        {/if}
                                    {else}
                                        <p class="text-center text-muted mt10">
                                            {__("No Requests")}
                                        </p>
                                    {/if}
                                </div>
                            {elseif $sub_view == "delete"}
                                <div class="panel-heading with-icon">
                                    <!-- panel title -->
                                    <i class="fa fa-trash pr5 panel-icon"></i>
                                    <strong>{__("Delete Group")}</strong>
                                    <!-- panel title -->
                                </div>
                                <div class="panel-body">
                                    <div class="alert alert-warning">
                                        <i class="fa fa-exclamation-triangle fa-lg mr10"></i>{__("Once you delete your group you will no longer can access it again")}
                                    </div>
                                    <div class="text-center">
                                        <button class="btn btn-danger js_delete-group" data-id="{$group['group_id']}">
                                            <i class="fa fa-trash-o"></i>
                                            {__("Delete Group")}
                                        </button>
                                    </div>
                                </div>
                            {/if}
                        </div>
                        <!-- edit -->
                    </div>
                {/if}
                <!-- view content -->
            </div>
            <!-- profile-content -->
        </div>
        <!-- right panel -->

    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}