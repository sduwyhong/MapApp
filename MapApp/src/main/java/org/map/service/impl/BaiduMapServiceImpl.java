package org.map.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.map.result.Result;
import org.map.service.MapService;
import org.map.test.TestApi;
import org.map.webservice.ArrayOfString;
import org.map.webservice.WeatherWebService;
import org.map.webservice.WeatherWebServiceSoap;

import com.alibaba.fastjson.JSONObject;

/**
 * @author wyhong
 * @date 2018-5-26
 */
public class BaiduMapServiceImpl implements MapService {

	public String invokeApi(String request_url) {
		String params = StringUtils.substringAfter(request_url, "?");
		StringBuilder stringBuilder = new StringBuilder();
		URL url;
		try {
			String res = (StringUtils.substringBefore(request_url, "?") + "?" + URLEncoder.encode(params, "UTF-8")).replace("%3D", "=").replace("%26", "&");
			url = new URL(res);
			URLConnection connection = url.openConnection();
			connection.connect();
			InputStream inputStream = connection.getInputStream();
			//解决tomcat下网络传输乱码问题
			//在Tomcat下, 调用的是DoubleByte做decode,在非Tomcat下,调用的是UTF-8的decode
			BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
			String line = null;
			while((line = reader.readLine()) != null) {
				stringBuilder.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return stringBuilder.toString();
	}

	@Override
	public String searchPlace(String query, String region) {
		String request_url = "http://api.map.baidu.com/place/v2/search?query="+query+"&region="+region+"&output=json&ak=wuDPYMIqWTUBCz8fUwL7GWAHSblRGNIL";
		return invokeApi(request_url);
	}

	@Override
	public String searchLocation(String address) {
		String request_url = "http://api.map.baidu.com/geocoder/v2/?address="+address+"&output=json&ak=wuDPYMIqWTUBCz8fUwL7GWAHSblRGNIL&callback=showLocation";
		return invokeApi(request_url);
	}

	@Override
	public String transit(String origin, String destination) {
		origin = searchLocation(origin);
		destination = searchLocation(destination);
		//TODO：处理json，解析出经纬度
		String request_url = "http://api.map.baidu.com/direction/v2/transit?origin=40.056878,116.30815&destination=31.222965,121.505821&ak=wuDPYMIqWTUBCz8fUwL7GWAHSblRGNIL";
		return invokeApi(request_url);
	}

	@Override
	public String getDestWeather(String destination) {
		//创建服务视图
		WeatherWebService weatherWebService = new WeatherWebService();
		//得到porttype
		WeatherWebServiceSoap weatherWebServiceSoap = weatherWebService.getWeatherWebServiceSoap();
		//调用方法
		ArrayOfString arrayOfString = weatherWebServiceSoap.getWeatherbyCityName(destination);
		List<String> strings = arrayOfString.getString();
		String res = null;
		for (String string : strings) {
			//TODO：此处解析有用的数据封装
		}
		Result result = new Result();
		result.setResult(res);
		return JSONObject.toJSONString(result);
	}

	@Override
	public String searchInterestPoint(String tag, String region) {
		String request_url = "http://api.map.baidu.com/place/v2/search?query="+tag+"&region="+region+"&output=json&ak=wuDPYMIqWTUBCz8fUwL7GWAHSblRGNIL";
		return invokeApi(request_url);
	}

}
