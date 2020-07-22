{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="container mt20">
    <div class="row">
    	<div class="col-md-10 col-md-offset-1">

    		<div class="wizard-header">
    			<h3>
    				<b>{__("BUILD")}</b> {__("YOUR PROFILE")}<br>
    				<small>{__("This information will let us know more about you")}.</small>
    			</h3>
    		</div>
    		
    		<ul class="nav nav-pills nav-justified thumbnail js_wizard-steps">
                <li class="active">
                	<a href="#step-1">
                		<h4 class="list-group-item-heading">{__("Step 1")}</h4>
                		<p class="list-group-item-text">{__("Upload your photo")}</p>
                	</a>
                </li>
                <li class="disabled">
                	<a href="#step-2">
                		<h4 class="list-group-item-heading">{__("Step 2")}</h4>
                		<p class="list-group-item-text">{__("Update your info")}</p>
                	</a>
                </li>
                <li class="disabled">
                	<a href="#step-3">
                		<h4 class="list-group-item-heading">{__("Step 3")}</h4>
                		<p class="list-group-item-text">{__("Add Friends")}</p>
                	</a>
                </li>
            </ul>

            <div class="well js_wizard-content" id="step-1">
            	<div class="text-center">
            		<h3 class="mb5">{__("Welcome")} {$user->_data['user_firstname']}</h3>
	            	<p class="mb20">{__("Let's start with your photo")}</p>
            	</div>
            	
            	<!-- profile-avatar -->
            	<div class="relative" style="height: 160px;">
            		<div class="profile-avatar-wrapper static">
	            		<img src="{$user->_data['user_picture']}" alt="{$user->_data['user_firstname']} {$user->_data['user_lastname']}">
	            		<div class="profile-avatar-change">
	            			<i class="fa fa-camera js_x-uploader" data-handle="picture-user"></i>
	            		</div>
	            		<div class="profile-avatar-delete">
	            			<i class="fa fa-trash js_delete-picture" data-handle="picture-user" title='{__("Delete Picture")}'></i>
	            		</div>
	            		<div class="profile-avatar-change-loader">
	            			<div class="loader loader_medium"></div>
	            		</div>
	            	</div>
            	</div>
            	<!-- profile-avatar -->

            	<!-- buttons -->
            	<div class="clearfix mt20">
            		<button id="activate-step-2" class="btn btn-primary pull-right flip">{__("Next Step")}</button>
            	</div>
            	<!-- buttons -->
            </div>

            <div class="well js_wizard-content x-hidden" id="step-2">
            	<div class="text-center">
            		<h3 class="mb5">{__("Update your info")}</h3>
	            	<p class="mb20">{__("Share your information with our community")}</p>
            	</div>

            	<form class="js_ajax-forms" data-url="users/started.php">
            		<div class="form-group">
            			<label for="city">{__("Current City")}</label>
            			<input type="text" class="form-control js_geocomplete" name="city" id="city" value="{$user->_data['user_current_city']}">
            		</div>
            		<div class="form-group">
            			<label for="hometown">{__("Hometown")}</label>
            			<input type="text" class="form-control js_geocomplete" name="hometown" id="hometown" value="{$user->_data['user_hometown']}">
            		</div>

            		<div class="form-group">
            			<label for="work_title">{__("Work Title")}</label>
            			<input type="text" class="form-control" name="work_title" id="work_title" value="{$user->_data['user_work_title']}">
            		</div>
            		<div class="form-group">
            			<label for="work_place">{__("Work Place")}</label>
            			<input type="text" class="form-control" name="work_place" id="work_place" value="{$user->_data['user_work_place']}">
            		</div>

            		<div class="form-group">
            			<label for="edu_major">{__("Major")}</label>
            			<input type="text" class="form-control" name="edu_major" id="edu_major" value="{$user->_data['user_edu_major']}">
            		</div>
            		<div class="form-group">
            			<label for="edu_school">{__("School")}</label>
            			<input type="text" class="form-control" name="edu_school" id="edu_school" value="{$user->_data['user_edu_school']}">
            		</div>
            		<div class="form-group">
            			<label for="edu_class">{__("Class")}</label>
            			<input type="text" class="form-control" name="edu_class" id="edu_class" value="{$user->_data['user_edu_class']}">
            		</div>

            		<!-- success -->
            		<div class="alert alert-success mb0 mt10 x-hidden" role="alert"></div>
            		<!-- success -->

            		<!-- error -->
            		<div class="alert alert-danger mb0 mt10 x-hidden" role="alert"></div>
            		<!-- error -->

            		<!-- buttons -->
            		<div class="clearfix mt20">
            			<div class="pull-right flip">
            				<button type="submit" class="btn btn-success">{__("Save Changes")}</button>
            				<button type="button" class="btn btn-primary" id="activate-step-3">{__("Next Step")}</button>
            			</div>
            		</div>
            		<!-- buttons -->
            	</form>
            </div>

            <div class="well js_wizard-content x-hidden" id="step-3">
            	<div class="text-center">
            		<h3 class="mb5">{__("Add Friends")}</h3>
            		<p class="mb20">{__("Get latest activities from our popular users")}</p>
            	</div>
            	
            	<!-- new people -->
            	<ul class="row">
                    {foreach $user->_data['new_people'] as $_user}
            		{include file='__feeds_user.tpl' _connection="add" _parent="profile"}
            		{/foreach}
            	</ul>
            	<!-- new people -->

            	<!-- buttons -->
            	<div class="clearfix mt20">
            		<a href="{$system['system_url']}/started/finished" class="btn btn-danger pull-right flip">{__("Finish")}</a>
            	</div>
            	<!-- buttons -->
            </div>          

        </div>
    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}

<script type="text/javascript">
    $(function() {

        var wizard_steps = $('.js_wizard-steps li a');
        var wizard_content = $('.js_wizard-content');

        wizard_content.hide();

        wizard_steps.click(function(e) {
            e.preventDefault();
            var $target = $($(this).attr('href'));
            var $item = $(this).closest('li');
            if(!$item.hasClass('disabled')) {
                wizard_steps.closest('li').removeClass('active');
                $item.addClass('active');
                wizard_content.hide();
                $target.show();
            }
        });

        $('.js_wizard-steps li.active a').trigger('click');

        $('#activate-step-2').on('click', function(e) {
            $('.js_wizard-steps li:eq(1)').removeClass('disabled');
            $('.js_wizard-steps li a[href="#step-2"]').trigger('click');
        });

        $('#activate-step-3').on('click', function(e) {
            $('.js_wizard-steps li:eq(2)').removeClass('disabled');
            $('.js_wizard-steps li a[href="#step-3"]').trigger('click');
        });

    });
</script>