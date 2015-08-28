{% extends "services.tpl" %}


{% block service_name %}{_ Registration _}{% endblock %}


{% block service_description %}

    <!-- Main Form -->
    <div id="sign_up_div" class="container">
      <div class="row">
        <div class="col-md-8 col-md-offset-2 signup">
          {% wire id="sign_up_form" type="submit" postback={innosignup} delegate="mod_kazoo" %}
          <form id="sign_up_form" method="post" action="postback">
            <div class="form-group">
              <div class="row">
                <div class="col-sm-6">
                  <input type="text" class="form-control margin-bottom-xs" id="firstname" name="firstname" placeholder="{_ Your name (mandatory) _}">
                </div>
                <div class="col-sm-6">
                  <input type="text" class="form-control" id="surname" name="surname" placeholder="{_ Your surname (mandatory) _}">
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="row">
                <div class="col-sm-6">
                  <input type="text" class="form-control margin-bottom-xs" id="username" name="username" placeholder="{_ Enter email address (mandatory) _}">
                </div>
                <div class="col-sm-6">
                  <input type="text" class="form-control margin-bottom-xs" id="email" name="email" placeholder="{_ Confirm email address (mandatory) _}">
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="row">
                <div class="col-sm-6">
                  <input type="text" class="form-control" id="companyname"  name="companyname" placeholder="{_ Company name (optional) _}">
                </div>
                <div class="col-sm-6">
                  <input type="text" class="form-control" id="phonenumber" name="phonenumber" placeholder="{_ Phone number (mandatory) _}">
                </div>
              </div>
            </div>
            <div class="checkbox">
              <label>
                <input type="checkbox" id="checkbox" name="checkbox" />{_ I agree to the _} <a href="/termscons">{_ Terms of Service _}</a>
              </label>
            </div>
            <br />
            <div class="form-group">
              <div class="row">
                <div class="col-sm-6">
                  {% button text=_"Create an account" action={submit target="sign_up_form"} class="btn btn-zprimary margin-bottom-xs" %}
                </div>
                <div class="col-sm-6">
                  <div class="g-recaptcha" data-sitekey="6LeY2wsTAAAAAMUb-o1XX4_M0UKQ5IOM4_uxsh48"></div>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
<script src='https://www.google.com/recaptcha/api.js'></script>

<br />

<br />
    
{% endblock %}
