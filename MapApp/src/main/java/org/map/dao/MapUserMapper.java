package org.map.dao;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.map.model.MapUser;
import org.map.model.MapUserExample;
import org.map.model.MapUserKey;

public interface MapUserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table map_user
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    long countByExample(MapUserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table map_user
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    int deleteByExample(MapUserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table map_user
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    @Delete({
        "delete from map_user",
        "where id = #{id,jdbcType=VARCHAR}"
    })
    int deleteByPrimaryKey(MapUserKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table map_user
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    @Insert({
        "insert into map_user (id, username, ",
        "password, gender, preference)",
        "values (#{id,jdbcType=VARCHAR}, #{username,jdbcType=VARCHAR}, ",
        "#{password,jdbcType=VARCHAR}, #{gender,jdbcType=CHAR}, #{preference,jdbcType=TINYINT})"
    })
    int insert(MapUser record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table map_user
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    int insertSelective(MapUser record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table map_user
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    List<MapUser> selectByExample(MapUserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table map_user
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    @Select({
        "select",
        "id, username, password, gender, preference",
        "from map_user",
        "where id = #{id,jdbcType=VARCHAR}"
    })
    @ResultMap("org.map.dao.MapUserMapper.BaseResultMap")
    MapUser selectByPrimaryKey(MapUserKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table map_user
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    int updateByExampleSelective(@Param("record") MapUser record, @Param("example") MapUserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table map_user
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    int updateByExample(@Param("record") MapUser record, @Param("example") MapUserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table map_user
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    int updateByPrimaryKeySelective(MapUser record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table map_user
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    @Update({
        "update map_user",
        "set username = #{username,jdbcType=VARCHAR},",
          "password = #{password,jdbcType=VARCHAR},",
          "gender = #{gender,jdbcType=CHAR},",
          "preference = #{preference,jdbcType=TINYINT}",
        "where id = #{id,jdbcType=VARCHAR}"
    })
    int updateByPrimaryKey(MapUser record);
}