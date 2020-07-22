<div class="panel panel-default">
    <div class="panel-heading with-icon">
        <i class="fa fa-exchange pr5 panel-icon"></i>
        <strong>{__("Affiliates")}</strong>
        {if $sub_view == "payments"} &rsaquo; <strong>{__("Payment Requests")}</strong>{/if}
    </div>
    {if $sub_view == ""}
        <div class="panel-body">
            <form class="js_ajax-forms form-horizontal" data-url="admin/settings.php?edit=affiliates">
                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("Affiliates Enabled")}
                    </label>
                    <div class="col-sm-9">
                        <label class="switch" for="affiliates_enabled">
                            <input type="checkbox" name="affiliates_enabled" id="affiliates_enabled" {if $system['affiliates_enabled']}checked{/if}>
                            <span class="slider round"></span>
                        </label>
                        <span class="help-block">
                            {__("Enable or Disable the affiliates system")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label text-left">
                        {__("User Earn Money When")}
                    </label>
                    <div class="col-sm-9">
                        <select class="form-control" name="affiliate_type">
                            <option {if $system['affiliate_type'] == "registration"}selected{/if} value="registration">
                                {__("New User Registered")}
                            </option>
                            <option {if $system['affiliate_type'] == "packages"}selected{/if} value="packages">
                                {__("New User Registered & Bought Pro Package")}
                            </option>
                        </select>
                        <span class="help-block">
                            {__("If registration type is 'Subscriptions Only' User will earn money from new registration only")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Payment Method")}
                    </label>
                    <div class="col-sm-9">
                        <div class="radio radio-primary radio-inline">
                            <input type="radio" name="affiliate_payment_method" id="method_paypal" value="paypal" {if $system['affiliate_payment_method'] == "paypal"}checked{/if}>
                            <label for="method_paypal">{__("Paypal")}</label>
                        </div>
                        <div class="radio radio-primary radio-inline">
                            <input type="radio" name="affiliate_payment_method" id="method_skrill" value="skrill" {if $system['affiliate_payment_method'] == "skrill"}checked{/if}>
                            <label for="method_skrill">{__("Skrill")}</label>
                        </div>
                        <div class="radio radio-primary radio-inline">
                            <input type="radio" name="affiliate_payment_method" id="method_both" value="both" {if $system['affiliate_payment_method'] == "both"}checked{/if}>
                            <label for="method_both">{__("Both")}</label>
                        </div>
                        <span class="help-block">
                            {__("Users can send withdrawal requests via any of these methods")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Minimum Withdrawal Request")} ({$system['system_currency']})
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="affiliates_min_withdrawal" value="{$system['affiliates_min_withdrawal']}">
                        <span class="help-block">
                            {__("The minimum amount of money so user can send a withdrawal request")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        {__("Price/Referred")} ({$system['system_currency']})
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="affiliates_per_user" value="{$system['affiliates_per_user']}">
                        <span class="help-block">
                            {__("The price for each new referred user")}
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
                    </div>
                </div>

                <!-- success -->
                <div class="alert alert-success mb0 mt10 x-hidden" role="alert"></div>
                <!-- success -->

                <!-- error -->
                <div class="alert alert-danger mb0 mt10 x-hidden" role="alert"></div>
                <!-- error -->
            </form>
        </div>
    {elseif $sub_view == "payments"}
        <div class="panel-body">
            <div class="alert alert-warning">
                <div class="icon">
                    <i class="fa fa-paypal fa-2x"></i>
                </div>
                <div class="text">
                    <strong>{__("Payment Requests")}</strong><br>
                    {__("You will need to make the payments from your Paypal/Skrill account")}.<br>
                    {__("After making the payment you can mark the payment request as paid")}.
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                    <thead>
                        <tr>
                            <th>{__("ID")}</th>
                            <th>{__("User")}</th>
                            <th>{__("Email")}</th>
                            <th>{__("Amount")}</th>
                            <th>{__("Method")}</th>
                            <th>{__("Referrals")}</th>
                            <th>{__("Actions")}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $rows as $row}
                        <tr>
                            <td>{$row['payment_id']}</td>
                            <td>
                                <a target="_blank" href="{$system['system_url']}/{$row['user_name']}">
                                    <img class="tbl-image" src="{$row['user_picture']}">
                                    {$row['user_firstname']} {$row['user_lastname']}
                                </a>
                            </td>
                            <td>{$row['email']}</td>
                            <td>{$system['system_currency_symbol']}{$row['amount']|number_format:2}</td>
                            <td>
                                <label class="label {if $row['method'] == 'paypal'}label-info{else}label-danger{/if}">
                                    {$row['method']|ucfirst}
                                </label>
                            </td>
                            <td>
                                <span class="text-link" data-toggle="modal" data-url="admin/referrals.php?user_id={$row['user_id']}">
                                    {__("Show")}
                                </span>
                            </td>
                            <td>
                                <button data-toggle="tooltip" data-placement="top" title='{__("Mark as Paid")}' class="btn btn-xs btn-success js_admin-withdraw" data-handle="approve" data-id="{$row['payment_id']}">
                                        <i class="fa fa-check"></i>
                                </button>
                                <button data-toggle="tooltip" data-placement="top" title='{__("Decline")}' class="btn btn-xs btn-danger js_admin-withdraw" data-handle="decline" data-id="{$row['payment_id']}">
                                    <i class="fa fa-times"></i>
                                </button>
                            </td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    {/if}
</div>