$(document).on('submit', '#user-new', function (e) {
    var $this = $(this);
    var data = {};
    $.each($this.serializeArray(), function (index, field) {
        data[field.name] = field.value;
    });

    var l = Ladda.create(document.querySelector('#submit-button'));
    l.start();

    if (data['user[email]'].length <= 0) {
        $this.find('#user_email').focus();
        l.stop();
        e.preventDefault();
        return false;
    } else if (!validateEmail(data['user[email]'])) {
        $this.find('#user_email').focus();
        l.stop();
        e.preventDefault();
        return false;
    } else if (data['user[password]'].length <= 0) {
        $this.find('#user_password').focus();
        l.stop();
        e.preventDefault();
        return false;
    } else if (data['user[name]'].length <= 0) {
        $this.find('#user_name').focus();
        l.stop();
        e.preventDefault();
        return false;
    } else if (!$this.find('#user_terms').is(':checked')) {
        $this.find('#user_terms').focus();
        l.stop();
        e.preventDefault();
        return false;
    }

    // From http://stackoverflow.com/questions/46155/validate-email-address-in-javascript
    function validateEmail(email) {
        var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        return re.test(email);
    }
});

