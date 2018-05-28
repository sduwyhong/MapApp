var path = 'http://localhost:8888/MapApp/api/v1/';
var service = {
		search:function(){
			$('#myPageTop').show();
			$('.hamburger').trigger('click');
		},
		address:function(){
			var geocoder = new AMap.Geocoder({
				city: "010", //城市，默认：“全国”
				radius: 1000 //范围，默认：500
			});
			//地理编码,返回地理编码结果
			geocoder.getLocation($('input[name=address]').val(), function(status, result) {
				$('#_close').trigger('click');
				if (status === 'complete' && result.info === 'OK') {
					geocoder_CallBack(result);
				}
			});
			function addMarker(i, d) {
				var marker = new AMap.Marker({
					map: map,
					position: [ d.location.getLng(),  d.location.getLat()]
				});
				var infoWindow = new AMap.InfoWindow({
					content: d.formattedAddress,
					offset: {x: 0, y: -30}
				});
				marker.on("mouseover", function(e) {
					infoWindow.open(map, marker.getPosition());
				});
			}
			//地理编码返回结果展示
			function geocoder_CallBack(data) {
				var resultStr = "";
				//地理编码结果数组
				var geocode = data.geocodes;
				for (var i = 0; i < geocode.length; i++) {
					//拼接输出html
					resultStr += "<span style=\"font-size: 12px;padding:0px 0 4px 2px; border-bottom:1px solid #C1FFC1;\">" + "<b>地址</b>：" + geocode[i].formattedAddress + "" + "&nbsp;&nbsp;<b>的地理编码结果是:</b><b>&nbsp;&nbsp;&nbsp;&nbsp;坐标</b>：" + geocode[i].location.getLng() + ", " + geocode[i].location.getLat() + "" + "<b>&nbsp;&nbsp;&nbsp;&nbsp;匹配级别</b>：" + geocode[i].level + "</span>";
					addMarker(i, geocode[i]);
				}
				map.setFitView();
				document.getElementById("result").innerHTML = resultStr;
			}
		},
		transit:function() {
			$('#_close').trigger('click');
			var city = '';
			//实例化城市查询类
			var citysearch = new AMap.CitySearch();
			//自动获取用户IP，返回当前城市
			citysearch.getLocalCity(function(status, result) {
				if (status === 'complete' && result.info === 'OK') {
					city = result.city;
					var transOptions = {
							map: map,
							city: city,
							panel: 'panel',                           
							policy: AMap.TransferPolicy.LEAST_TIME //乘车策略
					};
					//构造公交换乘类
					var transfer = new AMap.Transfer(transOptions);
					//根据起、终点名称查询公交换乘路线
					transfer.search([
			             {keyword: $('input[name=start]').val(),city:city},
			             //第一个元素city缺省时取transOptions的city属性
			             {keyword: $('input[name=end]').val(),city:city}
			             //第二个元素city缺省时取transOptions的cityd属性,
			             //没有cityd属性时取city属性
		             ]);
				}
			});
			
		},
		weather_fancy:function() {
			$('#_close').trigger('click');
			 AMap.service('AMap.Weather', function() {
			        var weather = new AMap.Weather();
			        //查询实时天气信息, 查询的城市到行政级别的城市，如朝阳区、杭州市
			        weather.getLive($('input[name=dest]').val(), function(err, data) {
			            if (!err) {
			                var str = [];
			                str.push('<div style="color: #3366FF;">实时天气' + '</div>');
			                str.push('<div>城市/区：' + data.city + '</div>');
			                str.push('<div>天气：' + data.weather + '</div>');
			                str.push('<div>温度：' + data.temperature + '℃</div>');
			                str.push('<div>风向：' + data.windDirection + '</div>');
			                str.push('<div>风力：' + data.windPower + ' 级</div>');
			                str.push('<div>空气湿度：' + data.humidity + '</div>');
			                str.push('<div>发布时间：' + data.reportTime + '</div>');
			                var marker = new AMap.Marker({map: map, position: map.getCenter()});
			                var infoWin = new AMap.InfoWindow({
			                    content: str.join(''),
			                    offset: new AMap.Pixel(0, -20)
			                });
			                infoWin.open(map, marker.getPosition());
			                marker.on('mouseover', function() {
			                    infoWin.open(map, marker.getPosition());
			                });
			            }
			        });
			        //未来4天天气预报
			        weather.getForecast($('input[name=dest]').val(), function(err, data) {
			            if (err) {return;}
			            var str = [];
			            for (var i = 0,dayWeather; i < data.forecasts.length; i++) {
			                dayWeather = data.forecasts[i];
			                str.push(dayWeather.date+' <div class="weather">'+dayWeather.dayWeather+'</div> '+ dayWeather.nightTemp + '~' + dayWeather.dayTemp + '℃');
			            }
			            document.getElementById('result').innerHTML = str.join('<br>');
			        });
			    });
		},
		interest:function() {
			$('#_close').trigger('click');
			 AMap.service(["AMap.PlaceSearch"], function() {
			        var placeSearch = new AMap.PlaceSearch({ //构造地点查询类
			            pageSize: 5,
			            pageIndex: 1,
			            city: "济南", //城市
			            map: map,
			            panel: "panel"
			        });
			        //关键字查询
			        placeSearch.search($('input[name=query]').val());
			    });
		}
}
