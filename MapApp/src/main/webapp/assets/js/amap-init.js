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
	
	//模态框 
	function closeOthers(){
		$("#_start > div").hide(500);
		$('#myPageTop').hide();
		$('#result').empty();
		$('#panel').empty();
		$('.amap-info-contentContainer').empty();
	}
	//路线
	$("#a_transit").click(function() {
		closeOthers();
		$('.hamburger').trigger('click');
		$('#container').hide();
		$("#_close").show();
		$("#_start").animate({
			left: '350px',
			height: '520px',
			width: '400px'
		}, 500, function() {
			$("#transit_container").show(500);
			$("#_close").animate({
				height: '40px',
				width: '40px'
			}, 500);
		});
	});
	//兴趣点
	$("#a_interest").click(function() {
		closeOthers();
		$('.hamburger').trigger('click');
		$('#container').hide();
		$("#_close").show();
		$("#_start").animate({
			left: '350px',
			height: '520px',
			width: '400px'
		}, 500, function() {
			$("#interest_container").show(500);
			$("#_close").animate({
				height: '40px',
				width: '40px'
			}, 500);
		});
	});
	//经纬度
	$("#a_address").click(function() {
		closeOthers();
		$('.hamburger').trigger('click');
		$('#container').hide();
		$("#_close").show();
		$("#_start").animate({
			left: '350px',
			height: '520px',
			width: '400px'
		}, 500, function() {
			$("#address_container").show(500);
			$("#_close").animate({
				height: '40px',
				width: '40px'
			}, 500);
		});
	});
	//天气
	$("#a_weather").click(function() {
		closeOthers();
		$('.hamburger').trigger('click');
		$('#container').hide();
		$("#_close").show();
		$("#_start").animate({
			left: '350px',
			height: '520px',
			width: '400px'
		}, 500, function() {
			$("#weather_container").show(500);
			$("#_close").animate({
				height: '40px',
				width: '40px'
			}, 500);
		});
	});
	//关闭
	$("#_close").click(function() {
		$('#container').show();
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