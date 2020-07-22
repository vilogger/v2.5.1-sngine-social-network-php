<div class="panel panel-default">
    <div class="panel-heading with-icon">
        {if $sub_view == "edit"}
            <div class="pull-right flip">
                <a target="_blank" href="{$system['system_url']}/groups/{$data['group_name']}" class="btn btn-info">
                    <i class="fa fa-television fa-fw mr5"></i>{__("View Group")}
                </a>
            </div>
        {/if}
        <i class="fa fa-users pr5 panel-icon"></i>
        <strong>{__("Groups")}</strong>
        {if $sub_view == "edit"} &rsaquo; <strong>{$data['group_title']}</strong>{/if}
    </div>
    {if $sub_view != "edit"}
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Group")}</th>
                            <th>{__("Admin")}</th>
                            <th>{__("Privacy")}</th>
                            <th>{__("Members")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                        <tr>
                            <td>
                                <a href="{$system['system_url']}/groups/{$row['group_name']}" target="_blank">{$row['group_id']}</a>
                            </td>
                            <td>
                                <a target="_blank" href="{$system['system_url']}/groups/{$row['group_name']}">
                                    <img class="tbl-image" src="{$row['group_picture']}">
                                    {$row['group_title']}
                                </a>
                            </td>
                            <td>
                                <a target="_blank" href="{$system['system_url']}/{$row['user_name']}">
                                    <img class="tbl-image" src="{$row['user_picture']}">
                                    {$row['user_firstname']} {$row['user_lastname']}
                                </a>
                            </td>
                            <td>
                                {if $row['group_privacy'] == "public"}
                                    <i class="fa fa-globe fa-fw fa-lg"></i>
                                    {__("Public")}
                                {elseif $row['group_privacy'] == "closed"}
                                    <i class="fa fa-unlock-alt fa-fw fa-lg"></i>
                                    {__("Closed")}
                                {elseif $row['group_privacy'] == "secret"}
                                    <i class="fa fa-lock fa-fw fa-lg"></i>
                                    {__("Secret")}
                                {/if}
                            </td>
                            <td>{$row['group_members']}</td>
                            <td>
                                <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-xs btn-danger js_admin-deleter" data-handle="group" data-id="{$row['group_id']}">
                                    <i class="fa fa-trash-o"></i>
                                </button>
                                <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/admincp/groups/edit/{$row['group_id']}" class="btn btn-xs btn-primary">
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
            <div class="row">
                <div class="col-xs-offset-3 col-xs-6 col-sm-offset-0 col-sm-2 mb10">
                    <img class="img-responsive img-thumbnail" src="{$data['group_picture']}">
                </div>
                <div class="col-xs-12 col-sm-10 mb10">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <span class="badge">{$data['group_id']}</span>
                            {__("Group ID")}
                        </li>
                        <li class="list-group-item">
                            <span class="badge">{$data['group_members']}</span>
                            {__("Members")}
                        </li>
                        <li class="list-group-item">
                            <span class="badge">
                                {if $data['group_privacy'] == "public"}
                                    <i class="fa fa-globe fa-fw fa-lg"></i>
                                    {__("Public")}
                                {elseif $data['group_privacy'] == "closed"}
                                    <i class="fa fa-unlock-alt fa-fw fa-lg"></i>
                                    {__("Closed")}
                                {elseif $data['group_privacy'] == "secret"}
                                    <i class="fa fa-lock fa-fw fa-lg"></i>
                                    {__("Secret")}
                                {/if}
                            </span>
                            {__("Privacy")}
                        </li>
                    </ul>
                </div>
            </div>

            <!-- tabs nav -->
            <ul class="nav nav-tabs mb20">
                <li class="active">
                    <a href="#basic" data-toggle="tab">
                        <i class="fa fa-cog fa-fw mr5"></i><strong class="pr5">{__("Group Info")}</strong>
                    </a>
                </li>
            </ul>
            <!-- tabs nav -->

            <!-- tabs content -->
            <div class="tab-content">
                <!-- basic tab -->
                <div class="tab-pane active" id="basic">
                    <form class="js_ajax-forms form-horizontal" data-url="admin/groups.php?id={$data['group_id']}">
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
                                {__("Name Your Group")}
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" name="group_title" value="{$data['group_title']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Web Address")}
                            </label>
                            <div class="col-sm-9">
                                <div class="input-group">
                                    <span class="input-group-addon">{$system['system_url']}/groups/</span>
                                    <input type="text" class="form-control" name="group_name" id="group_name" value="{$data['group_name']}">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Select Privacy")}
                            </label>
                            <div class="col-sm-9">
                                <select class="form-control selectpicker" name="group_privacy">
                                    <option {if $data['group_privacy'] == "public"}selected{/if} value="public" data-content="<div class='option'><div class='icon'><i class='fa fa-globe fa-2x'></i></div><div class='text'><b>{__('Public Group')}</b><br>{__('Anyone can see the group, its members and their posts')}.
                                    </div></div>">{__("Public Group")}</option>
                                    <option {if $data['group_privacy'] == "closed"}selected{/if} value="closed" data-content="<div class='option'><div class='icon'><i class='fa fa-unlock-alt fa-2x'></i></div><div class='text'><b>{__('Closed Group')}</b><br>{__('Only members can see posts')}.
                                    </div></div>">{__("Closed Group")}</option>
                                    <option {if $data['group_privacy'] == "secret"}selected{/if} value="secret" data-content="<div class='option'><div class='icon'><i class='fa fa-lock fa-2x'></i></div><div class='text'><b>{__('Secret Group')}</b><br>{__('Only members can find the group and see posts')}.
                                    </div></div>">{__("Secret Group")}</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("About")}
                            </label>
                            <div class="col-sm-9">
                                <textarea class="form-control" name="group_description" rows="5">{$data['group_description']}</textarea>
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
    {/if}
</div>