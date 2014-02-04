$(document).ready(function(){
    $('#shipped_button').click(function(){
        $(this).toggleClass('btn-danger btn-success');
    });
});

$(document).ready(function(){
    slideShow();
});

function slideShow(){
    var current = $('.imagereg .show');
    var next = current.next().length ? current.next() : current.siblings().first();

    current.hide().removeClass('show');
    next.fadeIn(1500).fadeOut(4100).addClass('show');

    setTimeout(slideShow, 5000);
}