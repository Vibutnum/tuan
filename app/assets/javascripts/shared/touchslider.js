!function(t, e) {
    "use strict";
    function i(t) {
        return null  == t ? t + "" : "object" == typeof t || "function" == typeof t ? C[D.call(t)] || "object" : typeof t
    }
    function n(t) {
        var e = i(t);
        return !!t && "function" != e && "string" != e && (0 === t.length || t.length && (1 == t.nodeType || t.length - 1 in t))
    }
    function s(t) {
        return (t + "").replace(/^-ms-/, "ms-").replace(/-([a-z]|[0-9])/gi, function(t, e) {
            return (e + "").toUpperCase()
        }
        )
    }
    function r(t) {
        var e = s(t)
          , i = s(k + e);
        return e in z && e || i in z && i || ""
    }
    function o(t) {
        return "function" == i(t)
    }
    function a(t) {
        var e, n = 0;
        if ("number" == i(t.length))
            n = t.length;
        else if ("keys" in Object)
            n = Object.keys(t).length;
        else
            for (e in t)
                t.hasOwnProperty(e) && n++;
        return n
    }
    function h(t, e) {
        return "item" in t ? t.item(e) : function() {
            var t, i = 0;
            for (t in this)
                if (i++ == e)
                    return this[t]
        }
        .call(t, e)
    }
    function c(t, e) {
        if (n(t)) {
            if ("function" == i(t.forEach))
                return t.forEach(e);
            for (var s, r = 0, o = t.length; o > r; r++)
                s = t[r],
                "undefined" != i(s) && e(s, r, t)
        } else {
            var a;
            for (a in t)
                e(a, t[a], t)
        }
    }
    function u(t) {
        var e = [];
        return c(t.children || t.childNodes, function(t) {
            1 == t.nodeType && e.push(t)
        }
        ),
        e
    }
    function l(e, i) {
        var n = t.getComputedStyle && t.getComputedStyle(e, null ) || e.currentStyle || e.style;
        return n[i]
    }
    function f(t, e) {
        c(e, function(e, i) {
            var n;
            switch (e) {
            case "float":
                n = r("cssFloat") ? "cssFloat" : "styleFloat";
                break;
            default:
                n = s(e)
            }
            try {
                t.style[n] = i
            } catch (o) {}
        }
        )
    }
    function p(t, e, n) {
        return "object" == i(e) ? c(e, function(e, i) {
            p(t, e, i)
        }
        ) : void c(e.split(" "), function(e) {
            t.addEventListener ? t.addEventListener(e, n, !1) : t.attachEvent ? t.attachEvent("on" + e, n) : t["on" + e] = n
        }
        )
    }
    function d(t, e, n) {
        return "object" == i(e) ? c(e, function(e, i) {
            d(t, e, i)
        }
        ) : void c(e.split(" "), function(e) {
            t.removeEventListener ? t.removeEventListener(e, n, !1) : t.detachEvent ? t.detachEvent("on" + e, n) : t["on" + e] = null 
        }
        )
    }
    function m() {
        var e;
        t.getSelection ? (e = getSelection(),
        "empty" in e ? e.empty() : "removeAllRanges" in e && e.removeAllRanges()) : S.selection.empty()
    }
    function g(t, e, i, n) {
        return -i * ((t = t / n - 1) * t * t * t - 1) + e
    }
    function v(t) {
        var e, i, n = {}, s = t.which, r = t.button;
        if (c("wheelDelta detail which keyCode".split(" "), function(e) {
            n[e] = t[e]
        }
        ),
        n.oldEvent = t,
        n.type = t.type.toLowerCase(),
        n.eventType = E[n.type] || n.type,
        n.eventCode = P[n.type] || 0,
        n.pointerType = F[t.pointerType] || t.pointerType || n.eventType,
        n.target = t.target || t.srcElement || S.documentElement,
        3 === n.target.nodeType && (n.target = n.target.parentNode),
        n.preventDefault = function() {
            t.preventDefault && t.preventDefault(),
            n.returnValue = t.returnValue = !1
        }
        ,
        e = A[n.eventType]) {
            switch (n.eventType) {
            case "mouse":
            case "pointer":
                var o = t.pointerId || 0;
                3 == n.eventCode ? delete e[o] : e[o] = t;
                break;
            case "touch":
                A[n.eventType] = e = t.touches
            }
            (i = h(e, 0)) && (n.clientX = i.clientX,
            n.clientY = i.clientY),
            n.button = 4 > s ? Math.max(0, s - 1) : 4 & r && 1 || 2 & r,
            n.length = a(e)
        }
        return n
    }
    var y = "2.0.1"
      , T = 0
      , w = t.requestAnimationFrame || t.webkitRequestAnimationFrame || t.mozRequestAnimationFrame || t.msRequestAnimationFrame || function(t) {
        var e = +new Date
          , i = Math.max(1e3 / 60, 1e3 / 60 - (e - T));
        return T = e + i,
        setTimeout(t, i)
    }
      , b = t.cancelAnimationFrame || t.webkitCancelAnimationFrame || t.webkitCancelRequestAnimationFrame || t.mozCancelRequestAnimationFrame || t.msCancelRequestAnimationFrame || clearTimeout
      , S = t.document
      , z = S.createElement("div").style
      , k = function() {
        for (var t, e = "-webkit- -moz- -o- -ms-".split(" "); t = e.shift(); )
            if (s(t + "transform") in z)
                return t;
        return ""
    }
    ()
      , x = r("transition")
      , D = Object.prototype.toString
      , M = [].slice
      , C = {}
      , E = {}
      , P = {
        click: 4,
        mousewheel: 5,
        dommousescroll: 5,
        keydown: 6,
        resize: 7
    }
      , F = {
        2: "touch",
        3: "pen",
        4: "mouse",
        pen: "pen"
    }
      , j = []
      , L = []
      , A = (function() {
        var t = {}
          , e = {
            start: 1,
            down: 1,
            move: 2,
            end: 3,
            up: 3,
            cancel: 3
        };
        return c("mouse touch pointer MSPointer-".split(" "), function(i) {
            var n = /pointer/i.test(i) ? "pointer" : i;
            t[n] = t[n] || {},
            F[n] = n,
            c(e, function(e, r) {
                var o = s(i + e);
                t[n][o] = r,
                E[o.toLowerCase()] = n,
                P[o.toLowerCase()] = r,
                1 == r ? j.push(o) : L.push(o)
            }
            )
        }
        ),
        c("otransitionend oTransitionEnd webkitTransitionEnd mozTransitionEnd MSTransitionEnd transitionend".split(" "), function(t) {
            j.push(t),
            P[t.toLowerCase()] = 8
        }
        ),
        t
    }
    (),
    {
        touch: {},
        pointer: {},
        mouse: {}
    });
    c("Boolean Number String Function Array Date RegExp Object Error".split(" "), function(t) {
        C["[object " + t + "]"] = t.toLowerCase()
    }
    ),
    e.prototype = {
        version: y,
        constructor: e,
        latestTime: 0,
        init: function(e) {
            var i = this
              , n = this.handler = function(t) {
                i.handleEvent(t)
            }
            ;
            this.events = {},
            this.duration = isNaN(parseInt(e.duration)) ? 600 : parseInt(e.duration),
            this.direction = 0 == parseInt(e.direction) ? 0 : 1,
            this.current = parseInt(e.start) || 0,
            this.mouse = null  == e.mouse ? !0 : !!e.mouse,
            this.mousewheel = !!e.mousewheel,
            this.interval = parseInt(e.interval) || 5e3,
            this.playing = null  == e.autoplay ? !0 : !!e.autoplay,
            this.arrowkey = !!e.arrowkey,
            this.fullsize = null  == e.fullsize ? !0 : !!e.fullsize,
            this.align = e.align || "center",
            this.pages = u(this.container),
            this.length = this.pages.length,
            this.pageData = [],
            p(this.container, j.join(" ") + " click" + (this.mousewheel ? " mousewheel DOMMouseScroll" : ""), n),
            p(S, L.join(" ") + (this.arrowkey ? " keydown" : ""), n),
            p(t, "resize", n),
            c(this.pages, function(t) {
                i.pageData.push({
                    cssText: t.style.cssText || ""
                })
            }
            ),
            this.pageData.container = this.container.style.cssText || "",
            this.on({
                before: function() {
                    clearTimeout(this.playTimer)
                },
                dragStart: function() {
                    clearTimeout(this.playTimer),
                    m()
                },
                after: this.firePlay
            }).firePlay(),
            this.comment = document.createComment(" Powered by TouchSlider v" + this.version + "  https://github.com/qiqiboy/touchslider "),
            this.container.appendChild(this.comment),
            this.resize()
        },
        resize: function() {
            var t, e = this, i = this.direction ? "height" : "width", n = l(this.container, "position");
            return this.size = this.getSize(this.offsetParent = this.container["absolute" == n || "fixed" == n ? "offsetParent" : "parentNode"] || S.body),
            t = {
                "float": "left",
                display: "inline"
            },
            c(this.pages, function(n) {
                e.fullsize && (t[i] = e.size - e.getMarginSize(n) - e.getPaddingSize(n) - e.getBorderSize(n) + "px"),
                "height" == i && (t.clear = "both"),
                f(n, t)
            }
            ),
            this.total = this.getSum(0, this.length),
            t = {},
            "static" == n && (t = {
                position: "relative"
            }),
            t[x] = "none",
            t[i] = this.total + "px",
            t[this.direction ? "top" : "left"] = this.getPos(this.current) + "px",
            b(this.timer),
            f(this.container, t),
            clearTimeout(this.playTimer),
            this.firePlay()
        },
        on: function(t, e) {
            var n = this;
            return "object" == i(t) ? c(t, function(t, e) {
                n.on(t, e)
            }
            ) : (this.events[t] || (this.events[t] = []),
            this.events[t].push(e)),
            this
        },
        fire: function(t) {
            var e = this
              , i = M.call(arguments, 1);
            return c(this.events[t] || [], function(t) {
                o(t) && t.apply(e, i)
            }
            ),
            this
        },
        isStatic: function() {
            return !this.timer && !this.drag
        },
        prev: function() {
            return this.slide((this.current - 1 + this.length) % this.length)
        },
        next: function() {
            return this.slide((this.current + 1) % this.length)
        },
        play: function() {
            return this.playing = !0,
            this.firePlay()
        },
        firePlay: function() {
            var t = this;
            return this.playing && (this.playTimer = setTimeout(function() {
                t.next()
            }
            , this.interval)),
            this
        },
        pause: function() {
            return this.playing = !1,
            clearTimeout(this.playTimer),
            this
        },
        slide: function(t) {
            function e() {
                var t = Math.min(o, +new Date - r)
                  , s = g(t, 0, 1, o);
                cp = (i - u) * s + u,
                n.container.style[p] = cp + "px",
                t == o ? n.end() : n.timer = w(e)
            }
            var i, n = this, s = this.direction, r = +new Date, o = this.duration, a = this.current, h = Math.min(Math.max(0, t), this.length - 1), c = this.getSum(h, h + 1), u = parseFloat(l(this.container, s ? "top" : "left")) || 0, p = s ? "top" : "left", d = {};
            i = this.getPos(h),
            o *= Math.min(1, Math.abs(i - u) / c) || 10,
            this.current = h,
            this.latestTime = r + o,
            this.fire("before", a, h),
            this.end = function() {
                delete n.timer,
                n.fire("after", h, a)
            }
            ,
            x ? (this.timer = 1,
            d[x] = p + " " + o + "ms ease",
            d[p] = i + "px",
            f(this.container, d)) : (b(this.timer),
            e())
        },
        handleEvent: function(t) {
            var e = v(t)
              , i = e.button < 1 && e.length < 2 && (!this.pointerType || this.pointerType == e.eventType) && (this.mouse || "mouse" != e.pointerType);
            switch (e.eventCode) {
            case 2:
                if (i && this.rect) {
                    var n = this.current
                      , s = this.direction
                      , r = [e.clientX, e.clientY]
                      , o = this.rect
                      , a = r[s] - o[s];
                    null  == this.drag && o.toString() != r.toString() && (this.drag = Math.abs(a) >= Math.abs(r[1 - s] - o[1 - s]),
                    this.drag && this.fire("dragStart", e)),
                    this.drag && (this.pages[n + (a > 0 ? -1 : 1)] || (a /= Math.abs(a) / this.size + 2),
                    this.container.style[s ? "top" : "left"] = this.startPos + a + "px",
                    this.fire("dragMove", e),
                    this._offset = a,
                    e.preventDefault())
                }
                break;
            case 1:
            case 3:
                if (i) {
                    var h, a, u, f, p, d, m, g = this, n = this.current, y = this.direction ? "top" : "left";
                    if (e.length && (1 == e.eventCode || this.drag))
                        f = e.target.nodeName.toLowerCase(),
                        clearTimeout(this.eventTimer),
                        this.pointerType || (this.pointerType = e.eventType),
                        this.startPos = parseFloat(l(this.container, y)) || 0,
                        x ? this.container.style[x] = "none" : this.timer && (b(this.timer),
                        delete this.timer),
                        this.rect = [e.clientX, e.clientY],
                        this.time = +new Date,
                        this.container.style[y] = this.startPos + "px",
                        "touch" == e.eventType || "a" != f && "img" != f || e.preventDefault();
                    else if (u = this.time) {
                        if (a = this._offset || 0,
                        h = this.drag,
                        d = this.startPos + a,
                        m = this.getPos(n),
                        c("rect drag time startPos _offset".split(" "), function(t) {
                            delete g[t]
                        }
                        ),
                        h) {
                            for (p = a > 0 ? 1 : -1; p * (d - m) > this.getOuterSize(this.pages[n]) / 2 && this.pages[n - p]; )
                                m = this.getPos(n -= p);
                            Math.abs(a) > 20 && +new Date - u < 500 && (n -= p),
                            this.fire("dragEnd", e),
                            e.preventDefault()
                        }
                        d != m ? this.slide(n) : h && this.firePlay(),
                        this.eventTimer = setTimeout(function() {
                            delete g.pointerType
                        }
                        , 400)
                    }
                }
                break;
            case 4:
                this.timer && e.preventDefault();
                break;
            case 5:
                if (e.preventDefault(),
                this.isStatic() && +new Date - this.latestTime > Math.max(1e3 - this.duration, 0)) {
                    var T = e.wheelDelta || -e.detail;
                    Math.abs(T) >= 3 && this[T > 0 ? "prev" : "next"]()
                }
                break;
            case 6:
                var f = e.target.nodeName.toLowerCase();
                if (this.isStatic() && "input" != f && "textarea" != f && "select" != f)
                    switch (e.keyCode || e.which) {
                    case 33:
                    case 37:
                    case 38:
                        this.prev();
                        break;
                    case 32:
                    case 34:
                    case 39:
                    case 40:
                        this.next();
                        break;
                    case 35:
                        this.slide(this.length - 1);
                        break;
                    case 36:
                        this.slide(0)
                    }
                break;
            case 7:
                this.resize();
                break;
            case 8:
                t.propertyName == (this.direction ? "top" : "left") && (this.container.style[x] = "none",
                this.end())
            }
        },
        getSum: function(t, e) {
            for (var i = 0; e > t; )
                i += this.getOuterSize(this.pages[t++], !0);
            return i
        },
        getPos: function(t) {
            var e = this.direction ? "Top" : "Left"
              , i = this.getOuterSize(this.pages[t], !0)
              , n = this.getSum(0, t) + this["getMargin" + e + "Size"](this.container) + this["getBorder" + e + "Size"](this.container);
            switch (this.align) {
            case "top":
            case "left":
                return -n;
            case "bottom":
            case "right":
                return this.size - i - n;
            default:
                return (this.size - i) / 2 - n
            }
        },
        getOuterSize: function(t, e) {
            return t[this.direction ? "offsetHeight" : "offsetWidth"] + (e ? this.getMarginSize(t) : 0)
        },
        getInnerSize: function(t) {
            return this.getOuterSize(t) - this.getBorderSize(t)
        },
        getSize: function(t) {
            return t[this.direction ? "offsetHeight" : "offsetWidth"] - this.getPaddingSize(t) - this.getBorderSize(t)
        },
        destroy: function() {
            var e = this.pageData;
            return d(this.container, j.join(" ") + " click" + (this.mousewheel ? " mousewheel DOMMouseScroll" : ""), this.handler),
            d(S, L.join(" ") + (this.arrowkey ? " keydown" : ""), this.handler),
            d(t, "resize", this.handler),
            c(this.pages, function(t, i) {
                t.style.cssText = e[i].cssText
            }
            ),
            this.container.style.cssText = e.container,
            this.container.removeChild(this.comment),
            this.length = 0,
            this.pause()
        },
        refresh: function() {
            return this.pages = u(this.container),
            this.length = this.pages.length,
            this.current = Math.max(Math.min(this.length - 1, this.current), 0),
            this.resize()
        },
        append: function(t, e) {
            return null  == e && (e = this.pages.length),
            this.pageData.splice(e, 0, {
                cssText: t.style.cssText || ""
            }),
            this.container.insertBefore(t, this.pages[e] || null ),
            this.refresh()
        },
        prepend: function(t) {
            return this.append(t, 0)
        },
        insertBefore: function(t, e) {
            return this.append(t, e - 1)
        },
        insertAfter: function(t, e) {
            return this.append(t, e + 1)
        },
        remove: function(t) {
            return this.container.removeChild(this.pages[t]),
            this.pageData.splice(t, 1),
            this.refresh()
        }
    },
    c("margin padding border".split(" "), function(t) {
        c("Top Left Right Bottom".split(" "), function(i) {
            var n = t + i;
            e.prototype[s("get-" + n) + "Size"] = function(e) {
                return parseFloat(l(e, n + ("border" == t ? "Width" : ""))) || 0
            }
        }
        ),
        e.prototype[s("get-" + t) + "Size"] = function(e) {
            return this[s("get-" + t) + (this.direction ? "Top" : "Left") + "Size"](e) + this[s("get-" + t) + (this.direction ? "Bottom" : "Right") + "Size"](e)
        }
    }
    ),
    "function" == typeof define && define.amd ? define("TouchSlider", function() {
        return e
    }
    ) : t.TouchSlider = e
}
(window, function(t, e) {
    return this instanceof arguments.callee ? (this.container = "string" == typeof t ? document.getElementById(t) : t,
    void this.init(e || {})) : new arguments.callee(t,e)
}
);
