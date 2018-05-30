package com.nazdaq.tms.service;

import java.util.List;

import com.nazdaq.tms.model.UserRole;





/**
 * @author abu.taleb
 *
 */
public interface UserRoleService {
	
	public void addUserRole(UserRole userRole);

	public List<UserRole> listUserRole();
	
	public UserRole getUserRole(int userroleid);
	
	public void deleteUserRole(UserRole userRole);
	
	public List<String> getUserRoleName();
}
