<div class="panel panel-default">
    <div class="panel-heading with-icon">
        <i class="fa fa-paper-plane-o pr5 panel-icon"></i>
        <strong>{__("Newsletter")}</strong>
    </div>
    <div class="panel-body">

        <!-- Newsletter -->
        <form class="js_ajax-forms form-horizontal" data-url="admin/newsletter.php">

            <div class="form-group">
                <label class="col-sm-3 control-label">
                    {__("Subject")}
                </label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="subject">
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-sm-3 control-label">
                    {__("Message")}
                </label>
                <div class="col-sm-9">
                    <textarea class="form-control" rows="10" name="message"></textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">
                    {__("Is HTML")}
                </label>
                <div class="col-sm-9">
                    <label class="switch" for="is_html">
                        <input type="checkbox" name="is_html" id="is_html">
                        <span class="slider round"></span>
                    </label>
                    <span class="help-block">
                        {__("The message will be sent as HTML instead of plain text")}
                    </span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label text-left">
                    {__("Send to")}
                </label>
                <div class="col-sm-9">
                    <select class="form-control" name="to">
                        <option value="all">{__("All Users")}</option>
                        <option value="active">{__("Active Users")}</option>
                        <option value="inactive">{__("Inactive Users")}</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">
                    {__("Test Message")}
                </label>
                <div class="col-sm-9">
                    <label class="switch" for="is_test">
                        <input type="checkbox" name="is_test" id="is_test">
                        <span class="slider round"></span>
                    </label>
                    <span class="help-block">
                        {__("The message will sent to Website Email only")}
                    </span>
                </div>
            </div>

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
        <!-- Newsletter -->
        
    </div>
</div>