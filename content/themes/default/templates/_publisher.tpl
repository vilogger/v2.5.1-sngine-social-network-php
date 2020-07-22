<div class="x-form publisher" data-handle="{$_handle}" {if $_id}data-id="{$_id}"{/if}>

    <!-- publisher loader -->
    <div class="publisher-loader">
        <div class="loader loader_small"></div>
    </div>
    <!-- publisher loader -->

    <!-- publisher tabs -->
    <ul class="publisher-tabs clearfix">
        <li>
            <span class="active js_publisher-tab" data-tab="post">
                <i class="fa fa-pencil fa-fw"></i> <span class="hidden-xs">{__("Write")}</span> {__("Post")}
            </span>
        </li>
        {if $system['photos_enabled']}
            <li>
                <span class="js_publisher-tab" data-tab="album">
                    <i class="fa fa-picture-o fa-fw"></i> <span class="hidden-xs">{__("Create")}</span> {__("Album")}
                </span>
            </li>
        {/if}
        <li class="dropdown">
            <span class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-bars fa-fw"></i> {__("More")}
            </span>
            <ul class="dropdown-menu">
                <li>
                    <span class="js_publisher-tab" data-tab="poll">
                        <i class="fa fa-pie-chart fa-fw"></i> {__("Create Poll")}
                    </span>
                </li>
                {if $system['market_enabled'] && $_handle != "group" && $_handle != "event"}
                    <li>
                        <span class="js_publisher-tab" data-tab="product">
                            <i class="fa fa-tag fa-fw"></i> {__("Sell Something")}
                        </span>
                    </li>
                {/if}
                {if $system['blogs_enabled'] && $_handle != "group" && $_handle != "event"}
                    <li>
                        <a href="{$system['system_url']}/blogs/new">
                            <i class="fa fa-file-text fa-fw"></i> {__("Write Article")}
                        </a>
                    </li>
                {/if}
                {if $system['videos_enabled']}
                    <li>
                        <span class="publisher-tools-attach js_publisher-tab" data-tab="video">
                            <i class="fa fa-video-camera fa-fw js_x-uploader" data-handle="publisher" data-type="video"></i> {__("Add Video")}
                        </span>
                    </li>
                {/if}
                {if $system['audio_enabled']}
                    <li>
                        <span class="publisher-tools-attach js_publisher-tab" data-tab="audio">
                            <i class="fa fa-music fa-fw js_x-uploader" data-handle="publisher" data-type="audio"></i> {__("Add Audio")}
                        </span>
                    </li>
                {/if}
                {if $system['file_enabled']}
                    <li>
                        <span class="publisher-tools-attach js_publisher-tab" data-tab="file">
                            <i class="fa fa-paperclip fa-fw js_x-uploader" data-handle="publisher" data-type="file"></i> {__("Add File")}
                        </span>
                    </li>
                {/if}
            </ul>
        </li>
    </ul>
    <!-- publisher tabs -->

    <!-- post product -->
    <div class="publisher-meta top" data-meta="product">
        <i class="fa fa-tag fa-fw"></i>
        <input name="name" type="text" placeholder='{__("What are you selling?")}'>
    </div>
    <div class="publisher-meta top" data-meta="product">
        <i class="fa fa-money fa-fw"></i>
        <input name="price" type="text" placeholder='{__("Add price")} ({$system["system_currency"]})'>
    </div>
    <div class="publisher-meta top" data-meta="product">
        <i class="fa fa-shopping-basket fa-fw"></i>
        <select name="category_id">
            {foreach $market_categories as $category}
                <option value="{$category['category_id']}">{__($category['category_name'])}</option>
            {/foreach}
        </select>
    </div>
    <div class="publisher-meta top" data-meta="product">
        <i class="fa fa-map-marker fa-fw"></i>
        <input name="location" class="js_geocomplete" type="text" placeholder='{__("Add Location (optional)")}'>
    </div>
    <!-- post product -->

    <!-- post message -->
    <div class="relative">
        <textarea dir="auto" class="js_autosize js_mention js_publisher-scraper" data-init-placeholder='{__("What is on your mind? #Hashtag.. @Mention.. Link..")}' placeholder='{__("What is on your mind? #Hashtag.. @Mention.. Link..")}'></textarea>
    </div>
    <!-- post message -->

    <!-- publisher scraper -->
    <div class="publisher-scraper"></div>
    <!-- publisher scraper -->

    <!-- post attachments -->
    <div class="publisher-attachments attachments clearfix x-hidden">
        <ul></ul>
    </div>
    <!-- post attachments -->

    <!-- post album -->
    <div class="publisher-meta" data-meta="album">
        <i class="fa fa-picture-o fa-fw"></i>
        <input type="text" placeholder='{__("Album title")}'>
    </div>
    <!-- post album -->

    <!-- post poll -->
    <div class="publisher-meta" data-meta="poll">
        <i class="fa fa-plus fa-fw"></i>
        <input type="text" placeholder='{__("Add an option")}...'>
    </div>
    <div class="publisher-meta" data-meta="poll">
        <i class="fa fa-plus fa-fw"></i>
        <input type="text" placeholder='{__("Add an option")}...'>
    </div>
    <!-- post poll -->

    <!-- post video -->
    <div class="publisher-meta" data-meta="video">
        <i class="fa fa-video-camera fa-fw"></i>
        {__("Video uploaded successfully")}
    </div>
    <!-- post video -->

    <!-- post audio -->
    <div class="publisher-meta" data-meta="audio">
        <i class="fa fa-music fa-fw"></i>
        {__("Audio uploaded successfully")}
    </div>
    <!-- post audio -->

    <!-- post file -->
    <div class="publisher-meta" data-meta="file">
        <i class="fa fa-file-text-o fa-fw"></i>
        {__("File uploaded successfully")}
    </div>
    <!-- post file -->

    <!-- post location -->
    <div class="publisher-meta" data-meta="location">
        <i class="fa fa-map-marker fa-fw"></i>
        <input class="js_geocomplete" type="text" placeholder='{__("Where are you?")}'>
    </div>
    <!-- post location -->

    <!-- post feelings -->
    <div class="publisher-meta feelings" data-meta="feelings">
        <div id="feelings-menu-toggle" data-init-text='{__("What are you doing?")}'>{__("What are you doing?")}</div>
        <div id="feelings-data" style="display: none">
            <input type="text" placeholder='{__("What are you doing?")}'>
            <span></span>
        </div>
        <div id="feelings-menu" class="dropdown-menu dropdown-widget">
            <div class="dropdown-widget-body ptb5">
                <div class="js_scroller">
                    <ul class="feelings-list">
                        {foreach $feelings as $feeling}
                            <li class="feeling-item js_feelings-add" data-action="{$feeling['action']}" data-placeholder="{__($feeling['placeholder'])}">
                                <div class="icon">
                                    <i class="twa twa-3x twa-{$feeling['icon']}"></i>
                                </div>
                                <div class="data">
                                    {__($feeling['text'])}
                                </div>
                            </li>
                        {/foreach}
                    </ul>
                </div>
            </div>
        </div>
        <div id="feelings-types" class="dropdown-menu dropdown-widget">
            <div class="dropdown-widget-body ptb5">
                <div class="js_scroller">
                    <ul class="feelings-list">
                        {foreach $feelings_types as $type}
                            <li class="feeling-item js_feelings-type" data-type="{$type['action']}" data-icon="{$type['icon']}">
                                <div class="icon">
                                    <i class="twa twa-3x twa-{$type['icon']}"></i>
                                </div>
                                <div class="data">
                                    {__($type['text'])}
                                </div>                        
                            </li>
                        {/foreach}
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- post feelings -->

    <!-- publisher-footer -->
    <div class="publisher-footer clearfix">
        <!-- publisher-tools -->
        <ul class="publisher-tools">
            {if $system['photos_enabled']}
                <li data-toggle="tooltip" data-placement="top" title='{__("Add Photos")}'>
                    <span class="publisher-tools-attach js_publisher-photos">
                        <i class="fa fa-camera fa-fw js_x-uploader" data-handle="publisher" data-multiple="true"></i>
                    </span>
                </li>
            {/if}
            {if $system['geolocation_enabled']}
                <li data-toggle="tooltip" data-placement="top" title='{__("Check In")}'>
                    <span class="js_publisher-location">
                        <i class="fa fa-map-marker fa-fw"></i>
                    </span>
                </li>
            {/if}
            <li class="relative" data-toggle="tooltip" data-placement="top" title='{__("Add Feelings & Activity")}'>
                <span class="js_publisher-feelings">
                    <i class="twa twa-smile"></i>
                </span>
            </li>
            <li class="relative">
                <span class="js_emoji-menu-toggle" data-toggle="tooltip" data-placement="top" title='{__("Insert an emoji")}'>
                    <i class="fa fa-smile-o fa-fw"></i>
                </span>
                {include file='_emoji-menu.tpl'}
            </li>
        </ul>
        <!-- publisher-tools -->

        <!-- publisher-buttons -->
        <div class="pull-right flip mt5 mr10">
            {if $_privacy}
                <!-- privacy -->
                {if $system['default_privacy'] == "me"}
                <div class="btn-group js_publisher-privacy" data-toggle="tooltip" data-placement="top" data-value="me" title='{__("Shared with: Only Me")}'>
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <i class="btn-group-icon fa fa-lock"></i> <span class="btn-group-text hidden-xs">{__("Only Me")}</span> <span class="caret"></span>
                    </button>
                {elseif $system['default_privacy'] == "friends"}
                <div class="btn-group js_publisher-privacy" data-toggle="tooltip" data-placement="top" data-value="friends" title='{__("Shared with: Friends")}'>
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <i class="btn-group-icon fa fa-users"></i> <span class="btn-group-text hidden-xs">{__("Friends")}</span> <span class="caret"></span>
                    </button>
                {else}
                <div class="btn-group js_publisher-privacy" data-toggle="tooltip" data-placement="top" data-value="public" title='{__("Shared with: Public")}'>
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <i class="btn-group-icon fa fa-globe"></i> <span class="btn-group-text hidden-xs">{__("Public")}</span> <span class="caret"></span>
                    </button>
                {/if}
                    <ul class="dropdown-menu" role="menu">
                        <li>
                            <a href="#" data-title='{__("Shared with: Public")}' data-value="public">
                                <i class="fa fa-globe"></i> {__("Public")}
                            </a>
                        </li>
                        <li>
                            <a href="#" data-title='{__("Shared with: Friends")}' data-value="friends">
                                <i class="fa fa-users"></i> {__("Friends")}
                            </a>
                        </li>
                        {if $_handle == 'me'}
                            <li>
                                <a href="#" data-title='{__("Shared with: Only Me")}' data-value="me">
                                    <i class="fa fa-lock"></i> {__("Only Me")}
                                </a>
                            </li>
                        {/if}
                    </ul>
                </div>
                <!-- privacy -->
            {/if}
            <button type="button" class="btn btn-primary js_publisher">{__("Post")}</button>
        </div>
        <!-- publisher-buttons -->
    </div>
    <!-- publisher-footer -->
</div>