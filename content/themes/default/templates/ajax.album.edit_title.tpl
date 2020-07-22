<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h5 class="modal-title">{__("Edit Album")}</h5>
</div>
<form class="js_ajax-forms" data-url="albums/action.php">
    <div class="modal-body">
        <div class="form-group">
            <label>{__("Title")}</label>
            <input type="hidden" name="do" value="edit_album">
            <input type="hidden" name="id" value="{$album['album_id']}">
            <input name="title" type="text" value="{$album['title']}" class="form-control" required autofocus>
        </div>
        <!-- error -->
        <div class="alert alert-danger mb0 mt10 x-hidden" role="alert"></div>
        <!-- error -->
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-primary">{__("Save")}</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">{__("Cancel")}</button>
    </div>
</form>