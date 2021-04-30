"use strict"

// var images = document.querySelectorAll(".lazyload")
// if (images.length) {
//   lazyload(images)
// }

/* lazyload */
document.addEventListener("DOMContentLoaded", function() {
  let lazyImages = [].slice.call(document.querySelectorAll("img.lazy"))
  let active = false

  const lazyLoad = function() {
    if (active === false) {
      active = true

      setTimeout(function() {
        lazyImages.forEach(function(lazyImage) {
          if (
            lazyImage.getBoundingClientRect().top <= window.innerHeight &&
            lazyImage.getBoundingClientRect().bottom >= 0 &&
            getComputedStyle(lazyImage).display !== "none"
          ) {
            lazyImage.src = lazyImage.dataset.src
            lazyImage.srcset = lazyImage.dataset.srcset
            lazyImage.classList.remove("lazy")
            lazyImage.classList.add("loaded")

            lazyImages = lazyImages.filter(function(image) {
              return image !== lazyImage
            })

            if (lazyImages.length === 0) {
              document.removeEventListener("scroll", lazyLoad)
              window.removeEventListener("resize", lazyLoad)
              window.removeEventListener("orientationchange", lazyLoad)
            }
          }
        })

        active = false
      }, 200)
    }
  }

  document.addEventListener("scroll", lazyLoad)
  window.addEventListener("resize", lazyLoad)
  window.addEventListener("orientationchange", lazyLoad)
})

/* app */
/* Vue.use(VueLazyload)
var app = new Vue({
  el: "#main",
  data: {
    message: "Hello Vue!",
  },
}) */
$(document).ready(function() {
  $('[data-fancybox="gallery"]').fancybox({
    buttons: ["zoom", "share", "slideShow", "fullScreen", "download", "thumbs", "close"],
  })
  $('[data-fancybox="files"]').fancybox({
    buttons: ["zoom", "share", "slideShow", "fullScreen", "download", "thumbs", "close"],
  })
  $("#share").jsSocials({
    // showLabel: false,
    showCount: false,
    shareIn: "popup",
    shares: ["twitter", { share: "facebook", label: "แชร์" }, "googleplus", "linkedin", "email"],
  })
})
$("#news-index-pjax").on("pjax:success", function() {
  $("html,body").animate(
    {
      scrollTop: $("#news").offset().top - 30,
    },
    1500,
    "easeInOutExpo"
  )
})
/* const socket = io("http://10.40.58.74:3000", {
  path: "/wss",
})
socket.on("screen finish", function (data) {
  console.log("screen finish", data)
})
socket.on("doctor finish", function (data) {
  console.log("doctor finish", data)
})
socket.on("paid finish", function (data) {
  console.log("paid finish", data)
})
socket.on("dispensing finish", function (data) {
  console.log("dispensing finish", data)
})
socket.on("test", function (data) {
  console.log("test", data)
}) */

// socket.emit({ receiveEvent: "test", hn: "473871000", caller_id: 91422, queue_id: 12 })
