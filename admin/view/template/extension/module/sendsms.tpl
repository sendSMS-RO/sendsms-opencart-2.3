<?= $header ?><?= $column_left ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-first-module" data-toggle="tooltip" title="<?= $button_save ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?= $cancel ?>" data-toggle="tooltip" title="<?= $button_cancel ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
                <a href="<?= $about_link ?>" data-toggle="tooltip" title="<?= $about_text ?>" class="btn btn-default"><?= $about_text ?></a>
                <a href="<?= $history_link ?>" data-toggle="tooltip" title="<?= $history_text ?>" class="btn btn-default"><?= $history_text ?></a>
                <a href="<?= $test_link ?>" data-toggle="tooltip" title="<?= $test_text ?>" class="btn btn-default"><?= $test_text ?></a>
                <a href="<?= $campaign_link ?>" data-toggle="tooltip" title="<?= $campaign_text ?>" class="btn btn-default"><?= $campaign_text ?></a>
            </div>
            <h1><?= $heading_title ?></h1>
            <ul class="breadcrumb">
                <?php foreach($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?= $breadcrumb['href'] ?>"><?= $breadcrumb['text'] ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if($error_warning){ ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?= $error_warning ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?= $text_edit ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?= $action ?>" method="post" enctype="multipart/form-data" id="form-first-module" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?= $entry_status ?></label>
                        <div class="col-sm-10">
                            <select name="module_sendsms_status" id="input-status" class="form-control">
                                <?php if($module_sendsms_status){ ?>
                                    <option value="1" selected="selected"><?= $text_enabled ?></option>
                                    <option value="0"><?= $text_disabled ?></option>
                                {% else %}
                                <?php }else{ ?>
                                    <option value="1"><?= $text_enabled ?></option>
                                    <option value="0" selected="selected"><?= $text_disabled ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sendsms-username"><?= $entry_username ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="module_sendsms_username" id="input-sendsms-username" class="form-control" value="<?= $sendsms_username ?>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sendsms-password"><?= $entry_password ?></label>
                        <div class="col-sm-10">
                            <input type="password" name="module_sendsms_password" id="input-sendsms-password" class="form-control" value="<?= $sendsms_password ?>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sendsms-label"><?= $entry_label ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="module_sendsms_label" id="input-sendsms-label" class="form-control" value="<?= $sendsms_label ?>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sendsms-simulation"><?= $entry_simulation ?></label>
                        <div class="col-sm-10">
                            <select name="module_sendsms_simulation" class="form-control" id="input-sendsms-simulation">
                                <?php if($sendsms_simulation == 1) { ?>
                                    <option value="0"><?= $entry_no ?></option>
                                    <option value="1" selected><?= $entry_yes ?></option>
                                {% else %}
                                <?php }else { ?>
                                    <option value="0" selected><?= $entry_no ?></option>
                                    <option value="1"><?= $entry_yes ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sendsms-simulation-phone"><?= $entry_simulation_phone ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="module_sendsms_simulation_phone" id="input-sendsms-simulation-phone" class="form-control" value="<?= $sendsms_simulation_phone ?>" />
                        </div>
                    </div>
                    <?php foreach($statuses as $status){ ?>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-sendsms-message-<?= $status['order_status_id'] ?>"><?= $entry_message ?>: <?= $status['name'] ?></label>
                            <div class="col-sm-10">
                                <textarea name="module_sendsms_message_<?= $status['order_status_id'] ?>" id="input-sendsms-message-<?= $status['order_status_id'] ?>" rows="5" class="form-control sendsms_char_count" maxlength="160"><?= ${'sendsms_message_' . $status['order_status_id']} ?></textarea>
                                <p>160 <?= $entry_characters_left ?></p>
                                <span class="help-block"><?= $entry_available_vars ?>: {billing_first_name}, {billing_last_name}, {shipping_first_name}, {shipping_last_name}, {order_number}, {order_date}, {order_total}</span>
                            </div>
                        </div>
                    <?php } ?>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var sendsms_char_count = document.getElementsByClassName('sendsms_char_count');
    for (var i = 0; i < sendsms_char_count.length; i++) {
        var sendsms_element = sendsms_char_count[i];
        sendsms_element.onkeyup = function() {
            var text_length = this.value.length;
            var text_remaining = 160 - text_length;
            this.nextElementSibling.innerHTML = text_remaining + ' <?= $entry_characters_left ?>';
        };
        var text_length = sendsms_element.value.length;
        var text_remaining = 160 - text_length;
        sendsms_element.nextElementSibling.innerHTML = text_remaining + ' <?= $entry_characters_left ?>';
    }
</script>
<?= $footer ?>