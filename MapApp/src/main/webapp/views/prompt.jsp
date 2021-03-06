<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- prompt start -->
	<div id='_start' style="overflow: auto;">
		<div id='_close' style="display: none;">
			<span class="glyphicon glyphicon-remove"></span>
		</div>
		<br /> 
		<!--地点查询框-->
		<div id="location_container" style="display: none;">
			<div id="lab1">
				<span id="lab_login">地点查询</span>
			</div>
			<div id="form_container1">
				<br />
				<label>请输入地点</label>
				<div id="r-result"><input type="text" id="suggestId" size="20" value="百度" style="width:250px;" /></div>
				<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
				<br>
			</div>
		</div>
		<!--路线规划查询框-->
		<div id="transit_container" style="display: none;">
			<div id="lab1">
				<span id="lab_login">路线规划查询</span>
			</div>
			<div id="form_container1">
				<br />
				<label>请输入您的起始位置(Origin)</label>
				<input type="text" name="start" class="form-control" placeholder="Origin" autofocus="autofocus" value="山东大学齐鲁软件学院"/>
				<br>
				<label>请输入您的目的地(Destination)</label>
				<input type="text" name="end" class="form-control" placeholder="Destination" value="济南恒隆广场"/>
				<br>
				<center><input type="button" value="查询" class="btn btn-success" onclick="service.transit()" /></center>
				<br>
				<div></div>
				<hr>
				<center>
					<p class="p_transit" hidden="hidden"></p>
				</center>
			</div>
		</div>
		<!--目的地天气查询框-->
		<div id="weather_container" style="display: none;">
			<div id="lab1">
				<span id="lab_login">目的地天气查询</span>
			</div>
			<div id="form_container1">
				<br />
				<label>请输入您的目的地(Destination)</label>
				<input type="text" name="dest" class="form-control" placeholder="Destination" autofocus="autofocus" value="历下区"/>
				<br>
				<center><input type="button" value="查询" class="btn btn-success" onclick="service.weather()" /></center>
				<br>
				<div></div>
				<hr>
				<center>
					<p class="p_weather" hidden="hidden"></p>
				</center>
				<!-- 
				<center><input type="button" value="查询" class="btn btn-success" onclick="service.weather_fancy()" /></center>
				<br>
				<hr>
				<table>
					<tr hidden="hidden" class="tr_weather">
					    <td></td>
					    <td><img src=""></td>
					    <td><img src=""></td>
					    <td></td>
					    <td></td>
					    <td></td>
					</tr>
				</table>
				 -->
			</div>
		</div>
		<!--经纬度查询框-->
		<div id="address_container" style="display: none;">
			<div id="lab1">
				<span id="lab_login">经纬度查询</span>
			</div>
			<div id="form_container1">
				<br />
				<label>详细地址(Address)</label>
				<input type="text" name="address" class="form-control" placeholder="详细地址" autofocus="autofocus" value="北京市海淀区苏州街"/>
				<br>
				<center><input type="button" value="查询" class="btn btn-success" onclick="service.address()" /></center>
				<br>
				<div></div>
				<hr>
				<center>
					<p id="p_lng"></p>
					<p id="p_lat"></p>
				</center>
			</div>
		</div>
		<!--兴趣点框-->
		<div id="interest_container" style="display: none;">
			<div id="lab1">
				<span id="lab_login">地址查询</span>
			</div>
			<div id="form_container1">
				<br />
				<label>地区(Optional)</label>
				<!-- <input type="text" name="region" class="form-control" placeholder="地区" value="济南" /> -->
				<div id="demo" class="citys">
	                <p>
	                    <select name="province"></select>
	                    <select name="city"></select>
	                    <select name="area"></select>
	                </p>
	            </div>
	             <script type="text/javascript">
	             	var region = '';
	                $('#demo').citys({
	                	code:350206,
	                	onChange:function(data){
	                		region = data.province + data.city + data.area;
	                	}
                	});
	            </script>
				<br>
				<label>兴趣点(Query)</label>
				<input type="text" name="query" class="form-control" placeholder="兴趣点" autofocus="autofocus" value="火锅"/>
				<br>
				<center><input type="button" value="查询" class="btn btn-success" onclick="service.interest()" /></center>
			</div>
		</div>
		<!--兴趣点结果列表-->
		<div id="interest_result_container" style="display: none;">
			<div id="lab1">
				<span id="lab_login">为您搜索到以下结果</span>
			</div>
			<div id="form_container1">
				<ul>
					<li class="interest_item" hidden="hidden" style="list-style-type:decimal; margin-right: 10px; color: #000000">
						<a href="#" style="color: #00BFFF"></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- prompt end -->
	
	<!-- route start -->
	<!-- Modal -->
	<div class="modal fade" style="width: auto;" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog" style="width: 1500px;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel">为你搜索到如下路线</h4>
	      </div>
	      <div class="modal-body">
	        <div class="container">
				<table class="table table-hover table-expandable" id="route_table">
	                <thead>
	                    <tr>
	                        <th>到达时间</th>
	                        <th>距离</th>
	                        <th>价格</th>
	                    </tr>
	                </thead>
					<tbody v-for="r in routes">
						<tr>
							<td>{{r.arrive_time}}</td>
							<td>{{r.distance/1000}}km</td>
							<td>{{r.price}}元</td>
						</tr>
						<tr>
							<td colspan="4">
								<h4 style="color: #000000">详细行程</h4>
								<ul>
									<li v-for="ss in r.steps"><p v-for="s in ss" style="color: #000000">{{s.instructions}}</p></li>
								</ul>   
							</td>
						</tr>
					</tbody>
            	</table>
		</div>
	      </div>
	      <div class="modal-footer">
	        <center><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></center>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!-- route end -->