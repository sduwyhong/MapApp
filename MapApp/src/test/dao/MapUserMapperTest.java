package dao;

import static org.junit.Assert.fail;

import java.util.UUID;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.map.dao.MapUserMapper;
import org.map.model.MapUser;
import org.map.model.MapUserExample;
import org.map.model.MapUserKey;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.DigestUtils;

/**
 * @author wyhong
 * @date 2018-5-25
 */
public class MapUserMapperTest {

	MapUserMapper mapUserMapper;
	
	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new 
				ClassPathXmlApplicationContext("classpath:spring/applicationContext-db.xml");
		mapUserMapper = (MapUserMapper) context.getBean("mapUserMapper");
	}

//	@Test
	public void insertSelective() {
		MapUser record = new MapUser();
		record.setId(UUID.randomUUID().toString().replace("-", ""));
		record.setUsername("wyhong");
		record.setPassword(DigestUtils.md5DigestAsHex("123".getBytes()));
		record.setGender("男");
		mapUserMapper.insertSelective(record);
	}

	@Test
	public void select() {
		MapUserExample example = new MapUserExample();
		example.createCriteria().andUsernameLike("w%").andIdLike("5d8%");
		mapUserMapper.selectByExample(example);
		MapUserKey key = new MapUserKey();
		key.setId("5d8ea8a5227b4e1ab8b56c96ecb28fa0");
		mapUserMapper.selectByPrimaryKey(key);
	}
}
