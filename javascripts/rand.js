
var rightarrow='\u25B6';
var downarrow='\u25BC';

$(document).ready(function() {
  $(".skilldescription").hide();

	$(".skillbar").each(function(index) {
		$(this).prepend('<span class="skillarrow">'+rightarrow+'</span> ');

    var arrow = $("#"+$(this).attr('id')+ " > .skillarrow");

    $(this).hover(
      function() { $(this).css('cursor', 'pointer'); },
      function() { $(this).css('cursor', 'auto'); }
      );

		$(this).click(function() {


      if(arrow.text().trim().charAt(0) == downarrow)
      {
        // Hide skill descriptions
		  	arrow.html(rightarrow);
        $(this).next().slideUp("fast");
      }
      else
      {
        // Show skill descriptions
		  	arrow.html(downarrow);
        $(this).next().slideDown("fast");
      }

		});

	});
});

