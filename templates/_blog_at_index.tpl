          <div class="tab-pane active" id="blog">
            {% for id in m.search[{query cat='blog' sort='-rsc.publication_start' pagelen=4}] %}
            <div class="media">
              <a class="pull-left" href="{{ m.rsc[id].page_path }}">
                {% image m.rsc[id].depiction class="media-object" alt="Blog Message" %}
              </a>
              <div class="media-body">
                <h4 class="media-heading"><a href="{{ m.rsc[id].page_path }}">{{ m.rsc[id].title }}</a></h4>
                <a class="undecorate-link" href="{{ m.rsc[id].page_path }}">{{ m.rsc[id].summary }}</a>
              </div>
            </div>
            {% endfor %}
            <a href="/allblogs" class="read-more">{_ more blogs _}...</a>
          </div>
