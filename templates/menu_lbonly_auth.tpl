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
            <li><a href="/dashboard">{_ Dashboard _}</a></li>
            <li><a href="/finance_details">{_ Payments _}</a></li>
            <li><a href="/documents">{_ Documents _}</a></li>
            <li><a href="/lb_statistics">{_ Statistics _}</a></li>
            <li class="divider visible-xs"></li>
            <li><a id="xs_sign_out" class="visible-xs" href="#">{_ Sign out _}</a></li>
            {% wire id="xs_sign_out" postback={signout} delegate="mod_kazoo" %} 
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
        </div>
      </div>
    </div>
