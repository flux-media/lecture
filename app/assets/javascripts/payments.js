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
            pricing_id: $('input[name=pricing]:checked', $this).first().val(),
            authenticity_token: $('meta[name=csrf-token]').attr('content')
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
        error: function (response) {
            l.stop();
            // TODO: Do something about it.
            swal({
                title: "Error!",
                text: "Something's wrong!",
                type: "error",
                confirmButtonText: "Sorry"
            });
        }
    });
})