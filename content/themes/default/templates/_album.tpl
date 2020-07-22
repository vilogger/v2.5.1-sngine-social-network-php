<!-- album buttons -->
{if $album['manage_album'] && $album['can_delete']}
    <div class="clearfix">
        <div class="pull-right flip">
            <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-url="albums/modal.php?do=edit_title&id={$album['album_id']}">
                    <i class="fa fa-pencil"></i> {__("Edit Album")}
                </button>
                {if $system['photos_enabled']}
                    <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-url="albums/modal.php?do=add_photos&id={$album['album_id']}">
                        <i class="fa fa-plus-circle"></i> {__("Add Photos")}
                    </button>
                {/if}
            </div>
            <button type="button" class="btn btn-danger btn-sm js_delete-album" data-id="{$album['album_id']}">
                <i class="fa fa-trash-o"></i> {__("Delete Album")}
            </button>
        </div>
    </div>
{/if}
<!-- album buttons -->

<!-- album title & meta -->
<div class="album-title">
    {$album['title']}
</div>
<div class="album-meta">
    {if $album['privacy'] == "me"}
        {__("Shared with")} <i class="fa fa-lock" data-toggle="tooltip" data-placement="top" title='{__("Shared with")}: {__("Only Me")}'></i>
    {elseif $album['privacy'] == "friends"}
        {__("Shared with")} <i class="fa fa-users" data-toggle="tooltip" data-placement="top" title='{__("Shared with")}: {__("Friends")}'></i>
    {elseif $album['privacy'] == "public"}
        {__("Shared with")} <i class="fa fa-globe" data-toggle="tooltip" data-placement="top" title='{__("Shared with")}: {__("Public")}'></i>
    {elseif $album['privacy'] == "custom"}
        {__("Shared with")} <i class="fa fa-cog" data-toggle="tooltip" data-placement="top" title='{__("Shared with")} {__("Custom People")}'></i>
    {/if}
</div>
<!-- album title & meta -->

<!-- photos -->
{if count($album['photos']) > 0}
    <ul class="row">
        {foreach $album['photos'] as $photo}
        {include file='__feeds_photo.tpl' _context="album" _manage=$album['manage_album']}
        {/foreach}
    </ul>
    {if count($album['photos']) >= $system['max_results_even']}
    <!-- see-more -->
    <div class="alert alert-info see-more js_see-more" data-get="photos" data-id="{$album['album_id']}" data-type='album'>
        <span>{__("See More")}</span>
        <div class="loader loader_small x-hidden"></div>
    </div>
    <!-- see-more -->
    {/if}
{else}
    <p class="text-center text-muted mt10">
    {__("This album is empty")}
    </p>
{/if}
<!-- photos -->