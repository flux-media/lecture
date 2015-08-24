$(document).on('submit', '#new-inquiry', function (e) {
    e.preventDefault();

    var $this = $(this);
    var data = {};
    $.each($this.serializeArray(), function (index, field) {
        data[field.name] = $.trim(field.value);
    });

    var l = Ladda.create(document.querySelector('#new-inquiry-button'));
    l.start();

    if (data['name'].length <= 0) {
        $this.find('#name').focus();
        l.stop();
        return false;
    }
    else if (data['email'].length <= 0 || !validateEmail(data['email'])) {
        $this.find('#email').focus();
        l.stop();
        return false;
    }
    else if (data['content'].length <= 0) {
        $this.find('#content').focus();
        l.stop();
        return false;
    }

    $.ajax({
        method: 'POST',
        url: $this.attr('action'),
        data: data,
        success: function (response) {
            l.stop();
            swal({
                title: response.data.title,
                text: response.data.text,
                type: response.data.type,
                confirmButtonText: response.data.confirmButtonText
            });

            if (response.result === 0) {
                $this.find('#name').val('');
                $this.find('#email').val('');
                $this.find('#content').val('');
            }
        },
        error: function () {
            l.stop();
            var locales_error = $('#locales_error');
            swal({
                title: locales_error.data('title'),
                text: locales_error.data('text'),
                type: 'error',
                confirmButtonText: locales_error.data('confirmButtonText')
            });
        }
    });
});
