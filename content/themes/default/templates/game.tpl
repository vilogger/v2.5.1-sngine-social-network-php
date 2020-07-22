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
            <div class="post">
				<div class="post-body">
					<div class="post-header mb0">
						<div class="post-avatar">
							<div class="post-avatar-picture" style="background-image:url({$game['thumbnail']});">
							</div>
						</div>
						<div class="post-meta">
							<!-- game name -->
							<h3 style="margin-top: 5px; margin-bottom: 0;">{$game['title']}</h3>
							<!-- game name -->
						</div>
					</div>
				</div>
			</div>
			<div class="table-responsive">
				<iframe frameborder="0" src="{$game['source']}" width="940" height="560"></iframe>
			</div>
        </div>
        
	</div>
</div>
<!-- page content -->

{include file='_footer.tpl'}