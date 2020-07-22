{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page content -->
<div class="container mt20">
            
    <div class="panel">
        <div class="panel-body">
            <div class="wizard-header">
                <h3>
                    <b>{__("UPGRADE")}</b> {__("YOUR PROFILE")}<br>
                    <small>{__("Choose the Plan That's Right for You")}.</small>
                </h3>
            </div>
            <div class="row">
                {foreach $packages as $package}
                    <!-- package -->
                    <div class="col-md-{if $packages_count >= 4}3{elseif $packages_count == 3}4{elseif $packages_count <= 2}6{/if} text-center">
                        <div class="panel panel-default panel-pricing">
                            <div class="panel-heading">
                                <img src="{$package['icon']}">
                                <h3>{$package['name']}</h3>
                            </div>
                            <div class="panel-body text-center">
                                <div class="price" style="color: {$package['color']}">{$system['system_currency_symbol']}{$package['price']}</div>
                                <div class="period">
                                    {if $package['period'] == "life"}
                                        {__("Life Time")}
                                    {else}
                                        {__("per")} 
                                        {if $package['period_num'] != '1'}{$package['period_num']}{/if} {__($package['period']|ucfirst)}
                                    {/if}
                                </div>
                                <div>
                                    
                                </div>
                            </div>
                            <ul class="list-group text-center">
                                <li class="list-group-item"><i class="fa fa-check green"></i> {__("Featured member")}</li>
                                <li class="list-group-item"><i class="fa fa-check green"></i> {__("Verified badge")}</li>
                                <li class="list-group-item">
                                    {if !$package['boost_posts_enabled']}
                                        <i class="fa fa-times red"></i> {__("Posts promotion")}
                                    {else}
                                        <i class="fa fa-check green"></i> {__("Boost up to")} {$package['boost_posts']} {__("Posts")}
                                    {/if}
                                </li>
                                <li class="list-group-item">
                                    {if !$package['boost_pages_enabled']}
                                        <i class="fa fa-times red"></i> {__("Pages promotion")}
                                    {else}
                                        <i class="fa fa-check green"></i> {__("Boost up to")} {$package['boost_pages']} {__("Pages")}
                                    {/if}
                                </li>
                            </ul>
                            <div class="panel-footer">
                                {if $user->_logged_in}
                                    <button class="btn btn-lg btn-block btn-info" data-toggle="modal" data-url="#payment" data-options='{literal}{{/literal}"id": {$package["package_id"]}, "price": "{$package["price"]}", "name": "{$package["name"]}", "img": "{$package["icon"]}"{literal}}{/literal}'>
                                        {if !$user->_data['user_subscribed']}
                                            {__("Buy Now")}
                                        {else}
                                            {__("Upgrade Now")}
                                        {/if}
                                    </button>
                                {else}
                                    <a class="btn btn-lg btn-block btn-info" href="{$system['system_url']}/signin">
                                        {__("Buy Now")}
                                    </a>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <!-- /package -->
                {/foreach}
            </div>
        </div>            
    </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}