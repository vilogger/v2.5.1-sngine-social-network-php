{if $system['social_share_enabled']}
    <div class="post-sharing x-hidden">
        <span class="btn btn-sm btn-default js_share" data-id="{$post['post_id']}">
            <i class="fa fa-share-square-o icon"></i>
        </span>
        <a href="http://www.facebook.com/sharer.php?u={$system['system_url']}/posts/{$post['post_id']}" class="btn btn-sm btn-social-icon btn-facebook" target="_blank">
            <i class="fa fa-facebook"></i>
        </a>
        <a href="https://twitter.com/intent/tweet?url={$system['system_url']}/posts/{$post['post_id']}" class="btn btn-sm btn-social-icon btn-twitter" target="_blank">
            <i class="fa fa-twitter"></i>
        </a>
        <a href="https://plus.google.com/share?url={$system['system_url']}/posts/{$post['post_id']}" class="btn btn-sm btn-social-icon btn-google" target="_blank">
            <i class="fa fa-google"></i>
        </a>
        <a href="http://vk.com/share.php?url={$system['system_url']}/posts/{$post['post_id']}" class="btn btn-sm btn-social-icon btn-vk" target="_blank">
            <i class="fa fa-vk"></i>
        </a>
        <a href="http://www.linkedin.com/shareArticle?mini=true&url={$system['system_url']}/posts/{$post['post_id']}" class="btn btn-sm btn-social-icon btn-linkedin" target="_blank">
            <i class="fa fa-linkedin"></i>
        </a>
        <a href="http://www.tumblr.com/share/link?url={$system['system_url']}/posts/{$post['post_id']}" class="btn btn-sm btn-social-icon btn-tumblr" target="_blank">
            <i class="fa fa-tumblr"></i>
        </a>
        <a href="http://reddit.com/submit?url={$system['system_url']}/posts/{$post['post_id']}" class="btn btn-sm btn-social-icon btn-reddit" target="_blank">
            <i class="fa fa-reddit"></i>
        </a>
        <a href="http://pinterest.com/pin/create/button/?url=http://www.ok.ru/dk?st.cmd=addShare&st.s=1&st._surl={$system['system_url']}/posts/{$post['post_id']}" class="btn btn-sm btn-social-icon btn-pinterest" target="_blank">
            <i class="fa fa-pinterest"></i>
        </a>
        <a href="http://www.ok.ru/dk?st.cmd=addShare&st.s=1&st._surl={$system['system_url']}/posts/{$post['post_id']}" class="btn btn-sm btn-social-icon btn-odnoklassniki" target="_blank">
            <i class="fa fa-odnoklassniki"></i>
        </a>
    </div>
{/if}