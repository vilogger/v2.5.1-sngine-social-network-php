<div class="{if $_iteration == 1}col-sm-8 col-md-6{else}col-sm-4 col-md-3{/if}">
    <a href="{$system['system_url']}/blogs/{$article['post_id']}/{$article['article']['title_url']}" class="blog-container {if $_iteration == 1}primary{/if}">
        <div class="blog-image">
            <img class="img-responsive" src="{$article['article']['parsed_cover']}">
        </div>
        <div class="blog-content">
            <h3>{$article['article']['title']}</h3>
            <div class="text">{$article['article']['text_snippet']|truncate:400}</div>
            <div>
                <div class="post-avatar">
                    <div class="post-avatar-picture small rounded" style="background-image:url('{$article['post_author_picture']}');">
                    </div>
                </div>
                <div class="post-meta">
                    <span class="text-link">
                        {$article['post_author_name']}
                    </span>
                    <div class="post-time">
                        <span class="js_moment" data-time="{$article['time']}">{$article['time']}</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="blog-more">
            <span>{__("More")}</span>
        </div>
    </a>
</div>