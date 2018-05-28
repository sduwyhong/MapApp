package org.map.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.map.model.MapUser;
import org.map.service.MapUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;

/**
 * @author wyhong
 * @date 2018-5-26
 */
@Component
@Path("/user")
public class MapUserAction {

	@Autowired
	MapUserService mapUserService;
	
	private final String JSON = MediaType.APPLICATION_JSON+";charset=utf-8";
	
	@Path("/create")
	@POST
	@Produces(JSON)
	public String register(@FormParam("record")String json) {
		MapUser mapUser = JSONObject.parseObject(json, MapUser.class);
		return mapUserService.register(mapUser);
	}
	
	@Path("/login")
	@POST
	@Produces(JSON)
	public String login(@FormParam("username")String username, @FormParam("password")String password,
			@Context HttpServletRequest request, @Context HttpServletResponse response) {
		return mapUserService.login(username, password, request, response);
	}
	
	@Path("/switch")
	@POST
	@Produces(JSON)
	public String switchPreference(@FormParam("id")String id, @FormParam("preference")Byte preference) {
		return mapUserService.switchPreference(id, preference);
	}
	
	@Path("/preference")
	@GET
	@Produces(JSON)
	public String getPreference(@Context HttpServletRequest request) {
		return mapUserService.getPreference(request);
	}
}
