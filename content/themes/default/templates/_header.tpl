{if !$user->_logged_in}
    <body data-hash-tok="{$session_hash['token']}" data-hash-pos="{$session_hash['position']}" class="visitor n_chat">
{else}
    <body data-hash-tok="{$session_hash['token']}" data-hash-pos="{$session_hash['position']}" data-chat-enabled="{$user->_data['user_chat_enabled']}" class="{if !$system['chat_enabled']}n_chat{/if}{if $system['activation_enabled'] && !$user->_data['user_activated']} n_activated{/if}{if !$system['system_live']} n_live{/if}">
{/if}
    
    <!-- main wrapper -->
    <div class="main-wrapper">
        
        {if $user->_logged_in && $system['activation_enabled'] && !$user->_data['user_activated']}
            <!-- top-bar -->
            <div class="top-bar">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-7 hidden-xs">
                            {if $system['activation_type'] == "email"}
                                {__("Please go to")} <span class="text-primary">{$user->_data['user_email']}</span> {__("to complete the sign-up process")}.
                            {else}
                                {__("Please check the SMS on your phone")} <strong>{$user->_data['user_phone']}</strong> {__("to complete the sign-up process")}.
                            {/if}
                        </div>
                        <div class="col-xs-12 col-sm-5">
                            {if $system['activation_type'] == "email"}
                                <span class="text-link" data-toggle="modal" data-url="core/activation_email_resend.php">
                                    {__("Resend Activation Email")}
                                </span>
                                 - 
                                <span class="text-link" data-toggle="modal" data-url="#activation-email-reset">
                                    {__("Change Email")}
                                </span>
                            {else}
                                <span class="btn btn-info btn-sm mr10" data-toggle="modal" data-url="#activation-phone">{__("Enter Code")}</span>
                                {if $user->_data['user_phone']}
                                    <span class="text-link" data-toggle="modal" data-url="core/activation_phone_resend.php">
                                        {__("Resend SMS")}
                                    </span>
                                     - 
                                {/if}
                                <span class="text-link" data-toggle="modal" data-url="#activation-phone-reset">
                                    {__("Change Phone Number")}
                                </span>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
            <!-- top-bar -->
        {/if}

        {if !$system['system_live']}
            <!-- top-bar alert-->
            <div class="top-bar alert-bar">
                <div class="container">
                    <i class="fa fa-exclamation-triangle fa-lg pr5"></i>
                    <span class="hidden-xs">{__("The system has been shutted down")}.</span>
                    <span>{__("Turn it on from")}</span> <a href="{$system['system_url']}/admincp/settings">{__("Admin Panel")}</a>
                </div>
            </div>
            <!-- top-bar alert-->
        {/if}

        <div class="main-header">
            <div class="container header-container">

                <div class="brand-container {if $user->_logged_in}hidden-xs{/if}">
                    <!-- brand -->
                    <a href="{$system['system_url']}" class="brand">
                        {if $system['system_logo']}
                            <img width="60" src="{$system['system_uploads']}/{$system['system_logo']}" alt="{$system['system_title']}" title="{$system['system_title']}">
                        {else}
                            {$system['system_title']}
                        {/if}
                    </a>
                    <!-- brand -->
                </div>

                <!-- navbar-collapse -->
                <div>

                    {if $user->_logged_in || (!$user->_logged_in && $system['system_public']) }
                        <!-- search -->
                        {include file='_header.search.tpl'}
                        <!-- search -->
                    {/if}

                    <!-- navbar-container -->
                    <div class="navbar-container">
                        <ul class="nav navbar-nav">
                            {if $user->_logged_in}
                                <li class="visible-xs-block">
                                    <a href="#" data-toggle="offcanvas" data-target=".sidebar-nav">
                                        <i class="fa fa-bars fa-lg"></i>
                                    </a>
                                </li>
                                <!-- home -->
                                <li>
                                    <a href="{$system['system_url']}">
                                        <i class="fa fa-home fa-lg"></i>
                                    </a>
                                </li>
                                <!-- home -->
                                
                                <!-- friend requests -->
                                {include file='_header.friend_requests.tpl'}
                                <!-- friend requests -->

                                <!-- messages -->
                                {include file='_header.messages.tpl'}
                                <!-- messages -->

                                <!-- notifications -->
                                {include file='_header.notifications.tpl'}
                                <!-- notifications -->

                                <!-- search -->
                                <li class="visible-xs-block">
                                    <a href="{$system['system_url']}/search">
                                        <i class="fa fa-search fa-lg"></i>
                                    </a>
                                </li>
                                <!-- search -->

                                <!-- user-menu -->
                                <li class="dropdown">
                                    <a href="{$system['system_url']}/{$user->_data['user_name']}" class="dropdown-toggle user-menu" data-toggle="dropdown">
                                        <img src="{$user->_data['user_picture']}" alt="">
                                        <span class="hidden-xs">{$user->_data['user_firstname']} {$user->_data['user_lastname']}</span>
                                        <i class="caret"></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                        {if $system['packages_enabled'] && !$user->_data['user_subscribed']}
                                            <li>
                                                <a href="{$system['system_url']}/packages">{__("Upgrade to Pro")}</a>
                                            </li>
                                            <li class="divider"></li>
                                        {/if}
                                        <li>
                                            <a href="{$system['system_url']}/{$user->_data['user_name']}">{__("Profile")}</a>
                                        </li>
                                        <li>
                                            <a href="{$system['system_url']}/settings/privacy">{__("Privacy")}</a>
                                        </li>
                                        <li>
                                            <a href="{$system['system_url']}/settings">{__("Settings")}</a>
                                        </li>
                                        {if $user->_is_admin}
                                            <li class="divider"></li>
                                            <li>
                                                <a href="{$system['system_url']}/admincp">{__("Admin Panel")}</a>
                                            </li>
                                        {/if}
                                        {if ($user->_data['user_group'] < 3 || $system['pages_enabled']) || ($user->_data['user_group'] < 3 || $system['groups_enabled'])}
                                            <li class="divider"></li>
                                            {if $user->_data['user_group'] < 3 || $system['pages_enabled']}
                                                <li>
                                                    <a href="{$system['system_url']}/pages/manage">{__("Manage Pages")}</a>
                                                </li>
                                            {/if}
                                            {if $user->_data['user_group'] < 3 || $system['groups_enabled']}
                                                <li>
                                                    <a href="{$system['system_url']}/groups/manage">{__("Manage Groups")}</a>
                                                </li>
                                            {/if}
                                        {/if}
                                        <li class="divider"></li>
                                        <li>
                                            <a href="{$system['system_url']}/signout">{__("Log Out")}</a>
                                        </li>
                                    </ul>
                                </li>
                                <!-- user-menu -->
                            {else}
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <span>{__("Join")}</span>
                                        <i class="caret"></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="{$system['system_url']}/signin">{__("Login")}</a>
                                        </li>
                                        {if $system['registration_enabled']}
                                            <li>
                                                <a href="{$system['system_url']}/signup">{__("Register")}</a>
                                            </li>
                                        {/if}
                                    </ul>
                                </li>
                            {/if}
                        </ul>
                    </div>
                    <!-- navbar-container -->
                </div>
                <!-- navbar-collapse -->

            </div>
        </div>
        
        <!-- ads -->
        {include file='_ads.tpl' _ads=$ads_master['header'] _master=true}
        <!-- ads -->