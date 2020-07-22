{if !($_tpl == "profile_pages" || $_tpl == "list")}
    <li class="col-md-3 col-sm-6">
        <div class="box">
            <a class="box-picture" href="{$system['system_url']}/pages/{$_page['page_name']}" style="background-image:url('{$_page['page_picture']}');"></a>
            <div class="box-content">
                <a href="{$system['system_url']}/pages/{$_page['page_name']}" class="title">
                    {$_page['page_title']}
                    {if $_page['page_verified']}
                    <i data-toggle="tooltip" data-placement="top" title='{__("Verified Page")}' class="fa fa-check-circle fa-fw verified-badge"></i>
                    {/if}
                </a>
                <div class="text clearfix">
                    <div class="pull-right flip">
                        {if $_page['i_like']}
                            <button type="button" class="btn btn-default js_unlike-page" data-id="{$_page['page_id']}">
                                <i class="fa fa-thumbs-o-up"></i>
                                {__("Unlike")}
                            </button>
                        {else}
                            <button type="button" class="btn btn-primary js_like-page" data-id="{$_page['page_id']}">
                                <i class="fa fa-thumbs-o-up"></i>
                                {__("Like")}
                            </button>
                        {/if}
                    </div>
                    <div>
                        {$_page['page_likes']} {__("Likes")}
                    </div>
                </div>
            </div>
        </div>
    </li>
{else}
    {if $_tpl == "profile_pages"}<li class="col-sm-12 col-md-6"><div class="data-container-wrapper">{else}<li class="feeds-item">{/if}
        <div class="data-container {if $_small}small{/if}">
            <a href="{$system['system_url']}/pages/{$_page['page_name']}{if $_search}?ref=qs{/if}">
                <img class="data-avatar" src="{$_page['page_picture']}" alt="{$_page['page_title']}">
            </a>
            <div class="data-content">
                <div class="pull-right flip">
                    {if $_page['i_like']}
                    <button type="button" class="btn btn-default js_unlike-page" data-id="{$_page['page_id']}">
                        <i class="fa fa-thumbs-o-up"></i>
                        {__("Unlike")}
                    </button>
                    {else}
                    <button type="button" class="btn btn-primary js_like-page" data-id="{$_page['page_id']}">
                        <i class="fa fa-thumbs-o-up"></i>
                        {__("Like")}
                    </button>
                    {/if}
                </div>
                <div>
                    <span class="name js_user-popover" data-uid="{$_page['page_id']}" data-type="page">
                        <a href="{$system['system_url']}/pages/{$_page['page_name']}{if $_search}?ref=qs{/if}">{$_page['page_title']}</a>
                    </span>
                    {if $_page['page_verified']}
                    <i data-toggle="tooltip" data-placement="top" title='{__("Verified Page")}' class="fa fa-check-circle fa-fw verified-badge"></i>
                    {/if}
                    <div>{$_page['page_likes']} {__("Likes")}</div>
                </div>
            </div>
        </div>
    {if $_tpl == "profile_pages"}</div></li>{else}</li>{/if}
{/if}