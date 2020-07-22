<div class="panel panel-default">
    <div class="panel-heading with-icon">
        {if $sub_view == "edit_page"}
            <div class="pull-right flip">
                <a target="_blank" href="{$system['system_url']}/pages/{$data['page_name']}" class="btn btn-info">
                    <i class="fa fa-television fa-fw mr5"></i>{__("View Page")}
                </a>
            </div>
        {elseif $sub_view == "categories"}
            <div class="pull-right flip">
                <a href="{$system['system_url']}/admincp/pages/add_category" class="btn btn-primary">
                    <i class="fa fa-plus"></i> {__("Add New Category")}
                </a>
            </div>
        {/if}
        <i class="fa fa-flag pr5 panel-icon"></i>
        <strong>{__("Pages")}</strong>
        {if $sub_view == "edit_page"} &rsaquo; <strong>{$data['page_title']}</strong>{/if}
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
                            <th>{__("Page")}</th>
                            <th>{__("Admin")}</th>
                            <th>{__("Likes")}</th>
                            <th>{__("Verified")}</th>
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
                                <td>
                                    <a target="_blank" href="{$system['system_url']}/{$row['user_name']}">
                                        <img class="tbl-image" src="{$row['user_picture']}">
                                        {$row['user_firstname']} {$row['user_lastname']}
                                    </a>
                                </td>
                                <td>{$row['page_likes']}</td>
                                <td>
                                    {if $row['page_verified']}
                                        <span class="label label-success">{__("Yes")}</span>
                                    {else}
                                        <span class="label label-danger">{__("No")}</span>
                                    {/if}
                                </td>
                                <td>
                                    <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-xs btn-danger js_admin-deleter" data-handle="page" data-id="{$row['page_id']}">
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
    {elseif $sub_view == "edit_page"}
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-offset-3 col-xs-6 col-sm-offset-0 col-sm-2 mb10">
                    <img class="img-responsive img-thumbnail" src="{$data['page_picture']}">
                </div>
                <div class="col-xs-12 col-sm-10 mb10">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <span class="badge">{$data['page_id']}</span>
                            {__("Page ID")}
                        </li>
                        <li class="list-group-item">
                            <span class="badge">{$data['page_likes']}</span>
                            {__("Likes")}
                        </li>
                    </ul>
                </div>
            </div>
            <!-- tabs nav -->
            <ul class="nav nav-tabs mb20">
                <li class="active">
                    <a href="#basic" data-toggle="tab">
                        <i class="fa fa-cog fa-fw mr5"></i><strong class="pr5">{__("Page Info")}</strong>
                    </a>
                </li>
            </ul>
            <!-- tabs nav -->

            <!-- tabs content -->
            <div class="tab-content">
                <!-- basic tab -->
                <div class="tab-pane active" id="basic">
                    <form class="js_ajax-forms form-horizontal" data-url="admin/pages.php?do=edit_page&id={$data['page_id']}">
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
                                {__("Verified Page")}
                            </label>
                            <div class="col-sm-9">
                                <label class="switch" for="page_verified">
                                    <input type="checkbox" name="page_verified" id="page_verified" {if $data['page_verified']}checked{/if}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Name Your Page")}
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" name="page_title" value="{$data['page_title']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Web Address")}
                            </label>
                            <div class="col-sm-9">
                                <div class="input-group">
                                    <span class="input-group-addon">{$system['system_url']}/pages/</span>
                                    <input type="text" class="form-control" name="page_name" id="page_name" value="{$data['page_name']}">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("Category")}
                            </label>
                            <div class="col-sm-9">
                                <select class="form-control" name="page_category">
                                    {foreach $data['categories'] as $category}
                                        <option {if $data['page_category'] == $category['category_id']}selected{/if} value="{$category['category_id']}">{__($category['category_name'])}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label text-left">
                                {__("About")}
                            </label>
                            <div class="col-sm-9">
                                <textarea class="form-control" name="page_description">{$data['page_description']}</textarea>
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
                                <button data-toggle="tooltip" data-placement="top" title='{__("Delete")}' class="btn btn-xs btn-danger js_admin-deleter" data-handle="page_category" data-id="{$row['category_id']}">
                                    <i class="fa fa-trash-o"></i>
                                </button>
                                <a data-toggle="tooltip" data-placement="top" title='{__("Edit")}' href="{$system['system_url']}/admincp/pages/edit_category/{$row['category_id']}" class="btn btn-xs btn-primary">
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
            <form class="js_ajax-forms form-horizontal" data-url="admin/pages.php?do=add_category">
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
            <form class="js_ajax-forms form-horizontal" data-url="admin/pages.php?do=edit_category&id={$data['category_id']}">
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