{if $_get}
	{if $posts}
		<ul>
			{foreach $posts as $post}
			{include file='__feeds_post.tpl'}
			{/foreach}
		</ul>

		<!-- see-more -->
		<div class="alert alert-post see-more js_see-more {if $user->_logged_in}js_see-more-infinite{/if}" data-get="{$_get}" data-filter="{$_filter}" {if $_id}data-id="{$_id}"{/if}>
			<span>{__("More Stories")}</span>
			<div class="loader loader_small x-hidden"></div>
		</div>
		<!-- see-more -->
	{else}
		<div class="text-center x-muted">
			<i class="fa fa-newspaper-o fa-4x"></i>
			<p class="mb10"><strong>{__("No posts to show")}</strong></p>
		</div>
	{/if}
{else}
	{foreach $posts as $post}
	{include file='__feeds_post.tpl'}
	{/foreach}
{/if}