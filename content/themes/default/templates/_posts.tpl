<!-- posts-filter -->
<div class="posts-filter">
    <span>{if $_title}{$_title}{else}{__("Recent Updates")}{/if}</span>
    {if !$_filter}
    <div class="pull-right flip">
        <div class="btn-group btn-group-xs js_posts-filter" data-value="all" title='{__("All")}'>
            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
                <i class="btn-group-icon fa fa-bars fa-fw"></i> <span class="btn-group-text">{__("All")}</span> <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#" data-title='{__("All")}' data-value="all"><i class="fa fa-bars fa-fw"></i> {__("All")}</a></li>
                <li><a href="#" data-title='{__("Text")}' data-value=""><i class="fa fa-comment fa-fw"></i> {__("Text")}</a></li>
                <li><a href="#" data-title='{__("Photos")}' data-value="photos"><i class="fa fa-file-image-o fa-fw"></i> {__("Photos")}</a></li>
                <li><a href="#" data-title='{__("Videos")}' data-value="video"><i class="fa fa-film fa-fw"></i> {__("Videos")}</a></li>
                <li><a href="#" data-title='{__("Audios")}' data-value="audio"><i class="fa fa-music fa-fw"></i> {__("Audios")}</a></li>
                <li><a href="#" data-title='{__("Files")}' data-value="file"><i class="fa fa-file-text-o fa-fw"></i> {__("Files")}</a></li>
                <li><a href="#" data-title='{__("Polls")}' data-value="poll"><i class="fa fa-pie-chart fa-fw"></i> {__("Polls")}</a></li>
                <li><a href="#" data-title='{__("Products")}' data-value="product"><i class="fa fa-tag fa-fw"></i> {__("Products")}</a></li>
                <li><a href="#" data-title='{__("Articles")}' data-value="article"><i class="fa fa-file-text fa-fw"></i> {__("Articles")}</a></li>
                <li><a href="#" data-title='{__("Maps")}' data-value="map"><i class="fa fa-map-marker fa-fw"></i> {__("Maps")}</a></li>
            </ul>
        </div>
    </div>
    {/if}
</div>
<!-- posts-filter -->

<!-- posts-loader -->
<div class="post x-hidden js_posts_loader">
	<div class="post-body">
		<div class="panel-effect">
			<div class="fake-effect fe-0"></div>
			<div class="fake-effect fe-1"></div>
			<div class="fake-effect fe-2"></div>
			<div class="fake-effect fe-3"></div>
			<div class="fake-effect fe-4"></div>
			<div class="fake-effect fe-5"></div>
			<div class="fake-effect fe-6"></div>
			<div class="fake-effect fe-7"></div>
			<div class="fake-effect fe-8"></div>
			<div class="fake-effect fe-9"></div>
			<div class="fake-effect fe-10"></div>
			<div class="fake-effect fe-11"></div>
		</div>
	</div>
</div>
<!-- posts-loader -->

{if count($posts) > 0}
	<div class="js_posts_stream" data-get="{$_get}" data-filter="{if $_filter}{$_filter}{else}all{/if}" {if $_id}data-id="{$_id}"{/if}>
		<ul>
			<!-- posts -->
			{foreach $posts as $post}
			{include file='__feeds_post.tpl' _get=$_get}
			{/foreach}
			<!-- posts -->
		</ul>

		<!-- see-more -->
		<div class="alert alert-post see-more mb10 js_see-more {if $user->_logged_in}js_see-more-infinite{/if}" data-get="{$_get}" data-filter="{if $_filter}{$_filter}{else}all{/if}" {if $_id}data-id="{$_id}"{/if}>
			<span>{__("More Stories")}</span>
			<div class="loader loader_small x-hidden"></div>
		</div>
		<!-- see-more -->
	</div>
{else}
	<div class="js_posts_stream" data-get="{$_get}" data-filter="{if $_filter}{$_filter}{else}all{/if}" {if $_id}data-id="{$_id}"{/if}>
		<ul>
			<!-- no posts -->
			<div class="text-center x-muted">
				<i class="fa fa-newspaper-o fa-4x"></i>
				<p class="mb10"><strong>{__("No posts to show")}</strong></p>
			</div>
			<!-- no posts -->
		</ul>
	</div>
{/if}