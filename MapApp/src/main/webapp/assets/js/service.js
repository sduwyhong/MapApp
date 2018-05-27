var path = 'http://localhost:8888/MapApp/api/v1/';
		var service = {
				parseAddress: function() {
					$('.hamburger').trigger('click');
					var keyword = $('input[name=keyword]').val();
					var myGeo = new BMap.Geocoder();
					myGeo.getPoint(keyword, function(point){
						if (point) {
							map.centerAndZoom(point, 16);
							map.addOverlay(new BMap.Marker(point));
						}else{
							alert("您选择地址没有解析到结果!");
						}
					}, "济南市");
				},
				locationInterest: function(address) {
					$("#_close").trigger('click');
					$('#allmap').show();
					var myGeo = new BMap.Geocoder();
					myGeo.getPoint(address, function(point){
						if (point) {
							map.centerAndZoom(point, 16);
							map.addOverlay(new BMap.Marker(point));
						}else{
							alert("您选择地址没有解析到结果!");
						}
					}, "济南市");
				},
				interest: function(){
					$.ajax({
						url:path+'map/place',
						data:{
							region: $('input[name=region]').val(),
							query: $('input[name=query]').val()
						},
						success:function(data){
							$('#interest_container').hide();
							$('#interest_result_container').show();
							for(var i in data.results) {
								var template = $('.interest_item:first').clone();
								template.removeAttr('hidden');
								var a = template.children('a:eq(0)');
								a.text(data.results[i].name);
								a.attr('href',"javascript:service.locationInterest('"+data.results[i].address+"')");
								$('.interest_item:last').after(template);
							}
						}
					})
				},
				address: function() {
					$.ajax({
						url:path+'map/location',
						data:{
							address:$('input[name=address]').val()
						},
						success: function(data) {
							$('#p_lng').text('经度：'+data.result.location.lng);
							$('#p_lng').css('color','#000000');
							$('#p_lat').text('纬度：'+data.result.location.lat);
							$('#p_lat').css('color','#000000');
						}
					})
				},
				weather: function() {
					$.ajax({
						url:path+'map/weather',
						data:{
							destination:$('input[name=dest]').val()
						},
						success: function(data) {
							for(var i in data.result) {
								var template = $('.p_weather:first').clone();
								template.removeAttr('hidden');
								template.css('color','#000000');
								template.html(i+'：'+data.result[i]);	
								$('.p_weather:last').after(template);
							}
						}
					})
				},
				transit: function() {
					$.ajax({
						url:path+'map/route',
						data:{
							origin:$('input[name=start]').val(),
							destination:$('input[name=end]').val()
						},
						success: function(data) {
						}
					})
				}
		}