{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="page-title">
    {$static['page_title']}
</div>

<div class="container offcanvas">
    <div class="row">

	    <!-- side panel -->
	    <div class="col-xs-12 visible-xs-block offcanvas-sidebar mt20">
	        {include file='_sidebar.tpl'}
	    </div>
	    <!-- side panel -->

	    <div class="col-xs-12 offcanvas-mainbar">
			<div class="row">
		        <div class="col-xs-10 col-xs-offset-1 text-readable ptb10">
		            {$static['page_text']}
		        </div>
		    </div>
	    </div>
	    
	</div>
</div>
<!-- page content -->

{include file='_footer.tpl'}