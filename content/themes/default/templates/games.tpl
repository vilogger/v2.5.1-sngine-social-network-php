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
                        <a href="{$system['system_url']}/games">{__("Discover")}</a>
                    </li>
                    <li {if $view == "played"}class="active"{/if}>
                        <a href="{$system['system_url']}/games/played">{__("Your Games")}</a>
                    </li>
                </ul>
            </div>
            <!-- tabs -->
            
            <!-- content -->
            <div>
                {if count($games) > 0}
                    <ul class="row">
                        {foreach $games as $_game}
                            {include file='__feeds_game.tpl'}
                        {/foreach}
                    </ul>

                    <!-- see-more -->
                    {if count($games) >= $system['max_results_even']}
                        <div class="alert alert-post see-more js_see-more" data-get="{$get}">
                            <span>{__("See More")}</span>
                            <div class="loader loader_small x-hidden"></div>
                        </div>
                    {/if}
                    <!-- see-more -->
                {else}
                    <p class="text-center text-muted">
                        {__("No games to show")}
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