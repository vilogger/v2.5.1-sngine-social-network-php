<div class="panel panel-default">
    <div class="panel-heading with-icon">
        {if $sub_view == "edit_event"}
            <div class="pull-right flip">
                <a target="_blank" href="{$system['system_url']}/events/{$data['event_id']}" class="btn btn-info">
                    <i class="fa fa-television fa-fw mr5"></i>{__("View Event")}
                </a>
            </div>
        {elseif $sub_view == "categories"}
            <div class="pull-right flip">
                <a href="{$system['system_url']}/admincp/events/add_category" class="btn btn-primary">
                    <i class="fa fa-plus"></i> {__("Add New Category")}
                </a>
            </div>
        {/if}
        <i class="fa fa-calendar pr5 panel-icon"></i>
        <strong>{__("Events")}</strong>
        {if $sub_view == "edit_event"} &rsaquo; <strong>{$data['event_title']}</strong>{/if}
        {if $sub_view == "categories"} &rsaquo; <strong>{__("Categories")}</strong>{/if}
        {if $sub_view == "add_category"} &rsaquo; <strong>{__("Categories")}</strong> &rsaquo; <strong>{__("Add New")}</strong>{/if}
        {if $sub_view == "edit_category"} &rsaquo; <strong>{__("Categories")}</strong> &rsaquo; <strong>{$data['category_name']}</strong>{/if}
    </div>
    {if $sub_view == ""}
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Event")}</th>
                            <th>{__("Admin")}</th>
                            <th>{__("Privacy")}</th>
                            <th>{__("Interested")}</th>
                            <th>{__("Going")}</th>
                            <th>{__("Invited")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                        <tr>
                            <td>
                                <a href="{$system['system_url']}/events/{$row['event_id']}" target="_blank">{$row['event_id']}</a>
                            </td>
                            <td>
                                <a target="_blank" href="{$system['system_url']}/events/{$row['event_id']}">
                                    {$row['event_title']}
                                </a>
                            </td>
                            <td>
                                <a target="_blank" href="{$system['system_url']}/{$row['user_name']}">
                                    <img class="tbl-image" src="{$row['user_picture']}">
                                    {$row['user_firstname']} {$row['user_lastname']}
                                </a>
                            </td>
                            <td>
                                {if $row['event_privacy'] == "public"}
                                    <i class="fa fa-globe fa-fw fa-lg"></i>
                                    {__("Public")}
                                {elseif $row['event_privacy'] == "closed"}
                                    <i class="fa fa-unlock-alt fa-fw fa-lg"></i>
                                    {__("Closed")}
                                {elseif $row['event_privacy'] == "secret"}
                                    <i class="fa fa-lock fa-fw fa-lg"></i>
                                    {__("Secret")}
                                {/if}
                            </td>
                            <td>{$row['event_interested']}</td>
                            <td>{$row['event_going']}</td>
                            <td>{$row['event_invited']}</td>
                            <td>
                                <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-xs btn-danger js_admin-deleter" data-handle="event" data-id="{$row['event_id']}">
                                    <i class="fa fa-trash-o"></i>
                                </button>
                                <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/admincp/events/edit_event/{$row['event_id']}" class="btn btn-xs btn-primary">
                                    <i class="fa fa-pencil"></i>
                                </a>
                            </td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    {elseif $sub_view == "edit_event"}
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-offset-3 col-xs-6 col-sm-offset-0 col-sm-2 mb10">
                    <img class="img-responsive img-thumbnail" src="{$data['event_picture']}">
                </div>
                <div class="col-xs-12 col-sm-5 mb10">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <span class="badge">{$data['event_id']}</span>
                            {__("Event ID")}
                        </li>
                        <li class="list-group-item">
                            <span class="badge">
                                {if $data['event_privacy'] == "public"}
                                    <i class="fa fa-globe fa-fw fa-lg"></i>
                                    {__("Public")}
                                {elseif $data['event_privacy'] == "closed"}
                                    <i class="fa fa-unlock-alt fa-fw fa-lg"></i>
                                    {__("Closed")}
                                {elseif $data['event_privacy'] == "secret"}
                                    <i class="fa fa-lock fa-fw fa-lg"></i>
                                    {__("Secret")}
                                {/if}
                            </span>
                            {__("Privacy")}
                        </li>
                    </ul>
                </div>
                <div class="col-xs-12 col-sm-5 mb10">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <span class="badge">{$data['event_interested']}</span>
                            {__("Interested")}
                        </li>
                        <li class="list-group-item">
                            <span class="badge">{$data['event_going']}</span>
                            {__("Going")}
                        </li>
                        <li class="list-group-item">
                            <span class="badge">{$data['event_invited']}</span>
                            {__("Invited")}
                        </li>
                    </ul>
                </div>
            </div>
            <!-- tabs nav -->
            <ul class="nav nav-tabs mb20">
                <li class="active">
                    <a href="#basic" data-toggle="tab">
                        <i class="fa fa-cog fa-fw mr5"></i><strong class="pr5">{__("Event Info")}</strong>
                    </a>
                </li>
            </ul>
            <!-- tabs nav -->

            <!-- tabs content -->
            <div class="tab-content">
                <!-- basic tab -->
                <div class="tab-pane active" id="basic">
                    <form class="js_ajax-forms form-horizontal" data-url="admin/events.php?do=edit_event&id={$data['event_id']}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Admin")}
                            </label>
                            <div class="col-sm-9 mt5">
                                <a target="_blank" href="{$system['system_url']}/{$data['user_name']}">
                                    <img class="tbl-image" src="{$data['user_picture']}">
                                    {$data['user_firstname']} {$data['user_lastname']}
                                </a> <a target="_blank" data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/admincp/users/edit/{$data['user_id']}" class="btn btn-xs btn-default ml10">
                                    <i class="fa fa-pencil"></i>
                                </a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Name Your Event")}
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" name="title" value="{$data['event_title']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Location")}
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" name="location" value="{$data['event_location']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Start Date")}
                            </label>
                            <div class="col-sm-9">
                                <div class='input-group date js_datetimepicker'>
                                    <input type='text' class="form-control" name="start_date" value="{get_datetime($data['event_start_date'])}" />
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
                                    <input type='text' class="form-control" name="end_date" value="{get_datetime($data['event_end_date'])}" />
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
                                {__("Select Privacy")}
                            </label>
                            <div class="col-sm-9">
                                <select class="form-control selectpicker" name="privacy">
                                    <option {if $data['event_privacy'] == "public"}selected{/if} value="public" data-content="<div class='option'><div class='icon'><i class='fa fa-globe fa-2x'></i></div><div class='text'><b>{__('Public Event')}</b><br>{__('Anyone can see the event, its users and posts')}.
                                    </div></div>">{__("Public Event")}</option>
                                    <option {if $data['event_privacy'] == "closed"}selected{/if} value="closed" data-content="<div class='option'><div class='icon'><i class='fa fa-unlock-alt fa-2x'></i></div><div class='text'><b>{__('Closed Event')}</b><br>{__('Only event users can see posts')}.
                                    </div></div>">{__("Closed Event")}</option>
                                    <option {if $data['event_privacy'] == "secret"}selected{/if} value="secret" data-content="<div class='option'><div class='icon'><i class='fa fa-lock fa-2x'></i></div><div class='text'><b>{__('Secret Event')}</b><br>{__('Only invited users and event users can find the event')}.
                                    </div></div>">{__("Secret Event")}</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Category")}
                            </label>
                            <div class="col-sm-9">
                                <select class="form-control" name="category">
                                    {foreach $data['categories'] as $category}
                                        <option {if $data['event_category'] == $category['category_id']}selected{/if} value="{$category['category_id']}">{__($category['category_name'])}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("About")}
                            </label>
                            <div class="col-sm-9">
                                <textarea class="form-control" name="description">{$data['event_description']}</textarea>
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
            </div>
            <!-- tabs content -->
        </div>
    {elseif $sub_view == "categories"}
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Title")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                        <tr>
                            <td>{$row['category_id']}</td>
                            <td>{$row['category_name']}</td>
                            <td>
                                <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-xs btn-danger js_admin-deleter" data-handle="event_category" data-id="{$row['category_id']}">
                                    <i class="fa fa-trash-o"></i>
                                </button>
                                <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/admincp/events/edit_category/{$row['category_id']}" class="btn btn-xs btn-primary">
                                    <i class="fa fa-pencil"></i>
                                </a>
                            </td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    {elseif $sub_view == "add_category"}
        <div class="panel-body">
            <form class="js_ajax-forms form-horizontal" data-url="admin/events.php?do=add_category">
                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Name")}
                    </label>
                    <div class="col-sm-9">
                        <input class="form-control" name="category_name">
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
    {elseif $sub_view == "edit_category"}
        <div class="panel-body">
            <form class="js_ajax-forms form-horizontal" data-url="admin/events.php?do=edit_category&id={$data['category_id']}">
                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Name")}
                    </label>
                    <div class="col-sm-9">
                        <input class="form-control" name="category_name" value="{$data['category_name']}">
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