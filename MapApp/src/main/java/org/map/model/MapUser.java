package org.map.model;

public class MapUser extends MapUserKey {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column map_user.username
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    private String username;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column map_user.password
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    private String password;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column map_user.gender
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    private String gender;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column map_user.preference
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    private Byte preference;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column map_user.username
     *
     * @return the value of map_user.username
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    public String getUsername() {
        return username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column map_user.username
     *
     * @param username the value for map_user.username
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column map_user.password
     *
     * @return the value of map_user.password
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    public String getPassword() {
        return password;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column map_user.password
     *
     * @param password the value for map_user.password
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column map_user.gender
     *
     * @return the value of map_user.gender
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    public String getGender() {
        return gender;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column map_user.gender
     *
     * @param gender the value for map_user.gender
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column map_user.preference
     *
     * @return the value of map_user.preference
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    public Byte getPreference() {
        return preference;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column map_user.preference
     *
     * @param preference the value for map_user.preference
     *
     * @mbg.generated Fri May 25 21:02:39 CST 2018
     */
    public void setPreference(Byte preference) {
        this.preference = preference;
    }
}