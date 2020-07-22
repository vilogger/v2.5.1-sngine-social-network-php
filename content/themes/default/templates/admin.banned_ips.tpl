<div class="panel panel-default">
    <div class="panel-heading with-icon">
        {if $sub_view == ""}
            <div class="pull-right flip">
                <a href="{$system['system_url']}/admincp/banned_ips/add" class="btn btn-primary">
                    <i class="fa fa-plus"></i> {__("Add New IP")}
                </a>
            </div>
        {/if}
        <i class="fa fa-user-times pr5 panel-icon"></i>
        <strong>{__("Banned IPs")}</strong>
        {if $sub_view == "add"} &rsaquo; <strong>{__("Add New")}</strong>{/if}
    </div>
    {if $sub_view == ""}
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("IP Address")}</th>
                            <th>{__("Time")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                        <tr>
                            <td>{$row['ip_id']}</td>
                            <td>{$row['ip']}</td>
                            <td>{$row['time']}</td>
                            <td>
                                <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-xs btn-danger js_admin-deleter" data-handle="ip" data-id="{$row['ip_id']}">
                                    <i class="fa fa-trash-o"></i>
                                </button>
                            </td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    {elseif $sub_view == "add"}
        <div class="panel-body">
            <form class="js_ajax-forms form-horizontal" data-url="admin/banned_ips.php?do=add">
                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("IP Address")}
                    </label>
                    <div class="col-sm-9">
                        <input class="form-control" name="ip">
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