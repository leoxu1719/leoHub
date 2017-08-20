package com.linksite.user;

import java.util.Date;

public class UserBean {

	
	/**编号*/
    private Long id;
	/**所属机构ID*/
    private Long companyId;
	/**登录名*/
    private String loginName;
	/**用户姓名*/
    private String name;
	/**密码*/
    private String password;
	/**手机号码*/
    private String mobileNum;
	/**用户状态 0：启动，1：禁用*/
    private String startUp;
	/**创建时间*/
    private Date createDate;
    /**创建人ID*/
    private Long createUserId;
	/**创建人*/
    private String createUserName;
	/**修改时间*/
    private Date updateDate;
	/**修改人ID*/
    private Long updateUserId;
	/**修改人*/
    private String updateUserName;
	/**是否有效 0有效，1无效*/
    private String deleted;
	/**身份证号码*/
	private String idCard;
	/**性别*/
	private String gender;
	/**备注*/
	private String remarks;
	/**权限*/
	private String roleString;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobileNum() {
		return mobileNum;
	}
	public void setMobileNum(String mobileNum) {
		this.mobileNum = mobileNum;
	}
	public String getStartUp() {
		return startUp;
	}
	public void setStartUp(String startUp) {
		this.startUp = startUp;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Long getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(Long createUserId) {
		this.createUserId = createUserId;
	}
	public String getCreateUserName() {
		return createUserName;
	}
	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Long getUpdateUserId() {
		return updateUserId;
	}
	public void setUpdateUserId(Long updateUserId) {
		this.updateUserId = updateUserId;
	}
	public String getUpdateUserName() {
		return updateUserName;
	}
	public void setUpdateUserName(String updateUserName) {
		this.updateUserName = updateUserName;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getRoleString() {
		return roleString;
	}
	public void setRoleString(String roleString) {
		this.roleString = roleString;
	}



}
