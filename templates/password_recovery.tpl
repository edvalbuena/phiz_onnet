{% extends "services.tpl" %}

{% block service_name %}{_ Password recovery _}{% endblock %}

{% block service_description %}

<div class="row">
  <div class="col-sm-2">
                {% wire id="password_recovery_page_form" type="submit" postback={forgottenpwd} delegate="phiz" %}
                <form id="password_recovery_page_form" class="input-group" method="post" action="postback">
                  <div class="mb-10" style="width: 230px; text-transform: none;">{_ Input Email _}</div>
                  <input class="form-control mb-10" placeholder="{_ Username _}" type="text"
                         name="forgotten_username" value=""  autofocus="autofocus" autocapitalize="off" autocomplete="on" tabindex=1>
                  <input class="form-control mb-10" placeholder="{_ Account or Phone number _}" type="text"
                         name="forgotten_account_name" value=""  autofocus="autofocus" autocapitalize="off" autocomplete="on" tabindex=1>
                  {% button text=_"Receive password" action={submit target="password_recovery_page_form"} class="btn btn-default" %}
                </form>
  </div>
</div>
    
{% endblock %}
