$(document).on('submit', '#new-session', function (e) {
    var $this = $(this);
    var data = {};
    $.each($this.serializeArray(), function (index, field) {
        data[field.name] = $.trim(field.value);
    });

    if (data['user[email]'].length <= 0 || !validateEmail(data['user[email]'])) {
        $this.find('#user_email').focus();
        e.preventDefault();
        return false;
    }
    else if (data['user[password]'].length <= 0) {
        $this.find('#user_password').focus();
        e.preventDefault();
        return false;
    }

    return true;
});
