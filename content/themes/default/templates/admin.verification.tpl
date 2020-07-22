<div class="panel panel-default">
    <div class="panel-heading with-icon">
        <i class="fa fa-check-circle pr5 panel-icon"></i>
        <strong>{__("Verification")}</strong>
        {if $sub_view == ""} &rsaquo; <strong>{__("Requests")}</strong>{/if}
        {if $sub_view == "users"} &rsaquo; <strong>{__("Verified Users")}</strong>{/if}
        {if $sub_view == "pages"} &rsaquo; <strong>{__("Verified Pages")}</strong>{/if}
    </div>
    {if $sub_view == ""}
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("User/Page")}</th>
                            <th>{__("Type")}</th>
                            <th>{__("Time")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}

                            <tr>
                                <td>{$row['request_id']}</td>
                                <td>
                                    {if $row['node_type'] == "user"}
                                        <a target="_blank" href="{$system['system_url']}/{$row['user_name']}">
                                            <img class="tbl-image" src="{$row['user_picture']}">
                                            {$row['user_firstname']} {$row['user_lastname']}
                                        </a>
                                    {elseif $row['node_type'] == "page"}
                                        <a target="_blank" href="{$system['system_url']}/pages/{$row['page_name']}">
                                            <img class="tbl-image" src="{$row['page_picture']}">
                                            {$row['page_title']}
                                        </a>
                                    {/if}
                                </td>
                                <td>
                                    <span class="label label-{$row['color']}">{$row['node_type']|capitalize}</span>
                                </td>
                                <td>{$row['time']|date_format:"%e %B %Y"}</td>
                                <td>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Verify")}' class="btn btn-xs btn-success js_admin-verify" data-handle="{$row['node_type']}" data-id="{$row['node_id']}">
                                        <i class="fa fa-check"></i>
                                    </button>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Decline")}' class="btn btn-xs btn-danger js_admin-unverify" data-id="{$row['request_id']}">
                                        <i class="fa fa-times"></i>
                                    </button>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    {elseif $sub_view == "users"}
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Name")}</th>
                            <th>{__("Username")}</th>
                            <th>{__("Joined")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                            <tr>
                                <td><a href="{$system['system_url']}/{$row['user_name']}" target="_blank">{$row['user_id']}</a></td>
                                <td>
                                    <a target="_blank" href="{$system['system_url']}/{$row['user_name']}">
                                        <img class="tbl-image" src="{$row['user_picture']}">
                                        {$row['user_firstname']} {$row['user_lastname']}
                                    </a>
                                </td>
                                <td>
                                    <a href="{$system['system_url']}/{$row['user_name']}" target="_blank">
                                        {$row['user_name']}
                                    </a>
                                </td>
                                <td>{$row['user_registered']|date_format:"%e %B %Y"}</td>
                                <td>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-xs btn-danger js_delete-user" data-id="{$row['user_id']}">
                                        <i class="fa fa-trash-o"></i>
                                    </button>
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/admincp/users/edit/{$row['user_id']}" class="btn btn-xs btn-primary">
                                        <i class="fa fa-pencil"></i>
                                    </a>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    {elseif $sub_view == "pages"}
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Page")}</th>
                            <th>{__("Likes")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                            <tr>
                                <td>
                                    <a href="{$system['system_url']}/pages/{$row['page_name']}" target="_blank">
                                        {$row['page_id']}
                                    </a>
                                </td>
                                <td>
                                    <a target="_blank" href="{$system['system_url']}/pages/{$row['page_name']}">
                                        <img class="tbl-image" src="{$row['page_picture']}">
                                        {$row['page_title']}
                                    </a>
                                </td>
                                <td>{$row['page_likes']}</td>
                                <td>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-xs btn-danger js_delete-page" data-id="{$row['page_id']}">
                                        <i class="fa fa-trash-o"></i>
                                    </button>
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/admincp/pages/edit_page/{$row['page_id']}" class="btn btn-xs btn-primary">
                                        <i class="fa fa-pencil"></i>
                                    </a>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    {/if}
</div>