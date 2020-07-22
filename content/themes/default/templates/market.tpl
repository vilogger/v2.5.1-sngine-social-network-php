{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="market-header">
	<div class="container">
	    {$system['system_title']} <strong>{__("Market")}</strong>
	    <div class="row mt20">
	    	<div class="col-sm-6 col-sm-offset-3">
	    		<form class="js_search-form" data-handle="market">
	    			<div class="input-group">
		    			<input name="query" type="text" class="form-control input-lg" placeholder='{__("Search for products")}'>
		    			<span class="input-group-btn">
		    				<button class="btn btn-lg btn-danger" type="submit">{__("Search")}</button>
		    			</span>
		    		</div>
	    		</form>
	    	</div>
	    </div>
    </div>
</div>

<div class="container offcanvas">
	<div class="row">

		<!-- left panel -->
		<div class="col-sm-3 offcanvas-sidebar">
			<div class="panel panel-default">
				<div class="panel-body with-nav">
					<ul class="side-nav">
						<li {if $view == "" || $view == "search"}class="active"{/if}>
							<a href="{$system['system_url']}/market">
                                {__("All")}
                            </a>
						</li>
						{foreach $categories as $category}
							<li {if $view == "category" && $category_id == $category['category_id']}class="active"{/if}>
								<a href="{$system['system_url']}/market/category/{$category['category_id']}/{$category['category_url']}">
	                                {__($category['category_name'])}
	                            </a>
							</li>
						{/foreach}
					</ul>
				</div>
			</div>
		</div>
		<!-- left panel -->

		<!-- right panel -->
		<div class="col-sm-9 offcanvas-mainbar">

			{include file='_ads.tpl'}

			{if $view == "search"}
				<div class="alert alert-warning">
					<!-- results counter -->
		            <strong class="text-primary">{$total}</strong> 
		            {__("results were found for the search for")} 
		            <strong class="text-primary">{$query}</strong>
		            <!-- results counter -->
				</div>
            {/if}

            {if $view == "" && $promoted_products}
				<h4 class="mt0 mb20">{__("Promoted Products")}</h4>
				<div class="row mb20" style="border-bottom: 1px solid #ddd">
					{foreach $promoted_products as $post}
						<div class="col-md-4 col-sm-6">
							<div class="thumbnail boosted">
								<div class="boosted-icon" data-toggle="tooltip" title="{__('Promoted')}">
					                <i class="fa fa-bullhorn"></i>
					            </div>
								{if $post['photos_num'] > 0}
									<a class="thumbnail-picture" href="{$system['system_url']}/posts/{$post['post_id']}" style="background-image:url({$system['system_uploads']}/{$post['photos'][0]['source']});"></a>
								{else}
									<a class="thumbnail-picture" href="{$system['system_url']}/posts/{$post['post_id']}" style="background-image:url('{$system['system_url']}/content/themes/{$system['theme']}/images/blank_product.jpg');"></a>
								{/if}
								<a href="{$system['system_url']}/posts/{$post['post_id']}" class="title">{$post['product']['name']}</a>
								<div class="text" data-more="false" dir="auto">{$post['text']}</div>
								<div class="thumbnail-footer">
									<div class="row">
										<div class="col-xs-5 price">
											{$system['system_currency_symbol']}{$post['product']['price']}
										</div>
										<div class="col-xs-7 info">
											<a class="btn btn-primary btn-sm" href="{$system['system_url']}/posts/{$post['post_id']}">
												<i class="fa fa-info-circle"></i> {__("More info")}
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					{/foreach}
				</div>
            {/if}
			
			<div class="row">
				{if count($rows) > 0}
					{foreach $rows as $post}
						<div class="col-md-4 col-sm-6">
							<div class="thumbnail">
								{if $post['photos_num'] > 0}
									<a class="thumbnail-picture" href="{$system['system_url']}/posts/{$post['post_id']}" style="background-image:url({$system['system_uploads']}/{$post['photos'][0]['source']});"></a>
								{else}
									<a class="thumbnail-picture" href="{$system['system_url']}/posts/{$post['post_id']}" style="background-image:url('{$system['system_url']}/content/themes/{$system['theme']}/images/blank_product.jpg');"></a>
								{/if}
								<a href="{$system['system_url']}/posts/{$post['post_id']}" class="title">{$post['product']['name']}</a>
								<div class="text" data-more="false" dir="auto">{$post['text']}</div>
								<div class="thumbnail-footer">
									<div class="row">
										<div class="col-xs-5 price">
											{$system['system_currency_symbol']}{$post['product']['price']}
										</div>
										<div class="col-xs-7 info">
											<a class="btn btn-primary btn-sm" href="{$system['system_url']}/posts/{$post['post_id']}">
												<i class="fa fa-info-circle"></i> {__("More info")}
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					{/foreach}
				{else}
					<p class="text-center text-muted">
						{__("No products to show")}
					</p>
				{/if}
			</div>

	        {$pager}
		</div>
		<!-- right panel -->

	</div>
</div>
<!-- page content -->

{include file='_footer.tpl'}