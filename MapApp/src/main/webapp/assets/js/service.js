var path = 'http://localhost:8888/MapApp/api/v1/';
var route_result = {}
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
					//region: $('input[name=region]').val(),
					region: region,
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
		weather_fancy: function() {
			 var cityName=$('input[name=dest]').val();
             //跨域是浏览器的安全策略.
             //我现在是jQuery ，jQuery 怎么去解决
             //jQuery 解决的方式.
             $.ajax({
                     url:"http://api.map.baidu.com/telematics/v3/weather",
                     type:"get",
                     data:{
                           location:cityName,
                           output:'json',
                           ak:'6tYzTvGZSOpYB5Oc2YGGOKt8'
                     },
                     /*预期服务器端返回的数据类型，假设我现在跨域了，我就改成jsonp 就可以了 */
                 dataType:"jsonp",
                 success:function(data){
                     console.log(data)
                     //百度那边的 数据已经回来，我现在要解析这个数据.
                     var weatherData=data.results[0].weather_data;
                     for(var i in weatherData) {
                    	 var tr = $('.tr_weather:first').clone();
                    	 tr.removeAttr('hidden');
                    	 tr.children('td:eq(0)').text(weatherData[i].date);
                    	 tr.children('td:eq(1)').children('img').attr('src',weatherData[i].dayPictureUrl);
                    	 tr.children('td:eq(2)').children('img').attr('src',weatherData[i].nightPictureUrl);
                    	 tr.children('td:eq(3)').text(weatherData[i].temperature);
                    	 tr.children('td:eq(4)').text(weatherData[i].weather);
                    	 tr.children('td:eq(5)').text(weatherData[i].wind);
                    	 $('.tr_weather:last').after(tr);
                     }
                 }
             })
		},
		transit: function() {
			route_result = new Vue({
				el:'#route_table',
				data:{
					routes:[],
					test:1
				},
				methods:{
					getRoutes: function(){
						$.ajax({
							url:path+'map/route',
							data:{
								origin:$('input[name=start]').val(),
								destination:$('input[name=end]').val()
							},
							success: function(data) {
								route_result.routes = data.result.routes;
								$('#myModal').modal();
							}
						})
					}
				},
				mounted: function(){
					//插件js中：table.children('tbody').children('tr').filter(':even').click(function () {})在vue渲染完成前就已完成
					//且只对源码可见的html元素有效，动态生成在内存中的元素无法通过click()绑定，要通过on()
					//解决方案：mounted（vue动态渲染完后）调用$(document).on()来绑定事件，
					//因为隐藏的template中的tr已经被插件js处理了一遍，所以除了事件以外的属性都已保留
					 $(document).on('click','.table-expandable > tbody > tr:even', function () {
			                var element = $(this);
			                element.next('tr').toggle('slow');
			                element.find(".table-expandable-arrow").toggleClass("up");
		             });
					 
				}
			});
			route_result.getRoutes();
		}
}
