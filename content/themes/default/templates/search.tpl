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
                    <!-- search form -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="mt5">
                                <i class="fa fa-search pr5"></i>
                                <strong>{__("Search")}</strong>
                            </div>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal js_search-form">
                                <div class="form-group">
                                    <div class="col-sm-10 mb5">
                                        <input type="text" name="query" class="form-control" placeholder='{__("Search for people, pages and #hashtags")}' required>
                                    </div>
                                    <div class="col-sm-2">
                                        <button type="submit" name="submit" class="btn btn-primary">{__("Search")}</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- search form -->

                    {if $query}
                    <!-- search results -->
                    <div id="search-full-results" class="panel panel-default">
                        <div class="panel-heading with-icon with-nav">
                            <!-- panel title -->
                            <div class="mb20">
                                <i class="fa fa-rss pr5 panel-icon"></i>
                                <strong>{__("Search Results")}</strong>
                            </div>
                            <!-- panel title -->

                            <!-- panel nav -->
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#posts" data-toggle="tab">
                                        <strong class="pr5">{__("Posts")}</strong>
                                    </a>
                                </li>
                                <li>
                                    <a href="#users" data-toggle="tab">
                                        <strong class="pr5">{__("Users")}</strong>
                                    </a>
                                </li>
                                <li>
                                    <a href="#pages" data-toggle="tab">
                                        <strong class="pr5">{__("Pages")}</strong>
                                    </a>
                                </li>
                                <li>
                                    <a href="#groups" data-toggle="tab">
                                        <strong class="pr5">{__("Groups")}</strong>
                                    </a>
                                </li>
                                <li>
                                    <a href="#events" data-toggle="tab">
                                        <strong class="pr5">{__("Events")}</strong>
                                    </a>
                                </li>
                            </ul>
                            <!-- panel nav -->
                        </div>
                        <div class="panel-body tab-content">
                            <div class="tab-pane active" id="posts">
                                {if count($results['posts']) > 0}
                                <ul>
                                    {foreach $results['posts'] as $post}
                                    {include file='__feeds_post.tpl'}
                                    {/foreach}
                                </ul>
                                {else}
                                <div class="text-center x-muted mtb10">
                                    <i class="fa fa-rss fa-4x"></i>
                                    <p class="mt10 mb10"><strong>{__("No results to show")}</strong></p>
                                </div>
                                {/if}
                            </div>
                            <div class="tab-pane" id="users">
                                {if count($results['users']) > 0}
                                <ul>
                                    {foreach $results['users'] as $_user}
                                    {include file='__feeds_user.tpl' _connection=$_user['connection']}
                                    {/foreach}
                                </ul>
                                {else}
                                <div class="text-center x-muted mtb10">
                                    <i class="fa fa-rss fa-4x"></i>
                                    <p class="mt10 mb10"><strong>{__("No results to show")}</strong></p>
                                </div>
                                {/if}
                            </div>
                            <div class="tab-pane" id="pages">
                                {if count($results['pages']) > 0}
                                <ul>
                                    {foreach $results['pages'] as $_page}
                                    {include file='__feeds_page.tpl' _tpl="list"}
                                    {/foreach}
                                </ul>
                                {else}
                                <div class="text-center x-muted mtb10">
                                    <i class="fa fa-rss fa-4x"></i>
                                    <p class="mt10 mb10"><strong>{__("No results to show")}</strong></p>
                                </div>
                                {/if}
                            </div>
                            <div class="tab-pane" id="groups">
                                {if count($results['groups']) > 0}
                                <ul>
                                    {foreach $results['groups'] as $_group}
                                    {include file='__feeds_group.tpl' _tpl="list"}
                                    {/foreach}
                                </ul>
                                {else}
                                <div class="text-center x-muted mtb10">
                                    <i class="fa fa-rss fa-4x"></i>
                                    <p class="mt10 mb10"><strong>{__("No results to show")}</strong></p>
                                </div>
                                {/if}
                            </div>
                            <div class="tab-pane" id="events">
                                {if count($results['events']) > 0}
                                <ul>
                                    {foreach $results['events'] as $_event}
                                    {include file='__feeds_event.tpl' _tpl="list"}
                                    {/foreach}
                                </ul>
                                {else}
                                <div class="text-center x-muted mtb10">
                                    <i class="fa fa-rss fa-4x"></i>
                                    <p class="mt10 mb10"><strong>{__("No results to show")}</strong></p>
                                </div>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- search results -->
                    {/if}
                </div>
                <!-- left panel -->

                <!-- right panel -->
                <div class="col-sm-4">
                    {include file='_ads.tpl'}
                    {include file='_widget.tpl'}
                </div>
                <!-- right panel -->
            </div>
        </div>
        
    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}