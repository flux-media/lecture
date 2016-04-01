$(document).ready(function () {
    // Share via Facebook
    $('#share-fb').on('click', function(e) {
        e.preventDefault();
        FB.ui({
            method: 'share',
            href: window.location.href
        }, function(response){});
    });
    // Share via Twitter
    $('#share-tw').on('click', function(e) {
        e.preventDefault();

    });

    var $sidebar = $('#course-sidebar');
    if ($sidebar.length > 0) {
        doSticky();
        $(window).resize(doSticky);
        $(window).scroll(doSticky);
    }
});

function doSticky() {
    var $sidebar = $('#course-sidebar'),
        $window = $(window),
        $content = $('#course-content'),
        windowWidth = $window.width(),
        scrollTop = $window.scrollTop(),
        containerWidth = $('.body').width(),
    // http://stackoverflow.com/questions/12749844/finding-the-position-of-bottom-of-a-div-with-jquery
        contentBottom = 170 + $content.outerHeight(true),
        sidebarHeight = $sidebar.height(),
        margin;
    if (windowWidth > 950 && scrollTop > 200 && scrollTop < contentBottom - sidebarHeight) {
        if (windowWidth < 1200) {
            margin = 30;
        } else if (windowWidth <= 1600) {
            margin = 100;
        } else {
            margin = 220;
        }
        $sidebar.addClass('sticky');
        $sidebar.css('right', ((windowWidth - containerWidth) / 2 + margin) + 'px');
        $sidebar.css('top', '5%');
    } else if (windowWidth > 950 && scrollTop >= contentBottom - sidebarHeight) {
        $sidebar.removeClass('sticky');
        $sidebar.css('right', 0);
        $sidebar.css('top', contentBottom - sidebarHeight - 200 + 'px');
    } else {
        $sidebar.removeClass('sticky');
        $sidebar.css('right', 'auto');
        $sidebar.css('top', 'auto');
    }
}