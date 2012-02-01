
var rightarrow='\u25B6';
var downarrow='\u25BC';

$(document).ready(function() {

  //------------------------------ Setup the navigation links
  // Let's do a cute slow scroll so that users know they're just sliding down the page, rather than jumping to a new one
  $("nav li a").each(function(index) {
    $(this).click(function()
      {
        $('html,body').animate({scrollTop:$($(this).attr('href')).offset().top}, 'fast'); return false;
      })
    });


  //------------------------------ Setup the skill description bars
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

