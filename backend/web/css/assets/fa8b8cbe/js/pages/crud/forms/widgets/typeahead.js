!function(e){var a={};function t(n){if(a[n])return a[n].exports;var o=a[n]={i:n,l:!1,exports:{}};return e[n].call(o.exports,o,o.exports,t),o.l=!0,o.exports}t.m=e,t.c=a,t.d=function(e,a,n){t.o(e,a)||Object.defineProperty(e,a,{enumerable:!0,get:n})},t.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},t.t=function(e,a){if(1&a&&(e=t(e)),8&a)return e;if(4&a&&"object"==typeof e&&e&&e.__esModule)return e;var n=Object.create(null);if(t.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:e}),2&a&&"string"!=typeof e)for(var o in e)t.d(n,o,function(a){return e[a]}.bind(null,o));return n},t.n=function(e){var a=e&&e.__esModule?function(){return e.default}:function(){return e};return t.d(a,"a",a),a},t.o=function(e,a){return Object.prototype.hasOwnProperty.call(e,a)},t.p="",t(t.s=576)}({576:function(e,a){var t,n=(t=["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"],{init:function(){var e,a,n,o,i,r;$("#kt_typeahead_1, #kt_typeahead_1_modal, #kt_typeahead_1_validate, #kt_typeahead_2_validate, #kt_typeahead_3_validate").typeahead({hint:!0,highlight:!0,minLength:1},{name:"states",source:(e=t,function(a,t){var n;n=[],substrRegex=new RegExp(a,"i"),$.each(e,(function(e,a){substrRegex.test(a)&&n.push(a)})),t(n)})}),a=new Bloodhound({datumTokenizer:Bloodhound.tokenizers.whitespace,queryTokenizer:Bloodhound.tokenizers.whitespace,local:t}),$("#kt_typeahead_2, #kt_typeahead_2_modal").typeahead({hint:!0,highlight:!0,minLength:1},{name:"states",source:a}),n=new Bloodhound({datumTokenizer:Bloodhound.tokenizers.whitespace,queryTokenizer:Bloodhound.tokenizers.whitespace,prefetch:HOST_URL+"/api/?file=typeahead/countries.json"}),$("#kt_typeahead_3, #kt_typeahead_3_modal").typeahead(null,{name:"countries",source:n}),o=new Bloodhound({datumTokenizer:Bloodhound.tokenizers.obj.whitespace("value"),queryTokenizer:Bloodhound.tokenizers.whitespace,prefetch:HOST_URL+"/api/?file=typeahead/movies.json"}),$("#kt_typeahead_4").typeahead(null,{name:"best-pictures",display:"value",source:o,templates:{empty:['<div class="empty-message" style="padding: 10px 15px; text-align: center;">',"unable to find any Best Picture winners that match the current query","</div>"].join("\n"),suggestion:Handlebars.compile("<div><strong>{{value}}</strong> – {{year}}</div>")}}),i=new Bloodhound({datumTokenizer:Bloodhound.tokenizers.obj.whitespace("team"),queryTokenizer:Bloodhound.tokenizers.whitespace,prefetch:HOST_URL+"/api/?file=typeahead/nba.json"}),r=new Bloodhound({datumTokenizer:Bloodhound.tokenizers.obj.whitespace("team"),queryTokenizer:Bloodhound.tokenizers.whitespace,prefetch:HOST_URL+"/api/?file=typeahead/nhl.json"}),$("#kt_typeahead_5").typeahead({highlight:!0},{name:"nba-teams",display:"team",source:i,templates:{header:'<h3 class="league-name" style="padding: 5px 15px; font-size: 1.2rem; margin:0;">NBA Teams</h3>'}},{name:"nhl-teams",display:"team",source:r,templates:{header:'<h3 class="league-name" style="padding: 5px 15px; font-size: 1.2rem; margin:0;">NHL Teams</h3>'}})}});jQuery(document).ready((function(){n.init()}))}});