var TouchSlide = function(e) {
    e = e || {};
    var t = {
        slideCell: e.slideCell || "#touchSlide",
        titCell: e.titCell || ".hd li",
        mainCell: e.mainCell || ".bd",
        effect: e.effect || "left",
        autoPlay: e.autoPlay || !1,
        delayTime: e.delayTime || 200,
        interTime: e.interTime || 2500,
        defaultIndex: e.defaultIndex || 0,
        titOnClassName: e.titOnClassName || "on",
        autoPage: e.autoPage || !1,
        prevCell: e.prevCell || ".prev",
        nextCell: e.nextCell || ".next",
        pageStateCell: e.pageStateCell || ".pageState",
        pnLoop: "undefined " == e.pnLoop ? !0 : e.pnLoop,
        startFun: e.startFun || null ,
        endFun: e.endFun || null ,
        switchLoad: e.switchLoad || null 
    }
      , n = document.getElementById(t.slideCell.replace("#", ""));
    if (!n)
        return !1;
    var a = function(e, t) {
        e = e.split(" ");
        var n = [];
        t = t || document;
        var a = [t];
        for (var l in e)
            0 != e[l].length && n.push(e[l]);
        for (var l in n) {
            if (0 == a.length)
                return !1;
            var i = [];
            for (var r in a)
                if ("#" == n[l][0])
                    i.push(document.getElementById(n[l].replace("#", "")));
                else if ("." == n[l][0])
                    for (var o = a[r].getElementsByTagName("*"), s = 0; s < o.length; s++) {
                        var c = o[s].className;
                        c && -1 != c.search(new RegExp("\\b" + n[l].replace(".", "") + "\\b")) && i.push(o[s])
                    }
                else
                    for (var o = a[r].getElementsByTagName(n[l]), s = 0; s < o.length; s++)
                        i.push(o[s]);
            a = i
        }
        return 0 == a.length || a[0] == t ? !1 : a
    }
      , l = function(e, t) {
        var n = document.createElement("div");
        n.innerHTML = t,
        n = n.children[0];
        var a = e.cloneNode(!0);
        return n.appendChild(a),
        e.parentNode.replaceChild(n, e),
        d = a,
        n
    }
      , i = function(e, t) {
        !e || !t || e.className && -1 != e.className.search(new RegExp("\\b" + t + "\\b")) || (e.className += (e.className ? " " : "") + t)
    }
      , r = function(e, t) {
        !e || !t || e.className && -1 == e.className.search(new RegExp("\\b" + t + "\\b")) || (e.className = e.className.replace(new RegExp("\\s*\\b" + t + "\\b","g"), ""))
    }
      , o = t.effect
      , s = a(t.prevCell, n)[0]
      , c = a(t.nextCell, n)[0]
      , u = a(t.pageStateCell)[0]
      , d = a(t.mainCell, n)[0];
    if (!d)
        return !1;
    var f, p, v = d.children.length, m = a(t.titCell, n), h = m ? m.length : v, g = t.switchLoad, T = parseInt(t.defaultIndex), L = parseInt(t.delayTime), b = parseInt(t.interTime), C = "false" == t.autoPlay || 0 == t.autoPlay ? !1 : !0, w = "false" == t.autoPage || 0 == t.autoPage ? !1 : !0, y = "false" == t.pnLoop || 0 == t.pnLoop ? !1 : !0, x = T, N = null , E = null , I = null , P = 0, k = 0, M = 0, S = 0, F = /hp-tablet/gi.test(navigator.appVersion), D = "ontouchstart" in window && !F, B = D ? "touchstart" : "mousedown", O = D ? "touchmove" : "", A = D ? "touchend" : "mouseup", H = d.parentNode.clientWidth, R = v;
    if (0 == h && (h = v),
    w) {
        h = v,
        m = m[0],
        m.innerHTML = "";
        var z = "";
        if (1 == t.autoPage || "true" == t.autoPage)
            for (var W = 0; h > W; W++)
                z += "<li>" + (W + 1) + "</li>";
        else
            for (var W = 0; h > W; W++)
                z += t.autoPage.replace("$", W + 1);
        m.innerHTML = z,
        m = m.children
    }
    "leftLoop" == o && (R += 2,
    d.appendChild(d.children[0].cloneNode(!0)),
    d.insertBefore(d.children[v - 1].cloneNode(!0), d.children[0])),
    f = l(d, '<div class="tempWrap" style="overflow:hidden; position:relative;"></div>'),
    d.style.cssText = "width:" + R * H + "px;position:relative;overflow:hidden;padding:0;margin:0;";
    for (var W = 0; R > W; W++)
        d.children[W].style.cssText = "display:table-cell;vertical-align:top;width:" + H + "px";
    var X = function() {
        "function" == typeof t.startFun && t.startFun(T, h)
    }
      , Y = function() {
        "function" == typeof t.endFun && t.endFun(T, h)
    }
      , V = function(e) {
        var t = ("leftLoop" == o ? T + 1 : T) + e
          , n = function(e) {
            for (var t = d.children[e].getElementsByTagName("img"), n = 0; n < t.length; n++)
                t[n].getAttribute(g) && (t[n].setAttribute("src", t[n].getAttribute(g)),
                t[n].removeAttribute(g))
        }
        ;
        if (n(t),
        "leftLoop" == o)
            switch (t) {
            case 0:
                n(v);
                break;
            case 1:
                n(v + 1);
                break;
            case v:
                n(0);
                break;
            case v + 1:
                n(1)
            }
    }
      , Z = function() {
        H = f.clientWidth,
        d.style.width = R * H + "px";
        for (var e = 0; R > e; e++)
            d.children[e].style.width = H + "px";
        var t = "leftLoop" == o ? T + 1 : T;
        $(-t * H, 0)
    }
    ;
    window.addEventListener("resize", Z, !1);
    var $ = function(e, t, n) {
        n = n ? n.style : d.style,
        n.webkitTransitionDuration = n.MozTransitionDuration = n.msTransitionDuration = n.OTransitionDuration = n.transitionDuration = t + "ms",
        n.webkitTransform = "translate(" + e + "px,0)translateZ(0)",
        n.msTransform = n.MozTransform = n.OTransform = "translateX(" + e + "px)"
    }
      , j = function(e) {
        switch (o) {
        case "left":
            T >= h ? T = e ? T - 1 : 0 : 0 > T && (T = e ? 0 : h - 1),
            null  != g && V(0),
            $(-T * H, L),
            x = T;
            break;
        case "leftLoop":
            null  != g && V(0),
            $(-(T + 1) * H, L),
            -1 == T ? (E = setTimeout(function() {
                $(-h * H, 0)
            }
            , L),
            T = h - 1) : T == h && (E = setTimeout(function() {
                $(-H, 0)
            }
            , L),
            T = 0),
            x = T
        }
        X(),
        I = setTimeout(function() {
            Y()
        }
        , L);
        for (var n = 0; h > n; n++)
            r(m[n], t.titOnClassName),
            n == T && i(m[n], t.titOnClassName);
        0 == y && (r(c, "nextStop"),
        r(s, "prevStop"),
        0 == T ? i(s, "prevStop") : T == h - 1 && i(c, "nextStop")),
        u && (u.innerHTML = "<span>" + (T + 1) + "</span>/" + h)
    }
    ;
    if (j(),
    C && (N = setInterval(function() {
        T++,
        j()
    }
    , b)),
    m)
        for (var W = 0; h > W; W++)
            !function() {
                var e = W;
                m[e].addEventListener("click", function() {
                    clearTimeout(E),
                    clearTimeout(I),
                    T = e,
                    j()
                }
                )
            }
            ();
    c && c.addEventListener("click", function() {
        (1 == y || T != h - 1) && (clearTimeout(E),
        clearTimeout(I),
        T++,
        j())
    }
    ),
    s && s.addEventListener("click", function() {
        (1 == y || 0 != T) && (clearTimeout(E),
        clearTimeout(I),
        T--,
        j())
    }
    );
    var q = function(e) {
        clearTimeout(E),
        clearTimeout(I),
        p = void 0,
        M = 0;
        var t = D ? e.touches[0] : e;
        P = t.pageX,
        k = t.pageY,
        d.addEventListener(O, G, !1),
        d.addEventListener(A, J, !1)
    }
      , G = function(e) {
        if (!D || !(e.touches.length > 1 || e.scale && 1 !== e.scale)) {
            var t = D ? e.touches[0] : e;
            if (M = t.pageX - P,
            S = t.pageY - k,
            "undefined" == typeof p && (p = !!(p || Math.abs(M) < Math.abs(S))),
            !p) {
                switch (e.preventDefault(),
                C && clearInterval(N),
                o) {
                case "left":
                    (0 == T && M > 0 || T >= h - 1 && 0 > M) && (M = .4 * M),
                    $(-T * H + M, 0);
                    break;
                case "leftLoop":
                    $(-(T + 1) * H + M, 0)
                }
                null  != g && Math.abs(M) > H / 3 && V(M > -0 ? -1 : 1)
            }
        }
    }
      , J = function(e) {
        0 != M && (e.preventDefault(),
        p || (Math.abs(M) > H / 10 && (M > 0 ? T-- : T++),
        j(!0),
        C && (N = setInterval(function() {
            T++,
            j()
        }
        , b))),
        d.removeEventListener(O, G, !1),
        d.removeEventListener(A, J, !1))
    }
    ;
    d.addEventListener(B, q, !1)
}
;
