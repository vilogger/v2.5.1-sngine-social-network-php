<div class="post-comments">

    {if $_is_photo}

        <!-- previous comments -->
        {if $photo['comments'] >= $system['min_results']}
            <div class="pb10 text-center js_see-more" data-get="photo_comments" data-id="{$photo['photo_id']}" data-remove="true">
                <span class="text-link">
                    <i class="fa fa-comment-o"></i>
                    {__("View previous comments")}
                </span>
                <div class="loader loader_small x-hidden"></div>
            </div>
        {/if}
        <!-- previous comments -->

        <!-- comments -->
        <ul class="js_comments">
            {if $photo['comments'] > 0}
                {foreach $photo['photo_comments'] as $comment}
                {include file='__feeds_comment.tpl' _comment=$comment}
                {/foreach}
            {/if}
        </ul>
        <!-- comments -->

        <!-- post a comment -->
        {if $user->_logged_in}
            {include file='__feeds_comment.form.tpl' _handle='photo' _id=$photo['photo_id']}
        {/if}
        <!-- post a comment -->

    {else}

        <!-- previous comments -->
        {if $post['comments'] >= $system['min_results']}
            <div class="pb10 text-center js_see-more" data-get="post_comments" data-id="{$post['post_id']}" data-remove="true">
                <span class="text-link">
                    <i class="fa fa-comment-o"></i>
                    {__("View previous comments")}
                </span>
                <div class="loader loader_small x-hidden"></div>
            </div>
        {/if}
        <!-- previous comments -->

        <!-- comments -->
        <ul class="js_comments">
            {if $post['comments'] > 0}
                {foreach $post['post_comments'] as $comment}
                {include file='__feeds_comment.tpl' _comment=$comment}
                {/foreach}
            {/if}
        </ul>
        <!-- comments -->

        <!-- post a comment -->
        {if $user->_logged_in}
            {include file='__feeds_comment.form.tpl' _handle='post' _id=$post['post_id']}
        {/if}
        <!-- post a comment -->

    {/if}

</div>