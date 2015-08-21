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

    var getUrlParameter = function getUrlParameter(sParam) {
        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : sParameterName[1];
            }
        }
    };
});
