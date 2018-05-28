package org.map.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.map.model.MapUser;

/**
 * @author wyhong
 * @date 2018-5-25
 */
public interface MapUserService {

	//注册
	public String register(MapUser record);
	//登录
	public String login(String username, String password, HttpServletRequest request, HttpServletResponse response);
	//更改偏好
	public String switchPreference(String id, Byte preference);
	//获取当前偏好
	public String getPreference(HttpServletRequest request);
}
