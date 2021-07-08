---
layout: page
title: "Cookies policy"
---

#### What are cookies?

A cookie is simply a technology for remembering something about you. They are small text files which are transferred to your computer or mobile when you visit a website or app. [Learn more.](https://www.cookiesandyou.com/)


#### What cookies do we use?

**Functional cookie**<br/>
We use a functional cookie ("cookiesOK") to indicate if you agree to our use of cookies.

**Google Analytics**<br/>
We use the Google Analytics service to help us to improve our website by collecting and reporting information on how you use it.<br/>
In order to track your session usage, Google uses a cookie ("_ga") with a randomly-generated ClientID in your browser. This ID is anonymized and contains no identifiable information like email, phone number, name, etc. We also send Google your IP Address. We use Google Analytics to track aggregated website behaviour, such as what pages you looked at, for how long, and so on.


#### Controlling cookies

- [Learn how to control and disable the cookies you don’t want.](https://www.cookiesandyou.com/)
- Install the [Google Analytics opt-out browser add-on](https://support.google.com/analytics/answer/181881) to prevent Google Analytics that is running on websites from sharing information with Google Analytics about visit activity.

<button type="button" class="btn btn-outline-secondary deletecookies">Stop the use of cookies on this site</button>



<!-- cookie removed OK alert -->
<div class="modal cookieremoved" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Cookie removed</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>We've removed our cookie from your browser and will no longer use cookies on this site.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>



<script type="text/javascript">
var deleteCookies = document.querySelector(".deletecookies");

// When clicking on the delete button: delete the "cookiesOK" cookie (set expires to past)
deleteCookies.addEventListener("click", function () {
  //console.log ("delete cookie")
  document.cookie = "cookiesOK=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
  $('.cookieremoved').modal("show");
});
</script>
