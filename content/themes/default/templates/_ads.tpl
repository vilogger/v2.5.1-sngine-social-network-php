{if $_master}

	{if $_ads && $user->_logged_in && ($page != "admin" && $page != "settings" && $page != "market" && $page != "static")}
	    <div class="container mtb20">
	    	<!-- ads -->
	        {foreach $_ads as $ads_unit}
	            <div class="panel panel-default panel-widget mb0">
	                <div class="panel-heading light">
	                    <i class="fa fa-bullhorn fa-fw mr5 yellow"></i><strong>{__("Sponsored")}</strong>
	                </div>
	                <div class="panel-body">{$ads_unit['code']}</div>
	            </div>
	        {/foreach}
	        <!-- ads -->
	    </div>
	{/if}

{else}

	{if $ads}
		<!-- ads -->
		{foreach $ads as $ads_unit}
			<div class="panel panel-default panel-widget">
			    <div class="panel-heading light">
			        <i class="fa fa-bullhorn fa-fw mr5 yellow"></i>{__("Sponsored")}
			    </div>
			    <div class="panel-body">{$ads_unit['code']}</div>
			</div>
		{/foreach}
		<!-- ads -->
	{/if}

{/if}

	