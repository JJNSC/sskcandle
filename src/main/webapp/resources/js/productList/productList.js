$(function() {
	$(".sort_menu a").on("click", function(event) {
		event.preventDefault();
		$(".sort_menu a").removeClass("active");
		$(this).addClass("active");
	})
});