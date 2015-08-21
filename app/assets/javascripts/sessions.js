$(document).on('submit', '#session-new', function (e) {
    var $this = $(this);
    var data = {};
    $.each($this.serializeArray(), function (index, field) {
        data[field.name] = field.value;
    });

    if (data['user[email]'].length <= 0) {
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
