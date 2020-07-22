{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="container mt20 offcanvas">
    <div class="row">

        <!-- left panel -->
        <div class="col-sm-4 col-md-2 offcanvas-sidebar">
            {include file='_sidebar.tpl'}
        </div>
        <!-- left panel -->

        <!-- right panel -->
        <div class="col-sm-8 col-md-10 offcanvas-mainbar">

            <!-- tabs -->
            <div class="box-tabs-wrapper clearfix">
                <ul class="nav pull-left flip">
                    <li {if $view == ""}class="active"{/if}>
                        <a href="{$system['system_url']}/pages">{__("Discover")}</a>
                    </li>
                    <li {if $view == "liked"}class="active"{/if}>
                        <a href="{$system['system_url']}/pages/liked">{__("Liked Pages")}</a>
                    </li>
                    <li {if $view == "manage"}class="active"{/if}>
                        <a href="{$system['system_url']}/pages/manage">{__("Your Pages")}</a>
                    </li>
                </ul>
                <div class="mt10 pull-right flip">
                    <button class="btn btn-success btn-sm" data-toggle="modal" data-url="#create-page">
                        <i class="fa fa-plus-circle fa-fw"></i><span class="hidden-xs">{__("Create Page")}</span>
                    </button>
                </div>
            </div>
            <!-- tabs -->
            
            <!-- content -->
            <div>
                {if count($pages) > 0}
                    <ul class="row">
                        {foreach $pages as $_page}
                            {include file='__feeds_page.tpl'}
                        {/foreach}
                    </ul>

                    <!-- see-more -->
                    {if count($pages) >= $system['max_results_even']}
                        <div class="alert alert-post see-more js_see-more" data-get="{$get}" data-uid="{$user->_data['user_id']}">
                            <span>{__("See More")}</span>
                            <div class="loader loader_small x-hidden"></div>
                        </div>
                    {/if}
                    <!-- see-more -->
                {else}
                    <p class="text-center text-muted">
                        {__("No pages to show")}
                    </p>
                {/if}
            </div>
            <!-- content -->

        </div>
        <!-- right panel -->

    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}