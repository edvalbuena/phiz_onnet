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
                  <input type="text" class="form-control margin-bottom-xs" id="firstname" name="firstname" placeholder="Your name (mandatory)" data-toggle="popover" 
                                     data-placement="left" data-trigger="focus" data-content="Enter your name here." data-original-title="Name">
                </div>
                <div class="col-sm-6">
                  <input type="text" class="form-control" id="surname" name="surname" placeholder="Your surname (mandatory)" data-toggle="popover" 
                                     data-placement="left" data-trigger="focus" data-content="Enter your surname here." data-original-title="Name">
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="row">
                <div class="col-sm-6">
                  <input type="text" class="form-control margin-bottom-xs" id="username" name="username" placeholder="Enter email address (mandatory)" data-toggle="popover" 
                                     data-placement="left" data-trigger="focus" data-content="Enter your nickname here." data-original-title="Username">
                </div>
                <div class="col-sm-6">
                  <input type="text" class="form-control margin-bottom-xs" id="email" name="email" placeholder="Confirm email address (mandatory)" data-toggle="popover" 
                                     data-placement="left" data-trigger="focus" data-content="Enter a valid email here." data-original-title="Email">
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="row">
                <div class="col-sm-6">
                  <input type="text" class="form-control" id="companyname"  name="companyname" placeholder="Company name (optional)" data-toggle="popover" 
                                     data-placement="left" data-trigger="focus" data-content="Enter your company name." data-original-title="Company name">
                </div>
                <div class="col-sm-6">
                  <input type="text" class="form-control" id="phonenumber" name="phonenumber" placeholder="Phone number (mandatory)" data-toggle="popover" 
                                     data-trigger="focus" data-content="Enter your phonenumber here." data-original-title="Phone number">
                </div>
              </div>
            </div>
            <div class="checkbox">
              <label>
                <input type="checkbox" id="checkbox" name="checkbox" /> I agree to the <a href="/termscons">Terms of Service</a> and <a href="/privacypolicy">Privacy Policy</a>
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
