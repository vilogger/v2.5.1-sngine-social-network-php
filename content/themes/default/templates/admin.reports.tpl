<div class="panel panel-default">
    <div class="panel-heading with-icon">
        <i class="fa fa-exclamation-triangle pr5 panel-icon"></i>
        <strong>{__("Reports")}</strong>
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover js_dataTable">
                <thead>
                    <tr>
                        <th>{__("ID")}</th>
                        <th>{__("Node")}</th>
                        <th>{__("Type")}</th>
                        <th>{__("Reporter By")}</th>
                        <th>{__("Time")}</th>
                        <th>{__("Actions")}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $rows as $row}

                        <tr>
                            <td>{$row['report_id']}</td>
                            <td>
                                {if $row['node_type'] == "user"}
                                    <a target="_blank" href="{$system['system_url']}/{$row['node']['user_name']}">
                                        <img class="tbl-image" src="{$row['node']['user_picture']}">
                                        {$row['node']['user_firstname']} {$row['node']['user_lastname']}
                                    </a>
                                {elseif $row['node_type'] == "page"}
                                    <a target="_blank" href="{$system['system_url']}/pages/{$row['node']['page_name']}">
                                        <img class="tbl-image" src="{$row['node']['page_picture']}">
                                        {$row['node']['page_title']}
                                    </a>
                                {elseif $row['node_type'] == "group"}
                                    <a target="_blank" href="{$system['system_url']}/groups/{$row['node']['group_name']}">
                                        <img class="tbl-image" src="{$row['node']['group_picture']}">
                                        {$row['node']['group_title']}
                                    </a>
                                {elseif $row['node_type'] == "event"}
                                    <a target="_blank" href="{$system['system_url']}/events/{$row['node_id']}">
                                        <img class="tbl-image" src="{$row['node']['event_picture']}">
                                        {$row['node']['event_title']}
                                    </a>
                                {elseif $row['node_type'] == "post"}
                                    <a class="btn btn-xs btn-default" href="{$system['system_url']}/posts/{$row['node_id']}" target="_blank">
                                        <i class="fa fa-eye"></i> {__("View Post")}
                                    </a>
                                {elseif $row['node_type'] == "comment"}
                                    <a class="btn btn-xs btn-default" href="{$row['url']}" target="_blank">
                                        <i class="fa fa-eye"></i> {__("View Comment")}
                                    </a>
                                {/if}
                            </td>
                            <td>
                                <span class="label label-{$row['node']['color']}">{$row['node_type']|capitalize}</span>
                            </td>
                            <td>
                                <a target="_blank" href="{$system['system_url']}/{$row['user_name']}">
                                    <img class="tbl-image" src="{$row['user_picture']}">
                                    {$row['user_firstname']} {$row['user_lastname']}
                                </a>
                            </td>

                            <td>{$row['time']|date_format:"%e %B %Y"}</td>
                            <td>
                                <button data-toggle="tooltip" data-placement="top" title='{__("Mark as Safe")}' class="btn btn-xs btn-success js_admin-deleter" data-handle="report" data-id="{$row['report_id']}">
                                    <i class="fa fa-check"></i>
                                </button>
                                <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-xs btn-danger js_admin-deleter" data-handle="{$row['node_type']}" data-id="{$row['node_id']}" data-node="{$row['report_id']}">
                                    <i class="fa fa-trash-o"></i>
                                </button>
                                {if $row['node_type'] == "user"}
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' target="_blank" href="{$system['system_url']}/admincp/users/edit/{$row['node_id']}" class="btn btn-xs btn-primary">
                                        <i class="fa fa-pencil"></i>
                                    </a>
                                {elseif $row['node_type'] == "page"}
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' target="_blank" href="{$system['system_url']}/admincp/pages/edit_page/{$row['node_id']}" class="btn btn-xs btn-primary">
                                        <i class="fa fa-pencil"></i>
                                    </a>
                                {elseif $row['node_type'] == "group"}
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' target="_blank" href="{$system['system_url']}/admincp/groups/edit/{$row['node_id']}" class="btn btn-xs btn-primary">
                                        <i class="fa fa-pencil"></i>
                                    </a>
                                {elseif $row['node_type'] == "event"}
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' target="_blank" href="{$system['system_url']}/admincp/events/edit_event/{$row['node_id']}" class="btn btn-xs btn-primary">
                                        <i class="fa fa-pencil"></i>
                                    </a>
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>