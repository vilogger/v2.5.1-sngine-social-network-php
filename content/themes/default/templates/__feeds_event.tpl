{if !($_tpl == "profile_events" || $_tpl == "list")}
    <li class="col-md-3 col-sm-6">
        <div class="box">
            <a class="box-picture" href="{$system['system_url']}/events/{$_event['event_id']}" style="background-image:url('{$_event['event_picture']}');"></a>
            <div class="box-content">
                <a href="{$system['system_url']}/events/{$_event['event_id']}" class="title">
                    {$_event['event_title']}
                </a>
                <div class="text clearfix">
                    <div class="pull-right flip">
                        {if $_event['i_joined']['is_interested']}
                            <button type="button" class="btn btn-default js_uninterest-event" data-id="{$_event['event_id']}">
                                <i class="fa fa-check"></i> {__("Interested")}
                            </button>
                        {else}
                            <button type="button" class="btn btn-primary js_interest-event" data-id="{$_event['event_id']}">
                                <i class="fa fa-star"></i> {__("Interested")}
                            </button>
                        {/if}
                    </div>
                    <div>
                        {$_event['event_interested']} {__("Interested")}
                    </div>
                </div>
            </div>
        </div>
    </li>
{else}
    {if $_tpl == "profile_events"}<li class="col-sm-12 col-md-6"><div class="data-container-wrapper">{else}<li class="feeds-item">{/if}
        <div class="data-container {if $_small}small{/if}">
            <a href="{$system['system_url']}/events/{$_event['event_id']}{if $_search}?ref=qs{/if}">
                <img class="data-avatar" src="{$_event['event_picture']}" alt="{$_event['event_title']}">
            </a>
            <div class="data-content">
                <div class="pull-right flip">
                    {if $_tpl != "list"}
                        {if $_event['i_joined']['is_going']}
                            <button type="button" class="btn btn-default js_ungo-event" data-id="{$_event['event_id']}">
                                <i class="fa fa-check"></i> {__("Going")}
                            </button>
                        {else}
                            <button type="button" class="btn btn-success js_go-event" data-id="{$_event['event_id']}">
                                <i class="fa fa-calendar-check-o"></i> {__("Going")}
                            </button>
                        {/if}
                    {/if}
                    {if $_event['i_joined']['is_interested']}
                        <button type="button" class="btn btn-default js_uninterest-event" data-id="{$_event['event_id']}">
                            <i class="fa fa-check"></i> {__("Interested")}
                        </button>
                    {else}
                        <button type="button" class="btn btn-primary js_interest-event" data-id="{$_event['event_id']}">
                            <i class="fa fa-star"></i> {__("Interested")}
                        </button>
                    {/if}
                </div>
                <div>
                    <span class="name">
                        <a href="{$system['system_url']}/events/{$_event['event_id']}{if $_search}?ref=qs{/if}">{$_event['event_title']}</a>
                    </span>
                    <div>{$_event['event_interested']} {__("Interested")}</div>
                </div>
            </div>
        </div>
    {if $_tpl == "profile_events"}</div></li>{else}</li>{/if}
{/if}