{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="container mt20 offcanvas">
    <div class="row">

        <!-- left panel -->
        <div class="col-sm-3 offcanvas-sidebar">
            <div class="panel panel-default">
                <div class="panel-body with-nav">
                    <ul class="side-nav">
                        <li {if $view == ""}class="active"{/if}>
                            <a href="{$system['system_url']}/settings"><i class="fa fa-cog fa-fw fa-lg pr10"></i> {__("Account Settings")}</a>
                        </li>
                        <li {if $view == "profile"}class="active"{/if}>
                            <a href="{$system['system_url']}/settings/profile"><i class="fa fa-user fa-fw fa-lg pr10"></i> {__("Edit Profile")}</a>
                        </li>
                        <li {if $view == "privacy"}class="active"{/if}>
                            <a href="{$system['system_url']}/settings/privacy"><i class="fa fa-lock fa-fw fa-lg pr10"></i> {__("Privacy Settings")}</a>
                        </li>
                        <li {if $view == "security"}class="active"{/if}>
                            <a href="{$system['system_url']}/settings/security"><i class="fa fa-shield fa-fw fa-lg pr10"></i> {__("Security Settings")}</a>
                        </li>
                        {if $system['email_notifications']}
                            {if $system['email_post_likes'] || $system['email_post_comments'] || $system['email_post_shares'] || $system['email_wall_posts'] || $system['email_mentions'] || $system['email_profile_visits'] || $system['email_friend_requests']}
                                <li {if $view == "notifications"}class="active"{/if}>
                                    <a href="{$system['system_url']}/settings/notifications"><i class="fa fa-envelope-open-o fa-fw fa-lg pr10"></i> {__("Email Notifications")}</a>
                                </li>
                            {/if}
                        {/if}
                        {if $system['social_login_enabled']}
                            {if $system['facebook_login_enabled'] || $system['twitter_login_enabled'] || $system['google_login_enabled'] || $system['instagram_login_enabled'] || $system['linkedin_login_enabled'] || $system['vkontakte_login_enabled']}
                                <li {if $view == "linked"}class="active"{/if}>
                                    <a href="{$system['system_url']}/settings/linked"><i class="fa fa-share-alt fa-fw fa-lg pr10"></i> {__("Linked Accounts")}</a>
                                </li>
                            {/if}
                        {/if}
                        <li {if $view == "blocking"}class="active"{/if}>
                            <a href="{$system['system_url']}/settings/blocking"><i class="fa fa-minus-circle fa-fw fa-lg pr10"></i> {__("Blocking")}</a>
                        </li>
                        {if $system['packages_enabled']}
                            <li {if $view == "membership"}class="active"{/if}>
                                <a href="{$system['system_url']}/settings/membership"><i class="fa fa-id-card-o fa-fw fa-lg pr10"></i> {__("Membership")}</a>
                            </li>
                        {/if}
                        {if $system['affiliates_enabled']}
                            <li {if $view == "affiliates"}class="active"{/if}>
                                <a href="{$system['system_url']}/settings/affiliates"><i class="fa fa-exchange fa-fw fa-lg pr10"></i> {__("Affiliates")}</a>
                            </li>
                        {/if}
                        {if $system['verification_requests']}
                            <li {if $view == "verification"}class="active"{/if}>
                                <a href="{$system['system_url']}/settings/verification"><i class="fa fa-check-circle fa-fw fa-lg pr10"></i> {__("Verification")}</a>
                            </li>
                        {/if}
                        {if $system['delete_accounts_enabled']}
                            <li {if $view == "delete"}class="active"{/if}>
                                <a href="{$system['system_url']}/settings/delete"><i class="fa fa-trash fa-fw fa-lg pr10"></i> {__("Delete Account")}</a>
                            </li>
                        {/if}
                    </ul>
                </div>
            </div>
        </div>
        <!-- left panel -->

        <!-- right panel -->
        <div class="col-sm-9 offcanvas-mainbar">
            <div class="panel panel-default">

                {if $view == ""}
                    <div class="panel-heading with-icon with-nav">
                        <!-- panel title -->
                        <div class="mb20">
                            <i class="fa fa-cog pr5 panel-icon"></i>
                            <strong>{__("Account Settings")}</strong>
                        </div>
                        <!-- panel title -->

                        <!-- panel nav -->
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#username" data-toggle="tab">
                                    <i class="fa fa-cog fa-fw mr5"></i><strong class="pr5">{__("Username")}</strong>
                                </a>
                            </li>
                            <li>
                                <a href="#email" data-toggle="tab">
                                    <i class="fa fa-envelope-o fa-fw mr5"></i><strong class="pr5">{__("Email")}</strong>
                                </a>
                            </li>
                            <li>
                                <a href="#password" data-toggle="tab">
                                    <i class="fa fa-key fa-fw mr5"></i><strong class="pr5">{__("Password")}</strong>
                                </a>
                            </li>
                        </ul>
                        <!-- panel nav -->
                    </div>
                    <div class="panel-body tab-content">
                        <!-- username tab -->
                        <div class="tab-pane active" id="username">
                            <form class="js_ajax-forms form-horizontal" data-url="users/settings.php?edit=username">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Username")}
                                    </label>
                                    <div class="col-sm-9">
                                        <div class="input-group">
                                            <span class="input-group-addon">{$system['system_url']}/</span>
                                            <input type="text" class="form-control" name="username" value="{$user->_data['user_name']}">
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
                        <!-- username tab -->

                        <!-- email tab -->
                        <div class="tab-pane" id="email">
                            <form class="js_ajax-forms form-horizontal" data-url="users/settings.php?edit=email">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Email Address")}
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" name="email" value="{$user->_data['user_email']}">
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
                        <!-- email tab -->

                        <!-- password tab -->
                        <div class="tab-pane" id="password">
                            <form class="js_ajax-forms form-horizontal" data-url="users/settings.php?edit=password">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Current")}
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" name="current">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("New")}
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" name="new">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Re-type new")}
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" name="confirm">
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
                        <!-- password tab -->
                    </div>
                {elseif $view == "profile"}
                    <div class="panel-heading with-icon with-nav">
                        <!-- panel title -->
                        <div class="mb20">
                            <i class="fa fa-user pr5 panel-icon"></i>
                            <strong>{__("Edit Profile")}</strong>
                        </div>
                        <!-- panel title -->

                        <!-- panel nav -->
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#basic" data-toggle="tab">
                                    <i class="fa fa-user fa-fw mr5"></i><strong class="pr5">{__("Basic")}</strong>
                                </a>
                            </li>
                            <li>
                                <a href="#work" data-toggle="tab">
                                    <i class="fa fa-briefcase fa-fw mr5"></i><strong class="pr5">{__("Work")}</strong>
                                </a>
                            </li>
                            <li>
                                <a href="#location" data-toggle="tab">
                                    <i class="fa fa-map-marker fa-fw mr5"></i><strong class="pr5">{__("Location")}</strong>
                                </a>
                            </li>
                            <li>
                                <a href="#education" data-toggle="tab">
                                    <i class="fa fa-graduation-cap fa-fw mr5"></i><strong class="pr5">{__("Education")}</strong>
                                </a>
                            </li>
                            <li>
                                <a href="#social" data-toggle="tab">
                                    <i class="fa fa-facebook-official fa-fw mr5"></i><strong class="pr5">{__("Social Links")}</strong>
                                </a>
                            </li>
                            {if $custom_fields['other']}
                                <li>
                                    <a href="#other" data-toggle="tab">
                                        <i class="fa fa-plus fa-fw mr5"></i><strong class="pr5">{__("Other")}</strong>
                                    </a>
                                </li>
                            {/if}
                        </ul>
                        <!-- panel nav -->
                    </div>

                    <div class="panel-body tab-content">
                        <!-- basic tab -->
                        <div class="tab-pane active" id="basic">
                            <form class="js_ajax-forms form-horizontal" data-url="users/settings.php?edit=basic">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("First Name")}
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control" name="firstname" value="{$user->_data['user_firstname']}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Last Name")}
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control" name="lastname" value="{$user->_data['user_lastname']}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("I am")}
                                    </label>
                                    <div class="col-sm-9">
                                        <select name="gender" class="form-control">
                                            <option value="none">{__("Select Sex")}</option>
                                            <option {if $user->_data['user_gender'] == "male"}selected{/if} value="male">{__("Male")}</option>
                                            <option {if $user->_data['user_gender'] == "female"}selected{/if} value="female">{__("Female")}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Birthdate")}
                                    </label>
                                    <div class="col-sm-9">
                                        <div class="row">
                                            <div class="col-xs-4">
                                                <select class="form-control" name="birth_month">
                                                    <option value="none">{__("Select Month")}</option>
                                                    <option {if $user->_data['user_birthdate_parsed']['month'] == '1'}selected{/if} value="1">{__("Jan")}</option>
                                                    <option {if $user->_data['user_birthdate_parsed']['month'] == '2'}selected{/if} value="2">{__("Feb")}</option>
                                                    <option {if $user->_data['user_birthdate_parsed']['month'] == '3'}selected{/if} value="3">{__("Mar")}</option>
                                                    <option {if $user->_data['user_birthdate_parsed']['month'] == '4'}selected{/if} value="4">{__("Apr")}</option>
                                                    <option {if $user->_data['user_birthdate_parsed']['month'] == '5'}selected{/if} value="5">{__("May")}</option>
                                                    <option {if $user->_data['user_birthdate_parsed']['month'] == '6'}selected{/if} value="6">{__("Jun")}</option>
                                                    <option {if $user->_data['user_birthdate_parsed']['month'] == '7'}selected{/if} value="7">{__("Jul")}</option>
                                                    <option {if $user->_data['user_birthdate_parsed']['month'] == '8'}selected{/if} value="8">{__("Aug")}</option>
                                                    <option {if $user->_data['user_birthdate_parsed']['month'] == '9'}selected{/if} value="9">{__("Sep")}</option>
                                                    <option {if $user->_data['user_birthdate_parsed']['month'] == '10'}selected{/if} value="10">{__("Oct")}</option>
                                                    <option {if $user->_data['user_birthdate_parsed']['month'] == '11'}selected{/if} value="11">{__("Nov")}</option>
                                                    <option {if $user->_data['user_birthdate_parsed']['month'] == '12'}selected{/if} value="12">{__("Dec")}</option>
                                                </select>
                                            </div>
                                            <div class="col-xs-4">
                                                <select class="form-control" name="birth_day">
                                                    <option value="none">{__("Select Day")}</option>
                                                    {for $i=1 to 31}
                                                    <option {if $user->_data['user_birthdate_parsed']['day'] == $i}selected{/if} value="{$i}">{$i}</option>
                                                    {/for}
                                                </select>
                                            </div>
                                            <div class="col-xs-4">
                                                <select class="form-control" name="birth_year">
                                                    <option value="none">{__("Select Year")}</option>
                                                    {for $i=1905 to 2015}
                                                    <option {if $user->_data['user_birthdate_parsed']['year'] == $i}selected{/if} value="{$i}">{$i}</option>
                                                    {/for}
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Relationship Status")}
                                    </label>
                                    <div class="col-sm-9">
                                        <select name="relationship" class="form-control">
                                            <option value="none">{__("Select Relationship")}</option>
                                            <option {if $user->_data['user_relationship'] == "single"}selected{/if} value="single">{__("Single")}</option>
                                            <option {if $user->_data['user_relationship'] == "relationship"}selected{/if} value="relationship">{__("In a relationship")}</option>
                                            <option {if $user->_data['user_relationship'] == "married"}selected{/if} value="married">{__("Married")}</option>
                                            <option {if $user->_data['user_relationship'] == "complicated"}selected{/if} value="complicated">{__("It's complicated")}</option>
                                            <option {if $user->_data['user_relationship'] == "separated"}selected{/if} value="separated">{__("Separated")}</option>
                                            <option {if $user->_data['user_relationship'] == "divorced"}selected{/if} value="divorced">{__("Divorced")}</option>
                                            <option {if $user->_data['user_relationship'] == "widowed"}selected{/if} value="widowed">{__("Widowed")}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("About Me")}
                                    </label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" name="biography">{$user->_data['user_biography']}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Website")}
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="website" value="{$user->_data['user_website']}">
                                    </div>
                                </div>
                                <!-- custom fields -->
                                {if $custom_fields['basic']}
                                {include file='__custom_fields.tpl' _custom_fields=$custom_fields['basic'] _registration=false}
                                {/if}
                                <!-- custom fields -->
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
                        <!-- basic tab -->

                        <!-- work tab -->
                        <div class="tab-pane" id="work">
                            <form class="js_ajax-forms form-horizontal" data-url="users/settings.php?edit=work">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Work Title")}
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="work_title" value="{$user->_data['user_work_title']}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Work Place")}
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="work_place" value="{$user->_data['user_work_place']}">
                                    </div>
                                </div>
                                <!-- custom fields -->
                                {if $custom_fields['work']}
                                {include file='__custom_fields.tpl' _custom_fields=$custom_fields['work'] _registration=false}
                                {/if}
                                <!-- custom fields -->
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
                        <!-- work tab -->

                        <!-- location tab -->
                        <div class="tab-pane" id="location">
                            <form class="js_ajax-forms form-horizontal" data-url="users/settings.php?edit=location">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Current City")}
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control js_geocomplete" name="city" value="{$user->_data['user_current_city']}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Hometown")}
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control js_geocomplete" name="hometown" value="{$user->_data['user_hometown']}">
                                    </div>
                                </div>
                                <!-- custom fields -->
                                {if $custom_fields['location']}
                                {include file='__custom_fields.tpl' _custom_fields=$custom_fields['location'] _registration=false}
                                {/if}
                                <!-- custom fields -->
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
                        <!-- location tab -->

                        <!-- education tab -->
                        <div class="tab-pane" id="education">
                            <form class="js_ajax-forms form-horizontal" data-url="users/settings.php?edit=education">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("School")}
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="edu_school" value="{$user->_data['user_edu_school']}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Major")}
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="edu_major" value="{$user->_data['user_edu_major']}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Class")}
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="edu_class" value="{$user->_data['user_edu_class']}">
                                    </div>
                                </div>
                                <!-- custom fields -->
                                {if $custom_fields['education']}
                                {include file='__custom_fields.tpl' _custom_fields=$custom_fields['education'] _registration=false}
                                {/if}
                                <!-- custom fields -->
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
                        <!-- education tab -->

                        <!-- social tab -->
                        <div class="tab-pane" id="social">
                            <form class="js_ajax-forms form-horizontal" data-url="users/settings.php?edit=social">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        <i class="fa fa-facebook-square fa-2x" style="color: #3B579D"></i>
                                    </label>
                                    <div class="col-sm-9 mt5">
                                        <input type="text" class="form-control" name="facebook" value="{$user->_data['user_social_facebook']}" placeholder="{__('Facebook Profile URL')}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        <i class="fa fa-twitter-square fa-2x" style="color: #55ACEE"></i>
                                    </label>
                                    <div class="col-sm-9 mt5">
                                        <input type="text" class="form-control" name="twitter" value="{$user->_data['user_social_twitter']}" placeholder="{__('Twitter Profile URL')}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        <i class="fa fa-google-plus-square fa-2x" style="color: #DC4A38"></i>
                                    </label>
                                    <div class="col-sm-9 mt5">
                                        <input type="text" class="form-control" name="google" value="{$user->_data['user_social_google']}" placeholder="{__('Google+ Profile URL')}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        <i class="fa fa-youtube fa-2x" style="color: #E62117"></i>
                                    </label>
                                    <div class="col-sm-9 mt5">
                                        <input type="text" class="form-control" name="youtube" value="{$user->_data['user_social_youtube']}" placeholder="{__('YouTube Profile URL')}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        <i class="fa fa-instagram fa-2x" style="color: #3f729b"></i>
                                    </label>
                                    <div class="col-sm-9 mt5">
                                        <input type="text" class="form-control" name="instagram" value="{$user->_data['user_social_instagram']}" placeholder="{__('Instagram Profile URL')}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        <i class="fa fa-linkedin-square fa-2x" style="color: #1A84BC"></i>
                                    </label>
                                    <div class="col-sm-9 mt5">
                                        <input type="text" class="form-control" name="linkedin" value="{$user->_data['user_social_linkedin']}" placeholder="{__('LinkedIn Profile URL')}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        <i class="fa fa-vk fa-2x" style="color: #527498"></i>
                                    </label>
                                    <div class="col-sm-9 mt5">
                                        <input type="text" class="form-control" name="vkontakte" value="{$user->_data['user_social_vkontakte']}" placeholder="{__('Vkontakte Profile URL')}">
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
                        <!-- social tab -->

                        {if $custom_fields['other']}
                            <!-- other tab -->
                            <div class="tab-pane" id="other">
                                <form class="js_ajax-forms form-horizontal" data-url="users/settings.php?edit=other">
                                    <!-- custom fields -->
                                    {if $custom_fields['other']}
                                    {include file='__custom_fields.tpl' _custom_fields=$custom_fields['other'] _registration=false}
                                    {/if}
                                    <!-- custom fields -->
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
                            <!-- other tab -->
                        {/if}
                    </div>
                {elseif $view == "privacy"}
                    <div class="panel-heading with-icon">
                        <!-- panel title -->
                        <i class="fa fa-lock pr5 panel-icon"></i>
                        <strong>{__("Privacy Settings")}</strong>
                        <!-- panel title -->
                    </div>
                    <div class="panel-body">
                        <form class="js_ajax-forms form-horizontal" data-url="users/settings.php?edit=privacy">
                            {if $system['chat_enabled']}
                                <div class="form-group">
                                    <label class="col-sm-5 control-label" for="privacy_chat">
                                        {__("Chat")}
                                    </label>
                                    <div class="col-sm-3">
                                        <select class="form-control" name="privacy_chat" id="privacy_chat">
                                            <option {if $user->_data['user_chat_enabled'] == 0}selected{/if} value="0">
                                                {__("Offline")}
                                            </option>
                                            <option {if $user->_data['user_chat_enabled'] == 1}selected{/if} value="1">
                                                {__("Online")}
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            {/if}
                            <div class="form-group">
                                <label class="col-sm-5 control-label" for="privacy_wall">
                                    {__("Who can post on your wall")}
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="privacy_wall" id="privacy_wall">
                                        <option {if $user->_data['user_privacy_wall'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $user->_data['user_privacy_wall'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $user->_data['user_privacy_wall'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label" for="privacy_birthdate">
                                    {__("Who can see your")} {__("birthdate")}
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="privacy_birthdate" id="privacy_birthdate">
                                        <option {if $user->_data['user_privacy_birthdate'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $user->_data['user_privacy_birthdate'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $user->_data['user_privacy_birthdate'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label" for="privacy_relationship">
                                    {__("Who can see your")} {__("relationship")}
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="privacy_relationship" id="privacy_relationship">
                                        <option {if $user->_data['user_privacy_relationship'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $user->_data['user_privacy_relationship'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $user->_data['user_privacy_relationship'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label" for="privacy_basic">
                                    {__("Who can see your")} {__("basic info")}
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="privacy_basic" id="privacy_basic">
                                        <option {if $user->_data['user_privacy_basic'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $user->_data['user_privacy_basic'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $user->_data['user_privacy_basic'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label" for="privacy_work">
                                    {__("Who can see your")} {__("work info")}
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="privacy_work" id="privacy_work">
                                        <option {if $user->_data['user_privacy_work'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $user->_data['user_privacy_work'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $user->_data['user_privacy_work'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label" for="privacy_location">
                                    {__("Who can see your")} {__("location info")}
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="privacy_location" id="privacy_location">
                                        <option {if $user->_data['user_privacy_location'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $user->_data['user_privacy_location'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $user->_data['user_privacy_location'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label" for="privacy_education">
                                    {__("Who can see your")} {__("education info")}
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="privacy_education" id="privacy_education">
                                        <option {if $user->_data['user_privacy_education'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $user->_data['user_privacy_education'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $user->_data['user_privacy_education'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label" for="privacy_other">
                                    {__("Who can see your")} {__("other info")}
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="privacy_other" id="privacy_other">
                                        <option {if $user->_data['user_privacy_other'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $user->_data['user_privacy_other'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $user->_data['user_privacy_other'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label" for="privacy_friends">
                                    {__("Who can see your")} {__("friends")}
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="privacy_friends" id="privacy_friends">
                                        <option {if $user->_data['user_privacy_friends'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $user->_data['user_privacy_friends'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $user->_data['user_privacy_friends'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label" for="privacy_photos">
                                    {__("Who can see your")} {__("photos")}
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="privacy_photos" id="privacy_photos">
                                        <option {if $user->_data['user_privacy_photos'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $user->_data['user_privacy_photos'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $user->_data['user_privacy_photos'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label" for="privacy_pages">
                                    {__("Who can see your")} {__("liked pages")}
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="privacy_pages" id="privacy_pages">
                                        <option {if $user->_data['user_privacy_pages'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $user->_data['user_privacy_pages'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $user->_data['user_privacy_pages'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label" for="privacy_groups">
                                    {__("Who can see your")} {__("joined groups")}
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="privacy_groups" id="privacy_groups">
                                        <option {if $user->_data['user_privacy_groups'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $user->_data['user_privacy_groups'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $user->_data['user_privacy_groups'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label" for="privacy_events">
                                    {__("Who can see your")} {__("joined events")}
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="privacy_events" id="privacy_events">
                                        <option {if $user->_data['user_privacy_events'] == "public"}selected{/if} value="public">
                                            {__("Everyone")}
                                        </option>
                                        <option {if $user->_data['user_privacy_events'] == "friends"}selected{/if} value="friends">
                                            {__("Friends")}
                                        </option>
                                        <option {if $user->_data['user_privacy_events'] == "me"}selected{/if} value="me">
                                            {__("Just Me")}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-7 col-sm-offset-5">
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
                {elseif $view == "security"}
                    <div class="panel-heading with-icon">
                        <!-- panel title -->
                        <i class="fa fa-shield pr5 panel-icon"></i>
                        <strong>{__("Security Settings")}</strong>
                        <!-- panel title -->
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>{__("ID")}</th>
                                        <th>{__("Browser")}</th>
                                        <th>{__("OS")}</th>
                                        <th>{__("Date")}</th>
                                        <th>{__("IP")}</th>
                                        <th>{__("Actions")}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach $sessions as $session}
                                        <tr {if $session['session_token'] == $user->_data['active_session']}class="success"{/if}>
                                            <td>{$session@iteration}</td>
                                            <td>{$session['user_browser']} {if $session['session_token'] == $user->_data['active_session']}<span class="label label-info">{__("Active Session")}</span>{/if}</td>
                                            <td>{$session['user_os']}</td>
                                            <td>
                                                <span class="js_moment" data-time="{$session['session_date']}">{$session['session_date']}</span>
                                            </td>
                                            <td>{$session['user_ip']}</td>
                                            <td>
                                                <button data-toggle="tooltip" data-placement="top" title='{__("End Session")}' class="btn btn-xs btn-danger js_session-deleter" data-id="{$session['session_id']}">
                                                    <i class="fa fa-trash-o"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    </div>
                {elseif $view == "notifications"}
                    <div class="panel-heading with-icon">
                        <!-- panel title -->
                        <i class="fa fa-envelope-open-o pr5 panel-icon"></i>
                        <strong>{__("Email Notifications")}</strong>
                        <!-- panel title -->
                    </div>
                    <div class="panel-body">
                        <form class="js_ajax-forms form-horizontal" data-url="users/settings.php?edit=notifications">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    {__("Email Me When")}
                                </label>
                                <div class="col-sm-9">
                                    {if $system['email_post_likes']}
                                        <div class="checkbox checkbox-primary">
                                            <input type="checkbox" name="email_post_likes" id="email_post_likes" {if $user->_data['email_post_likes']}checked{/if}>
                                            <label for="email_post_likes">{__("Someone liked my post")}</label>
                                        </div>
                                    {/if}
                                    {if $system['email_post_comments']}
                                        <div class="checkbox checkbox-primary">
                                            <input type="checkbox" name="email_post_comments" id="email_post_comments" {if $user->_data['email_post_comments']}checked{/if}>
                                            <label for="email_post_comments">{__("Someone commented on my post")}</label>
                                        </div>
                                    {/if}
                                    {if $system['email_post_shares']}
                                        <div class="checkbox checkbox-primary">
                                            <input type="checkbox" name="email_post_shares" id="email_post_shares" {if $user->_data['email_post_shares']}checked{/if}>
                                            <label for="email_post_shares">{__("Someone shared my post")}</label>
                                        </div>
                                    {/if}
                                    {if $system['email_wall_posts']}
                                        <div class="checkbox checkbox-primary">
                                            <input type="checkbox" name="email_wall_posts" id="email_wall_posts" {if $user->_data['email_wall_posts']}checked{/if}>
                                            <label for="email_wall_posts">{__("Someone posted on my timeline")}</label>
                                        </div>
                                    {/if}
                                    {if $system['email_mentions']}
                                        <div class="checkbox checkbox-primary">
                                            <input type="checkbox" name="email_mentions" id="email_mentions" {if $user->_data['email_mentions']}checked{/if}>
                                            <label for="email_mentions">{__("Someone mentioned me")}</label>
                                        </div>
                                    {/if}
                                    {if $system['email_profile_visits']}
                                        <div class="checkbox checkbox-primary">
                                            <input type="checkbox" name="email_profile_visits" id="email_profile_visits" {if $user->_data['email_profile_visits']}checked{/if}>
                                            <label for="email_profile_visits">{__("Someone visited my profile")}</label>
                                        </div>
                                    {/if}
                                    {if $system['email_friend_requests']}
                                        <div class="checkbox checkbox-primary">
                                            <input type="checkbox" name="email_friend_requests" id="email_friend_requests" {if $user->_data['email_friend_requests']}checked{/if}>
                                            <label for="email_friend_requests">{__("Someone sent me/accepted my friend requset")}</label>
                                        </div>
                                    {/if}
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
                {elseif $view == "linked"}
                    <div class="panel-heading with-icon">
                        <!-- panel title -->
                        <i class="fa fa-share-alt pr5 panel-icon"></i>
                        <strong>{__("Linked Accounts")}</strong>
                        <!-- panel title -->
                    </div>
                    <div class="panel-body">
                        <ul>
                            {if $system['facebook_login_enabled']}
                                <li class="feeds-item">
                                    <div class="data-container">
                                        <div class="data-avatar">
                                            <i class="fa fa-facebook-square" style="color: #3B579D"></i>
                                        </div>
                                        <div class="data-content">
                                            <div class="pull-right flip">
                                                {if $user->_data['facebook_connected']}
                                                <a class="btn btn-danger" href="{$system['system_url']}/revoke/facebook">{__("Disconnect")}</a>
                                                {else}
                                                <a class="btn btn-primary" href="{$system['system_url']}/connect/facebook">{__("Connect")}</a>
                                                {/if}
                                            </div>
                                            <div>
                                                <div class="name mt5 text-primary">
                                                    {__("Facebook")}
                                                </div>
                                                {if $user->_data['facebook_connected']}
                                                {__("Your account is connected to")} {__("Facebook")}
                                                {else}
                                                {__("Connect your account to")} {__("Facebook")}
                                                {/if}
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            {/if}
                            {if $system['twitter_login_enabled']}
                                <li class="feeds-item">
                                    <div class="data-container">
                                        <div class="data-avatar">
                                            <i class="fa fa-twitter-square" style="color: #55ACEE"></i>
                                        </div>
                                        <div class="data-content">
                                            <div class="pull-right flip">
                                                {if $user->_data['twitter_connected']}
                                                <a class="btn btn-danger" href="{$system['system_url']}/revoke/twitter">{__("Disconnect")}</a>
                                                {else}
                                                <a class="btn btn-primary" href="{$system['system_url']}/connect/twitter">{__("Connect")}</a>
                                                {/if}
                                            </div>
                                            <div>
                                                <div class="name mt5 text-primary">
                                                    {__("Twitter")}
                                                </div>
                                                {if $user->_data['twitter_connected']}
                                                {__("Your account is connected to")} {__("Twitter")}
                                                {else}
                                                {__("Connect your account to")} {__("Twitter")}
                                                {/if}
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            {/if}
                            {if $system['google_login_enabled']}
                                <li class="feeds-item">
                                    <div class="data-container">
                                        <div class="data-avatar">
                                            <i class="fa fa-google-plus-square" style="color: #DC4A38"></i>
                                        </div>
                                        <div class="data-content">
                                            <div class="pull-right flip">
                                                {if $user->_data['google_connected']}
                                                <a class="btn btn-danger" href="{$system['system_url']}/revoke/google">{__("Disconnect")}</a>
                                                {else}
                                                <a class="btn btn-primary" href="{$system['system_url']}/connect/google">{__("Connect")}</a>
                                                {/if}
                                            </div>
                                            <div>
                                                <div class="name mt5 text-primary">
                                                    {__("Google")}
                                                </div>
                                                {if $user->_data['google_connected']}
                                                {__("Your account is connected to")} {__("Google")}
                                                {else}
                                                {__("Connect your account to")} {__("Google")}
                                                {/if}
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            {/if}
                            {if $system['instagram_login_enabled']}
                                <li class="feeds-item">
                                    <div class="data-container">
                                        <div class="data-avatar">
                                            <i class="fa fa-instagram" style="color: #3f729b"></i>
                                        </div>
                                        <div class="data-content">
                                            <div class="pull-right flip">
                                                {if $user->_data['instagram_connected']}
                                                    <a class="btn btn-danger" href="{$system['system_url']}/revoke/instagram">{__("Disconnect")}</a>
                                                {else}
                                                    <a class="btn btn-primary" href="{$system['system_url']}/connect/instagram">{__("Connect")}</a>
                                                {/if}
                                            </div>
                                            <div>
                                                <div class="name mt5 text-primary">
                                                    {__("Instagram")}
                                                </div>
                                                {if $user->_data['instagram_connected']}
                                                    {__("Your account is connected to")} {__("Instagram")}
                                                {else}
                                                    {__("Connect your account to")} {__("Instagram")}
                                                {/if}
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            {/if}
                            {if $system['linkedin_login_enabled']}
                                <li class="feeds-item">
                                    <div class="data-container">
                                        <div class="data-avatar">
                                            <i class="fa fa-linkedin-square" style="color: #1A84BC"></i>
                                        </div>
                                        <div class="data-content">
                                            <div class="pull-right flip">
                                                {if $user->_data['linkedin_connected']}
                                                <a class="btn btn-danger" href="{$system['system_url']}/revoke/linkedin">{__("Disconnect")}</a>
                                                {else}
                                                <a class="btn btn-primary" href="{$system['system_url']}/connect/linkedin">{__("Connect")}</a>
                                                {/if}
                                            </div>
                                            <div>
                                                <div class="name mt5 text-primary">
                                                    {__("Linkedin")}
                                                </div>
                                                {if $user->_data['linkedin_connected']}
                                                {__("Your account is connected to")} {__("Linkedin")}
                                                {else}
                                                {__("Connect your account to")} {__("Linkedin")}
                                                {/if}
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            {/if}
                            {if $system['vkontakte_login_enabled']}
                                <li class="feeds-item">
                                    <div class="data-container">
                                        <div class="data-avatar">
                                            <i class="fa fa-vk" style="color: #527498"></i>
                                        </div>
                                        <div class="data-content">
                                            <div class="pull-right flip">
                                                {if $user->_data['vkontakte_connected']}
                                                <a class="btn btn-danger" href="{$system['system_url']}/revoke/vkontakte">{__("Disconnect")}</a>
                                                {else}
                                                <a class="btn btn-primary" href="{$system['system_url']}/connect/vkontakte">{__("Connect")}</a>
                                                {/if}
                                            </div>
                                            <div>
                                                <div class="name mt5 text-primary">
                                                    {__("Vkontakte")}
                                                </div>
                                                {if $user->_data['vkontakte_connected']}
                                                {__("Your account is connected to")} {__("Vkontakte")}
                                                {else}
                                                {__("Connect your account to")} {__("Vkontakte")}
                                                {/if}
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            {/if}
                        </ul>
                    </div>
                {elseif $view == "blocking"}
                    <div class="panel-heading with-icon">
                        <!-- panel title -->
                        <i class="fa fa-minus-circle pr5 panel-icon"></i>
                        <strong>{__("Manage Blocking")}</strong>
                        <!-- panel title -->
                    </div>
                    <div class="panel-body">
                        <div class="alert alert-info">
                            <i class="fa fa-info-circle fa-lg mr10"></i>{__("Once you block someone, that person can no longer see things you post on your timeline")}<br>
                        </div>

                        {if count($blocks) > 0}
                            <ul>
                                {foreach $blocks as $_user}
                                {include file='__feeds_user.tpl' _connection="blocked"}
                                {/foreach}
                            </ul>
                        {else}
                            <p class="text-center text-muted">
                                {__("No blocked users")}
                            </p>
                        {/if}

                        {if count($blocks) >= $system['max_results']}
                            <!-- see-more -->
                            <div class="alert alert-info see-more js_see-more" data-get="blocks">
                                <span>{__("See More")}</span>
                                <div class="loader loader_small x-hidden"></div>
                            </div>
                            <!-- see-more -->
                        {/if}
                    </div>
                {elseif $view == "affiliates"}
                    <div class="panel-heading with-icon with-nav">
                        <!-- panel title -->
                        <div class="mb20">
                            <i class="fa fa-exchange pr5 panel-icon"></i>
                            <strong>{__("Affiliates")}</strong>
                        </div>
                        <!-- panel title -->

                        <!-- panel nav -->
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#affiliates" data-toggle="tab">
                                    <i class="fa fa-users fa-fw mr5"></i><strong class="pr5">{__("My Affiliates")}</strong>
                                </a>
                            </li>
                            <li>
                                <a href="#payments" data-toggle="tab">
                                    <i class="fa fa-money fa-fw mr5"></i><strong class="pr5">{__("Payments")}</strong>
                                </a>
                            </li>
                        </ul>
                        <!-- panel nav -->
                    </div>
                    <div class="panel-body tab-content">
                        <!-- affiliates tab -->
                        <div class="tab-pane active" id="affiliates">
                            <div class="alert alert-warning">
                                <div class="icon">
                                    <i class="fa fa-money fa-2x"></i>
                                </div>
                                <div class="text">
                                    <strong>{__("Affiliates System")}</strong><br>
                                    {__("Earn up to")} {$system['system_currency_symbol']}{$system['affiliates_per_user']|number_format:2} {__("For each user your refer")}.<br>
                                    {__("You will be paid when")} 
                                    {if $system['affiliate_type'] == "registeration"}.
                                        {__("new user registered")}
                                    {else}
                                        {__("new user registered & bought a package")}.
                                    {/if}
                                </div>
                            </div>
                            <div class="text-center text-readable mb20">
                                {__("Your affiliate link is")}<br>
                                <a href="{$system['system_url']}/?ref={$user->_data['user_name']}" target="_blank"  class="ptb5 plr20" style="border: 1px solid #ddd;">
                                    {$system['system_url']}/?ref={$user->_data['user_name']}
                                </a>
                            </div>

                            <div class="divider"></div>

                            {if count($affiliates) > 0}
                                <ul>
                                    {foreach $affiliates as $_user}
                                    {include file='__feeds_user.tpl' _connection=$_user["connection"]}
                                    {/foreach}
                                </ul>
                            {else}
                                <p class="text-center text-muted">
                                    {__("No affiliates")}
                                </p>
                            {/if}

                            <!-- see-more -->
                            {if count($affiliates) >= $system['max_results']}
                                <div class="alert alert-info see-more js_see-more" data-uid="{$user->_data['user_id']}" data-get="affiliates">
                                    <span>{__("See More")}</span>
                                    <div class="loader loader_small x-hidden"></div>
                                </div>
                            {/if}
                            <!-- see-more -->
                        </div>
                        <!-- affiliates tab -->

                        <!-- payments tab -->
                        <div class="tab-pane" id="payments">
                            <div class="alert alert-info">
                                <div class="icon">
                                    <i class="fa fa-info-circle fa-2x"></i>
                                </div>
                                <div class="text pt5">
                                    {__("The minimum withdrawal request amount is")} {$system['system_currency_symbol']}{$system['affiliates_min_withdrawal']}
                                </div>
                            </div>
                            <form class="js_ajax-forms form-horizontal" data-url="users/withdraw.php">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    <div class="col-sm-9 text-lg">
                                        {__("Your Balance")}: {$system['system_currency_symbol']}{$user->_data['user_affiliate_balance']|number_format:2}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Email")}
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" name="email" value="{$user->_data['user_affiliate_email']}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Amount")} ({$system['system_currency']})
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="amount">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        {__("Payment Method")}
                                    </label>
                                    <div class="col-sm-9">
                                        {if $system['affiliate_payment_method'] == "both" || $system['affiliate_payment_method'] == "paypal"}
                                            <div class="radio radio-primary radio-inline">
                                                <input type="radio" name="method" id="method_paypal" value="paypal" {if $system['affiliate_payment_method'] == "paypal"}checked{/if}>
                                                <label for="method_paypal">{__("Paypal")}</label>
                                            </div>
                                        {/if}
                                        {if $system['affiliate_payment_method'] == "both" || $system['affiliate_payment_method'] == "skrill"}
                                            <div class="radio radio-primary radio-inline">
                                                <input type="radio" name="method" id="method_skrill" value="skrill" {if $system['affiliate_payment_method'] == "skrill"}checked{/if}>
                                                <label for="method_skrill">{__("Skrill")}</label>
                                            </div>
                                        {/if}
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-9 col-sm-offset-3">
                                        <button type="submit" class="btn btn-success">{__("Make a withdrawal")}</button>
                                    </div>
                                </div>

                                <!-- success -->
                                <div class="alert alert-success mb0 mt10 x-hidden" role="alert"></div>
                                <!-- success -->

                                <!-- error -->
                                <div class="alert alert-danger mb0 mt10 x-hidden" role="alert"></div>
                                <!-- error -->
                            </form>

                            <div class="divider"></div>

                            <h4>{__("Withdrawal History")}</h2>
                            {if count($payments) > 0}
                                <div class="table-responsive mt20">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>{__("ID")}</th>
                                                <th>{__("Email")}</th>
                                                <th>{__("Amount")}</th>
                                                <th>{__("Method")}</th>
                                                <th>{__("Time")}</th>
                                                <th>{__("Status")}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {foreach $payments as $payment}
                                            <tr>
                                                <td>{$payment@iteration}</td>
                                                <td>{$payment['email']}</td>
                                                <td>{$system['system_currency_symbol']}{$payment['amount']|number_format:2}</td>
                                                <td>
                                                    {$payment['method']|ucfirst}
                                                </td>
                                                <td>
                                                    <span class="js_moment" data-time="{$payment['time']}">{$payment['time']}</span>
                                                </td>
                                                <td>
                                                    {if $payment['status'] == '0'}
                                                        <span class="label label-warning">{__("Pending")}</span>
                                                    {elseif $payment['status'] == '1'}
                                                        <span class="label label-success">{__("Approved")}</span>
                                                    {else}
                                                        <span class="label label-danger">{__("Declined")}</span>
                                                    {/if}
                                                </td>
                                            </tr>
                                            {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                            {else}
                                <p class="text-center text-muted">
                                    {__("No withdrawal history")}
                                </p>
                            {/if}
                        </div>
                        <!-- payments tab -->
                    </div>
                {elseif $view == "verification"}
                    <div class="panel-heading with-icon">
                        <!-- panel title -->
                        <i class="fa fa-check-circle pr5 panel-icon"></i>
                        <strong>{__("Verification")}</strong>
                        <!-- panel title -->
                    </div>
                    <div class="panel-body">
                        
                        {if $case == "verified"}
                            <div class="text-center">
                                <div class="big-icon success">
                                    <i class="fa fa-thumbs-o-up fa-3x"></i>
                                </div>
                                <h4>{__("Congratulations")}</h4>
                                <p class="mt20">{__("This account is verified")}</p>
                            </div>
                        {elseif $case == "request"}
                            <div class="alert alert-info">
                                <i class="fa fa-info-circle fa-lg mr10"></i>{__("You can send verification request to verify your account")}<br>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-success js_verify">
                                    <i class="fa fa-check-circle mr5"></i>{__("Verification Request")}
                                </button>
                            </div>
                        {elseif $case == "pending"}
                            <div class="alert alert-info">
                                <i class="fa fa-info-circle fa-lg mr10"></i>{__("Your verification request is still awaiting admin approval")}<br>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-warning btn-delete js_unverify"><i class="fa fa-clock-o mr5"></i>{__("Pending")}</button>
                            </div>
                        {elseif $case == "declined"}
                            <div class="text-center">
                                <div class="big-icon error">
                                    <i class="fa fa-meh-o fa-3x"></i>
                                </div>
                                <h4>{__("Sorry")}</h4>
                                <p class="mt20">{__("Your verification request has been declined by the admin")}</p>
                            </div>
                        {/if}
                    </div>
                {elseif $view == "membership"}
                    <div class="panel-heading with-icon">
                        <!-- panel title -->
                        <i class="fa fa-id-card-o pr5 panel-icon"></i>
                        <strong>{__("Membership")}</strong>
                        <!-- panel title -->
                    </div>
                    <div class="panel-body">
                        <div class="alert alert-warning">
                            <div class="icon">
                                <i class="fa fa-id-card-o fa-2x"></i>
                            </div>
                            <div class="text">
                                <strong>{__("Membership")}</strong><br>
                                {__("Choose the Plan That's Right for You")}, {__("Check the package from")} <a href="{$system['system_url']}/packages">{__("Here")}</a>
                            </div>
                        </div>

                        {if !$user->_data['user_subscribed']}
                            <div class="text-center">
                                <a href="{$system['system_url']}/packages" class="btn btn-primary"><i class="fa fa-rocket mr5"></i>{__("Upgrade to Pro")}</a>
                            </div>
                        {else}
                            {if $user->_data['user_subscribed']}
                                <form class="form-horizontal">
                                    <div class="form-group mb0">
                                        <label class="col-sm-3 control-label text-left">
                                            {__("Package")}
                                        </label>
                                        <div class="col-sm-9">
                                            <p class="form-control-static">
                                                {$user->_data['name']} ({$system['system_currency_symbol']}{$user->_data['price']} 
                                                {if $user->_data['period'] == "life"}{__("Life Time")}{else}{__("per")} {if $user->_data['period_num'] != '1'}{$user->_data['period_num']}{/if} {__($user->_data['period']|ucfirst)}{/if})
                                            </p>
                                        </div>
                                    </div>
                                    <div class="form-group mb0">
                                        <label class="col-sm-3 control-label text-left">
                                            {__("Subscription Date")}
                                        </label>
                                        <div class="col-sm-9">
                                            <p class="form-control-static">
                                                {$user->_data['user_subscription_date']|date_format:"%e %B %Y"}
                                            </p>
                                        </div>
                                    </div>
                                    <div class="form-group mb0">
                                        <label class="col-sm-3 control-label text-left">
                                            {__("Expiration Date")}
                                        </label>
                                        <div class="col-sm-9">
                                            <p class="form-control-static">
                                                {$user->_data['subscription_end']|date_format:"%e %B %Y"} ({if $user->_data['subscription_timeleft'] > 0}{__("Remining")} {$user->_data['subscription_timeleft']} {__("Days")}{else}{__("Expired")}{/if})
                                            </p>
                                        </div>
                                    </div>
                                    <div class="form-group mb0">
                                        <label class="col-sm-3 control-label text-left">
                                            {__("Boosted Posts")}
                                        </label>
                                        <div class="col-sm-9">
                                            <p class="form-control-static">
                                                {$user->_data['user_boosted_posts']}/{$user->_data['boost_posts']}
                                            </p>
                                            
                                            <div class="progress mb5">
                                                <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="{($user->_data['user_boosted_posts']/$user->_data['boost_pages'])*100}" aria-valuemin="0" aria-valuemax="100" style="width: {($user->_data['user_boosted_posts']/$user->_data['boost_pages'])*100}%"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label text-left">
                                            {__("Boosted Pages")}
                                        </label>
                                        <div class="col-sm-9">
                                            <p class="form-control-static">
                                                {$user->_data['user_boosted_pages']}/{$user->_data['boost_pages']}
                                            </p>
                                            
                                            <div class="progress mb5">
                                                <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="{($user->_data['user_boosted_pages']/$user->_data['boost_pages'])*100}" aria-valuemin="0" aria-valuemax="100" style="width: {($user->_data['user_boosted_pages']/$user->_data['boost_pages'])*100}%"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label text-left">
                                            
                                        </label>
                                        <div class="col-sm-9">
                                            <a href="{$system['system_url']}/packages" class="btn btn-primary"><i class="fa fa-rocket mr5"></i>{__("Upgrade Package")}</a>
                                        </div>
                                    </div>
                                </form>
                            {/if}
                        {/if}
                    </div>
                {elseif $view == "delete"}
                    <div class="panel-heading with-icon">
                        <!-- panel title -->
                        <i class="fa fa-trash pr5 panel-icon"></i>
                        <strong>{__("Delete Account")}</strong>
                        <!-- panel title -->
                    </div>
                    <div class="panel-body">
                        <div class="alert alert-warning">
                            <i class="fa fa-exclamation-triangle fa-lg mr10"></i>{__("Once you delete your account you will no longer can access it again")}
                        </div>
                        <div class="text-center">
                            <button class="btn btn-danger js_delete-user"><i class="fa fa-trash mr5"></i>{__("Delete My Account")}</button>
                        </div>
                    </div>
                {/if}
                
            </div>
        </div>
        <!-- right panel -->
        
    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}