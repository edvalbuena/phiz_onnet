{% extends "services.tpl" %}

{% block service_name %}{_ Sign in _}{% endblock %}

{% block service_description %}

<div class="row">
  <div class="col-sm-2">
                {% wire id="sign_in_page_form" type="submit" postback={phizauth} delegate="phiz" %}
                <form id="sign_in_page_form" class="input-group" method="post" action="postback">
                  <input type="text" class="form-control mb-10" placeholder="{_ Login _}"
                          name="username" value="{{ login_name }}"  autofocus="autofocus" autocapitalize="off" autocomplete="on" tabindex=1 />
                  {# validate id="username_page" type={presence} #}

                  <input type="password" class="form-control mb-10" placeholder="{_ Password _}"
                         name="password" value="{{ password }}" autocomplete="on" tabindex=2/>

                  <input type="text" class="form-control mb-10" placeholder="{_ Account Name _}"
                         name="account" value="" autocomplete="on" tabindex=3/>

                  {% button text=_"Enter" action={submit target="sign_in_page_form"} class="btn btn-default" %}
                </form>
  <br/>
  <a href="/password_recovery" style="margin-top: 2em;" class="undecorate-link">{_ Forgot your password? _}</a>
  <br/>
  </div>
</div>
    
{% endblock %}
