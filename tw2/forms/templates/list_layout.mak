<%namespace name="tw" module="tw2.core.mako_util"/>\
<ul\
${tw.attrs(attrs=w.attrs)}>
   % for i,c in enumerate(w.children):
    <li \
class="${(i % 2 and 'even' or 'odd') + ((c.validator and c.validator.required) and ' required' or '') + (c.error_msg and ' error' or '')}"\
     % if w.hover_help and c.help_text:
title="${c.help_text}" \
     % endif
${tw.attrs(attrs=c.container_attrs)}\
>
        ${c.label or ''} 
        ${c.display() | n}
        % if not w.hover_help:
${c.help_text or ''}\
        % endif 
        <span id="${c.compound_id or ''}:error">${c.error_msg or ''}</span>
    </li>
   % endfor
    <li class="error"><span id="${w.compound_id or ''}:error">${w.error_msg or ''}</span></li>
</ul>