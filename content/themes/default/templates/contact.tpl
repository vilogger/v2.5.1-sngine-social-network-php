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
                                <i class="fa fa-envelope-o pr5"></i>
                                <strong>{__("Contact Us")}</strong>
                            </div>
                        </div>
                        <div class="panel-body">
                            <form class="js_ajax-forms form-horizontal" data-url="core/contact.php">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Name")} <span class="text-danger">*</span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="name">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Email")} <span class="text-danger">*</span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" name="email">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Subject")} <span class="text-danger">*</span>
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="subject">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Message")} <span class="text-danger">*</span>
                                    </label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" name="message" rows="5"></textarea>
                                    </div>
                                </div>

                                {if $system['reCAPTCHA_enabled']}
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"></label>
                                        <div class="col-sm-9">
                                            <!-- reCAPTCHA -->
                                            <script src='https://www.google.com/recaptcha/api.js'></script>
                                            <div class="g-recaptcha" data-sitekey="{$system['reCAPTCHA_site_key']}"></div>
                                            <!-- reCAPTCHA -->
                                        </div>
                                    </div>
                                {/if}

                                <div class="form-group">
                                    <div class="col-sm-9 col-sm-offset-3">
                                    <button type="submit" class="btn btn-primary">{__("Send")}</button>
                                    </div>
                                </div>

                                <!-- success -->
                                <div class="alert alert-success mb0 mt10 x-hidden" role="alert"></div>
                                <!-- success -->

                                <!-- error -->
                                <div class="alert alert-danger mb0 mt10 x-hidden" role="alert"></div>
                                <!-- error -->

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
                                    {include file='__feeds_page.tpl'}
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
                                    {include file='__feeds_group.tpl'}
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