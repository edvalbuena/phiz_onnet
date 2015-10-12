    <div style="background-color: #E86110;" class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="hidden-xs navbar-brand" href="/">OnNet communications</a>
          <a class="visible-xs navbar-brand" href="/">OnNet</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
             {% if m.session.lb_user_id and m.kazoo.is_kazoo_account_admin %}
               {% include "_lb_topmenu.tpl" %}
             {% endif %}
           <li class="divider visible-xs"></li>
           <li><a id="xs_sign_out" class="visible-xs" href="#">{_ Sign out _}</a></li>
           {% wire id="xs_sign_out" postback={signout} delegate="mod_kazoo" %} 
            <!-- Profile links for extra small screens -->
            <!-- <li  class="visible-xs"><a href="#">Sign out</a></li> -->
          </ul>
          <ul class="nav navbar-nav navbar-right hidden-xs">
            <!-- Admin Sign in -->
           <li id="sign_out">
             <a class="visible-lg visible-md" href="#">{_ Sign out _}</a>
             <a class="visible-sm" href="#"><i class="fa fa-power-off fa-lg"></i></a>
           </li>
           {% wire id="sign_out" postback={signout} delegate="mod_kazoo" %} 
            {% all include "language_choice.tpl" %}
          </ul>
             {% if m.modules.info.mod_kazoo.enabled and m.kazoo.get_kazoo_account_id %}
                 {% include "_kazoo_topmenu.tpl" %}
             {% endif %}
        </div>
      </div>
    </div>