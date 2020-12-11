$(document).ready(function() {

    // change navbar background after start scrolling
    background_nav();
    $(document).scroll(function() {
        background_nav();
    });
    function background_nav() {
        if($(window).scrollTop() >= 50) {
            $('#navbar').css('background-color', '#FFBF00');
        } else {
            $('#navbar').css('background-color', 'transparent');
        }
    }

    // slider
    function collision($div1, $div2) {
        var x1 = $div1.offset().left;
        var w1 = 40;
        var r1 = x1 + w1;
        var x2 = $div2.offset().left;
        var w2 = 40;
        var r2 = x2 + w2;

        if (r1 < x2 || x1 > r2) return false;
        return true;

    }
});
