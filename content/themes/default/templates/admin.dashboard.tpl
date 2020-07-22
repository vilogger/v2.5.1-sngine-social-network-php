<div class="panel panel-default">
    <div class="panel-heading with-icon">
        <strong>{__("Dashboard")}</strong>
    </div>
    <div class="panel-body">
        <div id="admin-chart-dashboard" class="admin-chart mb20"></div>
        <div class="row">
            <div class="col-sm-4">
                <div class="stat-panel">
                    <div class="stat-cell">
                        <i class="fa fa-user bg-icon"></i>
                        <span class="text-xlg">{$insights['users']}</span><br>
                        <span class="text-lg">{__("Users")}</span><br>
                        <a href="{$system['system_url']}/admincp/users">{__("Manage Users")}</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="stat-panel">
                    <div class="stat-cell">
                        <i class="fa fa-male bg-icon"></i>
                        <span class="text-xlg">{$insights['users_males']}</span><br>
                        <span>{$insights['users_males_percent']}%</span><br>
                        <span class="text-lg">{__("Males")}</span><br>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="stat-panel">
                    <div class="stat-cell">
                        <i class="fa fa-female bg-icon"></i>
                        <span class="text-xlg">{$insights['users_females']}</span><br>
                        <span>{$insights['users_females_percent']}%</span><br>
                        <span class="text-lg">{__("Females")}</span><br>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="stat-panel danger">
                    <div class="stat-cell">
                        <i class="fa fa-minus-circle bg-icon"></i>
                        <span class="text-xlg">{$insights['banned']}</span><br>
                        <span class="text-lg">{__("Banned")}</span><br>
                        <a href="{$system['system_url']}/admincp/users/banned">{__("Manage Banned")}</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="stat-panel warning">
                    <div class="stat-cell">
                        <i class="fa fa-envelope bg-icon"></i>
                        <span class="text-xlg">{$insights['not_activated']}</span><br>
                        <span class="text-lg">{__("Not Activated")}</span><br>
                        <a href="{$system['system_url']}/admincp/users">{__("Manage Users")}</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="stat-panel info">
                    <div class="stat-cell">
                        <i class="fa fa-clock-o bg-icon"></i>
                        <span class="text-xlg">{$insights['online']}</span><br>
                        <span class="text-lg">{__("Online")}</span><br>
                        <a href="{$system['system_url']}/admincp/users/online">{__("Manage Online")}</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="stat-panel success">
                    <div class="stat-cell">
                        <i class="fa fa-newspaper-o bg-icon"></i>
                        <span class="text-xlg">{$insights['posts']}</span><br>
                        <span class="text-lg">{__("Posts")}</span><br>
                        <a href="{$system['system_url']}/admincp/reports">{__("Manage Reports")}</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="stat-panel success">
                    <div class="stat-cell">
                        <i class="fa fa-comments bg-icon"></i>
                        <span class="text-xlg">{$insights['comments']}</span><br>
                        <span class="text-lg">{__("Comments")}</span><br>
                        <a href="{$system['system_url']}/admincp/reports">{__("Manage Reports")}</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="stat-panel">
                    <div class="stat-cell">
                        <i class="fa fa-flag bg-icon"></i>
                        <span class="text-xlg">{$insights['pages']}</span><br>
                        <span class="text-lg">{__("Pages")}</span><br>
                        <a href="{$system['system_url']}/admincp/pages">{__("Manage Pages")}</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="stat-panel">
                    <div class="stat-cell">
                        <i class="fa fa-users bg-icon"></i>
                        <span class="text-xlg">{$insights['groups']}</span><br>
                        <span class="text-lg">{__("Groups")}</span><br>
                        <a href="{$system['system_url']}/admincp/groups">{__("Manage Groups")}</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="stat-panel">
                    <div class="stat-cell">
                        <i class="fa fa-calendar bg-icon"></i>
                        <span class="text-xlg">{$insights['events']}</span><br>
                        <span class="text-lg">{__("Events")}</span><br>
                        <a href="{$system['system_url']}/admincp/events">{__("Manage Events")}</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="stat-panel info">
                    <div class="stat-cell">
                        <i class="fa fa-comments-o bg-icon"></i>
                        <span class="text-xlg">{$insights['messages']}</span><br>
                        <span class="text-lg">{__("Messages")}</span><br>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="stat-panel info">
                    <div class="stat-cell">
                        <i class="fa fa-globe bg-icon"></i>
                        <span class="text-xlg">{$insights['notifications']}</span><br>
                        <span class="text-lg">{__("Notifications")}</span><br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>