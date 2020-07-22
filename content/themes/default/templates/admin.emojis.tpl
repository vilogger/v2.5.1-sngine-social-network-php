<div class="panel panel-default">
    <div class="panel-heading with-icon">
        {if $sub_view == ""}
            <div class="pull-right flip">
                <a href="{$system['system_url']}/admincp/emojis/add" class="btn btn-primary">
                    <i class="fa fa-plus"></i> {__("Add New Emoji")}
                </a>
            </div>
        {/if}
        <i class="fa fa-smile-o pr5 panel-icon"></i>
        <strong>{__("Emojis")}</strong>
        {if $sub_view == "add"} &rsaquo; <strong>{__("Add New")}</strong>{/if}
        {if $sub_view == "edit"} &rsaquo; <strong>{__("Edit Emoji")}</strong>{/if}
    </div>
    {if $sub_view == ""}
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("Preview")}</th>
                            <th>{__("Pattern")}</th>
                            <th>{__("Class")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                            <tr>
                                <td>
                                    {$row['emoji_id']}
                                </td>
                                <td>
                                    <i class="twa twa-2x twa-{$row['class']}"></i>
                                </td>
                                <td>
                                    {$row['pattern']}
                                </td>
                                <td>
                                    {$row['class']}
                                </td>
                                <td>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-xs btn-danger js_admin-deleter" data-handle="emoji" data-id="{$row['emoji_id']}">
                                        <i class="fa fa-trash-o"></i>
                                    </button>
                                    <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/admincp/emojis/edit/{$row['emoji_id']}" class="btn btn-xs btn-primary">
                                        <i class="fa fa-pencil"></i>
                                    </a>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    {elseif $sub_view == "add"}
        <div class="panel-body">
            <div class="alert alert-warning">
                <div class="icon">
                    <i class="fa fa-info-circle fa-2x"></i>
                </div>
                <div class="text pt5">
                    {__("Sngine uses Twemoji Awesome and you can check")} <a target="_blank" href="https://www.webpagefx.com/tools/emoji-cheat-sheet/">{__("Emoji Cheat Sheet")}</a>  {__("for the Emojis, You must replace underscores with hyphens, For example: :hatching_chick: for pattern and hatching-chickas for class")}.
                </div>
            </div>
            <form class="js_ajax-forms form-horizontal" data-url="admin/emojis.php?do=add">
                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Pattern")}
                    </label>
                    <div class="col-sm-9">
                        <input class="form-control" name="pattern">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Class")}
                    </label>
                    <div class="col-sm-9">
                        <input class="form-control" name="class">
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
    {elseif $sub_view == "edit"}
        <div class="panel-body">
            <div class="alert alert-warning">
                <div class="icon">
                    <i class="fa fa-info-circle fa-2x"></i>
                </div>
                <div class="text pt5">
                    {__("Sngine uses Twemoji Awesome and you can check")} <a target="_blank" href="https://www.webpagefx.com/tools/emoji-cheat-sheet/">{__("Emoji Cheat Sheet")}</a>  {__("for the Emojis, You must replace underscores with hyphens, For example: :hatching_chick: for pattern and hatching-chickas for class")}.
                </div>
            </div>
            <form class="js_ajax-forms form-horizontal" data-url="admin/emojis.php?do=edit&id={$data['emoji_id']}">
                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Pattern")}
                    </label>
                    <div class="col-sm-9">
                        <input class="form-control" name="pattern" value="{$data['pattern']}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Class")}
                    </label>
                    <div class="col-sm-9">
                        <input class="form-control" name="class" value="{$data['class']}">
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