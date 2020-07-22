<div class="panel panel-default">
    <div class="panel-heading with-icon">
        {if $sub_view == ""}
            <div class="pull-right flip">
                <a href="{$system['system_url']}/admincp/announcements/add" class="btn btn-primary">
                    <i class="fa fa-plus"></i> {__("Add New Announcement")}
                </a>
            </div>
        {/if}
        <i class="fa fa-bullhorn pr5 panel-icon"></i>
        <strong>{__("Announcements")}</strong>
        {if $sub_view == "edit"} &rsaquo; <strong>{$data['name']}</strong>{/if}
        {if $sub_view == "add"} &rsaquo; <strong>{__("Add New")}</strong>{/if}
    </div>
    {if $sub_view == ""}
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Name")}</th>
                            <th>{__("Type")}</th>
                            <th>{__("Start Date")}</th>
                            <th>{__("End Date")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                            <tr>
                                <td>{$row['announcement_id']}</td>
                                <td>{$row['name']}</td>
                                <td>{$row['type']}</td>
                                <td>{$row['start_date']}</td>
                                <td>{$row['end_date']}</td>
                                <td>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-xs btn-danger js_admin-deleter" data-handle="announcement" data-id="{$row['announcement_id']}">
                                        <i class="fa fa-trash-o"></i>
                                    </button>
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/admincp/announcements/edit/{$row['announcement_id']}" class="btn btn-xs btn-primary">
                                        <i class="fa fa-pencil"></i>
                                    </a>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    {elseif $sub_view == "edit"}
        <div class="panel-body">
            <form class="js_ajax-forms form-horizontal" data-url="admin/announcements.php?do=edit&id={$data['announcement_id']}">
                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Name")}
                    </label>
                    <div class="col-sm-9">
                        <input class="form-control" name="name" value="{$data['name']}">
                        <span class="help-block">
                            {__("Announcement name will appear only in the admin panel (mandatory)")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Title")}
                    </label>
                    <div class="col-sm-9">
                        <input class="form-control" name="title" value="{$data['title']}">
                        <span class="help-block">
                            {__("Announcement title will appear on the announcement block")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Type")}
                    </label>
                    <div class="col-sm-9">
                        <select class="form-control" name="type">
                            <option {if $data['type'] == "success"}selected{/if} value="success" class="alert-success">{__("Success")}</option>
                            <option {if $data['type'] == "warning"}selected{/if} value="warning" class="alert-warning">{__("Warning")}</option>
                            <option {if $data['type'] == "danger"}selected{/if} value="danger" class="alert-danger">{__("Danger")}</option>
                            <option {if $data['type'] == "info"}selected{/if} value="info" class="alert-info">{__("Info")}</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("HTML")}
                    </label>
                    <div class="col-sm-9">
                        <textarea class="form-control" name="message" rows="8">{$data['code']}</textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Start Date")}
                    </label>
                    <div class="col-sm-9">
                        <div class='input-group date js_datetimepicker'>
                            <input type='text' class="form-control" name="start_date" value="{get_datetime($data['start_date'])}" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                        <span class="help-block">
                            {__("Your current server datetime is")}: {$date} (UTC)
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("End Date")}
                    </label>
                    <div class="col-sm-9">
                        <div class='input-group date js_datetimepicker'>
                            <input type='text' class="form-control" name="end_date" value="{get_datetime($data['end_date'])}" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                        <span class="help-block">
                            {__("Your current server datetime is")}: {$date} (UTC)
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
    {elseif $sub_view == "add"}
        <div class="panel-body">
            <form class="js_ajax-forms form-horizontal" data-url="admin/announcements.php?do=add">
                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Name")}
                    </label>
                    <div class="col-sm-9">
                        <input class="form-control" name="name">
                        <span class="help-block">
                            {__("Announcement name will appear only in the admin panel")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Title")}
                    </label>
                    <div class="col-sm-9">
                        <input class="form-control" name="title">
                        <span class="help-block">
                            {__("Announcement title will appear on the announcement block")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Type")}
                    </label>
                    <div class="col-sm-9">
                        <select class="form-control" name="type">
                            <option value="success" class="alert-success">{__("Success")}</option>
                            <option value="warning" class="alert-warning">{__("Warning")}</option>
                            <option value="danger" class="alert-danger">{__("Danger")}</option>
                            <option value="info" class="alert-info">{__("Info")}</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("HTML")}
                    </label>
                    <div class="col-sm-9">
                        <textarea class="form-control" name="message" rows="8"></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Start Date")}
                    </label>
                    <div class="col-sm-9">
                        <div class='input-group date js_datetimepicker'>
                            <input type='text' class="form-control" name="start_date" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                        <span class="help-block">
                            {__("Your current server datetime is")}: {$date} (UTC)
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("End Date")}
                    </label>
                    <div class="col-sm-9">
                        <div class='input-group date js_datetimepicker'>
                            <input type='text' class="form-control" name="end_date" />
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                        <span class="help-block">
                            {__("Your current server datetime is")}: {$date} (UTC)
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
    {/if}
</div>