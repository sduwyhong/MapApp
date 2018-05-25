package org.map.test;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.apache.commons.lang3.StringUtils;

/**
 * @author wyhong
 * @date 2018-5-16
 */
public class TestApi {
	
	public static void main(String[] args) throws Exception{
		String request_url = "http://api.map.baidu.com/place/v2/search?query=四季粥铺&tag=餐厅&region=济南&output=json&ak=wuDPYMIqWTUBCz8fUwL7GWAHSblRGNIL";
		String params = StringUtils.substringAfter(request_url, "?");
		String res = (StringUtils.substringBefore(request_url, "?") + "?" + URLEncoder.encode(params, "UTF-8")).replace("%3D", "=").replace("%26", "&");
		URL url = new URL(res);
		URLConnection connection = url.openConnection();
		connection.connect();
		InputStream inputStream = connection.getInputStream();
		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
		String line = null;
		while((line = reader.readLine()) != null) {
			System.out.println(line);
		}
	}
}
