package org.map.controller;

import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import org.map.service.MapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author wyhong
 * @date 2018-5-26
 */
@Component
@Path("/map")
public class MapAction {

	private static final String JSON = "application/json;charset=utf-8";
	@Autowired
	MapService mapService;
	
	@Path("/place")
	@GET
	@Produces(JSON)
	public String searchPlace(@QueryParam("query")String query, @QueryParam("region")String region){
		return mapService.searchPlace(query, region);
	}
	@Path("/location")
	@GET
	@Produces(JSON)
	public String searchLocation(@QueryParam("address")String address){
		return mapService.searchLocation(address);
	}
	@Path("/route")
	@GET
	@Produces(JSON)
	public String transit(@QueryParam("origin")String origin, @QueryParam("destination")String destination){
		return mapService.transit(origin, destination);
	}
	@Path("/weather")
	@GET
	@Produces(JSON)
	public String getDestWeather(@QueryParam("destination")String destination){
		return mapService.getDestWeather(destination);
	}
	@Path("/interest")
	@GET
	@Produces(JSON)
	public String searchInterestPoint(@QueryParam("tag")String tag, @QueryParam("region")String region){
		return mapService.searchInterestPoint(tag, region);
	}
}
