{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="container mt20 offcanvas">
    <div class="row">

        <!-- threads -->
        <div class="col-sm-4 offcanvas-sidebar">
            <div class="panel panel-default panel-conversations">
                <div class="panel-heading">
                     {__("Inbox")}
                </div>
                <div class="panel-body js_live-messages-alt">
                    {if count($user->_data['conversations']) > 0}
                        <div class="js_scroller" data-slimScroll-height="100%">
                            <ul>
                                {foreach $user->_data['conversations'] as $_conversation}
                                {include file='__feeds_conversation.tpl' conversation=$_conversation}
                                {/foreach}
                            </ul>

                            {if count($user->_data['conversations']) >= $system['max_results']}
                            <!-- see-more -->
                            <div class="alert alert-post see-more small mlr5 js_see-more" data-get="conversations">
                                <span>{__("Load Older Threads")}</span>
                                <div class="loader loader_small x-hidden"></div>
                            </div>
                            <!-- see-more -->
                            {/if}
                        </div>
                    {/if}
                </div>
            </div>
        </div>
        <!-- threads -->

        <!-- conversation -->
        <div class="col-sm-8 offcanvas-mainbar js_conversation-container">
            {if $view == "new"}
                <div class="panel panel-default panel-messages fresh">
                    <div class="panel-heading clearfix">
                        <div class="mt5">
                            {__("New Message")}
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="chat-conversations js_scroller" data-slimScroll-height="367px"></div>
                        <div class="chat-to clearfix js_autocomplete">
                            <div class="to">{__("To")}:</div>
                            <ul class="tags"></ul>
                            <div class="typeahead">
                                <input type="text" size="1" autofocus>
                            </div>
                        </div>
                        <div class="chat-attachments attachments clearfix x-hidden">
                            <ul>
                                <li class="loading">
                                    <div class="loader loader_small"></div>
                                </li>
                            </ul>
                        </div>
                        <div class="chat-form-container">
                            <div class="x-form chat-form">
                                <div class="chat-form-message">
                                    <textarea class="js_autosize js_post-message" placeholder='{__("Write a message")}'></textarea>
                                </div>
                                <div class="x-form-tools">
                                    <div class="x-form-tools-attach">
                                        <i class="fa fa-camera js_x-uploader" data-handle="chat"></i>
                                    </div>
                                    <div class="x-form-tools-emoji js_emoji-menu-toggle">
                                        <i class="fa fa-smile-o fa-lg"></i>
                                    </div>
                                    {include file='_emoji-menu.tpl'}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {else}
                {if $conversation}
                    {include file='ajax.chat.conversation.tpl'}
                {else}
                    <div class="panel panel-default panel-messages empty">
                        <div class="panel-heading clearfix">
                            <div class="pull-right flip">
                                <a href="{$system['system_url']}/messages/new" class="btn btn-default js_chat-start">
                                    <i class="fa fa-comment-o"></i>
                                    {__("New Message")}
                                </a>
                            </div>
                            <div class="mt5 text-muted">{__("No Selection")}</div>
                        </div>
                        <div class="panel-body">
                            <h4>{__("No Conversation Selected")}</h4>
                            <a href="{$system['system_url']}/messages/new" class="text-link js_chat-start">{__("New Message")}</a>
                        </div>
                    </div>
                {/if}
            {/if}
        </div>
        <!-- conversation -->

    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}