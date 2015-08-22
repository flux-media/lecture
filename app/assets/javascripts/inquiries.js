$(document).on('submit', '#new-inquiry', function (e) {
    var $this = $(this);
    var data = {};
    $.each($this.serializeArray(), function (index, field) {
        data[field.name] = field.value;
    });

    if (data['name'].length <= 0) {
        $this.find('#name').focus();
        e.preventDefault();
        return false;
    }
    else if (data['email'].length <= 0) {
        $this.find('#email').focus();
        e.preventDefault();
        return false;
    }
    else if (data['content'].length <= 0) {
        $this.find('#content').focus();
        e.preventDefault();
        return false;
    }

    return true;
});
