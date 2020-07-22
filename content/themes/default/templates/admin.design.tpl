<div class="panel panel-default">
    <div class="panel-heading with-icon">
        <i class="fa fa-paint-brush pr5 panel-icon"></i>
        <strong>{__("Design")}</strong>
    </div>
    <div class="panel-body">

        <!-- Design -->
        <form class="js_ajax-forms form-horizontal" data-url="admin/design.php">
            <div class="form-group">
                <label class="col-sm-3 control-label text-left">
                    {__("Website Logo")}
                </label>
                <div class="col-sm-9">
                    {if $system['system_logo'] == ''}
                        <div class="x-image">
                            <button type="button" class="close x-hidden js_x-image-remover" title='{__("Remove")}'>
                                <span>×</span>
                            </button>
                            <div class="loader loader_small x-hidden"></div>
                            <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                            <input type="hidden" class="js_x-image-input" name="system_logo" value="">
                        </div>
                    {else}
                        <div class="x-image" style="background-image: url('{$system['system_uploads']}/{$system['system_logo']}')">
                            <button type="button" class="close js_x-image-remover" title='{__("Remove")}'>
                                <span>×</span>
                            </button>
                            <div class="loader loader_small x-hidden"></div>
                            <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                            <input type="hidden" class="js_x-image-input" name="system_logo" value="{$system['system_logo']}">
                        </div>
                    {/if}
                    <span class="help-block">
                        {__("The perfect size for your logo should be (wdith: 60px & height: 46px)")}
                    </span>
                </div>
            </div>

            <div class="divider"></div>

            <div class="form-group">
                <label class="col-sm-3 control-label text-left">
                    {__("Default Favicon")}
                </label>
                <div class="col-sm-9">
                    <div>
                        <label class="switch" for="system_favicon_default">
                            <input type="checkbox" name="system_favicon_default" id="system_favicon_default" {if $system['system_favicon_default']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="help-block">
                            {__("Use the default")} (<a target="_blank" href="{$system['system_url']}/content/themes/{$system['theme']}/images/favicon.png">{__("preview")}</a>)
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label text-left">
                    {__("Custom Favicon")}
                </label>
                <div class="col-sm-9">
                    {if $system['system_favicon'] == ''}
                        <div class="x-image">
                            <button type="button" class="close x-hidden js_x-image-remover" title='{__("Remove")}'>
                                <span>×</span>
                            </button>
                            <div class="loader loader_small x-hidden"></div>
                            <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                            <input type="hidden" class="js_x-image-input" name="system_favicon" value="">
                        </div>
                    {else}
                        <div class="x-image" style="background-image: url('{$system['system_uploads']}/{$system['system_favicon']}')">
                            <button type="button" class="close js_x-image-remover" title='{__("Remove")}'>
                                <span>×</span>
                            </button>
                            <div class="loader loader_small x-hidden"></div>
                            <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                            <input type="hidden" class="js_x-image-input" name="system_favicon" value="{$system['system_favicon']}">
                        </div>
                    {/if}
                    <span class="help-block">
                        {__("The perfect size for your favicon should be (wdith: 196px & height: 196px)")}
                    </span>
                </div>
            </div>

            <div class="divider"></div>

            <div class="form-group">
                <label class="col-sm-3 control-label text-left">
                    {__("Default OG-Image")}
                </label>
                <div class="col-sm-9">
                    <div>
                        <label class="switch" for="system_ogimage_default">
                            <input type="checkbox" name="system_ogimage_default" id="system_ogimage_default" {if $system['system_ogimage_default']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="help-block">
                            {__("Use the default")} (<a target="_blank" href="{$system['system_url']}/content/themes/{$system['theme']}/images/og-image.jpg">{__("preview")}</a>)
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label text-left">
                    {__("Custom OG-Image")}
                </label>
                <div class="col-sm-9">
                    {if $system['system_ogimage'] == ''}
                        <div class="x-image">
                            <button type="button" class="close x-hidden js_x-image-remover" title='{__("Remove")}'>
                                <span>×</span>
                            </button>
                            <div class="loader loader_small x-hidden"></div>
                            <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                            <input type="hidden" class="js_x-image-input" name="system_ogimage" value="">
                        </div>
                    {else}
                        <div class="x-image" style="background-image: url('{$system['system_uploads']}/{$system['system_ogimage']}')">
                            <button type="button" class="close js_x-image-remover" title='{__("Remove")}'>
                                <span>×</span>
                            </button>
                            <div class="loader loader_small x-hidden"></div>
                            <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                            <input type="hidden" class="js_x-image-input" name="system_ogimage" value="{$system['system_ogimage']}">
                        </div>
                    {/if}
                    <span class="help-block">
                        {__("The perfect size for your og-image should be (wdith: 590px & height: 300px)")}
                    </span>
                </div>
            </div>

            <div class="divider"></div>

            <div class="form-group">
                <label class="col-sm-3 control-label text-left">
                    {__("Default Wallpaper")}
                </label>
                <div class="col-sm-9">
                    <div>
                        <label class="switch" for="system_wallpaper_default">
                            <input type="checkbox" name="system_wallpaper_default" id="system_wallpaper_default" {if $system['system_wallpaper_default']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="help-block">
                            {__("Use the default")} (<a target="_blank" href="{$system['system_url']}/content/themes/{$system['theme']}/images/index-wallpaper.jpg">{__("preview")}</a>)
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label text-left">
                    {__("Custom Wallpaper")}
                </label>
                <div class="col-sm-9">
                    {if $system['system_wallpaper'] == ''}
                        <div class="x-image">
                            <button type="button" class="close x-hidden js_x-image-remover" title='{__("Remove")}'>
                                <span>×</span>
                            </button>
                            <div class="loader loader_small x-hidden"></div>
                            <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                            <input type="hidden" class="js_x-image-input" name="system_wallpaper" value="">
                        </div>
                    {else}
                        <div class="x-image" style="background-image: url('{$system['system_uploads']}/{$system['system_wallpaper']}')">
                            <button type="button" class="close js_x-image-remover" title='{__("Remove")}'>
                                <span>×</span>
                            </button>
                            <div class="loader loader_small x-hidden"></div>
                            <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                            <input type="hidden" class="js_x-image-input" name="system_wallpaper" value="{$system['system_wallpaper']}">
                        </div>
                    {/if}
                    <span class="help-block">
                        {__("The perfect size for your wallpaper should be (wdith: 4600px & height: 3000px)")}
                    </span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label text-left">
                    {__("Home Random Profiles")}
                </label>
                <div class="col-sm-9">
                    <div>
                        <label class="switch" for="system_random_profiles">
                            <input type="checkbox" name="system_random_profiles" id="system_random_profiles" {if $system['system_random_profiles']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="help-block">
                            {__("Show the random profiles on home page")}
                        </span>
                    </div>
                </div>
            </div>

            <div class="divider"></div>

            <div class="form-group">
                <label class="col-sm-3 control-label text-left">
                    {__("Enable Customization")}
                </label>
                <div class="col-sm-9">
                    <label class="switch" for="css_customized">
                        <input type="checkbox" name="css_customized" id="css_customized" {if $system['css_customized']}checked{/if}>
                        <span class="slider round"></span>
                    </label>
                    <span class="help-block">
                        {__("Turn the customization On and Off")}
                    </span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">
                {__("Background Color")}
                </label>
                <div class="col-sm-9">
                    <div class="input-group colorpicker-component js_colorpicker">
                        <input type="text" class="form-control" name="css_background" value="{$system['css_background']}" />
                        <span class="input-group-addon"><i></i></span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">
                {__("Link Color")}
                </label>
                <div class="col-sm-9">
                    <div class="input-group colorpicker-component js_colorpicker">
                        <input type="text" class="form-control" name="css_link_color" value="{$system['css_link_color']}" />
                        <span class="input-group-addon"><i></i></span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">
                {__("Header Color")}
                </label>
                <div class="col-sm-9">
                    <div class="input-group colorpicker-component js_colorpicker">
                        <input type="text" class="form-control" name="css_header" value="{$system['css_header']}" />
                        <span class="input-group-addon"><i></i></span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">
                {__("Header Search Background")}
                </label>
                <div class="col-sm-9">
                    <div class="input-group colorpicker-component js_colorpicker">
                        <input type="text" class="form-control" name="css_header_search" value="{$system['css_header_search']}" />
                        <span class="input-group-addon"><i></i></span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">
                {__("Header Search Font")}
                </label>
                <div class="col-sm-9">
                    <div class="input-group colorpicker-component js_colorpicker">
                        <input type="text" class="form-control" name="css_header_search_color" value="{$system['css_header_search_color']}" />
                        <span class="input-group-addon"><i></i></span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">
                {__("Button Primary")}
                </label>
                <div class="col-sm-9">
                    <div class="input-group colorpicker-component js_colorpicker">
                        <input type="text" class="form-control" name="css_btn_primary" value="{$system['css_btn_primary']}" />
                        <span class="input-group-addon"><i></i></span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">
                {__("Menu Background")}
                </label>
                <div class="col-sm-9">
                    <div class="input-group colorpicker-component js_colorpicker">
                        <input type="text" class="form-control" name="css_menu_background" value="{$system['css_menu_background']}" />
                        <span class="input-group-addon"><i></i></span>
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-3 control-label">
                {__("Custom CSS")}
                </label>
                <div class="col-sm-9">
                    <textarea class="form-control" rows="10" name="css_custome_css">{$system['css_custome_css']}</textarea>
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
        <!-- Design -->
    </div>
</div>