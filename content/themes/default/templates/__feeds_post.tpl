{if !$standalone}<li>{/if}
    <!-- post -->
    <div class="post {if $boosted}boosted{/if}" data-id="{$post['post_id']}">

        {if $standalone && $pinned}
            <div class="pin-icon" data-toggle="tooltip" title="{__('Pinned Post')}">
                <i class="fa fa-bookmark"></i>
            </div>
        {/if}

        {if $standalone && $boosted}
            <div class="boosted-icon" data-toggle="tooltip" title="{__('Promoted')}">
                <i class="fa fa-bullhorn"></i>
            </div>
        {/if}

        <!-- post body -->
        <div class="post-body">
            
            {include file='__feeds_post.body.tpl' _post=$post _shared=false}

            <!-- post stats -->
            <div class="post-stats">
                <!-- likes -->
                <span class="text-clickable" data-toggle="modal" data-url="posts/who_likes.php?post_id={$post['post_id']}">
                    <i class="fa fa-thumbs-o-up"></i> 
                    <span class="js_post-likes-num">
                        {$post['likes']}
                    </span>
                </span>
                <!-- likes -->

                <span class="pull-right flip">
                    <!-- comments -->
                    <span class="text-clickable js_comments-toggle">
                        <i class="fa fa-comments"></i> {$post['comments']} {__("Comments")}
                    </span>
                    <!-- comments -->

                    <!-- shares -->
                    <span class="text-clickable ml10 {if $post['shares'] == 0}x-hidden{/if}" data-toggle="modal" data-url="posts/who_shares.php?post_id={$post['post_id']}">
                        <i class="fa fa-share"></i> {$post['shares']} {__("Shares")}
                    </span>
                    <!-- shares -->
                </span>
            </div>
            <!-- post stats -->

            <!-- post actions -->
            <div class="post-actions">
                {if $user->_logged_in}
                    <!-- like -->
                    <span class="text-clickable mr20 {if $post['i_like']}text-active js_unlike-post{else}js_like-post{/if}">
                        <i class="fa fa-thumbs-o-up"></i> <span>{__("Like")}</span>
                    </span>
                    <!-- like -->

                    <!-- comment -->
                    <span class="text-clickable js_comment mr20">
                        <i class="fa fa-comment-o"></i> <span>{__("Comment")}</span>
                    </span>
                    <!-- comment -->

                    <!-- share -->
                    {if $post['privacy'] == "public"}
                        <span class="text-clickable {if $system['social_share_enabled']}js_share-toggle{else}js_share{/if}" data-id="{$post['post_id']}">
                            <i class="fa fa-share"></i> <span>{__("Share")}</span>
                        </span>
                    {/if}
                    <!-- share -->
                {else}
                    <a href="{$system['system_url']}/signin">{__("Please log in to like, share and comment!")}</a>
                {/if}
            </div>
            <!-- post actions -->

        </div>
        <!-- post body -->

        <!-- post footer -->
        <div class="post-footer {if !$standalone}x-hidden{/if}">
            <!-- social sharing -->
            {include file='__feeds_post.social.tpl'}
            <!-- social sharing -->

            <!-- comments -->
            {include file='__feeds_post.comments.tpl'}
            <!-- comments -->
        </div>
        <!-- post footer -->

    </div>
    <!-- post -->
{if !$standalone}</li>{/if}