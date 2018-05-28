$(document).ready(function () {
	//主界面
	var trigger = $('.hamburger'),
	overlay = $('.overlay'),
	isClosed = false;
	trigger.click(function () {
		hamburger_cross();      
	});
	function hamburger_cross() {

		if (isClosed == true) {          
			overlay.hide();
			trigger.removeClass('is-open');
			trigger.addClass('is-closed');
			isClosed = false;
		} else {   
			overlay.show();
			trigger.removeClass('is-closed');
			trigger.addClass('is-open');
			isClosed = true;
		}
	}
	$('[data-toggle="offcanvas"]').click(function () {
		$('#wrapper').toggleClass('toggled');
	}); 
	
	//关闭
	$("#_close").click(function() {
		$('#allmap').show();
		$("#_close").animate({
			height: '0px',
			width: '0px'
		}, 500, function() {
			$("#_close").hide(500);
			$("#p_location").text('');
			$(".p_weather[hidden!=hidden]").remove();
			
			$("#_start > div").hide(500);
			
			$("#_start").animate({
				left: '0px',
				height: '0px',
				width: '0px'
			}, 500);
		});
	});
	//route
	$('#myModal').on('hidden.bs.modal', function () {
		//alert('hidden');
		location.reload();
	})
});
//模态框 
function closeOthers(){
	$("#_start > div").hide(500);
}
function openModal(container) {
	closeOthers();
	$('.hamburger').trigger('click');
	$('#allmap').hide();
	$("#_close").show();
	$("#_start").animate({
		left: '350px',
		height: '520px',
		width: '400px'
	}, 500, function() {
		$(container+'').show(500);
		$("#_close").animate({
			height: '40px',
			width: '40px'
		}, 500);
	});
}