package org.map.service;
/**
 * @author wyhong
 * @date 2018-5-26
 */
public interface MapService {
	
	public String searchPlace(String query, String region);
	
	public String searchLocation(String address);
	
	public String transit(String origin, String destination);
	
	public String getDestWeather(String destination);
	
	public String searchInterestPoint(String tag, String region);
}
