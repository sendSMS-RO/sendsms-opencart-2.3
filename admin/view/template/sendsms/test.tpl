 <?= $header ?> <?= $column_left ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-first-module" data-toggle="tooltip" title=" <?= $button_save ?>" class="btn btn-primary"><i class="fa fa-paper-plane"></i></button>
                <a href=" <?= $cancel ?>" data-toggle="tooltip" title=" <?= $button_cancel ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
                <a href=" <?= $about_link ?>" data-toggle="tooltip" title=" <?= $about_text ?>" class="btn btn-default"> <?= $about_text ?></a>
                <a href=" <?= $history_link ?>" data-toggle="tooltip" title=" <?= $history_text ?>" class="btn btn-default"> <?= $history_text ?></a>
                <a href=" <?= $test_link ?>" data-toggle="tooltip" title=" <?= $test_text ?>" class="btn btn-default"> <?= $test_text ?></a>
                <a href=" <?= $campaign_link ?>" data-toggle="tooltip" title=" <?= $campaign_text ?>" class="btn btn-default"> <?= $campaign_text ?></a>
            </div>
            <h1> <?= $heading_title ?></h1>
            <ul class="breadcrumb">
                <?php foreach($breadcrumbs as $breadcrumb){ ?>
                    <li><a href=" <?= $breadcrumb['href'] ?>"> <?= $breadcrumb['text'] ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if($error_warning){ ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>  <?= $error_warning ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <?php if($success){ ?>
            <div class="alert alert-success"> <?= $success ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-phone"></i>  <?= $heading_test ?></h3>
            </div>
            <div class="panel-body">
                <form action=" <?= $action ?>" method="post" enctype="multipart/form-data" id="form-first-module" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sendsms-phone"> <?= $entry_phone ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="module_sendsms_phone" id="input-sendsms-phone" class="form-control" value="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sendsms-message"> <?= $entry_message ?></label>
                        <div class="col-sm-10">
                            <textarea name="module_sendsms_message" id="input-sendsms-message" rows="5" class="form-control sendsms_char_count" maxlength="160"></textarea>
                            <p>160  <?= $entry_characters_left ?></p>
                        </div>
                    </div>
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
            this.nextElementSibling.innerHTML = text_remaining + '  <?= $entry_characters_left ?>';
        };
        var text_length = sendsms_element.value.length;
        var text_remaining = 160 - text_length;
        sendsms_element.nextElementSibling.innerHTML = text_remaining + '  <?= $entry_characters_left ?>';
    }
</script>
 <?= $footer ?>
