{% extends "services.tpl" %}


{% block service_name %}{_ News _}{% endblock %}


{% block service_description %}

<div class="row">
<div class="col-sm-8 blog-summary-list">

{% for id in m.search[{query cat='news' sort='-rsc.publication_start'}] %}
  {% if m.rsc[id].body %}
<div class="blog-summary">

    <div class="media">
      <h4 class="story"><a href="{{ m.rsc[id].page_url_abs }}" class="undecorate-link" style="border-bottom: 2px solid #3E7A8C;">{{ m.rsc[id].title }}</a></h4>
    </div>
       <ul class="text-muted list-inline">
        <li><i class="fa fa-calendar"></i> {{ m.rsc[id].publication_start|date:"F d, Y" }}</li>
      </ul>
      <hr>
      {{ m.rsc[id].body }}
     </div>

  {% endif %}
{% endfor %}

</div>
</div>
    
{% endblock %}
