/*
 * Based op Bootstrap Cookie Alert by Wruczek
 * https://github.com/Wruczek/Bootstrap-Cookie-Alert
 * Released under MIT license
 */
(function () {
    "use strict";
    var cookieAlert = document.querySelector(".cookiealert");
    var acceptCookies = document.querySelector(".acceptcookies");
    var declineCookies = document.querySelector(".declinecookies");

    if (!cookieAlert) {
       return;
    }

    cookieAlert.offsetHeight; // Force browser to trigger reflow (https://stackoverflow.com/a/39451131)


    // No "cookiesOK" cookie -> show cookie banner with choice
    // If "cookiesOK" cookie = true -> enable Google Analytics
    // Else declined -> do nothing
    if (!getCookie("cookiesOK")) {
        cookieAlert.classList.add("show");
    } else if (getCookie("cookiesOK") == "true"){
        enableAnalytics ();
    }


    // When clicking on the AGREE button:
    // create a 90 day cookie to remember user's choice,
    // enable Google Analytics,
    // and close the banner
    acceptCookies.addEventListener("click", function () {
        //console.log ("accept cookies");
        setCookie("cookiesOK", true, 90);
        cookieAlert.classList.remove("show");
        enableAnalytics ();

        // dispatch the accept event
        window.dispatchEvent(new Event("cookieAlertAccept"))
    });


    // When clicking on the DECLINE button:
    // create a 90 day cookie to remember user's choice,
    // enable Google Analytics,
    // and close the banner
    declineCookies.addEventListener("click", function () {
        //console.log ("decline cookies");
        setCookie("cookiesOK", false, 90);
        cookieAlert.classList.remove("show");

        // dispatch the accept event
        window.dispatchEvent(new Event("cookieAlertAccept"))
    });




    // Enable Google Analytics (only called if accepted)
    // vets = UA-921739-25
    function enableAnalytics (){
      $.ajax({
        url: "https://www.googletagmanager.com/gtag/js?id=UA-921739-25XX",
        dataType: "script",
        cache: true,
        success: function() {
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());
          gtag('config', 'UA-921739-25xx');
          //console.log("tag Google Analytics pageload");
        }
      });

    }



    // Cookie functions from w3schools
    function setCookie(cname, cvalue, exdays) {
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        var expires = "expires=" + d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    }

    function getCookie(cname) {
        var name = cname + "=";
        var decodedCookie = decodeURIComponent(document.cookie);
        var ca = decodedCookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) === ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) === 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }
})();
