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
                    <li {if $view == "" || $view == "find"}class="active"{/if}>
                        <a href="{$system['system_url']}/people">{__("Discover")}</a>
                    </li>
                    <li {if $view == "friend_requests"}class="active"{/if}>
                        <a href="{$system['system_url']}/people/friend_requests">
                            {__("Friend Requests")}
                            {if $user->_data['friend_requests_count'] > 0}
                                <span class="label label-danger ml5">{$user->_data['friend_requests_count']}</span>
                            {/if}
                        </a>
                    </li>
                    <li {if $view == "sent_requests"}class="active"{/if}>
                        <a href="{$system['system_url']}/people/sent_requests">
                            {__("Sent Requests")}
                            {if $user->_data['friend_requests_sent_count'] > 0}
                                <span class="label label-info ml5">{$user->_data['friend_requests_sent_count']}</span>
                            {/if}
                        </a>
                    </li>
                </ul>
            </div>
            <!-- tabs -->

            <!-- content -->
            <div class="row">
                <!-- left panel -->
                <div class="col-md-4 col-md-push-8">
                    <!-- search panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-search"></i> <strong>{__("Search")}</strong>
                        </div>
                        <div class="panel-body">
                            <form action="{$system['system_url']}/people/find" method="post">
                                <div class="form-group">
                                    <label>{__("Keyword")}</label>
                                    <input type="text" class="form-control" name="query">
                                </div>
                                <div class="form-group">
                                    <label>{__("Gender")}</label>
                                    <select class="form-control" name="gender">
                                        <option value="any">{__("Any")}</option>
                                        <option value="male">{__("Male")}</option>
                                        <option value="female">{__("Female")}</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>{__("Relationship")}</label>
                                    <select class="form-control" name="relationship">
                                        <option value="any">{__("Any")}</option>
                                        <option value="single">{__("Single")}</option>
                                        <option value="relationship">{__("In a relationship")}</option>
                                        <option value="married">{__("Married")}</option>
                                        <option value="complicated">{__("It's complicated")}</option>
                                        <option value="separated">{__("Separated")}</option>
                                        <option value="divorced">{__("Divorced")}</option>
                                        <option value="widowed">{__("Widowed")}</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>{__("Online Status")}</label>
                                    <select class="form-control" name="status">
                                        <option value="any">{__("Any")}</option>
                                        <option value="online">{__("Online")}</option>
                                        <option value="offline">{__("Offline")}</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary" name="submit">{__("Search")}</button>
                            </form>
                        </div>
                    </div>
                    <!-- search panel -->

                    {include file='_ads.tpl'}
                    {include file='_widget.tpl'}
                </div>
                <!-- left panel -->

                <!-- right panel -->
                <div class="col-md-8 col-md-pull-4">
                    <div class="panel panel-default">
                        {if $view == ""}
                            <div class="panel-heading light">
                                <strong>{__("People You May Know")}</strong>
                            </div>
                            <div class="panel-body">
                                {if count($people) > 0}
                                    <ul>
                                        {foreach $people as $_user}
                                        {include file='__feeds_user.tpl' _connection="add"}
                                        {/foreach}
                                    </ul>
                                {else}
                                    <p class="text-center text-muted">
                                        {__("No people available")}
                                    </p>
                                {/if}

                                <!-- see-more -->
                                {if count($people) >= $system['min_results']}
                                    <div class="alert alert-info see-more js_see-more" data-get="new_people">
                                        <span>{__("See More")}</span>
                                        <div class="loader loader_small x-hidden"></div>
                                    </div>
                                {/if}
                                <!-- see-more -->
                            </div>
                        {elseif $view == "find"}
                            <div class="panel-heading light">
                                <strong>{__("Search Results")}</strong>
                            </div>
                            <div class="panel-body">
                                {if count($people) > 0}
                                    <ul>
                                        {foreach $people as $_user}
                                        {include file='__feeds_user.tpl' _connection=$_user['connection']}
                                        {/foreach}
                                    </ul>
                                {else}
                                    <p class="text-center text-muted">
                                        {__("No people available for your search")}
                                    </p>
                                {/if}
                            </div>
                        {elseif $view == "friend_requests"}
                            <div class="panel-heading light">
                                <strong>{__("Respond to Your Friend Request")}</strong>
                            </div>
                            <div class="panel-body">
                                {if $user->_data['friend_requests_count'] > 0}
                                    <ul>
                                        {foreach $user->_data['friend_requests'] as $_user}
                                        {include file='__feeds_user.tpl' _connection="request"}
                                        {/foreach}
                                    </ul>
                                {else}
                                    <p class="text-center text-muted">
                                        {__("No new requests")}
                                    </p>
                                {/if}

                                <!-- see-more -->
                                {if $user->_data['friend_requests_count'] >= $system['max_results']}
                                    <div class="alert alert-info see-more js_see-more" data-get="friend_requests">
                                        <span>{__("See More")}</span>
                                        <div class="loader loader_small x-hidden"></div>
                                    </div>
                                {/if}
                                <!-- see-more -->
                            </div>
                        {elseif $view == "sent_requests"}
                            <div class="panel-heading light">
                                <strong>{__("Friend Requests Sent")}</strong>
                            </div>
                            <div class="panel-body">
                                {if $user->_data['friend_requests_sent_count'] > 0}
                                    <ul>
                                        {foreach $user->_data['friend_requests_sent'] as $_user}
                                        {include file='__feeds_user.tpl' _connection="cancel"}
                                        {/foreach}
                                    </ul>
                                {else}
                                    <p class="text-center text-muted">
                                        {__("No new requests")}
                                    </p>
                                {/if}

                                <!-- see-more -->
                                {if $user->_data['friend_requests_sent_count'] >= $system['max_results']}
                                    <div class="alert alert-info see-more js_see-more" data-get="friend_requests_sent">
                                        <span>{__("See More")}</span>
                                        <div class="loader loader_small x-hidden"></div>
                                    </div>
                                {/if}
                                <!-- see-more -->
                            </div>
                        {/if}
                    </div>
                </div>
                <!-- right panel -->
            </div>
            <!-- content -->

        </div>
        <!-- right panel -->

    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}