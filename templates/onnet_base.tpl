<!DOCTYPE html>
<html lang="{{ z_language|default:"ru"|escape }}">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/lib/images/favicon.ico">

    <title>OnNet communications Inc.</title>

    {% lib "js/jquery-2.1.1.min.js" %}
    {% lib "js/jquery-migrate-1.0.0.js" %}
    {% lib "js/jquery-ui.min.js" %}
    {% lib "js/jquery.ui.touch-punch.min.js" %}

    <!-- Bootstrap -->

    {% lib "css/bootstrap.min.css" %}
    {% lib "js/bootstrap.min.js" %}

    <!-- Custom styles for this template -->
    <link href='//fonts.googleapis.com/css?family=Tangerine:100,300,400&subset=latin,cyrillic' rel='stylesheet' type='text/css'>

    {% lib
          "css/z.modal.css"
    %}
    {% lib
          "css/z.growl.css"
          "css/jquery.loadmask.css"
          "css/animate.css"
          "css/elements.css"
          "css/custom.css"
          "css/onnet.css"
    %}
 
    {% with ["/lib/img/spb_gostdvor.jpg","/lib/img/msk_city.jpg","/lib/img/ldn_docklands.jpg"]|random as bgr_image %}
    <style type="text/css">
        #wrap,
        #hp-slider {
            height: 480px;
            background: url({{ bgr_image }}) no-repeat center center; 
            background-size: cover;
            filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{{ bgr_image }}', sizingMethod='scale');
            -ms-filter: "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{{ bgr_image }}', sizingMethod='scale')";
            border-bottom: 1px solid #eee;
            color: #fff;
        }
    </style>
    {% endwith %} 

    {% lib "js/apps/zotonic-1.0.js" %}
    {% lib "js/apps/z.widgetmanager.js" %}
    {% lib "js/modules/z.notice.js" %}
    {% lib "js/z.dialog.bootstrap3.js" %}
    {% lib "js/modules/ubf.js" %}
    {% lib
          "js/modules/jquery.loadmask.js"
          "js/modules/livevalidation-1.3.js"
     %}
    {% lib 
          "js/modules/z.tooltip.js"
          "js/modules/z.feedback.js"
          "js/modules/z.formreplace.js"
          "js/modules/z.datepicker.js"
          "js/modules/z.menuedit.js"
          "js/modules/z.cropcenter.js"
          "js/modules/livevalidation-1.3.js"
          "js/modules/jquery.loadmask.js"
          "js/modules/jquery.timepicker.min.js"
     %}

    {% lib "css/datepicker3.css" %}
    {% lib "js/bootstrap-datepicker.js" %}
    {% lib "js/locales/bootstrap-datepicker.ru.js" %}


    {% lib "css/font-awesome.min.css" %}
    {% lib "css/dataTables.bootstrap.css" %}
    {% lib "js/jquery.dataTables.min.js" %}
    {% lib "js/dataTables.bootstrap.js" %}
    {% lib "js/jquery.dataTables.columnFilter.js" %}


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    {% include "topmenu.tpl" %}

    {% block main %}{% endblock %}

    {% include "footer.tpl" %}
    {% include "google_anatytics.tpl" %}
    {% include "yandex_metrika.tpl" %}
    {% include "rambler_counter.tpl" %}

    {% script %}
  </body>
</html>
