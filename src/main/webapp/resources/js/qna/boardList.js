$(document).ready(function() {
    $('.accordion-toggle').on('click', function() {
    	const close = $('.show');
    	if(close != null) {
    		close.collapse('toggle');
    	}
        const target = $(this).data('target');
        $(target).collapse('toggle');
    });
});
