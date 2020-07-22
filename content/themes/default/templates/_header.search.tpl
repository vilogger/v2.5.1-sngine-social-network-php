<form class="navbar-form pull-left flip hidden-xs">
    <input id="search-input" type="text" class="form-control" placeholder='{__("Search for people, pages and #hashtags")}' autocomplete="off">
    <div id="search-results" class="dropdown-menu dropdown-widget dropdown-search js_dropdown-keepopen">
        <div class="dropdown-widget-header">
            {__("Search Results")}
        </div>
        <div class="dropdown-widget-body">
            <div class="loader loader_small ptb10"></div>
        </div>
        <a class="dropdown-widget-footer" id="search-results-all" href="{$system['system_url']}/search/">{__("See All Results")}</a>
    </div>
    {if $user->_logged_in && count($user->_data['search_log']) > 0}
        <div id="search-history" class="dropdown-menu dropdown-widget dropdown-search js_dropdown-keepopen">
            <div class="dropdown-widget-header">
                <span class="text-link pull-right flip js_clear-searches">
                    {__("Clear")}
                </span>
                <i class="fa fa-clock-o"></i> {__("Recent Searches")}
            </div>
            <div class="dropdown-widget-body">
                {include file='ajax.search.tpl' results=$user->_data['search_log']}
            </div>
            <a class="dropdown-widget-footer" id="search-results-all" href="{$system['system_url']}/search/">{__("Advanced Search")}</a>
        </div>
    {/if}
</form>