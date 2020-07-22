<div class="panel panel-default">
    <div class="panel-heading with-icon">
        <i class="fa fa-cog pr5 panel-icon"></i>
        <strong>{__("Settings")}</strong>
        {if $sub_view == "posts"} &rsaquo; <strong>{__("Posts")}</strong>{/if}
        {if $sub_view == "registration"} &rsaquo; <strong>{__("Registration")}</strong>{/if}
        {if $sub_view == "social_login"} &rsaquo; <strong>{__("Social Login")}</strong>{/if}
        {if $sub_view == "emails"} &rsaquo; <strong>{__("Emails")}</strong>{/if}
        {if $sub_view == "sms"} &rsaquo; <strong>{__("SMS")}</strong>{/if}
        {if $sub_view == "chat"} &rsaquo; <strong>{__("Chat")}</strong>{/if}
        {if $sub_view == "video_chat"} &rsaquo; <strong>{__("Video Chat")}</strong>{/if}
        {if $sub_view == "uploads"} &rsaquo; <strong>{__("Uploads")}</strong>{/if}
        {if $sub_view == "security"} &rsaquo; <strong>{__("Security")}</strong>{/if}
        {if $sub_view == "payments"} &rsaquo; <strong>{__("Payments")}</strong>{/if}
        {if $sub_view == "limits"} &rsaquo; <strong>{__("Limits")}</strong>{/if}
        {if $sub_view == "analytics"} &rsaquo; <strong>{__("Analytics")}</strong>{/if}
    </div>
    <div class="panel-body">

        {if $sub_view == ""}

            <!-- tabs nav -->
            <ul class="nav nav-tabs admin mb20">
                <li class="active">
                    <a href="#General" data-toggle="tab">
                        <i class="fa fa-server fa-fw mr5"></i><strong class="pr5">{__("General")}</strong>
                    </a>
                </li>
                <li>
                    <a href="#Features" data-toggle="tab">
                        <i class="fa fa-microchip fa-fw mr5"></i><strong class="pr5">{__("Features")}</strong>
                    </a>
                </li>
            </ul>
            <!-- tabs nav -->

            <!-- tabs content -->
            <div class="tab-content">
                <!-- General -->
                <div class="tab-pane active" id="General">
                    <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=general_settings">
                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Website Public")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="system_public">
                                    <input type="checkbox" name="system_public" id="system_public" {if $system['system_public']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Make the website public to allow non logged users to view website content")}
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Website Live")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="system_live">
                                    <input type="checkbox" name="system_live" id="system_live" {if $system['system_live']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Turn the entire website On and Off")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Shutdown Message")}
                            </label>
                            <div class="col-sm-9">
                                <textarea class="form-control" name="system_message" rows="3">{$system['system_message']}</textarea>
                                <span class="help-block">
                                    {__("The text that is presented when the site is closed")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Website Title")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="system_title" value="{$system['system_title']}">
                                <span class="help-block">
                                    {__("Title of your website")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Website Description")}
                            </label>
                            <div class="col-sm-9">
                                <textarea class="form-control" name="system_description" rows="3">{$system['system_description']}</textarea>
                                <span class="help-block">
                                    {__("Description of your website")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Website Keywords")}
                            </label>
                            <div class="col-sm-9">
                                <textarea class="form-control" name="system_keywords" rows="3">{$system['system_keywords']}</textarea>
                                <span class="help-block">
                                    {__("Example: social, sngine, social site")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Website Email")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="system_email" value="{$system['system_email']}">
                                <span class="help-block">
                                    {__("The contact email that all messages send to")}
                                </span>
                            </div>
                        </div>

                        

                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
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
                <!-- General -->

                <!-- Features -->
                <div class="tab-pane" id="Features">
                    <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=features_settings">
                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Contact Us")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="contact_enabled">
                                    <input type="checkbox" name="contact_enabled" id="contact_enabled" {if $system['contact_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Turn the contact us page On and Off")}
                                </span>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Directory")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="directory_enabled">
                                    <input type="checkbox" name="directory_enabled" id="directory_enabled" {if $system['directory_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable the directory for better SEO results")}<br>
                                    {__("Make the website public to allow non logged users to view website content")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Pages")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="pages_enabled">
                                    <input type="checkbox" name="pages_enabled" id="pages_enabled" {if $system['pages_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Users can create pages or only admins/moderators")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Groups")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="groups_enabled">
                                    <input type="checkbox" name="groups_enabled" id="groups_enabled" {if $system['groups_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Users can create groups or only admins/moderators")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Events")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="events_enabled">
                                    <input type="checkbox" name="events_enabled" id="events_enabled" {if $system['events_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Users can create events or only admins/moderators")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Blogs")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="blogs_enabled">
                                    <input type="checkbox" name="blogs_enabled" id="blogs_enabled" {if $system['blogs_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Allow users to create blogs")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Market")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="market_enabled">
                                    <input type="checkbox" name="market_enabled" id="market_enabled" {if $system['market_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Allow users to sell/buy products")}
                                </span>
                            </div>
                        </div>                

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Games")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="games_enabled">
                                    <input type="checkbox" name="games_enabled" id="games_enabled" {if $system['games_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Turn the games On and Off")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("DayTime Messages")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="daytime_msg_enabled">
                                    <input type="checkbox" name="daytime_msg_enabled" id="daytime_msg_enabled" {if $system['daytime_msg_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Turn the DayTime Messages (Good Morning, Afternoon, Evening) On and Off")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Verification Requests")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="verification_requests">
                                    <input type="checkbox" name="verification_requests" id="verification_requests" {if $system['verification_requests']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Turn the verification requests from users & pages On and Off")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Profile Visit Notification")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="profile_notification_enabled">
                                    <input type="checkbox" name="profile_notification_enabled" id="profile_notification_enabled" {if $system['profile_notification_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Turn the profile visit notification On and Off")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
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
                <!-- Features -->
            </div>

        {elseif $sub_view == "posts"}

            <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=posts">
                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Stories")}
                    </label>
                    <div class="col-sm-9">
                        <label class="switch" for="stories_enabled">
                            <input type="checkbox" name="stories_enabled" id="stories_enabled" {if $system['stories_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="help-block">
                            {__("Turn the stories On and Off")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Wall Posts")}
                    </label>
                    <div class="col-sm-9">
                        <label class="switch" for="wall_posts_enabled">
                            <input type="checkbox" name="wall_posts_enabled" id="wall_posts_enabled" {if $system['wall_posts_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="help-block">
                            {__("Users can publish posts on their friends walls")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Social Share")}
                    </label>
                    <div class="col-sm-9">
                        <label class="switch" for="social_share_enabled">
                            <input type="checkbox" name="social_share_enabled" id="social_share_enabled" {if $system['social_share_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="help-block">
                            {__("Turn the social share for posts On and Off")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Smart YouTube Player")}
                    </label>
                    <div class="col-sm-9">
                        <label class="switch" for="smart_yt_player">
                            <input type="checkbox" name="smart_yt_player" id="smart_yt_player" {if $system['smart_yt_player']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="help-block">
                            {__("Smart YouTube player will save a lot of bandwidth")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Geolocation")}
                    </label>
                    <div class="col-sm-9">
                        <label class="switch" for="geolocation_enabled">
                            <input type="checkbox" name="geolocation_enabled" id="geolocation_enabled" {if $system['geolocation_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="help-block">
                            {__("Turn the post Geolocation On and Off")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Geolocation Google Key")}
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="geolocation_key" value="{$system['geolocation_key']}">
                        <span class="help-block">
                            {__("Check the documentation to learn how to get this key")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Default Privacy")}
                    </label>
                    <div class="col-sm-9">
                        <select class="form-control selectpicker" name="default_privacy">
                            <option value="public" {if $system['default_privacy'] == "public"}selected{/if} data-content="<div class='option'><div class='icon'><i class='fa fa-globe fa-2x fa-fw'></i></div><div class='text'><b>{__('Public')}</b><br>{__('Anyone one can see the post')}</div></div>">{__("Public")}</option>
                            <option value="friends" {if $system['default_privacy'] == "friends"}selected{/if} data-content="<div class='option'><div class='icon'><i class='fa fa-users fa-2x fa-fw'></i></div><div class='text'><b>{__('Friends')}</b><br>{__('Only post author friends can see the post')}</div></div>">{__("Friends")}</option>
                            <option value="me" {if $system['default_privacy'] == "me"}selected{/if} data-content="<div class='option'><div class='icon'><i class='fa fa-lock fa-2x fa-fw'></i></div><div class='text'><b>{__('Only Me')}</b><br>{__('Only post author can see the post')}</div></div>">{__("Only Me")}</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                    </div>
                </div>

                <!-- success -->
                <div class="alert alert-success mb0 mt10 x-hidden" role="alert"></div>
                <!-- success -->

                <!-- error -->
                <div class="alert alert-danger mb0 mt10 x-hidden" role="alert"></div>
                <!-- error -->
            </form>

        {elseif $sub_view == "registration"}

            <!-- tabs nav -->
            <ul class="nav nav-tabs admin mb20">
                <li class="active">
                    <a href="#General" data-toggle="tab">
                        <i class="fa fa-sign-in fa-fw mr5"></i><strong class="pr5">{__("General")}</strong>
                    </a>
                </li>
                <li>
                    <a href="#Social" data-toggle="tab">
                        <i class="fa fa-facebook-official fa-fw mr5"></i><strong class="pr5">{__("Social Login")}</strong>
                    </a>
                </li>
            </ul>
            <!-- tabs nav -->

            <!-- tabs content -->
            <div class="tab-content">
                <!-- General -->
                <div class="tab-pane active" id="General">
                    <div class="alert alert-info">
                        <div class="icon">
                            <i class="fa fa-info-circle fa-2x"></i>
                        </div>
                        <div class="text pt5">
                            {__("If Registration is Free and Pro Packages enabled they will be used as an optional upgrading plans")}.
                        </div>
                    </div>

                    <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=registration">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Registration Enabled")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="registration_enabled">
                                    <input type="checkbox" name="registration_enabled" id="registration_enabled" {if $system['registration_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Allow users to create accounts")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Registration Type")}
                            </label>
                            <div class="col-sm-9">
                                <div class="radio radio-primary radio-inline">
                                    <input type="radio" name="registration_type" id="registration_free" value="free" {if $system['registration_type'] == "free"}checked{/if}>
                                    <label for="registration_free">{__("Free")}</label>
                                </div>
                                <div class="radio radio-primary radio-inline">
                                    <input type="radio" name="registration_type" id="registration_paid" value="paid" {if $system['registration_type'] == "paid"}checked{/if}>
                                    <label for="registration_paid">{__("Subscriptions Only")}</label>
                                </div>
                                <span class="help-block">
                                    {__("Allow users to create accounts Free or via Subscriptions only")}<br>
                                    {__("Make sure you have configured")} <a href="{$system['system_url']}/admincp/packages">{__("Pro Packages")}</a>
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Pro Packages Enabled")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="packages_enabled">
                                    <input type="checkbox" name="packages_enabled" id="packages_enabled" {if $system['packages_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable pro packages to be used as upgrading plans or for subscriptions")}<br>
                                    {__("Make sure you have configured")} <a href="{$system['system_url']}/admincp/settings/payments">{__("Payments Settings")}</a>
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Activation Enabled")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="activation_enabled">
                                    <input type="checkbox" name="activation_enabled" id="activation_enabled" {if $system['activation_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable account activation to send activation code to user's email/phone")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Activation Via")}
                            </label>
                            <div class="col-sm-9">
                                <div class="radio radio-primary radio-inline">
                                    <input type="radio" name="activation_type" id="activation_email" value="email" {if $system['activation_type'] == "email"}checked{/if}>
                                    <label for="activation_email">{__("Email")}</label>
                                </div>
                                <div class="radio radio-primary radio-inline">
                                    <input type="radio" name="activation_type" id="activation_sms" value="sms" {if $system['activation_type'] == "sms"}checked{/if}>
                                    <label for="activation_sms">{__("SMS")}</label>
                                </div>
                                <span class="help-block">
                                    {__("Select Email or SMS activation to send activation code to user's email/phone")}<br>
                                    {__("Make sure you have configured")} <a href="{$system['system_url']}/admincp/settings/sms">{__("SMS Settings")}</a>
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Age Restriction")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="age_restriction">
                                    <input type="checkbox" name="age_restriction" id="age_restriction" {if $system['age_restriction']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable/Disable age restriction")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Minimum Age")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="minimum_age" value="{$system['minimum_age']}">
                                <span class="help-block">
                                    {__("The minimum age required to register (in years)")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Getting Started")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="getting_started">
                                    <input type="checkbox" name="getting_started" id="getting_started" {if $system['getting_started']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable/Disable getting started page after registration")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Delete Account")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="delete_accounts_enabled">
                                    <input type="checkbox" name="delete_accounts_enabled" id="delete_accounts_enabled" {if $system['delete_accounts_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Allow users to delete their account")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Accounts/IP")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="max_accounts" value="{$system['max_accounts']}">
                                <span class="help-block">
                                    {__("Number of accounts allowed to register per IP (0 for unlimited)")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
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
                <!-- General -->

                <!-- Social -->
                <div class="tab-pane" id="Social">
                    <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=social_login">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Social Logins")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="social_login_enabled">
                                    <input type="checkbox" name="social_login_enabled" id="social_login_enabled" {if $system['social_login_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Turn registration/login via social media (Facebook, Twitter and etc) On and Off")}
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <!-- facebook -->
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <i class="fa fa-facebook-square fa-4x" style="color: #3B579D"></i>
                            </label>
                            <div class="col-sm-9 mt10">
                                <label class="switch" for="facebook_login_enabled">
                                    <input type="checkbox" name="facebook_login_enabled" id="facebook_login_enabled" {if $system['facebook_login_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Turn registration/login via Facebook On and Off")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Facebook App ID")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="facebook_appid" value="{$system['facebook_appid']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Facebook App Secret")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="facebook_secret" value="{$system['facebook_secret']}">
                            </div>
                        </div>
                        <!-- facebook -->

                        <div class="divider"></div>

                        <!-- twitter -->
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <i class="fa fa-twitter-square fa-4x" style="color: #55ACEE"></i>
                            </label>
                            <div class="col-sm-9 mt10">
                                <label class="switch" for="twitter_login_enabled">
                                    <input type="checkbox" name="twitter_login_enabled" id="twitter_login_enabled" {if $system['twitter_login_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Turn registration/login via Twitter On and Off")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Twitter App ID")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="twitter_appid" value="{$system['twitter_appid']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Twitter App Secret")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="twitter_secret" value="{$system['twitter_secret']}">
                            </div>
                        </div>
                        <!-- twitter -->

                        <div class="divider"></div>

                        <!-- google -->
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <i class="fa fa-google-plus-square fa-4x" style="color: #DC4A38"></i>
                            </label>
                            <div class="col-sm-9 mt10">
                                <label class="switch" for="google_login_enabled">
                                    <input type="checkbox" name="google_login_enabled" id="google_login_enabled" {if $system['google_login_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Turn registration/login via Google On and Off")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Google App ID")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="google_appid" value="{$system['google_appid']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Google App Secret")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="google_secret" value="{$system['google_secret']}">
                            </div>
                        </div>
                        <!-- google -->

                        <div class="divider"></div>

                        <!-- instagram -->
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <i class="fa fa-instagram fa-4x" style="color: #3f729b"></i>
                            </label>
                            <div class="col-sm-9 mt10">
                                <label class="switch" for="instagram_login_enabled">
                                    <input type="checkbox" name="instagram_login_enabled" id="instagram_login_enabled" {if $system['instagram_login_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Turn registration/login via Instagram On and Off")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Instagram App ID")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="instagram_appid" value="{$system['instagram_appid']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Instagram App Secret")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="instagram_secret" value="{$system['instagram_secret']}">
                            </div>
                        </div>
                        <!-- instagram -->

                        <div class="divider"></div>

                        <!-- linkedin -->
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <i class="fa fa-linkedin-square fa-4x" style="color: #1A84BC"></i>
                            </label>
                            <div class="col-sm-9 mt10">
                                <label class="switch" for="linkedin_login_enabled">
                                    <input type="checkbox" name="linkedin_login_enabled" id="linkedin_login_enabled" {if $system['linkedin_login_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Turn registration/login via Linkedin On and Off")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Linkedin App ID")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="linkedin_appid" value="{$system['linkedin_appid']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Linkedin App Secret")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="linkedin_secret" value="{$system['linkedin_secret']}">
                            </div>
                        </div>
                        <!-- linkedin -->

                        <div class="divider"></div>

                        <!-- vk -->
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <i class="fa fa-vk fa-4x" style="color: #527498"></i>
                            </label>
                            <div class="col-sm-9 mt10">
                                <label class="switch" for="vkontakte_login_enabled">
                                    <input type="checkbox" name="vkontakte_login_enabled" id="vkontakte_login_enabled" {if $system['vkontakte_login_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Turn registration/login via Vkontakte On and Off")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Vkontakte App ID")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="vkontakte_appid" value="{$system['vkontakte_appid']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Vkontakte App Secret")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="vkontakte_secret" value="{$system['vkontakte_secret']}">
                            </div>
                        </div>
                        <!-- vk -->

                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
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
                <!-- Social -->
            </div>

        {elseif $sub_view == "emails"}

            <!-- tabs nav -->
            <ul class="nav nav-tabs admin mb20">
                <li class="active">
                    <a href="#SMTP" data-toggle="tab">
                        <i class="fa fa-server fa-fw mr5"></i><strong class="pr5">{__("SMTP")}</strong>
                    </a>
                </li>
                <li>
                    <a href="#Notifications" data-toggle="tab">
                        <i class="fa fa-envelope-open-o fa-fw mr5"></i><strong class="pr5">{__("Email Notifications")}</strong>
                    </a>
                </li>
            </ul>
            <!-- tabs nav -->

            <!-- tabs content -->
            <div class="tab-content">
                <!-- SMTP -->
                <div class="tab-pane active" id="SMTP">
                    <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=emails">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("SMTP Emails")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="email_smtp_enabled">
                                    <input type="checkbox" name="email_smtp_enabled" id="email_smtp_enabled" {if $system['email_smtp_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable/Disable SMTP email system")}<br/>
                                    {__("PHP mail() function will be used in case of disabled")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("SMTP Require Authentication")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="email_smtp_authentication">
                                    <input type="checkbox" name="email_smtp_authentication" id="email_smtp_authentication" {if $system['email_smtp_authentication']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable/Disable SMTP email system")}<br/>
                                    {__("PHP mail() function will be used in case of disabled")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("SMTP SSL Encryption")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="email_smtp_ssl">
                                    <input type="checkbox" name="email_smtp_ssl" id="email_smtp_ssl" {if $system['email_smtp_ssl']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable/Disable SMTP SSL encryption")}<br/>
                                    {__("TLS encryption will be used in case of disabled")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("SMTP Server")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="email_smtp_server" value="{$system['email_smtp_server']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("SMTP Port")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="email_smtp_port" value="{$system['email_smtp_port']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("SMTP Username")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="email_smtp_username" value="{$system['email_smtp_username']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("SMTP Password")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="email_smtp_password" value="{$system['email_smtp_password']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Set From")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="email_smtp_setfrom" value="{$system['email_smtp_setfrom']}">
                                <span class="help-block">
                                    {__("Set the From email address")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                                <button type="button" class="btn btn-danger js_admin-tester" data-handle="smtp" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> {__('Loading')}">
                                    <i class="fa fa-bolt"></i> {__("Test Connection")}
                                </button>
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
                <!-- SMTP -->

                <!-- Notifications -->
                <div class="tab-pane" id="Notifications">
                    <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=email_notifications">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Email Notifications")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="email_notifications">
                                    <input type="checkbox" name="email_notifications" id="email_notifications" {if $system['email_notifications']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable/Disable email notifications system")}<br/>
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Email User When")}
                            </label>
                            <div class="col-sm-9">
                                <div class="checkbox checkbox-primary">
                                    <input type="checkbox" name="email_post_likes" id="email_post_likes" {if $system['email_post_likes']}checked{/if}>
                                    <label for="email_post_likes">{__("Someone liked his post")}</label>
                                </div>
                                <div class="checkbox checkbox-primary">
                                    <input type="checkbox" name="email_post_comments" id="email_post_comments" {if $system['email_post_comments']}checked{/if}>
                                    <label for="email_post_comments">{__("Someone commented on his post")}</label>
                                </div>
                                <div class="checkbox checkbox-primary">
                                    <input type="checkbox" name="email_post_shares" id="email_post_shares" {if $system['email_post_shares']}checked{/if}>
                                    <label for="email_post_shares">{__("Someone shared his post")}</label>
                                </div>
                                <div class="checkbox checkbox-primary">
                                    <input type="checkbox" name="email_wall_posts" id="email_wall_posts" {if $system['email_wall_posts']}checked{/if}>
                                    <label for="email_wall_posts">{__("Someone posted on his timeline")}</label>
                                </div>
                                <div class="checkbox checkbox-primary">
                                    <input type="checkbox" name="email_mentions" id="email_mentions" {if $system['email_mentions']}checked{/if}>
                                    <label for="email_mentions">{__("Someone mentioned him")}</label>
                                </div>
                                <div class="checkbox checkbox-primary">
                                    <input type="checkbox" name="email_profile_visits" id="email_profile_visits" {if $system['email_profile_visits']}checked{/if}>
                                    <label for="email_profile_visits">{__("Someone visited his profile")}</label>
                                </div>
                                <div class="checkbox checkbox-primary">
                                    <input type="checkbox" name="email_friend_requests" id="email_friend_requests" {if $system['email_friend_requests']}checked{/if}>
                                    <label for="email_friend_requests">{__("Someone sent him or accepted his friend requset")}</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
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
                <!-- Notifications -->
            </div>
            <!-- tabs content -->

        {elseif $sub_view == "sms"}

            <!-- SMS -->
            <div class="alert alert-info">
                <div class="icon">
                    <i class="fa fa-info-circle fa-2x"></i>
                </div>
                <div class="text">
                    {__("To start using SMS, you'll need to create an account at")} <a target="_blank" href="https://www.twilio.com">Twilio</a><br>
                    {__("Check the documentation for more help")}.
                </div>
            </div>

            <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=sms">
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Twilio Account SID")}
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="twilio_sid" value="{$system['twilio_sid']}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Twilio AUTH TOKEN")}
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="twilio_token" value="{$system['twilio_token']}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Twilio Phone Number")}
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="twilio_phone" value="{$system['twilio_phone']}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Test Phone Number")}
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="system_phone" value="{$system['system_phone']}">
                        <span class="help-block">
                            {__("Your phone number to test the SMS service i.e +12344567890")}<br/>
                            {__("A test SMS will be sent to this phone number when you test the connection")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                        <button type="button" class="btn btn-danger js_admin-tester" data-handle="sms" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> {__('Loading')}">
                            <i class="fa fa-bolt"></i> {__("Test Connection")}
                        </button>
                    </div>
                </div>

                <!-- success -->
                <div class="alert alert-success mb0 mt10 x-hidden" role="alert"></div>
                <!-- success -->

                <!-- error -->
                <div class="alert alert-danger mb0 mt10 x-hidden" role="alert"></div>
                <!-- error -->
            </form>
            <!-- SMS -->

        {elseif $sub_view == "chat"}

            <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=chat">
                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Chat Enabled")}
                    </label>
                    <div class="col-sm-9">
                        <label class="switch" for="chat_enabled">
                            <input type="checkbox" name="chat_enabled" id="chat_enabled" {if $system['chat_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="help-block">
                            {__("Turn the chat system On and Off")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("User Status Enabled")}
                    </label>
                    <div class="col-sm-9">
                        <label class="switch" for="chat_status_enabled">
                            <input type="checkbox" name="chat_status_enabled" id="chat_status_enabled" {if $system['chat_status_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="help-block">
                            {__("Turn the Last Seen On and Off")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                    </div>
                </div>

                <!-- success -->
                <div class="alert alert-success mb0 mt10 x-hidden" role="alert"></div>
                <!-- success -->

                <!-- error -->
                <div class="alert alert-danger mb0 mt10 x-hidden" role="alert"></div>
                <!-- error -->
            </form>

        {elseif $sub_view == "uploads"}

            <!-- tabs nav -->
            <ul class="nav nav-tabs admin mb20">
                <li class="active">
                    <a href="#General" data-toggle="tab">
                        <i class="fa fa-upload fa-fw mr5"></i><strong class="pr5">{__("General")}</strong>
                    </a>
                </li>
                <li>
                    <a href="#S3" data-toggle="tab">
                        <i class="fa fa-amazon fa-fw mr5"></i><strong class="pr5">{__("Amazon S3")}</strong>
                    </a>
                </li>
            </ul>
            <!-- tabs nav -->

            <!-- tabs content -->
            <div class="tab-content">
                <!-- General -->
                <div class="tab-pane active" id="General">
                    <div class="alert alert-info">
                        <div class="icon">
                            <i class="fa fa-info-circle fa-2x"></i>
                        </div>
                        <div class="text">
                            {__("Your server max upload size")} = {$max_upload_size}.<br>
                            {__("You can't upload files larger than")} {$max_upload_size} . {__("To upload larger files, contact your hosting provider")}.
                        </div>
                    </div>

                    <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=uploads">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Uploads Directory")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="uploads_directory" value="{$system['uploads_directory']}">
                                <span class="help-block">
                                    {__("The path of uploads local directory")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Uploads Prefix")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="uploads_prefix" value="{$system['uploads_prefix']}">
                                <span class="help-block">
                                    {__("Add a prefix to the uploaded files")}
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Max profile photo size")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="max_avatar_size" value="{$system['max_avatar_size']}">
                                <span class="help-block">
                                    {__("The Maximum size of profile photo")} {__("in kilobytes (1 M = 1024 KB)")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Max cover photo size")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="max_cover_size" value="{$system['max_cover_size']}">
                                <span class="help-block">
                                    {__("The Maximum size of cover photo")} {__("in kilobytes (1 M = 1024 KB)")}
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <i class="fa fa-picture-o fa-3x"></i>
                            </label>
                            <div class="col-sm-9 mt10">
                                <label class="switch" for="photos_enabled">
                                    <input type="checkbox" name="photos_enabled" id="photos_enabled" {if $system['photos_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable photo upload to share & upload photos to the site")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Max photo size")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="max_photo_size" value="{$system['max_photo_size']}">
                                <span class="help-block">
                                    {__("The Maximum size of uploaded photo in posts")} {__("in kilobytes (1M = 1024KB)")}
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <i class="fa fa-video-camera fa-3x"></i>
                            </label>
                            <div class="col-sm-9 mt10">
                                <label class="switch" for="videos_enabled">
                                    <input type="checkbox" name="videos_enabled" id="videos_enabled" {if $system['videos_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable video upload to share & upload videos to the site")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Max video size")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="max_video_size" value="{$system['max_video_size']}">
                                <span class="help-block">
                                    {__("The Maximum size of uploaded video in posts")} {__("in kilobytes (1M = 1024KB)")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Video extensions")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="video_extensions" value="{$system['video_extensions']}">
                                <span class="help-block">
                                    {__("Allowed video extensions (separated with comma ',)")}
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <i class="fa fa-music fa-3x"></i>
                            </label>
                            <div class="col-sm-9 mt10">
                                <label class="switch" for="audio_enabled">
                                    <input type="checkbox" name="audio_enabled" id="audio_enabled" {if $system['audio_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable audio upload to share & upload sounds to the site")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Max audio size")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="max_audio_size" value="{$system['max_audio_size']}">
                                <span class="help-block">
                                    {__("The Maximum size of uploaded audio in posts")} {__("in kilobytes (1M = 1024KB)")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Audio extensions")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="audio_extensions" value="{$system['audio_extensions']}">
                                <span class="help-block">
                                    {__("Allowed audio extensions (separated with comma ',)")}
                                </span>
                            </div>
                        </div>

                        <div class="divider"></div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <i class="fa fa-file-text-o fa-3x"></i>
                            </label>
                            <div class="col-sm-9 mt10">
                                <label class="switch" for="file_enabled">
                                    <input type="checkbox" name="file_enabled" id="file_enabled" {if $system['file_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable file upload to share & upload files to the site")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Max file size")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="max_file_size" value="{$system['max_file_size']}">
                                <span class="help-block">
                                    {__("The Maximum size of uploaded file in posts")} {__("in kilobytes (1M = 1024KB)")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("File extensions")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="file_extensions" value="{$system['file_extensions']}">
                                <span class="help-block">
                                    {__("Allowed file extensions (separated with comma ',)")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
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
                <!-- General -->

                <!-- S3 -->
                <div class="tab-pane" id="S3">
                    <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=s3">
                        <div class="alert alert-warning">
                            <div class="icon">
                                <i class="fa fa-amazon fa-2x"></i>
                            </div>
                            <div class="text">
                                <strong>{__("Amazon S3 Storage")}</strong><br>
                                {__("Before enabling Amazon S3, make sure you upload the whole 'uploads' folder to your bucket")}.<br>
                                {__("Before disabling Amazon S3, make sure you download the whole 'uploads' folder to your server")}.
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Amazon S3 Storage")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="s3_enabled">
                                    <input type="checkbox" name="s3_enabled" id="s3_enabled" {if $system['s3_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable Amazon S3 storage")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Bucket Name")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="s3_bucket" value="{$system['s3_bucket']}">
                                <span class="help-block">
                                    {__("Your Amazon S3 bucket name")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Bucket Region")}
                            </label>
                            <div class="col-sm-9">
                                <select name="s3_region" class="form-control">
                                    <option value="us-east-1" {if $system['s3_region'] == "us-east-1"}selected{/if}>US East (N. Virginia)</option>
                                    <option value="us-west-2" {if $system['s3_region'] == "us-west-2"}selected{/if}>US West (Oregon)</option>
                                    <option value="ap-northeast-2" {if $system['s3_region'] == "ap-northeast-2"}selected{/if}>Asia Pacific (Seoul)</option>
                                    <option value="ap-southeast-1" {if $system['s3_region'] == "ap-southeast-1"}selected{/if}>Asia Pacific (Singapore)</option>
                                    <option value="ap-southeast-2" {if $system['s3_region'] == "ap-southeast-2"}selected{/if}>Asia Pacific (Sydney)</option>
                                    <option value="ap-northeast-1" {if $system['s3_region'] == "ap-northeast-1"}selected{/if}>Asia Pacific (Tokyo)</option>
                                    <option value="eu-central-1" {if $system['s3_region'] == "eu-central-1"}selected{/if}>EU (Frankfurt)</option>
                                    <option value="eu-west-1" {if $system['s3_region'] == "eu-west-1"}selected{/if}>EU (Ireland)</option>
                                </select>
                                <span class="help-block">
                                    {__("Your Amazon S3 bucket region")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Access Key ID")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="s3_key" value="{$system['s3_key']}">
                                <span class="help-block">
                                    {__("Your Amazon S3 Access Key ID")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Access Key Secret")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="s3_secret" value="{$system['s3_secret']}">
                                <span class="help-block">
                                    {__("Your Amazon S3 Access Key Secret")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                                <button type="button" class="btn btn-danger js_admin-tester" data-handle="s3" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> {__('Loading')}">
                                    <i class="fa fa-bolt"></i> {__("Test Connection")}
                                </button>
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
                <!-- S3 -->
            </div>
            <!-- tabs content -->

        {elseif $sub_view == "security"}

            <!-- Security -->
            <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=security">
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Censored Words Enabled")}
                    </label>
                    <div class="col-sm-9">
                        <label class="switch" for="censored_words_enabled">
                            <input type="checkbox" name="censored_words_enabled" id="censored_words_enabled" {if $system['censored_words_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="help-block">
                            {__("Enable/Disable Words to be censored")}<br/>
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Censored Words")}
                    </label>
                    <div class="col-sm-9">
                        <textarea class="form-control" name="censored_words" rows="3">{$system['censored_words']}</textarea>
                        <span class="help-block">
                            {__("Words to be censored, separated by a comma (,)")}
                        </span>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("reCAPTCHA Enabled")}
                    </label>
                    <div class="col-sm-9">
                        <label class="switch" for="reCAPTCHA_enabled">
                            <input type="checkbox" name="reCAPTCHA_enabled" id="reCAPTCHA_enabled" {if $system['reCAPTCHA_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="help-block">
                            {__("Turn reCAPTCHA On and Off")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("reCAPTCHA Site Key")}
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="reCAPTCHA_site_key" value="{$system['reCAPTCHA_site_key']}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("reCAPTCHA Secret Key")}
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="reCAPTCHA_secret_key" value="{$system['reCAPTCHA_secret_key']}">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                    </div>
                </div>

                <!-- success -->
                <div class="alert alert-success mb0 mt10 x-hidden" role="alert"></div>
                <!-- success -->

                <!-- error -->
                <div class="alert alert-danger mb0 mt10 x-hidden" role="alert"></div>
                <!-- error -->
            </form>
            <!-- Security -->

        {elseif $sub_view == "payments"}

            <!-- tabs nav -->
            <ul class="nav nav-tabs admin mb20">
                <li class="active">
                    <a href="#Paypal" data-toggle="tab">
                        <i class="fa fa-paypal fa-fw mr5"></i><strong class="pr5">{__("Paypal")}</strong>
                    </a>
                </li>
                <li>
                    <a href="#Stripe" data-toggle="tab">
                        <i class="fa fa-credit-card fa-fw mr5"></i><strong class="pr5">{__("Stripe")}</strong>
                    </a>
                </li>
                <li>
                    <a href="#Currency" data-toggle="tab">
                        <i class="fa fa-usd fa-fw mr5"></i><strong class="pr5">{__("Currency")}</strong>
                    </a>
                </li>
            </ul>
            <!-- tabs nav -->

            <!-- tabs content -->
            <div class="tab-content">
                <!-- Paypal -->
                <div class="tab-pane active" id="Paypal">
                    <div class="alert alert-info">
                        <div class="icon">
                            <i class="fa fa-info-circle fa-2x"></i>
                        </div>
                        <div class="text">
                            {__("To start using Paypal, you'll need to create an account at")} <a target="_blank" href="https://developer.paypal.com/">{__("Paypal")}</a><br>
                            {__("Check the documentation for more help")}.
                        </div>
                    </div>
                    <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=paypal">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Paypal Enabled")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="paypal_enabled">
                                    <input type="checkbox" name="paypal_enabled" id="paypal_enabled" {if $system['paypal_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable payments via Paypal")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Paypal Mode")}
                            </label>
                            <div class="col-sm-9">
                                <div class="radio radio-primary radio-inline">
                                    <input type="radio" name="paypal_mode" id="paypal_live" value="live" {if $system['paypal_mode'] == "live"}checked{/if}>
                                    <label for="paypal_live">{__("Live")}</label>
                                </div>
                                <div class="radio radio-primary radio-inline">
                                    <input type="radio" name="paypal_mode" id="paypal_sandbox" value="sandbox" {if $system['paypal_mode'] == "sandbox"}checked{/if}>
                                    <label for="paypal_sandbox">{__("Sandbox")}</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("PayPal Clinet ID")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="paypal_id" value="{$system['paypal_id']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("PayPal Secret Key")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="paypal_secret" value="{$system['paypal_secret']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
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
                <!-- Paypal -->

                <!-- Stripe -->
                <div class="tab-pane" id="Stripe">
                    <div class="alert alert-info">
                        <div class="icon">
                            <i class="fa fa-info-circle fa-2x"></i>
                        </div>
                        <div class="text">
                            {__("To start using Stripe, you'll need to create an account at")} <a target="_blank" href="https://dashboard.stripe.com/">{__("Stripe")}</a><br>
                            {__("Check the documentation for more help")}.
                        </div>
                    </div>
                    <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=stripe">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Credit Card Enabled")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="creditcard_enabled">
                                    <input type="checkbox" name="creditcard_enabled" id="creditcard_enabled" {if $system['creditcard_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable payments via Credit Card")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Alipay Enabled")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="alipay_enabled">
                                    <input type="checkbox" name="alipay_enabled" id="alipay_enabled" {if $system['alipay_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable payments via Alipay")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Bitcoin Enabled")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="bitcoin_enabled">
                                    <input type="checkbox" name="bitcoin_enabled" id="bitcoin_enabled" {if $system['bitcoin_enabled']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                                <span class="help-block">
                                    {__("Enable payments via Bitcoin")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Stripe Mode")}
                            </label>
                            <div class="col-sm-9">
                                <div class="radio radio-primary radio-inline">
                                    <input type="radio" name="stripe_mode" id="stripe_live" value="live" {if $system['stripe_mode'] == "live"}checked{/if}>
                                    <label for="stripe_live">{__("Live")}</label>
                                </div>
                                <div class="radio radio-primary radio-inline">
                                    <input type="radio" name="stripe_mode" id="stripe_test" value="test" {if $system['stripe_mode'] == "test"}checked{/if}>
                                    <label for="stripe_test">{__("Test")}</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Test Secret Key")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="stripe_test_secret" value="{$system['stripe_test_secret']}">
                                <span class="help-block">
                                    {__("Stripe secret key that starts with sk_")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Test Publishable Key")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="stripe_test_publishable" value="{$system['stripe_test_publishable']}">
                                <span class="help-block">
                                    {__("Stripe publishable key that starts with pk_")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Live Secret Key")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="stripe_live_secret" value="{$system['stripe_live_secret']}">
                                <span class="help-block">
                                    {__("Stripe secret key that starts with sk_")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                {__("Live Publishable Key")}
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="stripe_live_publishable" value="{$system['stripe_live_publishable']}">
                                <span class="help-block">
                                    {__("Stripe publishable key that starts with pk_")}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
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
                <!-- Stripe -->

                <!-- Currency -->
                <div class="tab-pane" id="Currency">
                    <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=currency">
                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Currency")}
                            </label>
                            <div class="col-sm-9">
                                <select class="form-control" name="system_currency">
                                    <option {if $system['system_currency'] == "AUD"}selected{/if} value="AUD">Australian Dollar</option>
                                    <option {if $system['system_currency'] == "BRL"}selected{/if} value="BRL">Brazilian Real</option>
                                    <option {if $system['system_currency'] == "CAD"}selected{/if} value="CAD">Canadian Dollar</option>
                                    <option {if $system['system_currency'] == "CZK"}selected{/if} value="CZK">Czech Koruna</option>
                                    <option {if $system['system_currency'] == "DKK"}selected{/if} value="DKK">Danish Krone</option>
                                    <option {if $system['system_currency'] == "EUR"}selected{/if} value="EUR">Euro</option>
                                    <option {if $system['system_currency'] == "HKD"}selected{/if} value="HKD">Hong Kong Dollar</option>
                                    <option {if $system['system_currency'] == "HUF"}selected{/if} value="HUF">Hungarian Forint</option>
                                    <option {if $system['system_currency'] == "ILS"}selected{/if} value="ILS">Israeli New Sheqel</option>
                                    <option {if $system['system_currency'] == "JPY"}selected{/if} value="JPY">Japanese Yen</option>
                                    <option {if $system['system_currency'] == "MYR"}selected{/if} value="MYR">Malaysian Ringgit</option>
                                    <option {if $system['system_currency'] == "MXN"}selected{/if} value="MXN">Mexican Peso</option>
                                    <option {if $system['system_currency'] == "NOK"}selected{/if} value="NOK">Norwegian Krone</option>
                                    <option {if $system['system_currency'] == "NZD"}selected{/if} value="NZD">New Zealand Dollar</option>
                                    <option {if $system['system_currency'] == "PHP"}selected{/if} value="PHP">Philippine Peso</option>
                                    <option {if $system['system_currency'] == "PLN"}selected{/if} value="PLN">Polish Zloty</option>
                                    <option {if $system['system_currency'] == "GBP"}selected{/if} value="GBP">Pound Sterling</option>
                                    <option {if $system['system_currency'] == "RUB"}selected{/if} value="RUB">Russian Ruble</option>
                                    <option {if $system['system_currency'] == "SGD"}selected{/if} value="SGD">Singapore Dollar</option>
                                    <option {if $system['system_currency'] == "SEK"}selected{/if} value="SEK">Swedish Krona</option>
                                    <option {if $system['system_currency'] == "CHF"}selected{/if} value="CHF">Swiss Franc</option>
                                    <option {if $system['system_currency'] == "THB"}selected{/if} value="THB">Thai Baht</option>
                                    <option {if $system['system_currency'] == "TRY"}selected{/if} value="TRY">Turkish Lira</option>
                                    <option {if $system['system_currency'] == "USD"}selected{/if} value="USD">U.S. Dollar</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
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
                <!-- Currency -->
            </div>

        {elseif $sub_view == "limits"}

            <!-- Limits -->
            <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=limits">

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Data Heartbeat")}
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="data_heartbeat" value="{$system['data_heartbeat']}">
                        <span class="help-block">
                            {__("The update interval to check for new data (in seconds)")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Chat Heartbeat")}
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="chat_heartbeat" value="{$system['chat_heartbeat']}">
                        <span class="help-block">
                            {__("The update interval to check for new messages (in seconds)")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Offline after")}
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="offline_time" value="{$system['offline_time']}">
                        <span class="help-block">
                            {__("The amount of time to be considered online since the last user's activity (in seconds)")}
                        </span>
                    </div>
                </div>

                <div class="divider"></div>


                
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Minimum Results")}
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="min_results" value="{$system['min_results']}">
                        <span class="help-block">
                            {__("The Min number of results per request")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Maximum Results")}
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="max_results" value="{$system['max_results']}">
                        <span class="help-block">
                            {__("The Max number of results per request")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Minimum Even Results")}
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="min_results_even" value="{$system['min_results_even']}">
                        <span class="help-block">
                            {__("The Min even number of results per request")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Maximum Even Results")}
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="max_results_even" value="{$system['max_results_even']}">
                        <span class="help-block">
                            {__("The Max even number of results per request")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                    </div>
                </div>

                <!-- success -->
                <div class="alert alert-success mb0 mt10 x-hidden" role="alert"></div>
                <!-- success -->

                <!-- error -->
                <div class="alert alert-danger mb0 mt10 x-hidden" role="alert"></div>
                <!-- error -->
            </form>
            <!-- Limits -->

        {elseif $sub_view == "analytics"}

            <!-- Analytics -->
            <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=analytics">
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Tracking Code")}
                    </label>
                    <div class="col-sm-9">
                        <textarea class="form-control" name="message" rows="3">{$system['analytics_code']}</textarea>
                        <span class="help-block">
                            {__("The analytics tracking code (Ex: Google Analytics)")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                    </div>
                </div>

                <!-- success -->
                <div class="alert alert-success mb0 mt10 x-hidden" role="alert"></div>
                <!-- success -->

                <!-- error -->
                <div class="alert alert-danger mb0 mt10 x-hidden" role="alert"></div>
                <!-- error -->
            </form>
            <!-- Analytics -->

        {/if}
        
    </div>
</div>