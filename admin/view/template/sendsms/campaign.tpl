<?= $header ?><?= $column_left ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-first-module" data-toggle="tooltip" title="<?= $button_filter ?>" class="btn btn-primary"><i class="fa fa-filter"></i></button>
                <a href="<?= $cancel ?>" data-toggle="tooltip" title="<?= $button_cancel ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
                <a href="<?= $about_link ?>" data-toggle="tooltip" title="<?= $about_text ?>" class="btn btn-default"><?= $about_text ?></a>
                <a href="<?= $history_link ?>" data-toggle="tooltip" title="<?= $history_text ?>" class="btn btn-default"><?= $history_text ?></a>
                <a href="<?= $test_link ?>" data-toggle="tooltip" title="<?= $test_text ?>" class="btn btn-default"><?= $test_text ?></a>
                <a href="<?= $campaign_link ?>" data-toggle="tooltip" title="<?= $campaign_text ?>" class="btn btn-default"><?= $campaign_text ?></a>
            </div>
            <h1><?= $heading_title ?></h1>
            <ul class="breadcrumb">
                <?php foreach($breadcrumbs as $breadcrumb){  ?>
                    <li><a href="<?= $breadcrumb['href'] ?>"><?= $breadcrumb['text'] ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if($success){  ?>
            <div class="alert alert-success"><?= $success ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-filter"></i> <?= $heading_filter ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?= $action ?>" method="post" enctype="multipart/form-data" id="form-first-module" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sendsms-phone"><?= $campaign_date ?></label>
                        <div class="col-sm-5">
                            <div class="input-group date">
                                <input type="text" name="filter_date_start" value="<?= $filter_date_start ?>" placeholder="<?= $campaign_start_date ?>" data-date-format="YYYY-MM-DD" id="input-date" class="date form-control" />
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-5">
                            <div class="input-group date">
                                <input type="text" name="filter_date_end" value="<?= $filter_date_end ?>" placeholder="<?= $campaign_end_date ?>" data-date-format="YYYY-MM-DD" id="input-date" class="date form-control" />
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sendsms-sum"><?= $campaign_sum ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="filter_sum" id="input-sendsms-sum" class="form-control" value="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sendsms-product"><?= $campaign_product ?></label>
                        <div class="col-sm-10">
                            <select name="filter_product" class="form-control" id="input-sendsms-product">
                                <option value=""></option>
                                <?php foreach($products as $product){  ?>
                                    <option value="<?= $product['product_id'] ?>"><?= $product['name'] ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sendsms-county"><?= $campaign_billing_county ?></label>
                        <div class="col-sm-10">
                            <select name="filter_county" class="form-control" id="input-sendsms-county">
                                <option value=""></option>
                                <?php foreach($counties as $county){  ?>
                                    <option value="<?= $county['payment_zone'] ?>"><?= $county['payment_zone'] ?></option>
                                <?php  } ?>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('.date').datetimepicker({
        language: '<?= $datepicker ?>',
        pickTime: false
    });
</script>
<?= $footer ?>
