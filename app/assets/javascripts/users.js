$(document).on('submit', '#user-new', function (e) {
    e.preventDefault();

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
        return false;
    } else if (!validateEmail(data['user[email]'])) {
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

    // From http://stackoverflow.com/questions/46155/validate-email-address-in-javascript
    function validateEmail(email) {
        var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        return re.test(email);
    }
});

$(document).on('submit', '#reset-password', function (e) {
    e.preventDefault();

    var $this = $(this);
    var data = {};
    $.each($this.serializeArray(), function (index, field) {
        data[field.name] = field.value;
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
                    window.location.href = response.redirect_url;
                },
                error: function (response) {
                    l.stop();
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
        data[field.name] = field.value;
    });

    swal({
        // TODO: Manage these with admin database
        title: '경고',
        text: '진짜로 탈퇴하시렵니까?',
        type: 'warning',
        showCancelButton: 'true',
        confirmButtonText: '응',
        cancelButtonText: '아니',
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
    });
});
