
var rightarrow='&#x25B6;';
var downarrow='&#x25BC;';

$(document).ready(function() {
	$(".skillbar").each(function(index) {
		$(this).html(' <button class="skillarrow">'+rightarrow+'</button> '+$(this).html());

		$(this).click(function() {
			$(this).$("button").text('hi');
		});

	});
});

