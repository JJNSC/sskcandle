$(function() {
    $('.accordion-toggle').on('click', function() {
    	const close = $('.show');
    	if(close != null) {
    		close.collapse('toggle');
    	}
        const target = $(this).data('target');
        $(target).collapse('toggle');
    });
});

function updateBoard(qnaId) {
	const qnaContent = $('textarea').val();
	$.ajax({
		url: 'updateBoard',
		type: 'get',
		data: {
			"qnaId": qnaId,
			"qnaContent": qnaContent
		},
		success: function() {
			alert('변경내용이 저장되었습니다.');
		}
	});
};

