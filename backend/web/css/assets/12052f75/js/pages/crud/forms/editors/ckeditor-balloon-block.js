!function(e){var o={};function t(r){if(o[r])return o[r].exports;var n=o[r]={i:r,l:!1,exports:{}};return e[r].call(n.exports,n,n.exports,t),n.l=!0,n.exports}t.m=e,t.c=o,t.d=function(e,o,r){t.o(e,o)||Object.defineProperty(e,o,{enumerable:!0,get:r})},t.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},t.t=function(e,o){if(1&o&&(e=t(e)),8&o)return e;if(4&o&&"object"==typeof e&&e&&e.__esModule)return e;var r=Object.create(null);if(t.r(r),Object.defineProperty(r,"default",{enumerable:!0,value:e}),2&o&&"string"!=typeof e)for(var n in e)t.d(r,n,function(o){return e[o]}.bind(null,n));return r},t.n=function(e){var o=e&&e.__esModule?function(){return e.default}:function(){return e};return t.d(o,"a",o),o},t.o=function(e,o){return Object.prototype.hasOwnProperty.call(e,o)},t.p="",t(t.s=548)}({548:function(e,o,t){"use strict";var r={init:function(){BalloonEditor.create(document.querySelector("#kt-ckeditor-1")).then(e=>{console.log(e)}).catch(e=>{console.error(e)}),BalloonEditor.create(document.querySelector("#kt-ckeditor-2")).then(e=>{console.log(e)}).catch(e=>{console.error(e)}),BalloonEditor.create(document.querySelector("#kt-ckeditor-3")).then(e=>{console.log(e)}).catch(e=>{console.error(e)}),BalloonEditor.create(document.querySelector("#kt-ckeditor-4")).then(e=>{console.log(e)}).catch(e=>{console.error(e)}),BalloonEditor.create(document.querySelector("#kt-ckeditor-5")).then(e=>{console.log(e)}).catch(e=>{console.error(e)})}};jQuery(document).ready((function(){r.init()}))}});