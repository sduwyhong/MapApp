package org.map.service.impl;

import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.oval.ConstraintViolation;
import net.sf.oval.Validator;

import org.map.dao.MapUserMapper;
import org.map.model.MapUser;
import org.map.model.MapUserExample;
import org.map.result.Result;
import org.map.service.MapUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;

/**
 * @author wyhong
 * @date 2018-5-25
 */
public class MapUserServiceImpl implements MapUserService {

	@Autowired
	MapUserMapper mapUserMapper;

	Validator validator = new Validator();

	@Override
	@Transactional
	public String register(MapUser record) {
		List<ConstraintViolation> list = validator.validate(record);
		if(!list.isEmpty()) {
			Result result = new Result();
			result.setStatus("400");
			result.setMessage("illegal arguments");
			return JSONObject.toJSONString(result);
		}
		MapUserExample example = new MapUserExample();
		example.createCriteria().andUsernameEqualTo(record.getUsername());
		List<MapUser> _list = mapUserMapper.selectByExample(example);
		if(!list.isEmpty()){
			Result result = new Result();
			result.setStatus("400");
			result.setMessage("username has been existed");
			return JSONObject.toJSONString(result);
		}
		record.setId(UUID.randomUUID().toString().replace("-", ""));
		mapUserMapper.insert(record);
		return JSONObject.toJSONString(new Result());
	}

	@Override
	public String login(String username, String password, HttpServletRequest request, HttpServletResponse response) {
		MapUserExample example = new MapUserExample();
		example.createCriteria().andUsernameEqualTo(username);
		List<MapUser> list = mapUserMapper.selectByExample(example);
		if(list.size() == 0 || !list.get(0).getPassword().equals(password)) {
			Result result = new Result();
			result.setStatus("400");
			result.setMessage("invalid username or password");
			return JSONObject.toJSONString(result);
		}
		MapUser mapUser = list.get(0);
		if(password.equals(mapUser.getPassword())) {
			//登录成功
			request.getSession().setAttribute("user", username);
			Cookie cookie = new Cookie("user", mapUser.getId());
			cookie.setMaxAge(60 * 15);
			//同一项目下的不同页面都会带有这个cookie
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		return JSONObject.toJSONString(new Result());
	}

	@Override
	public String switchPreference(String id, Byte preference) {
		MapUser record = new MapUser();
		record.setId(id);
		record.setPreference(preference);
		if(mapUserMapper.updateByPrimaryKeySelective(record) > 0)
			return JSONObject.toJSONString(new Result());
		else {
			Result result = new Result();
			result.setMessage("nothing changed");
			return JSONObject.toJSONString(result);
		}
			
	}

	@Override
	public String getPreference(String id) {
		Result result = new Result();
		Byte preference = mapUserMapper.selectPreferenceById(id);
		result.setResult(preference);
		return JSONObject.toJSONString(result);
	}

}
