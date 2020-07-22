{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="container {if $user->_logged_in}offcanvas{/if}">
    <div class="row">

        <!-- side panel -->
        {if $user->_logged_in}
            <div class="col-xs-12 visible-xs-block offcanvas-sidebar mt20">
                {include file='_sidebar.tpl'}
            </div>
        {/if}
        <!-- side panel -->

        <div class="col-xs-12 {if $user->_logged_in}offcanvas-mainbar{/if}">
            <!-- profile-header -->
            <div class="profile-header">
                <!-- profile-cover -->
                <div {if $spage['page_cover_id']} class="profile-cover-wrapper js_lightbox" data-id="{$spage['page_cover_id']}" data-image="{$system['system_uploads']}/{$spage['page_cover']}" data-context="album" {else} class="profile-cover-wrapper" {/if}  {if $spage['page_cover']} style="background-image:url('{$system['system_uploads']}/{$spage['page_cover']}');" {/if}>
                    {if $user->_logged_in && $user->_data['user_id'] == $spage['page_admin']}
                        <div class="profile-cover-change">
                            <i class="fa fa-camera js_x-uploader" data-handle="cover-page" data-id="{$spage['page_id']}"></i>
                        </div>
                        <div class="profile-cover-delete {if !$spage['page_cover']}x-hidden{/if}">
                            <i class="fa fa-trash js_delete-cover" data-handle="cover-page" data-id="{$spage['page_id']}" title='{__("Delete Cover")}'></i>
                        </div>
                        <div class="profile-cover-change-loader">
                            <div class="loader loader_large"></div>
                        </div>
                    {/if}
                </div>
                <!-- profile-cover -->

                <!-- profile-avatar -->
                <div class="profile-avatar-wrapper">
                    <img {if $spage['page_picture_id']} class="js_lightbox" data-id="{$spage['page_picture_id']}" data-image="{$spage['page_picture']}" data-context="album" {/if} src="{$spage['page_picture']}" alt="{$spage['page_title']}">
                    {if $user->_logged_in && $user->_data['user_id'] == $spage['page_admin']}
                        <div class="profile-avatar-change">
                            <i class="fa fa-camera js_x-uploader" data-handle="picture-page" data-id="{$spage['page_id']}"></i>
                        </div>
                        <div class="profile-avatar-delete {if $spage['page_picture_default']}x-hidden{/if}">
                            <i class="fa fa-trash js_delete-picture" data-handle="picture-page" data-id="{$spage['page_id']}" title='{__("Delete Picture")}'></i>
                        </div>
                        <div class="profile-avatar-change-loader">
                            <div class="loader loader_medium"></div>
                        </div>
                    {/if}
                </div>
                <!-- profile-avatar -->

                <!-- profile-name -->
                <div class="profile-name-wrapper">
                    <a href="{$system['system_url']}/pages/{$spage['page_name']}">{$spage['page_title']}</a>
                    {if $spage['page_verified']}
                        <i data-toggle="tooltip" data-placement="top" title='{__("Verified Page")}' class="fa fa-check-circle fa-fw verified-badge"></i>
                    {/if}
                </div>
                <!-- profile-name -->

                <!-- profile-buttons -->
                <div class="profile-buttons-wrapper">
                    {if $spage['i_like']}
                        <button type="button" class="btn btn-default js_unlike-page" data-id="{$spage['page_id']}">
                            <i class="fa fa-thumbs-o-up"></i>
                            {__("Unlike")}
                        </button>
                    {else}
                        <button type="button" class="btn btn-primary js_like-page" data-id="{$spage['page_id']}">
                            <i class="fa fa-thumbs-o-up"></i>
                            {__("Like")}
                        </button>
                    {/if}
                    {if $user->_data['user_id'] == $spage['page_admin']}
                        {if $user->_data['can_boost_pages']}
                            {if $spage['page_boosted']}
                                <button type="button" class="btn btn-default js_unboost-page" data-id="{$spage['page_id']}">
                                    <i class="fa fa-bolt"></i>
                                    {__("Unboost")}
                                </button>
                            {else}
                                <button type="button" class="btn btn-danger js_boost-page" data-id="{$spage['page_id']}">
                                    <i class="fa fa-bolt"></i>
                                    {__("Boost")}
                                </button>
                            {/if}
                        {else}
                            <a href="{$system['system_url']}/packages" class="btn btn-danger">
                                <i class="fa fa-bolt"></i>
                                {__("Boost Page")}
                            </a>
                        {/if}
                        <a href="{$system['system_url']}/pages/{$spage['page_name']}/settings" class="btn btn-default">
                            <i class="fa fa-cog"></i> {__("Settings")}
                        </a>
                    {else}
                        <button class="btn btn-default js_report" data-handle="page" data-id="{$spage['page_id']}">
                            <i class="fa fa-flag"></i> {__("Report")}
                        </button>
                    {/if}
                </div>
                <!-- profile-buttons -->

                <!-- profile-tabs -->
                <div class="profile-tabs-wrapper">
                    <ul class="nav">
                        <li>
                            <a href="{$system['system_url']}/pages/{$spage['page_name']}">
                                {__("Timeline")}
                            </a>
                        </li>
                        <li class="middle-tabs">
                            <a href="{$system['system_url']}/pages/{$spage['page_name']}/photos">
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
                                    <a href="{$system['system_url']}/pages/{$spage['page_name']}/photos">{__("Photos")}</a>
                                </li>
                                <li>
                                    <a href="{$system['system_url']}/pages/{$spage['page_name']}/albums">{__("Albums")}</a>
                                </li>
                                {if $spage['i_like']}
                                    <li>
                                        <a href="{$system['system_url']}/pages/{$spage['page_name']}/invites">{__("Invite Friends")}</a>
                                    </li>
                                {/if}
                            </ul>
                        </li>
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
                            {if $spage['i_like']}
                                <button type="button" class="btn btn-default js_unlike-page" data-id="{$spage['page_id']}">
                                    <i class="fa fa-thumbs-o-up"></i>
                                    {__("Unlike")}
                                </button>
                            {else}
                                <button type="button" class="btn btn-primary js_like-page" data-id="{$spage['page_id']}">
                                    <i class="fa fa-thumbs-o-up"></i>
                                    {__("Like")}
                                </button>
                            {/if}
                            {if $user->_data['user_id'] == $spage['page_admin']}
                                {if $user->_data['can_boost_pages']}
                                    {if $spage['page_boosted']}
                                        <button type="button" class="btn btn-default js_unboost-page" data-id="{$spage['page_id']}">
                                            <i class="fa fa-bolt"></i>
                                            {__("Unboost")}
                                        </button>
                                    {else}
                                        <button type="button" class="btn btn-danger js_boost-page" data-id="{$spage['page_id']}">
                                            <i class="fa fa-bolt"></i>
                                            {__("Boost")}
                                        </button>
                                    {/if}
                                {else}
                                    <a href="{$system['system_url']}/packages" class="btn btn-danger">
                                        <i class="fa fa-bolt"></i>
                                        {__("Boost Page")}
                                    </a>
                                {/if}
                                <a href="{$system['system_url']}/pages/{$spage['page_name']}/settings" class="btn btn-default">
                                    <i class="fa fa-cog"></i> {__("Settings")}
                                </a>
                            {else}
                                <button class="btn btn-default js_report" data-handle="page" data-id="{$spage['page_id']}">
                                    <i class="fa fa-flag"></i> {__("Report")}
                                </button>
                            {/if}
                        </div>
                    </div>
                </div>
                <!-- profile-buttons alt -->

                <!-- view content -->
                {if $view == ""}
                    <div class="col-sm-4">
                        <!-- about -->
                        <div class="panel panel-default">
                            <div class="panel-body">
                                {if !is_empty($spage['page_description'])}
                                    <div class="about-bio">
                                        {$spage['page_description']}
                                    </div>
                                {/if}
                                <ul class="about-list">
                                    <!-- likes -->
                                    <li>
                                        <div class="about-list-item">
                                            <i class="fa fa-thumbs-o-up fa-fw fa-lg"></i>
                                            {$spage['page_likes']} {__("people like this")}
                                        </div>
                                    </li>
                                    <!-- likes -->
                                    <!-- category -->
                                    <li>
                                        <div class="about-list-item">
                                            <i class="fa fa-briefcase fa-fw fa-lg"></i>
                                            {__($spage['category_name'])}
                                        </div>
                                    </li>
                                    <!-- category -->
                                </ul>
                            </div>
                        </div>
                        <!-- about -->

                        <!-- invite friends -->
                        {if $spage['i_like'] && $spage['invites']}
                            <div class="panel panel-default">
                                <div class="panel-heading light no_border">
                                    <div class="pull-right flip">
                                        <small><a href="{$system['system_url']}/pages/{$spage['page_name']}/invites">{__("See All")}</a></small>
                                    </div>
                                    <strong class="text-muted">{__("Invite Friends")}</strong>
                                </div>
                                <div class="panel-body ptb5 plr5">
                                    <ul>
                                        {foreach $spage['invites'] as $_user}
                                        {include file='__feeds_user.tpl' _connection=$_user["connection"] _small=true}
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        {/if}
                        <!-- invite friends -->

                        <!-- photos -->
                        {if count($spage['photos']) > 0}
                            <div class="panel panel-default panel-photos">
                                <div class="panel-heading">
                                    <a href="{$system['system_url']}/pages/{$spage['page_name']}/photos">{__("Photos")}</a>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        {foreach $spage['photos'] as $photo}
                                            {include file='__feeds_photo.tpl' _context="photos" _small=true}
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        {/if}
                        <!-- photos -->
                    </div>
                    <div class="col-sm-8">
                        <!-- publisher -->
                        {if $user->_data['user_id'] == $spage['page_admin']}
                            {include file='_publisher.tpl' _handle="page" _id=$spage['page_id']}
                        {/if}
                        <!-- publisher -->

                        <!-- pinned post -->
                        {if $pinned_post}
                            {include file='_pinned_post.tpl' post=$pinned_post}
                        {/if}
                        <!-- pinned post -->
                        
                        <!-- posts -->
                        {include file='_posts.tpl' _get="posts_page" _id=$spage['page_id']}
                        <!-- posts -->
                    </div>
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
                                        <a href="{$system['system_url']}/pages/{$spage['page_name']}/photos">
                                            <strong class="pr5">{__("Photos")}</strong>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="{$system['system_url']}/pages/{$spage['page_name']}/albums">{__("Albums")}</a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="panel-body">
                                {if count($spage['photos']) > 0}
                                    <ul class="row">
                                        {foreach $spage['photos'] as $photo}
                                            {include file='__feeds_photo.tpl' _context="photos"}
                                        {/foreach}
                                    </ul>
                                    {if count($spage['photos']) >= $system['min_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more js_see-more" data-get="photos" data-id="{$spage['page_id']}" data-type='page'>
                                            <span>{__("See More")}</span>
                                            <div class="loader loader_small x-hidden"></div>
                                        </div>
                                        <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$spage['page_title']} {__("doesn't have photos")}
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
                                        <a href="{$system['system_url']}/pages/{$spage['page_name']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="active">
                                        <a href="{$system['system_url']}/pages/{$spage['page_name']}/albums">
                                            <strong class="pr5">{__("Albums")}</strong>
                                        </a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="panel-body">
                                {if count($spage['albums']) > 0}
                                    <ul class="row">
                                        {foreach $spage['albums'] as $album}
                                        {include file='__feeds_album.tpl'}
                                        {/foreach}
                                    </ul>
                                    {if count($spage['albums']) >= $system['max_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more js_see-more" data-get="albums" data-id="{$spage['page_id']}" data-type='page'>
                                            <span>{__("See More")}</span>
                                            <div class="loader loader_small x-hidden"></div>
                                        </div>
                                        <!-- see-more -->
                                    {/if}
                                {else}
                                    <p class="text-center text-muted mt10">
                                        {$spage['page_title']} {__("doesn't have albums")}
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
                                    <a href="{$system['system_url']}/pages/{$spage['page_name']}/albums" class="btn btn-default btn-sm">
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
                                        <a href="{$system['system_url']}/pages/{$spage['page_name']}/photos">{__("Photos")}</a>
                                    </li>
                                    <li class="active">
                                        <a href="{$system['system_url']}/pages/{$spage['page_name']}/albums">
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
                {elseif $view == "invites"}
                    <!-- invites -->
                    <div class="col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading with-icon with-nav">

                                <!-- panel title -->
                                <div class="mb20">
                                    <i class="fa fa-users pr5 panel-icon"></i>
                                    <strong>{__("Invites")}</strong>
                                </div>
                                <!-- panel title -->

                                <!-- panel nav -->
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="{$system['system_url']}/pages/{$spage['page_name']}/invites">
                                            <strong class="pr5">{__("Invites")}</strong>
                                        </a>
                                    </li>
                                </ul>
                                <!-- panel nav -->
                            </div>
                            <div class="panel-body">
                                {if $spage['invites']}
                                    <ul class="row">
                                        {foreach $spage['invites'] as $_user}
                                        {include file='__feeds_user.tpl' _connection=$_user["connection"] _parent="profile"}
                                        {/foreach}
                                    </ul>

                                    {if $spage['invites'] >= $system['max_results_even']}
                                        <!-- see-more -->
                                        <div class="alert alert-info see-more js_see-more" data-get="page_invites" data-id="{$spage['page_id']}">
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
                    <div class="col-md-3 col-sm-3">
                        <div class="panel panel-default">
                            <div class="panel-body with-nav">
                                <ul class="side-nav">
                                    <li {if $sub_view == ""}class="active"{/if}>
                                        <a href="{$system['system_url']}/pages/{$spage['page_name']}/settings"><i class="fa fa-cog fa-fw fa-lg pr10"></i> {__("Page Settings")}</a>
                                    </li>
                                    {if $system['verification_requests']}
                                        <li {if $sub_view == "verification"}class="active"{/if}>
                                            <a href="{$system['system_url']}/pages/{$spage['page_name']}/settings/verification"><i class="fa fa-check-circle fa-fw fa-lg pr10"></i> {__("Verification")}</a>
                                        </li>
                                    {/if}
                                    <li {if $sub_view == "delete"}class="active"{/if}>
                                        <a href="{$system['system_url']}/pages/{$spage['page_name']}/settings/delete"><i class="fa fa-trash fa-fw fa-lg pr10"></i> {__("Delete Page")}</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9 col-sm-9">
                        <div class="panel panel-default">
                            {if $sub_view == ""}
                                <div class="panel-heading with-icon">
                                    <!-- panel title -->
                                    <i class="fa fa-cog pr5 panel-icon"></i>
                                    <strong>{__("Page Settings")}</strong>
                                    <!-- panel title -->
                                </div>
                                <div class="panel-body">
                                    <form class="js_ajax-forms form-horizontal" data-url="pages_groups_events/create.php?type=page&do=edit&id={$spage['page_id']}">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="title">
                                                {__("Name Your Page")}
                                            </label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="title" id="title" value="{$spage['page_title']}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="username">
                                                {__("Web Address")}
                                            </label>
                                            <div class="col-sm-9">
                                                <div class="input-group">
                                                    <span class="input-group-addon">{$system['system_url']}/pages/</span>
                                                    <input type="text" class="form-control" name="username" id="username" value="{$spage['page_name']}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="category">
                                                {__("Category")}
                                            </label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="category" id="category">
                                                    {foreach $categories as $category}
                                                        <option {if $spage['page_category'] == $category['category_id']}selected{/if} value="{$category['category_id']}">{__($category['category_name'])}</option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" for="description">
                                                {__("About")}
                                            </label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" name="description" id="description">{$spage['page_description']}</textarea>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class="col-sm-9 col-sm-offset-3">
                                                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                                            </div>
                                        </div>

                                        <!-- error -->
                                        <div class="alert alert-danger mb0 mt10 x-hidden" role="alert"></div>
                                        <!-- error -->
                                    </form>
                                </div>
                            {elseif $sub_view == "verification"}
                                <div class="panel-heading with-icon">
                                    <!-- panel title -->
                                    <i class="fa fa-check-circle pr5 panel-icon"></i>
                                    <strong>{__("Verification")}</strong>
                                    <!-- panel title -->
                                </div>
                                <div class="panel-body">
                                    {if $case == "verified"}
                                        <div class="text-center">
                                            <div class="big-icon success">
                                                <i class="fa fa-thumbs-o-up fa-3x"></i>
                                            </div>
                                            <h4>{__("Congratulations")}</h4>
                                            <p class="mt20">{__("This page is verified")}</p>
                                        </div>
                                    {elseif $case == "request"}
                                        <div class="alert alert-info">
                                            <i class="fa fa-info-circle fa-lg mr10"></i>{__("You can send verification request to verify your page")}<br>
                                        </div>
                                        <div class="text-center">
                                            <button class="btn btn-success js_verify" data-id="{$spage['page_id']}">
                                                <i class="fa fa-check-circle mr5"></i>{__("Verification Request")}
                                            </button>
                                        </div>
                                    {elseif $case == "pending"}
                                        <div class="alert alert-info">
                                            <i class="fa fa-info-circle fa-lg mr10"></i>{__("Your verification request is still awaiting admin approval")}<br>
                                        </div>
                                        <div class="text-center">
                                            <button class="btn btn-warning btn-delete js_unverify" data-id="{$spage['page_id']}"><i class="fa fa-clock-o mr5"></i>{__("Pending")}</button>
                                        </div>
                                    {elseif $case == "declined"}
                                        <div class="text-center">
                                            <div class="big-icon error">
                                                <i class="fa fa-meh-o fa-3x"></i>
                                            </div>
                                            <h4>{__("Sorry")}</h4>
                                            <p class="mt20">{__("Your verification request has been declined by the admin")}</p>
                                        </div>
                                    {/if}
                                </div>
                            {elseif $sub_view == "delete"}
                                <div class="panel-heading with-icon">
                                    <!-- panel title -->
                                    <i class="fa fa-trash pr5 panel-icon"></i>
                                    <strong>{__("Delete Page")}</strong>
                                    <!-- panel title -->
                                </div>
                                <div class="panel-body">
                                    <div class="alert alert-warning">
                                        <i class="fa fa-exclamation-triangle fa-lg mr10"></i>{__("Once you delete your page you will no longer can access it again")}
                                    </div>
                                    <div class="text-center">
                                        <button class="btn btn-danger js_delete-page" data-id="{$spage['page_id']}">
                                            <i class="fa fa-trash mr5"></i>{__("Delete Page")}
                                        </button>
                                    </div>
                                </div>
                            {/if}
                        </div>
                    </div>
                {/if}
                <!-- view content -->
            </div>
            <!-- profile-content -->
        </div>
        
</div>
<!-- page content -->

{include file='_footer.tpl'}