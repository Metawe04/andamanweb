!function(i){var t={};function a(e){if(t[e])return t[e].exports;var s=t[e]={i:e,l:!1,exports:{}};return i[e].call(s.exports,s,s.exports,a),s.l=!0,s.exports}a.m=i,a.c=t,a.d=function(i,t,e){a.o(i,t)||Object.defineProperty(i,t,{enumerable:!0,get:e})},a.r=function(i){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(i,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(i,"__esModule",{value:!0})},a.t=function(i,t){if(1&t&&(i=a(i)),8&t)return i;if(4&t&&"object"==typeof i&&i&&i.__esModule)return i;var e=Object.create(null);if(a.r(e),Object.defineProperty(e,"default",{enumerable:!0,value:i}),2&t&&"string"!=typeof i)for(var s in i)a.d(e,s,function(t){return i[t]}.bind(null,s));return e},a.n=function(i){var t=i&&i.__esModule?function(){return i.default}:function(){return i};return a.d(t,"a",t),t},a.o=function(i,t){return Object.prototype.hasOwnProperty.call(i,t)},a.p="",a(a.s=599)}({599:function(i,t,a){"use strict";var e,s,l,n,o,c,r,d,m=(c=function(i,t){t=new Quill("#"+t,{modules:{toolbar:{}},placeholder:"Type message...",theme:"snow"});var a=KTUtil.find(i,".ql-toolbar");t=KTUtil.find(i,".ql-editor"),a&&KTUtil.addClass(a,"px-5 border-top-0 border-left-0 border-right-0"),t&&KTUtil.addClass(t,"px-8")},r=function(i){i=KTUtil.getById(i);var t=KTUtil.find(i,"[name=compose_to]"),a=(new Tagify(t,{delimiters:", ",maxTags:10,blacklist:["fuck","shit","pussy"],keepInvalidTags:!0,whitelist:[{value:"Chris Muller",email:"chris.muller@wix.com",initials:"",initialsState:"",pic:"./assets/media/users/100_11.jpg",class:"tagify__tag--primary"},{value:"Nick Bold",email:"nick.seo@gmail.com",initials:"SS",initialsState:"warning",pic:""},{value:"Alon Silko",email:"alon@keenthemes.com",initials:"",initialsState:"",pic:"./assets/media/users/100_6.jpg"},{value:"Sam Seanic",email:"sam.senic@loop.com",initials:"",initialsState:"",pic:"./assets/media/users/100_8.jpg"},{value:"Sara Loran",email:"sara.loran@tilda.com",initials:"",initialsState:"",pic:"./assets/media/users/100_9.jpg"},{value:"Eric Davok",email:"davok@mix.com",initials:"",initialsState:"",pic:"./assets/media/users/100_13.jpg"},{value:"Sam Seanic",email:"sam.senic@loop.com",initials:"",initialsState:"",pic:"./assets/media/users/100_13.jpg"},{value:"Lina Nilson",email:"lina.nilson@loop.com",initials:"LN",initialsState:"danger",pic:"./assets/media/users/100_15.jpg"}],templates:{dropdownItem:function(i){try{var t="";return t+='<div class="tagify__dropdown__item">',t+='   <div class="d-flex align-items-center">',t+='       <span class="symbol sumbol-'+(i.initialsState?i.initialsState:"")+' mr-2">',t+='           <span class="symbol-label" style="background-image: url(\''+(i.pic?i.pic:"")+"')\">"+(i.initials?i.initials:"")+"</span>",t+="       </span>",t+='       <div class="d-flex flex-column">',t+='           <a href="#" class="text-dark-75 text-hover-primary font-weight-bold">'+(i.value?i.value:"")+"</a>",t+='           <span class="text-muted font-weight-bold">'+(i.email?i.email:"")+"</span>",t+="       </div>",t+="   </div>",t+="</div>"}catch(i){}}},transformTag:function(i){i.class="tagify__tag tagify__tag--primary"},dropdown:{classname:"color-blue",enabled:1,maxItems:5}}),KTUtil.find(i,"[name=compose_cc]")),e=(new Tagify(a,{delimiters:", ",maxTags:10,blacklist:["fuck","shit","pussy"],keepInvalidTags:!0,whitelist:[{value:"Chris Muller",email:"chris.muller@wix.com",initials:"",initialsState:"",pic:"./assets/media/users/100_11.jpg",class:"tagify__tag--primary"},{value:"Nick Bold",email:"nick.seo@gmail.com",initials:"SS",initialsState:"warning",pic:""},{value:"Alon Silko",email:"alon@keenthemes.com",initials:"",initialsState:"",pic:"./assets/media/users/100_6.jpg"},{value:"Sam Seanic",email:"sam.senic@loop.com",initials:"",initialsState:"",pic:"./assets/media/users/100_8.jpg"},{value:"Sara Loran",email:"sara.loran@tilda.com",initials:"",initialsState:"",pic:"./assets/media/users/100_9.jpg"},{value:"Eric Davok",email:"davok@mix.com",initials:"",initialsState:"",pic:"./assets/media/users/100_13.jpg"},{value:"Sam Seanic",email:"sam.senic@loop.com",initials:"",initialsState:"",pic:"./assets/media/users/100_13.jpg"},{value:"Lina Nilson",email:"lina.nilson@loop.com",initials:"LN",initialsState:"danger",pic:"./assets/media/users/100_15.jpg"}],templates:{dropdownItem:function(i){try{var t="";return t+='<div class="tagify__dropdown__item">',t+='   <div class="d-flex align-items-center">',t+='       <span class="symbol sumbol-'+(i.initialsState?i.initialsState:"")+' mr-2" style="background-image: url(\''+(i.pic?i.pic:"")+"')\">",t+='           <span class="symbol-label">'+(i.initials?i.initials:"")+"</span>",t+="       </span>",t+='       <div class="d-flex flex-column">',t+='           <a href="#" class="text-dark-75 text-hover-primary font-weight-bold">'+(i.value?i.value:"")+"</a>",t+='           <span class="text-muted font-weight-bold">'+(i.email?i.email:"")+"</span>",t+="       </div>",t+="   </div>",t+="</div>"}catch(i){}}},transformTag:function(i){i.class="tagify__tag tagify__tag--primary"},dropdown:{classname:"color-blue",enabled:1,maxItems:5}}),KTUtil.find(i,"[name=compose_bcc]"));new Tagify(e,{delimiters:", ",maxTags:10,blacklist:["fuck","shit","pussy"],keepInvalidTags:!0,whitelist:[{value:"Chris Muller",email:"chris.muller@wix.com",initials:"",initialsState:"",pic:"./assets/media/users/100_11.jpg",class:"tagify__tag--primary"},{value:"Nick Bold",email:"nick.seo@gmail.com",initials:"SS",initialsState:"warning",pic:""},{value:"Alon Silko",email:"alon@keenthemes.com",initials:"",initialsState:"",pic:"./assets/media/users/100_6.jpg"},{value:"Sam Seanic",email:"sam.senic@loop.com",initials:"",initialsState:"",pic:"./assets/media/users/100_8.jpg"},{value:"Sara Loran",email:"sara.loran@tilda.com",initials:"",initialsState:"",pic:"./assets/media/users/100_9.jpg"},{value:"Eric Davok",email:"davok@mix.com",initials:"",initialsState:"",pic:"./assets/media/users/100_13.jpg"},{value:"Sam Seanic",email:"sam.senic@loop.com",initials:"",initialsState:"",pic:"./assets/media/users/100_13.jpg"},{value:"Lina Nilson",email:"lina.nilson@loop.com",initials:"LN",initialsState:"danger",pic:"./assets/media/users/100_15.jpg"}],templates:{dropdownItem:function(i){try{var t="";return t+='<div class="tagify__dropdown__item">',t+='   <div class="d-flex align-items-center">',t+='       <span class="symbol sumbol-'+(i.initialsState?i.initialsState:"")+' mr-2" style="background-image: url(\''+(i.pic?i.pic:"")+"')\">",t+='           <span class="symbol-label">'+(i.initials?i.initials:"")+"</span>",t+="       </span>",t+='       <div class="d-flex flex-column">',t+='           <a href="#" class="text-dark-75 text-hover-primary font-weight-bold">'+(i.value?i.value:"")+"</a>",t+='           <span class="text-muted font-weight-bold">'+(i.email?i.email:"")+"</span>",t+="       </div>",t+="   </div>",t+="</div>"}catch(i){}}},transformTag:function(i){i.class="tagify__tag tagify__tag--primary"},dropdown:{classname:"color-blue",enabled:1,maxItems:5}}),KTUtil.on(i,'[data-inbox="cc-show"]',"click",(function(t){var a=KTUtil.find(i,".inbox-to-cc");KTUtil.removeClass(a,"d-none"),KTUtil.addClass(a,"d-flex"),KTUtil.find(i,"[name=compose_cc]").focus()})),KTUtil.on(i,'[data-inbox="cc-hide"]',"click",(function(t){var a=KTUtil.find(i,".inbox-to-cc");KTUtil.removeClass(a,"d-flex"),KTUtil.addClass(a,"d-none")})),KTUtil.on(i,'[data-inbox="bcc-show"]',"click",(function(t){var a=KTUtil.find(i,".inbox-to-bcc");KTUtil.removeClass(a,"d-none"),KTUtil.addClass(a,"d-flex"),KTUtil.find(i,"[name=compose_bcc]").focus()})),KTUtil.on(i,'[data-inbox="bcc-hide"]',"click",(function(t){var a=KTUtil.find(i,".inbox-to-bcc");KTUtil.removeClass(a,"d-flex"),KTUtil.addClass(a,"d-none")}))},d=function(i){var t="#"+i,a=$(t+" .dropzone-item");a.id="";var e=a.parent(".dropzone-items").html();a.remove();var s=new Dropzone(t,{url:"https://keenthemes.com/scripts/void.php",parallelUploads:20,maxFilesize:1,previewTemplate:e,previewsContainer:t+" .dropzone-items",clickable:t+"_select"});s.on("addedfile",(function(i){$(document).find(t+" .dropzone-item").css("display","")})),s.on("totaluploadprogress",(function(i){document.querySelector(t+" .progress-bar").style.width=i+"%"})),s.on("sending",(function(i){document.querySelector(t+" .progress-bar").style.opacity="1"})),s.on("complete",(function(i){var a=t+" .dz-complete";setTimeout((function(){$(a+" .progress-bar, "+a+" .progress").css("opacity","0")}),300)}))},{init:function(){e=KTUtil.getById("kt_inbox_aside"),s=KTUtil.getById("kt_inbox_list"),l=KTUtil.getById("kt_inbox_view"),n=KTUtil.getById("kt_inbox_compose"),o=KTUtil.getById("kt_inbox_reply"),m.initAside(),m.initList(),m.initView(),m.initReply(),m.initCompose()},initAside:function(){new KTOffcanvas(e,{overlay:!0,baseClass:"offcanvas-mobile",toggleBy:"kt_subheader_mobile_toggle"}),KTUtil.on(e,'.list-item[data-action="list"]',"click",(function(i){var t=KTUtil.attr(this,"data-type"),a=KTUtil.find(s,".kt-inbox__items"),n=this.closest(".kt-nav__item"),o=KTUtil.find(e,".kt-nav__item.kt-nav__item--active"),c=new KTDialog({type:"loader",placement:"top center",message:"Loading ..."});c.show(),setTimeout((function(){c.hide(),KTUtil.css(s,"display","flex"),KTUtil.css(l,"display","none"),KTUtil.addClass(n,"kt-nav__item--active"),KTUtil.removeClass(o,"kt-nav__item--active"),KTUtil.attr(a,"data-type",t)}),600)}))},initList:function(){KTUtil.on(s,'[data-inbox="message"]',"click",(function(i){var t=KTUtil.find(this,'[data-inbox="actions"]');if(i.target===t||t&&!0===t.contains(i.target))return!1;var a=new KTDialog({type:"loader",placement:"top center",message:"Loading ..."});a.show(),setTimeout((function(){a.hide(),KTUtil.addClass(s,"d-none"),KTUtil.removeClass(s,"d-block"),KTUtil.addClass(l,"d-block"),KTUtil.removeClass(l,"d-none")}),700)})),KTUtil.on(s,'[data-inbox="group-select"] input',"click",(function(){for(var i=KTUtil.findAll(s,'[data-inbox="message"]'),t=0,a=i.length;t<a;t++){var e=i[t];KTUtil.find(e,".checkbox input").checked=this.checked,this.checked?KTUtil.addClass(e,"active"):KTUtil.removeClass(e,"active")}})),KTUtil.on(s,'[data-inbox="message"] [data-inbox="actions"] .checkbox input',"click",(function(){var i=this.closest('[data-inbox="message"]');i&&this.checked?KTUtil.addClass(i,"active"):KTUtil.removeClass(i,"active")}))},initView:function(){KTUtil.on(l,'[data-inbox="back"]',"click",(function(){var i=new KTDialog({type:"loader",placement:"top center",message:"Loading ..."});i.show(),setTimeout((function(){i.hide(),KTUtil.addClass(s,"d-block"),KTUtil.removeClass(s,"d-none"),KTUtil.addClass(l,"d-none"),KTUtil.removeClass(l,"d-block")}),700)})),KTUtil.on(l,'[data-inbox="message"]',"click",(function(i){var t=this.closest('[data-inbox="message"]'),a=KTUtil.find(this,'[data-toggle="dropdown"]'),e=KTUtil.find(this,'[data-inbox="toolbar"]');return!(i.target===a||a&&!0===a.contains(i.target))&&!(i.target===e||e&&!0===e.contains(i.target))&&void(KTUtil.hasClass(t,"toggle-on")?(KTUtil.addClass(t,"toggle-off"),KTUtil.removeClass(t,"toggle-on")):(KTUtil.removeClass(t,"toggle-off"),KTUtil.addClass(t,"toggle-on")))}))},initReply:function(){c(o,"kt_inbox_reply_editor"),d("kt_inbox_reply_attachments"),r("kt_inbox_reply_form")},initCompose:function(){c(n,"kt_inbox_compose_editor"),d("kt_inbox_compose_attachments"),r("kt_inbox_compose_form"),KTUtil.on(n,'[data-inbox="dismiss"]',"click",(function(i){swal.fire({text:"Are you sure to discard this message ?",type:"danger",buttonsStyling:!1,confirmButtonText:"Discard draft",confirmButtonClass:"btn btn-danger",showCancelButton:!0,cancelButtonText:"Cancel",cancelButtonClass:"btn btn-light-primary"}).then((function(i){$(n).modal("hide")}))}))}});jQuery(document).ready((function(){m.init()}))}});