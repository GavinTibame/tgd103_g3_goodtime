$(document).ready(function() {
	
	var $btns = $('.tablinks').click(function() {
	  if (this.id == 'all') {
	    $('#parent > ul > li').fadeIn(450);
	  } else {
	    var $el = $('.' + this.id).fadeIn(450);
	    $('#parent > ul >li').not($el).hide();
	  }
	  $btns.removeClass('active');
	  $(this).addClass('active');
	})
	
});


// =========================

$(document).ready(function() {
	
	var $btns = $('.tablinks').click(function() {
	  if (this.id == 'all') {
	    $('#parent > ul > li').fadeIn(450);
	  } else {
	    var $el = $('.' + this.id).fadeIn(450);
	    $('#parent > ul >li').not($el).hide();
	  }
	  $btns.removeClass('active');
	  $(this).addClass('active');
	})
	
});