<div class="col-xs-12 col-sm-4 col-sm-offset-4">
    <div class="panel panel-login">
        <!-- signin -->
        <div class="panel-body {if $do == 'up'}x-hidden{/if}">
            <h4>{__("Login")}</h4>
            {if $highlight}<div class="alert alert-warning" role="alert">{$highlight}</div>{/if}
            <form class="js_ajax-forms" data-url="core/signin.php">
                <div class="form-group">
                    <input name="username_email" type="text" class="form-control" placeholder='{__("Email")} {__("or")} {__("Username")}' required>
                </div>
                <div class="form-group">
                    <input name="password" type="password" class="form-control" placeholder='{__("Password")}' required>
                </div>
                <div class="checkbox checkbox-primary">
                    <input type="checkbox" name="remember" id="remember">
                    <label for="remember">{__("Remember me")}</label>
                    | <a href="{$system['system_url']}/reset">{__("Forgotten password?")}</a>
                </div>
                <button type="submit" class="btn btn-block btn-primary">{__("Login")}</button>

                <!-- error -->
                <div class="alert alert-danger mb0 mt10 x-hidden" role="alert"></div>
                <!-- error -->
            </form>
            {if $system['social_login_enabled']}
                {if $system['facebook_login_enabled'] || $system['twitter_login_enabled'] || $system['google_login_enabled'] || $system['linkedin_login_enabled'] || $system['vkontakte_login_enabled'] || $system['instagram_login_enabled']}
                    <div class="hr-heading mt5 mb10">
                        <div class="hr-heading-text">
                            {__("or")} {__("login with")}
                        </div>
                    </div>
                    <div class="text-center">
                        {if $system['facebook_login_enabled']}
                            <a href="{$system['system_url']}/connect/facebook" class="btn btn-social-icon btn-facebook">
                                <i class="fa fa-facebook"></i>
                            </a>
                        {/if}
                        {if $system['twitter_login_enabled']}
                            <a href="{$system['system_url']}/connect/twitter" class="btn btn-social-icon btn-twitter">
                                <i class="fa fa-twitter"></i>
                            </a>
                        {/if}
                        {if $system['google_login_enabled']}
                            <a href="{$system['system_url']}/connect/google" class="btn btn-social-icon btn-google">
                                <i class="fa fa-google"></i>
                            </a>
                        {/if}
                        {if $system['instagram_login_enabled']}
                            <a href="{$system['system_url']}/connect/instagram" class="btn btn-social-icon btn-instagram">
                                <i class="fa fa-instagram"></i>
                            </a>
                        {/if}
                        {if $system['linkedin_login_enabled']}
                            <a href="{$system['system_url']}/connect/linkedin" class="btn btn-social-icon btn-linkedin">
                                <i class="fa fa-linkedin"></i>
                            </a>
                        {/if}
                        {if $system['vkontakte_login_enabled']}
                            <a href="{$system['system_url']}/connect/vkontakte" class="btn btn-social-icon btn-vk">
                                <i class="fa fa-vk"></i>
                            </a>
                        {/if}
                    </div>
                {/if}
            {/if}
            {if $system['registration_enabled']}
                <div class="mt20 text-center">
                    {__("Not registered?")} <a href="{$system['system_url']}/signup" class="js_toggle-panel text-link">{__("Create an account")}</a>
                </div>
            {/if}
        </div>
        <!-- signin -->
        <!-- signup -->
        <div class="panel-body {if $do != 'up'}x-hidden{/if}">
            <h4>{__("New to")} {$system['system_title']}! {__("Sign up")}</h4>
            <form class="js_ajax-forms" data-url="core/signup.php">
                <div class="form-group">
                    <input name="first_name" type="text" class="form-control" placeholder='{__("First name")}' required>
                </div>
                <div class="form-group">
                    <input name="last_name" type="text" class="form-control" placeholder='{__("Last name")}' required>
                </div>
                <div class="form-group">
                    <input name="username" type="text" class="form-control" placeholder='{__("Username")}' required>
                </div>
                <div class="form-group">
                    <input name="email" type="email" class="form-control" placeholder='{__("Email")}' required>
                </div>
                {if $system['activation_enabled'] && $system['activation_type'] == "sms"}
                    <div class="form-group">
                        <input name="phone" type="text" class="form-control" placeholder='{__("Phone number (eg. +905...)")}' required>
                    </div>
                {/if}
                <div class="form-group">
                    <input name="password" type="password" class="form-control" placeholder='{__("Password")}' required>
                </div>
                <div class="js_hidden-section x-hidden">
                    <div class="form-group">
                        <label for="gender">{__("I am")}</label>
                        <select name="gender" id="gender" class="form-control" required>
                            <option value="none">{__("Select Sex")}:</option>
                            <option value="male">{__("Male")}</option>
                            <option value="female">{__("Female")}</option>
                        </select>
                    </div>
                    {if $system['age_restriction']}
                        <div class="form-group">
                            <label>{__("Birthdate")}</label>
                            <div class="row">
                                <div class="col-xs-4">
                                    <select class="form-control" name="birth_month">
                                        <option value="none">{__("Month")}</option>
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
                                        <option value="none">{__("Day")}</option>
                                        {for $i=1 to 31}
                                        <option {if $user->_data['user_birthdate_parsed']['day'] == $i}selected{/if} value="{$i}">{$i}</option>
                                        {/for}
                                    </select>
                                </div>
                                <div class="col-xs-4">
                                    <select class="form-control" name="birth_year">
                                        <option value="none">{__("Year")}</option>
                                        {for $i=1905 to 2017}
                                        <option {if $user->_data['user_birthdate_parsed']['year'] == $i}selected{/if} value="{$i}">{$i}</option>
                                        {/for}
                                    </select>
                                </div>
                            </div>
                        </div>
                    {/if}
                    <!-- custom fields -->
                    {if $custom_fields}
                    {include file='__custom_fields.tpl' _custom_fields=$custom_fields _registration=true}
                    {/if}
                    <!-- custom fields -->
                    {if $system['reCAPTCHA_enabled']}
                        <div class="form-group">
                            <!-- reCAPTCHA -->
                            <div class="g-recaptcha" data-sitekey="{$system['reCAPTCHA_site_key']}"></div>
                            <!-- reCAPTCHA -->
                        </div>
                    {/if}
                    <p class="text-muted">
                        {__("By clicking Sign Up, you agree to our")} <a href="{$system['system_url']}/static/terms">{__("Terms")}</a>
                    </p>
                </div>
                <button type="submit" class="btn btn-block btn-success">{__("Sign Up")}</button>

                <!-- error -->
                <div class="alert alert-danger mb0 mt10 x-hidden" role="alert"></div>
                <!-- error -->
            </form>
            {if $system['social_login_enabled']}
                {if $system['facebook_login_enabled'] || $system['twitter_login_enabled'] || $system['google_login_enabled'] || $system['linkedin_login_enabled'] || $system['vkontakte_login_enabled']}
                    <div class="hr-heading mt5 mb10">
                        <div class="hr-heading-text">
                            {__("or")} {__("register with")}
                        </div>
                    </div>
                    <div class="text-center">
                        {if $system['facebook_login_enabled']}
                            <a href="{$system['system_url']}/connect/facebook" class="btn btn-social-icon btn-facebook">
                                <i class="fa fa-facebook"></i>
                            </a>
                        {/if}
                        {if $system['twitter_login_enabled']}
                            <a href="{$system['system_url']}/connect/twitter" class="btn btn-social-icon btn-twitter">
                                <i class="fa fa-twitter"></i>
                            </a>
                        {/if}
                        {if $system['google_login_enabled']}
                            <a href="{$system['system_url']}/connect/google" class="btn btn-social-icon btn-google">
                                <i class="fa fa-google"></i>
                            </a>
                        {/if}
                        {if $system['instagram_login_enabled']}
                            <a href="{$system['system_url']}/connect/instagram" class="btn btn-social-icon btn-instagram">
                                <i class="fa fa-instagram"></i>
                            </a>
                        {/if}
                        {if $system['linkedin_login_enabled']}
                            <a href="{$system['system_url']}/connect/linkedin" class="btn btn-social-icon btn-linkedin">
                                <i class="fa fa-linkedin"></i>
                            </a>
                        {/if}
                        {if $system['vkontakte_login_enabled']}
                            <a href="{$system['system_url']}/connect/vkontakte" class="btn btn-social-icon btn-vk">
                                <i class="fa fa-vk"></i>
                            </a>
                        {/if}
                    </div>
                {/if}
            {/if}
            <div class="mt20 text-center">{__("Have an account?")} <a href="{$system['system_url']}/signin" class="js_toggle-panel text-link">{__("Login Now")}</a></div>
        </div>
        <!-- signup -->
    </div>
</div>