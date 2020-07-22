{if $_registration}
	{foreach $_custom_fields as $custom_field}
        <div class="form-group">
            {if $custom_field['type'] == "textbox"}
                <input name="fld_{$custom_field['field_id']}" type="text" class="form-control" placeholder="{__($custom_field['label'])}">
            {elseif $custom_field['type'] == "textarea"}
                <textarea name="fld_{$custom_field['field_id']}" class="form-control" placeholder="{__($custom_field['label'])}"></textarea>
            {elseif $custom_field['type'] == "selectbox"}
                <label>{__($custom_field['label'])}</label>
                <select name="fld_{$custom_field['field_id']}" class="form-control">
                	<option selected value="none">{__("Select")} {__($custom_field['label'])}</option>
                    {foreach $custom_field['options'] as $id => $value}
                        <option value="{$id}">{$value}</option>
                    {/foreach}
                </select>
            {/if}
        </div>
    {/foreach}
{else}
	{foreach $_custom_fields as $custom_field}
	    <div class="form-group">
	        <label class="col-sm-3 control-label">
	            {__($custom_field['label'])}
	        </label>
	        <div class="col-sm-9">
	            {if $custom_field['type'] == "textbox"}
	                <input type="text" name="fld_{$custom_field['field_id']}" class="form-control" value="{$custom_field['value']}">
	            {elseif $custom_field['type'] == "textarea"}
	                <textarea name="fld_{$custom_field['field_id']}" class="form-control">{$custom_field['value']}</textarea>
	            {elseif $custom_field['type'] == "selectbox"}
	                <select name="fld_{$custom_field['field_id']}" class="form-control">
	                    <option {if $custom_field['value'] == ""}selected{/if} value="none">{__("Select")} {__($custom_field['label'])}</option>
	                    {foreach $custom_field['options'] as $id => $value}
	                        <option {if $custom_field['value'] == $id}selected{/if} value="{$id}">{$value}</option>
	                    {/foreach}
	                </select>
	            {/if}
	            <span class="help-block">
                    {$custom_field['description']}
                </span>
	        </div>
	    </div>
	{/foreach}
{/if}