jQuery.noConflict()(function(a) {
    a(document).ready(function() {
        a("#ajax-contact-form").submit(function() {
            var b = a(this).serialize();
            a.ajax({
                type: "POST",
                url: "contact.php",
                data: b,
                success: function(c) {
                    a("#note").ajaxComplete(function(f, e, d) {
                        if (c == "OK") {
                            result = '<div class="notification_ok">Message was sent to website administrator, thank you!</div>';
                            a("#contacts-form").hide()
                        } else {
                            result = c
                        }
                        a(this).html(result)
                    })
                }
            });
            return false
        })
    })
});