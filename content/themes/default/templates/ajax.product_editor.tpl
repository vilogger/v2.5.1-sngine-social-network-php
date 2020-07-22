<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h5 class="modal-title">{__("Edit Product")}</h5>
</div>
<form class="js_ajax-forms" data-url="posts/edit.php">
    <div class="modal-body">
        <div class="form-group">
            <label>{__("Product Name")}</label>
            <input type="hidden" name="handle" value="product">
            <input type="hidden" name="id" value="{$post['post_id']}">
            <input name="name" type="text" value="{$post['product']['name']}" class="form-control" required autofocus>
        </div>
        <div class="form-group">
            <label>{__("Price")}</label>
            <input name="price" type="text" value="{$post['product']['price']}" class="form-control" required>
        </div>
        <div class="form-group">
            <label>{__("Category")}</label>
            <select name="category_id" class="form-control">
                {foreach $market_categories as $category}
                    <option {if $post['product']['category_id'] == $category['category_id']}selected{/if} value="{$category['category_id']}">{__($category['category_name'])}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label>{__("Location")}</label>
            <input name="location" type="text" value="{$post['product']['location']}" class="form-control js_geocomplete">
        </div>
        <div class="form-group">
            <label>{__("Description")}</label>
            <textarea name="message" rows="5" dir="auto" class="form-control">{$post['text_plain']}</textarea>
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