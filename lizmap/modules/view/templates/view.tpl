{meta_html csstheme 'css/main.css'}
{meta_html csstheme 'css/view.css'}
{meta_html csstheme 'css/media.css'}

{assign $idm = 0}
{foreach $mapitems as $mi}
{if $mi->type == 'rep'}
<h2>{$mi->title}</h2>
<ul class="thumbnails">
  {foreach $mi->childItems as $p}
  {assign $idm = $idm + 1}
  <a name="link-projet-{$idm}"></a>
  <li class="span3">
    <div class="thumbnail">
      <div class="liz-project">
        <img src="{$p->img}" alt="project image" class="liz-project-img">
        <p class="liz-project-desc" style="display:none;">
          <b>{$p->title}</b>
          <br/>
          <br/><b>{@default.project.abstract.label@}</b>&nbsp;: {$p->abstract|truncate:100}
          <br/>
          <br/><b>{@default.project.projection.label@}</b>&nbsp;: {$p->proj}
        </p>
      </div>
      <h5>{$p->title}</h5>
      <p>
        <a class="btn liz-project-view" href="{$p->url}">{@default.project.open.map@}</a>
        <a class="btn liz-project-show-desc" href="#link-projet-{$idm}" onclick="$('#liz-project-modal-{$idm}').modal('show'); return false;">{@default.project.open.map.metadata@}</a>
      </p>
    </div>
 
    <div id="liz-project-modal-{$idm}" class="modal fade hide" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-show="false" data-keyboard="false" data-backdrop="static">
    
      <div class="modal-header">  
        <a class="close" data-dismiss="modal">×</a>  
        <h3>{$p->title}</h3>  
      </div>  
      <div class="modal-body">
        <dl class="dl-horizontal">
          <dt>{@view~map.metadata.h2.illustration@}</dt>
          <dd><img src="{$p->img}" alt="project image" width="150" height="150"></dd>
          <dt>{@default.project.title.label@}</dt>
          <dd>{$p->title}&nbsp;</dd>
          <dt>{@default.project.abstract.label@}</dt>
          <dd>{$p->abstract|nl2br}&nbsp;</dd>
          <dt>{@default.project.projection.label@}</dt>
          <dd>{$p->proj}&nbsp;</dd>
          <dt>{@default.project.bbox.label@}</dt>
          <dd>{$p->bbox}</dd>
        </dl>       
      </div>  
      <div class="modal-footer">
        <a class="btn liz-project-view" href="{$p->url}">{@default.project.open.map@}</a>
        <a href="#" class="btn" data-dismiss="modal">{@default.project.close.map.metadata@}</a>  
      </div>
    </div>
  </li>
  {/foreach}
</ul>
{/if}
{/foreach}
