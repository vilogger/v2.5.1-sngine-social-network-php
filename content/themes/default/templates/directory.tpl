{include file='_head.tpl'}
{include file='_header.tpl'}

{if $view == ""}
    {include file='_directory.tpl'}
{else}

    <!-- page content -->
    <div class="container mt20 offcanvas">
        <div class="row">

            <!-- left panel -->
            <div class="col-sm-4 col-md-2 offcanvas-sidebar">
                <ul class="nav nav-pills nav-stacked nav-home mb20 js_sticky-sidebar">
                    <li {if $view == "posts"}class="active"{/if}>
                        <a href="{$system['system_url']}/directory/posts"><i class="fa fa-newspaper-o fa-fw pr10"></i> {__("Posts")}</a>
                    </li>
                    <li {if $view == "users"}class="active"{/if}>
                        <a href="{$system['system_url']}/directory/users"><i class="fa fa-user fa-fw pr10"></i> {__("Users")}</a>
                    </li>
                    <li {if $view == "pages"}class="active"{/if}>
                        <a href="{$system['system_url']}/directory/pages"><i class="fa fa-flag fa-fw pr10"></i> {__("Pages")}</a>
                    </li>
                    <li {if $view == "groups"}class="active"{/if}>
                        <a href="{$system['system_url']}/directory/groups"><i class="fa fa-users fa-fw pr10"></i> {__("Groups")}</a>
                    </li>
                    <li {if $view == "events"}class="active"{/if}>
                        <a href="{$system['system_url']}/directory/events"><i class="fa fa-calendar fa-fw pr10"></i> {__("Events")}</a>
                    </li>
                    {if $system['games_enabled']}
                        <li {if $view == "games"}class="active"{/if}>
                            <a href="{$system['system_url']}/directory/games"><i class="fa fa-gamepad fa-fw pr10"></i> {__("Games")}</a>
                        </li>
                    {/if}
                    <li>
                        <a href="{$system['system_url']}/search"><i class="fa fa-search fa-fw pr10"></i> {__("Search")}</a>
                    </li>
                </ul>
            </div>
            <!-- left panel -->

            <div class="col-sm-8 col-md-10 offcanvas-mainbar">
                <div class="row">
                    <!-- center panel -->
                    <div class="col-sm-12 col-md-7">
                        {if $view == "posts"}
                            {if count($rows) > 0}
                                <ul>
                                    {foreach $rows as $post}
                                    {include file='__feeds_post.tpl'}
                                    {/foreach}
                                </ul>
                                {$pager}
                            {else}
                                <p class="text-center text-muted">
                                    {__("No posts to show")}
                                </p>
                            {/if}

                        {elseif $view == "users"}
                            {if count($rows) > 0}
                                <ul>
                                    {foreach $rows as $_user}
                                    {include file='__feeds_user.tpl' _connection=$_user["connection"]}
                                    {/foreach}
                                </ul>
                                {$pager}
                            {else}
                                <p class="text-center text-muted">
                                    {__("No users to show")}
                                </p>
                            {/if}

                        {elseif $view == "pages"}
                            {if count($rows) > 0}
                                <ul>
                                    {foreach $rows as $_page}
                                    {include file='__feeds_page.tpl' _tpl="list"}
                                    {/foreach}
                                </ul>
                                {$pager}
                            {else}
                                <p class="text-center text-muted">
                                    {__("No pages to show")}
                                </p>
                            {/if}

                        {elseif $view == "groups"}
                            {if count($rows) > 0}
                                <ul>
                                    {foreach $rows as $_group}
                                    {include file='__feeds_group.tpl' _tpl="list"}
                                    {/foreach}
                                </ul>
                                {$pager}
                            {else}
                                <p class="text-center text-muted">
                                    {__("No groups to show")}
                                </p>
                            {/if}

                        {elseif $view == "events"}
                            {if count($rows) > 0}
                                <ul>
                                    {foreach $rows as $_event}
                                    {include file='__feeds_event.tpl' _tpl="list"}
                                    {/foreach}
                                </ul>
                                {$pager}
                            {else}
                                <p class="text-center text-muted">
                                    {__("No events to show")}
                                </p>
                            {/if}

                        {elseif $view == "games"}
                            {if count($rows) > 0}
                                <ul>
                                    {foreach $rows as $_game}
                                    {include file='__feeds_game.tpl' _tpl="list"}
                                    {/foreach}
                                </ul>
                                {$pager}
                            {else}
                                <p class="text-center text-muted">
                                    {__("No games to show")}
                                </p>
                            {/if}

                        {/if}
                    </div>
                    <!-- center panel -->

                    <!-- right panel -->
                    <div class="col-sm-12 col-md-5">
                        {include file='_ads.tpl'}
                        {include file='_widget.tpl'}
                    </div>
                    <!-- right panel -->
                </div>
            </div>

        </div>
    </div>
    <!-- page content -->

{/if}

{include file='_footer.tpl'}