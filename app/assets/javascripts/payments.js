$(document).on('submit', '#new-payment', function (e) {
    e.preventDefault();

    var $this = $(this);

    var l = Ladda.create(document.querySelector('#new-payment-button'));
    l.start();

    if ($('input[name=pricing]:checked', $this).length <= 0) {
        l.stop();
        $('input[name=pricing]', $this).first().focus();
        return false;
    }

    $.ajax({
        method: 'POST',
        url: $this.attr('action'),
        data: {
            pricing_id: $.trim($('input[name=pricing]:checked', $this).
                first().val()),
            authenticity_token: $.trim($('meta[name=csrf-token]').attr('content'))
        },
        success: function (response) {
            l.stop();
            swal({
                title: response.data.title,
                text: response.data.text,
                type: response.data.type,
                confirmButtonText: response.data.confirmButtonText
            }, function () {
                if (response.data.redirect_url !== null) {
                    window.location.href = response.data.redirect_url;
                }
            });
        },
        error: function () {
            l.stop();
            var locales_error = $('#locales_error');
            swal({
                title: locales_error.attr('title'),
                text: locales_error.attr('text'),
                type: 'error',
                confirmButtonText: locales_error.attr('confirmButtonText')
            });
        }
    });
});
