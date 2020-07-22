<ul class="nav nav-pills nav-stacked nav-home js_sticky-sidebar">
    <!-- basic -->
    <li>
        <a href="{$system['system_url']}/{$user->_data['user_name']}">
            <img src="{$user->_data.user_picture}" alt="{$user->_data['user_firstname']} {$user->_data['user_lastname']}">
            <span>{$user->_data['user_firstname']} {$user->_data['user_lastname']}</span>
        </a>
    </li>
    <li>
        <a href="{$system['system_url']}/messages">
            <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/chat_1.png">
            {__("Messages")}
        </a>
    </li>
    <li>
        <a href="{$system['system_url']}/settings">
            <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/settings_1.png">
            {__("Settings")}
        </a>
    </li>
    {if $user->_data['user_group'] == 1}
        <li>
            <a href="{$system['system_url']}/admincp">
                <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/admin_1.png">
                {__("Admin Panel")}
            </a>
        </li>
    {/if}
    <!-- basic -->

    <!-- favorites -->
    <li class="ptb5">
        <small class="text-muted">{__("favorites")|upper}</small>
    </li>

    <li {if $page== "index" && $view == ""}class="active"{/if}>
        <a href="{$system['system_url']}">
            <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/newfeed_1.png">
            {__("News Feed")}
        </a>
    </li>

    <li>
        <a href="{$system['system_url']}/{$user->_data['user_name']}/friends">
            <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/friends_1.png">
            {__("My Friends")}
        </a>
    </li>

    <li>
        <a href="{$system['system_url']}/{$user->_data['user_name']}/photos">
            <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/pictures_1.png">
            {__("My Photos")}
        </a>
    </li>

    {if $system['blogs_enabled']}
        <li {if $page== "index" && $view == "articles"}class="active"{/if}>
            <a href="{$system['system_url']}/articles">
                <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/article_1.png">
                {__("My Articles")}
            </a>
        </li>
    {/if}
    
    {if $system['market_enabled']}
        <li {if $page== "index" && $view == "products"}class="active"{/if}>
            <a href="{$system['system_url']}/products">
                <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/products_1.png">
                {__("My Products")}
            </a>
        </li>
    {/if}
    
    <li {if $page== "index" && $view == "saved"}class="active"{/if}>
        <a href="{$system['system_url']}/saved">
            <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/saved_1.png">
            {__("Saved Posts")}
        </a>
    </li>
    <!-- favorites -->

    <!-- explore -->
    <li class="ptb5">
        <small class="text-muted">{__("explore")|upper}</small>
    </li>

    <li {if $page== "people"}class="active"{/if}>
        <a href="{$system['system_url']}/people">
            <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/people_1.png">
            {__("People")}
        </a>
    </li>

    {if $user->_data['user_group'] < 3 || $system['pages_enabled']}
        <li {if $page== "pages"}class="active"{/if}>
            <a href="{$system['system_url']}/pages">
                <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/pages_1.png">
                {__("Pages")}
            </a>
        </li>
    {/if}

    {if $user->_data['user_group'] < 3 || $system['groups_enabled']}
        <li {if $page== "groups"}class="active"{/if}>
            <a href="{$system['system_url']}/groups">
                <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/groups_1.png">
                {__("Groups")}
            </a>
        </li>
    {/if}

    {if $system['events_enabled']}
        <li {if $page== "events"}class="active"{/if}>
            <a href="{$system['system_url']}/events">
                <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/events_1.png">
                {__("Events")}
            </a>
        </li>
    {/if}

    {if $system['blogs_enabled']}
        <li>
            <a href="{$system['system_url']}/blogs">
                <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/blogs_1.png">
                {__("Blogs")}
            </a>
        </li>
    {/if}

    {if $system['market_enabled']}
        <li>
            <a href="{$system['system_url']}/market">
                <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/market_1.png">
                {__("Market")}
            </a>
        </li>
    {/if}

    {if $system['games_enabled']}
        <li {if $page== "games"}class="active"{/if}>
            <a href="{$system['system_url']}/games">
                <img src="{$system['system_url']}/content/themes/{$system['theme']}/images/icons/games_1.png">
                {__("Games")}
            </a>
        </li>
    {/if}
    <!-- explore -->

</ul>