$(document).ready(function () {
    // Target your .container, .wrapper, .post, etc.
    $('.fitvids').fitVids();

    // Main slider.
    $('#main-slider').bxSlider();

    // Main tab.
    // Set tab 0 as default.
    setTab(0);
    var $mainTabs = $('#main-tabs');
    $mainTabs.on('click', 'a', function (e) {
        e.preventDefault();
        var $this = $(this),
            $parent = $this.parent();
        setTab($parent.index());
    });
});

function setTab(tab) {
    var $mainTabs = $('#main-tabs');
    $mainTabs.find('li').removeClass('active');
    $mainTabs.children().eq(tab).addClass('active');

    var $tabContents = $('#main-tab-contents');
    $tabContents.children().hide();
    $tabContents.children().eq(tab).show();

    var grid = document.querySelector('#grid' + tab);
    if (grid !== null && grid.getAttribute('salvattore') === null) {
        grid.setAttribute('salvattore', 'set');
        salvattore.registerGrid(grid);
    }
}