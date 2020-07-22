{include file='_head.tpl'}
{include file='_header.tpl'}

{if !$user->_logged_in}
    <!-- page content -->
    <div class="index-wrapper" {if !$system['system_wallpaper_default'] && $system['system_wallpaper']} style="background-image: url('{$system['system_uploads']}/{$system['system_wallpaper']}')" {/if}>
        <div class="container">
            <div class="index-intro">
                <h1>
                    {__("Welcome to")} {$system['system_title']}
                </h1>
                <p>
                    {__("Share your memories, connect with others, make new friends")}
                </p>
            </div>

            <div class="row relative">
                
                {if $random_profiles}
                    <!-- random 4 users -->
                    {foreach $random_profiles as $random_profile}
                        <a href="{$system['system_url']}/{$random_profile['user_name']}" class="fly-head" 
                            {if $random_profile@index == 0} style="top: 140px;left: 50px;" {/if}
                            {if $random_profile@index == 1} style="bottom: 60px;left: 210px;" {/if}
                            {if $random_profile@index == 2} style="top: 140px;right: 50px;" {/if}
                            {if $random_profile@index == 3} style="bottom: 60px;right: 210px;" {/if}
                            data-toggle="tooltip" data-placement="top" title="{$random_profile['user_firstname']} {$random_profile['user_lastname']}">
                            <img src="{$random_profile['user_picture']}">
                        </a>
                    {/foreach}
                    <!-- random 4 users -->
                {/if}

                <!-- sign in/up form -->
                {include file='_sign_form.tpl'}
                <!-- sign in/up form -->
            </div>
        </div>
    </div>

    {if $system['directory_enabled']}
        {include file='_directory.tpl'}
    {/if}
    <!-- page content -->
{else}
    <!-- page content -->
    <div class="container mt20 offcanvas">
        <div class="row">

            <!-- left panel -->
            <div class="col-sm-4 col-md-2 offcanvas-sidebar">
                {include file='_sidebar.tpl'}
            </div>
            <!-- left panel -->

            <div class="col-sm-8 col-md-10 offcanvas-mainbar">
                <div class="row">
                    <!-- center panel -->
                    <div class="col-sm-12 col-md-8">

                        <!-- announcments -->
                        {include file='_announcements.tpl'}
                        <!-- announcments -->

                        {if $view == ""}

                            <!-- stories -->
                            {if $system['stories_enabled']}
                                <div class="panel panel-default panel-users">
                                    <div class="panel-heading light no_border">
                                        <strong class="text-muted">{__("Stories")}</strong>
                                        <div class="x-muted text-clickable pull-right flip">
                                            <i class="fa fa-info-circle" data-toggle="tooltip" data-placement="top" title='{__("Stories are photos and videos that only last 24 hours")}'></i>
                                        </div>
                                        
                                    </div>
                                    <div class="panel-body pt5">
                                        <div class="row">
                                            <!-- add new story -->
                                            <div class="col-xs-2">
                                                <div class="user-picture" data-toggle="modal" data-url="posts/story.php?do=create" style="background-image:url({$user->_data['user_picture']});">
                                                    <div class="add">
                                                        <i class="fa fa-plus-circle"></i>
                                                    </div>
                                                </div> 
                                            </div>
                                            <!-- add new story -->

                                            <!-- users stories -->
                                            {foreach $stories as $story}
                                                <div class="col-xs-2">
                                                    <div class="user-picture-wrapper">
                                                        <div class="user-picture js_story" style="background-image:url({$story['user_picture']});" data-items='{$story["media"]}' data-toggle="tooltip" data-placement="top" title='{__("Watch")} {$story["user_firstname"]} {$story["user_lastname"]} {__("Story")}'>
                                                        </div>    
                                                    </div>
                                                </div>
                                            {/foreach}
                                            <!-- users stories -->
                                        </div>
                                    </div>
                                </div>
                            {/if}
                            <!-- stories -->

                            <!-- publisher -->
                            {include file='_publisher.tpl' _handle="me" _privacy=true}
                            <!-- publisher -->

                            <!-- boosted post -->
                            {if $boosted_post}
                                {include file='_boosted_post.tpl' post=$boosted_post}
                            {/if}
                            <!-- boosted post -->

                            <!-- posts stream -->
                            {include file='_posts.tpl' _get="newsfeed"}
                            <!-- posts stream -->

                        {elseif $view == "saved"}
                            <!-- saved posts stream -->
                            {include file='_posts.tpl' _get="saved" _title=__("Saved Posts")}
                            <!-- saved posts stream -->

                        {elseif $view == "articles"}
                            <!-- saved posts stream -->
                            {include file='_posts.tpl' _get="posts_profile" _id=$user->_data['user_id'] _filter="article" _title=__("My Articles")}
                            <!-- saved posts stream -->

                        {elseif $view == "products"}
                            <!-- saved posts stream -->
                            {include file='_posts.tpl' _get="posts_profile" _id=$user->_data['user_id'] _filter="product" _title=__("My Products")}
                            <!-- saved posts stream -->

                        {/if}
                    </div>
                    <!-- center panel -->

                    <!-- right panel -->
                    <div class="col-sm-12 col-md-4">
                        <!-- pro members -->
                        {if count($pro_members) > 0}
                            <div class="panel panel-default panel-friends">
                                <div class="panel-heading">
                                    {if $system['packages_enabled'] && !$user->_data['user_subscribed']}
                                        <div class="pull-right flip">
                                            <small><a href="{$system['system_url']}/packages">{__("Upgrade")}</a></small>
                                        </div>
                                    {/if}
                                    <strong class="text-primary"><i class="fa fa-bolt"></i> {__("Pro Users")}</strong>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        {foreach $pro_members as $_member}
                                            <div class="col-xs-4">
                                                <a class="friend-picture" href="{$system['system_url']}/{$_member['user_name']}" style="background-image:url({$_member['user_picture']});" >
                                                    <span class="friend-name">{$_member['user_firstname']} {$_member['user_lastname']}</span>
                                                </a>
                                            </div>
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        {/if}
                        <!-- pro members -->

                        <!-- boosted pages -->
                        {if count($promoted_pages) > 0}
                            <div class="panel panel-default panel-friends">
                                <div class="panel-heading">
                                    {if $system['packages_enabled'] && !$user->_data['user_subscribed']}
                                        <div class="pull-right flip">
                                            <small><a href="{$system['system_url']}/packages">{__("Upgrade")}</a></small>
                                        </div>
                                    {/if}
                                    <strong class="text-primary"><i class="fa fa-bullhorn fa-fw"></i> {__("Pro Pages")}</strong>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        {foreach $promoted_pages as $_page}
                                            <div class="col-xs-4">
                                                <a class="friend-picture" href="{$system['system_url']}/pages/{$_page['page_name']}" style="background-image:url({$_page['page_picture']});" >
                                                    <span class="friend-name">{$_page['page_title']}</span>
                                                </a>
                                            </div>
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        {/if}
                         <!-- boosted pages -->

                        {include file='_ads.tpl'}
                        {include file='_widget.tpl'}

                        <!-- people you may know -->
                        {if count($user->_data['new_people']) > 0}
                            <div class="panel panel-default panel-widget">
                                <div class="panel-heading">
                                    <div class="pull-right flip">
                                        <small><a href="{$system['system_url']}/people">{__("See All")}</a></small>
                                    </div>
                                    <strong>{__("People you may know")}</strong>
                                </div>
                                <div class="panel-body">
                                    <ul>
                                        {foreach $user->_data['new_people'] as $_user}
                                        {include file='__feeds_user.tpl' _connection="add" _small=true}
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        {/if}
                         <!-- people you may know -->

                        <!-- suggested pages -->
                        {if count($new_pages) > 0}
                            <div class="panel panel-default panel-widget">
                                <div class="panel-heading">
                                    <div class="pull-right flip">
                                        <small><a href="{$system['system_url']}/pages">{__("See All")}</a></small>
                                    </div>
                                    <strong>{__("Suggested Pages")}</strong>
                                </div>
                                <div class="panel-body">
                                    <ul>
                                        {foreach $new_pages as $_page}
                                        {include file='__feeds_page.tpl' _tpl="list"}
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        {/if}
                        <!-- suggested pages -->

                        <!-- suggested groups -->
                        {if count($new_groups) > 0}
                            <div class="panel panel-default panel-widget">
                                <div class="panel-heading">
                                    <div class="pull-right flip">
                                        <small><a href="{$system['system_url']}/groups">{__("See All")}</a></small>
                                    </div>
                                    <strong>{__("Suggested Groups")}</strong>
                                </div>
                                <div class="panel-body">
                                    <ul>
                                        {foreach $new_groups as $_group}
                                        {include file='__feeds_group.tpl' _tpl="list"}
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        {/if}
                        <!-- suggested groups -->

                        <!-- suggested events -->
                        {if count($new_events) > 0}
                            <div class="panel panel-default panel-widget">
                                <div class="panel-heading">
                                    <div class="pull-right flip">
                                        <small><a href="{$system['system_url']}/events">{__("See All")}</a></small>
                                    </div>
                                    <strong>{__("Suggested Events")}</strong>
                                </div>
                                <div class="panel-body">
                                    <ul>
                                        {foreach $new_events as $_event}
                                        {include file='__feeds_event.tpl' _tpl="list" _small=true}
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        {/if}
                        <!-- suggested events -->

                        <!-- mini footer -->
                        {if count($user->_data['new_people']) > 0 || count($new_pages) > 0 || count($new_groups) > 0 || count($new_events) > 0}
                            <div class="row plr10 hidden-xs">
                                <div class="col-xs-12 mb5">
                                    {if count($static_pages) > 0}
                                        {foreach $static_pages as $static_page}
                                            <a href="{$system['system_url']}/static/{$static_page['page_url']}">
                                                {$static_page['page_title']}
                                            </a>{if !$static_page@last} · {/if}
                                        {/foreach}
                                    {/if}
                                    {if $system['contact_enabled']}
                                         · 
                                        <a href="{$system['system_url']}/contacts">
                                            {__("Contacts")}
                                        </a>
                                    {/if}
                                    {if $system['directory_enabled']}
                                         · 
                                        <a href="{$system['system_url']}/directory">
                                            {__("Directory")}
                                        </a>
                                    {/if}
                                    {if $system['market_enabled']}
                                         · 
                                        <a href="{$system['system_url']}/market">
                                            {__("Market")}
                                        </a>
                                    {/if}
                                </div>
                                <div class="col-xs-12">
                                    &copy; {'Y'|date} {$system['system_title']} · <span class="text-link" data-toggle="modal" data-url="#translator">{$system['language']['title']}</span>
                                </div>
                            </div>
                        {/if}
                        <!-- mini footer -->
                    </div>
                    <!-- right panel -->
                </div>
            </div>

        </div>
    </div>
    <!-- page content -->
{/if}

{include file='_footer.tpl'}