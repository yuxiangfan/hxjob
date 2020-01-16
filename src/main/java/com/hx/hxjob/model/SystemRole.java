package com.hx.hxjob.model;

import java.util.List;

public class SystemRole {

	private int id;
	
	private String desEntryId;
	
	private String roleName;
	
	private String status;
	
	private String remark;
	
	private List<SystemResources> systemResources;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public List<SystemResources> getSystemResources() {
		return systemResources;
	}

	public void setSystemResources(List<SystemResources> systemResources) {
		this.systemResources = systemResources;
	}

	public String getDesEntryId() {
		return desEntryId;
	}

	public void setDesEntryId(String desEntryId) {
		this.desEntryId = desEntryId;
	}
	
}
