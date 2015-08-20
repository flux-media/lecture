$(document).on('page:change', function () {
    var grid = document.querySelector(('#grid'));
    if (grid !== null && grid.getAttribute('salvattore') === null) {
        grid.setAttribute('salvattore', 'set');
        salvattore.registerGrid(grid);
    }
});
