{assign "id" uniqid()}

<div class="emoji-menu">
	<div class="tab-content">
		<div class="tab-pane active" id="tab-emojis-{$id}">
			<div class="js_scroller" data-slimScroll-height="180">
				{foreach from=$user->get_emojis() item=emoji}
					<div class="item">
						<i data-emoji="{$emoji['pattern']}" class="js_emoji twa twa-2x twa-{$emoji['class']}"></i>
					</div>
				{/foreach}
			</div>
	    </div>

	    <div class="tab-pane" id="tab-stickers-{$id}">
			<div class="js_scroller" data-slimScroll-height="180">
				{foreach from=$user->get_stickers() item=sticker}
					<div class="item">
						<img data-emoji=":STK-{$sticker['sticker_id']}:" src="{$system['system_uploads']}/{$sticker['image']}" class="js_emoji">
					</div>
				{/foreach}
			</div>
	    </div>
	</div>

    <ul class="nav nav-tabs">
		<li class="active">
			<a href="#tab-emojis-{$id}" data-toggle="tab">
				<i class="fa fa-smile-o fa-fw"></i> {__("Emojis")}
			</a>
		</li>
		<li>
			<a href="#tab-stickers-{$id}" data-toggle="tab">
				<i class="fa fa-hand-peace-o fa-fw"></i> {__("Stickers")}
			</a>
		</li>
    </ul>
</div>