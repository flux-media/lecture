$(document).on('submit', '#new-user', function (e) {
    e.preventDefault();

    var $this = $(this);
    var data = {};
    $.each($this.serializeArray(), function (index, field) {
        data[field.name] = $.trim(field.value);
    });

    var l = Ladda.create(document.querySelector('#submit-button'));
    l.start();

    if (data['user[email]'].length <= 0 || !validateEmail(data['user[email]'])) {
        $this.find('#user_email').focus();
        l.stop();
        return false;
    } else if (data['user[password]'].length <= 0) {
        $this.find('#user_password').focus();
        l.stop();
        return false;
    } else if (data['user[name]'].length <= 0) {
        $this.find('#user_name').focus();
        l.stop();
        return false;
    } else if (!$this.find('#user_terms').is(':checked')) {
        $this.find('#user_terms').focus();
        l.stop();
        return false;
    }

    data['target'] = getUrlParameter('target');

    $.ajax({
        method: 'POST',
        url: $this.attr('action'),
        data: data,
        success: function (response) {
            l.stop();

            if (response.result === 0) {
                window.location.href = response.data.redirect_url;
            } else {
                swal({
                    title: response.data.title,
                    text: response.data.text,
                    type: response.data.type,
                    confirmButtonText: response.data.confirmButtonText
                });
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

$(document).on('submit', '#reset-password', function (e) {
    e.preventDefault();

    var $this = $(this);
    var data = {};
    $.each($this.serializeArray(), function (index, field) {
        data[field.name] = $.trim(field.value);
    });

    var l = Ladda.create(document.querySelector('#reset-password-button'));
    l.start();

    if (data['email'].length <= 0) {
        $this.find('#email').focus();
        l.stop();
        return false;
    }

    $.ajax({
        method: 'POST',
        url: $this.attr('action'),
        data: {
            email: data['email'],
            authenticity_token: $('meta[name=csrf-token]').attr('content')
        },
        success: function (response) {
            l.stop();
            swal({
                title: response.data.title,
                text: response.data.text,
                type: response.data.type,
                confirmButtonText: response.data.confirmButtonText
            });

            if (response.result === 0) {
                $this.find('#email').val('');
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


$(document).on('click', '#sign-up-with-facebook-button', function (e) {
    e.preventDefault();

    var l = Ladda.create(document.querySelector('#sign-up-with-facebook-button'));
    l.start();

    FB.login(function (response) {
        if (response.status === 'connected') {
            $.ajax({
                method: 'POST',
                url: $('#sign_up_by_provider_path').data('url'),
                data: {
                    provider: 'facebook',
                    token: response.authResponse.accessToken,
                    target: getUrlParameter('target'),
                    authenticity_token: $('meta[name=csrf-token]').attr('content')
                },
                success: function (response) {
                    l.stop();
                    if (response.result === 0) {
                        window.location.href = response.data.redirect_url;
                    }
                },
                error: function (response) {
                    var locales_error = $('#locales_error');
                    swal({
                        title: locales_error.data('title'),
                        text: locales_error.data('text'),
                        type: 'error',
                        confirmButtonText: locales_error.data('confirmButtonText')
                    });
                    console.log(response);
                }
            });
        } else if (response.status === 'not_authroized') {
            l.stop();
        } else {
            l.stop();
        }
    }, {scope: 'public_profile, email'});
});

$(document).on('submit', '#sign-out', function (e) {
    e.preventDefault();

    var $this = $(this);
    var data = {};
    $.each($this.serializeArray(), function (index, field) {
        data[field.name] = $.trim(field.value);
    });

    var locales_warning = $('#locales_warning');

    swal({
        title: locales_warning.data('title'),
        text: locales_warning.data('text'),
        type: 'warning',
        showCancelButton: 'true',
        confirmButtonText: locales_warning.data('confirmButtonText'),
        cancelButtonText: locales_warning.data('cancelButtonText'),
        closeOnConfirm: false
    }, function () {
        var l = Ladda.create(document.querySelector('#sign-out-button'));
        l.start();

        $.ajax({
            method: 'DELETE',
            url: $this.attr('action'),
            data: {
                user_id: data['user_id'],
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
                    if (response.result === 0) {
                        window.location.href = response.data.redirect_url;
                    }
                });
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
});
