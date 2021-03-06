/* SmoothScroll */
!(function() {
  function e() {
    var e = !1
    e && f("keydown", i), y.keyboardSupport && !e && a("keydown", i)
  }
  function t() {
    if (document.body) {
      var t = document.body,
        n = document.documentElement,
        r = window.innerHeight,
        i = t.scrollHeight
      if (((x = document.compatMode.indexOf("CSS") >= 0 ? n : t), (m = t), e(), (S = !0), top != self)) w = !0
      else if (i > r && (t.offsetHeight <= r || n.offsetHeight <= r)) {
        var s = !1,
          o = function() {
            s ||
              n.scrollHeight == document.height ||
              ((s = !0),
              setTimeout(function() {
                ;(n.style.height = document.height + "px"), (s = !1)
              }, 500))
          }
        if (((n.style.height = "auto"), setTimeout(o, 10), x.offsetHeight <= r)) {
          var u = document.createElement("div")
          ;(u.style.clear = "both"), t.appendChild(u)
        }
      }
      y.fixedBackground || b || ((t.style.backgroundAttachment = "scroll"), (n.style.backgroundAttachment = "scroll"))
    }
  }
  function n(e, t, n, r) {
    if ((r || (r = 1e3), c(t, n), 1 != y.accelerationMax)) {
      var i = +new Date(),
        s = i - L
      if (s < y.accelerationDelta) {
        var o = (1 + 30 / s) / 2
        o > 1 && ((o = Math.min(o, y.accelerationMax)), (t *= o), (n *= o))
      }
      L = +new Date()
    }
    if ((C.push({ x: t, y: n, lastX: 0 > t ? 0.99 : -0.99, lastY: 0 > n ? 0.99 : -0.99, start: +new Date() }), !k)) {
      var u = e === document.body,
        a = function() {
          for (var i = +new Date(), s = 0, o = 0, f = 0; f < C.length; f++) {
            var l = C[f],
              c = i - l.start,
              h = c >= y.animationTime,
              p = h ? 1 : c / y.animationTime
            y.pulseAlgorithm && (p = v(p))
            var d = (l.x * p - l.lastX) >> 0,
              m = (l.y * p - l.lastY) >> 0
            ;(s += d), (o += m), (l.lastX += d), (l.lastY += m), h && (C.splice(f, 1), f--)
          }
          u ? window.scrollBy(s, o) : (s && (e.scrollLeft += s), o && (e.scrollTop += o)),
            t || n || (C = []),
            C.length ? _(a, e, r / y.frameRate + 1) : (k = !1)
        }
      _(a, e, 0), (k = !0)
    }
  }
  function r(e) {
    S || t()
    var r = e.target,
      i = u(r)
    if (!i || e.defaultPrevented || l(m, "embed") || (l(r, "embed") && /\.pdf/i.test(r.src))) return !0
    var s = e.wheelDeltaX || 0,
      o = e.wheelDeltaY || 0
    return (
      s || o || (o = e.wheelDelta || 0),
      !y.touchpadSupport && h(o)
        ? !0
        : (Math.abs(s) > 1.2 && (s *= y.stepSize / 120),
          Math.abs(o) > 1.2 && (o *= y.stepSize / 120),
          n(i, -s, -o),
          e.preventDefault(),
          void 0)
    )
  }
  function i(e) {
    var t = e.target,
      r = e.ctrlKey || e.altKey || e.metaKey || (e.shiftKey && e.keyCode !== N.spacebar)
    if (/input|textarea|select|embed/i.test(t.nodeName) || t.isContentEditable || e.defaultPrevented || r) return !0
    if (l(t, "button") && e.keyCode === N.spacebar) return !0
    var i,
      s = 0,
      o = 0,
      a = u(m),
      f = a.clientHeight
    switch ((a == document.body && (f = window.innerHeight), e.keyCode)) {
      case N.up:
        o = -y.arrowScroll
        break
      case N.down:
        o = y.arrowScroll
        break
      case N.spacebar:
        ;(i = e.shiftKey ? 1 : -1), (o = -i * f * 0.9)
        break
      case N.pageup:
        o = 0.9 * -f
        break
      case N.pagedown:
        o = 0.9 * f
        break
      case N.home:
        o = -a.scrollTop
        break
      case N.end:
        var c = a.scrollHeight - a.scrollTop - f
        o = c > 0 ? c + 10 : 0
        break
      case N.left:
        s = -y.arrowScroll
        break
      case N.right:
        s = y.arrowScroll
        break
      default:
        return !0
    }
    n(a, s, o), e.preventDefault()
  }
  function s(e) {
    m = e.target
  }
  function o(e, t) {
    for (var n = e.length; n--; ) A[M(e[n])] = t
    return t
  }
  function u(e) {
    var t = [],
      n = x.scrollHeight
    do {
      var r = A[M(e)]
      if (r) return o(t, r)
      if ((t.push(e), n === e.scrollHeight)) {
        if (!w || x.clientHeight + 10 < n) return o(t, document.body)
      } else if (
        e.clientHeight + 10 < e.scrollHeight &&
        ((overflow = getComputedStyle(e, "").getPropertyValue("overflow-y")),
        "scroll" === overflow || "auto" === overflow)
      )
        return o(t, e)
    } while ((e = e.parentNode))
  }
  function a(e, t, n) {
    window.addEventListener(e, t, n || !1)
  }
  function f(e, t, n) {
    window.removeEventListener(e, t, n || !1)
  }
  function l(e, t) {
    return (e.nodeName || "").toLowerCase() === t.toLowerCase()
  }
  function c(e, t) {
    ;(e = e > 0 ? 1 : -1), (t = t > 0 ? 1 : -1), (E.x !== e || E.y !== t) && ((E.x = e), (E.y = t), (C = []), (L = 0))
  }
  function h(e) {
    if (e) {
      ;(e = Math.abs(e)), T.push(e), T.shift(), clearTimeout(O)
      var t = T[0] == T[1] && T[1] == T[2],
        n = p(T[0], 120) && p(T[1], 120) && p(T[2], 120)
      return !(t || n)
    }
  }
  function p(e, t) {
    return Math.floor(e / t) == e / t
  }
  function d(e) {
    var t, n, r
    return (
      (e *= y.pulseScale),
      1 > e
        ? (t = e - (1 - Math.exp(-e)))
        : ((n = Math.exp(-1)), (e -= 1), (r = 1 - Math.exp(-e)), (t = n + r * (1 - n))),
      t * y.pulseNormalize
    )
  }
  function v(e) {
    return e >= 1 ? 1 : 0 >= e ? 0 : (1 == y.pulseNormalize && (y.pulseNormalize /= d(1)), d(e))
  }
  var m,
    g = {
      frameRate: 150,
      animationTime: 800,
      stepSize: 120,
      pulseAlgorithm: !0,
      pulseScale: 8,
      pulseNormalize: 1,
      accelerationDelta: 20,
      accelerationMax: 1,
      keyboardSupport: !0,
      arrowScroll: 50,
      touchpadSupport: !0,
      fixedBackground: !0,
      excluded: "",
    },
    y = g,
    b = !1,
    w = !1,
    E = { x: 0, y: 0 },
    S = !1,
    x = document.documentElement,
    T = [120, 120, 120],
    N = { left: 37, up: 38, right: 39, down: 40, spacebar: 32, pageup: 33, pagedown: 34, end: 35, home: 36 },
    y = g,
    C = [],
    k = !1,
    L = +new Date(),
    A = {}
  setInterval(function() {
    A = {}
  }, 1e4)
  var O,
    M = (function() {
      var e = 0
      return function(t) {
        return t.uniqueID || (t.uniqueID = e++)
      }
    })(),
    _ = (function() {
      return (
        window.requestAnimationFrame ||
        window.webkitRequestAnimationFrame ||
        function(e, t, n) {
          window.setTimeout(e, n || 1e3 / 60)
        }
      )
    })(),
    D = /chrome/i.test(window.navigator.userAgent),
    P = "onmousewheel" in document
  P && D && (a("mousedown", s), a("mousewheel", r), a("load", t))
})()
