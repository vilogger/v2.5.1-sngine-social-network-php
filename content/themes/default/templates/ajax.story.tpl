<div class="modal-body plr0 ptb0">
    <div class="x-form publisher mini">

        <!-- publisher close -->
        <button type="button" class="close mr10 pull-right flip" data-dismiss="modal" aria-hidden="true">×</button>
        <!-- publisher close -->

        <!-- publisher tabs -->
        <ul class="publisher-tabs clearfix">
            <li>
                <span class="active">
                    <i class="fa fa-picture-o fa-fw"></i> {__("Create a Story")}
                </span>
            </li>
        </ul>
        <!-- publisher tabs -->

        <!-- post message -->
        <div class="relative">
            <textarea dir="auto" class="js_mention" placeholder='{__("What is on your mind?")}'></textarea>
        </div>
        <!-- post message -->

        <!-- post attachments -->
        <div class="publisher-attachments attachments clearfix x-hidden">
            <ul></ul>
        </div>
        <!-- post attachments -->

        <!-- publisher-footer -->
        <div class="publisher-footer clearfix">
            <!-- publisher-tools -->
            <ul class="publisher-tools">
                {if $system['photos_enabled']}
                    <li data-toggle="tooltip" data-placement="top" title='{__("Add Photos")}'>
                        <span class="publisher-tools-attach js_publisher-photos">
                            <i class="fa fa-camera fa-fw js_x-uploader" data-handle="publisher-mini" data-multiple="true"></i>
                        </span>
                    </li>
                {/if}
            </ul>
            <!-- publisher-tools -->

            <!-- publisher-buttons -->
            <div class="pull-right flip mt5 mr10">
                <button type="button" class="btn btn-primary js_story-publish">{__("Publish Story")}</button>
            </div>
            <!-- publisher-buttons -->
        </div>
        <!-- publisher-footer -->
    </div>
</div>