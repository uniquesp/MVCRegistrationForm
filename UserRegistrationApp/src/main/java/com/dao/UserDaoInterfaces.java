package com.dao;

import java.util.List;

import com.model.UserDTO;

public interface UserDaoInterfaces {

	public int registerUser(UserDTO userDTO);
	public List<UserDTO> getAllUsers(UserDTO userDTO);
	public boolean getUser(UserDTO userDTO);
	public boolean deleteUser(int userId);
	public boolean updateUser(UserDTO userDTO);
}
