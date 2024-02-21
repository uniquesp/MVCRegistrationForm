package com.dao;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.*;
import javax.servlet.http.Part;
import com.model.UserDTO;
import com.util.DbConnection;
import com.util.ImageConversion;

public class UserDao implements UserDaoInterfaces {

	@Override
	public int registerUser(UserDTO userDTO) {
		PreparedStatement preparedStatement = null;
		String INSERT_USERS_SQL = "INSERT INTO user_info"
				+ "(username,email,mobile_no,bdate,country,state,district,city,area,pincode,gender,hobbies,language,password,profile_pic) VALUES"
				+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
		int userinserted = 0;
		Connection connection = DbConnection.createConnection();
		System.out.println("Connection Done");
		try {
			preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
			preparedStatement.setString(1, userDTO.getUser_name());
			preparedStatement.setString(2, userDTO.getEmail());
			preparedStatement.setString(3, userDTO.getMobileno());
			preparedStatement.setString(4, userDTO.getBirthdate());
			preparedStatement.setString(5, userDTO.getCountry());
			preparedStatement.setString(6, userDTO.getState());
			preparedStatement.setString(7, userDTO.getDistrict());
			preparedStatement.setString(8, userDTO.getCity());
			preparedStatement.setString(9, userDTO.getArea());
			preparedStatement.setInt(10, userDTO.getPincode());
			preparedStatement.setString(11, userDTO.getGender());
			preparedStatement.setString(12, userDTO.getHobbies());
			preparedStatement.setString(13, userDTO.getLanguage());
			preparedStatement.setString(14, userDTO.getPassword());
			if (userDTO.getProfilePic() != null) {
				preparedStatement.setBlob(15, userDTO.getProfilePic());
			}
			System.out.println(preparedStatement);
			userinserted = preparedStatement.executeUpdate();
			System.out.println(userinserted);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					DbConnection.closeConnection();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return userinserted;
	}

	@Override
	public List<UserDTO> getAllUsers(UserDTO userDTO) {
		List<UserDTO> userList = new ArrayList<>();
		Statement statement = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement=null;
		String SELECT_ALL_USERS_SQL = "SELECT * FROM user_info WHERE deleted=0";
		String SELECT_ONE_USER_SQL = "SELECT * FROM user_info WHERE id=?";
		Connection connection = DbConnection.createConnection();
		try {
			statement = connection.createStatement();
			if(userDTO.getUser_id()!=0){
		
				//resultSet = statement.executeQuery(SELECT_ONE_USER_SQL);
				preparedStatement = connection.prepareStatement(SELECT_ONE_USER_SQL);
				preparedStatement.setInt(1, userDTO.getUser_id());
				resultSet = preparedStatement.executeQuery();
			}else {
				resultSet = statement.executeQuery(SELECT_ALL_USERS_SQL);
			}
			int i = 1;
			ImageConversion conversion = new ImageConversion();
			while (resultSet.next()) {
				UserDTO userDTO2 = new UserDTO();
				userDTO2.setSerial_no(i);
				userDTO2.setUser_id(resultSet.getInt("id"));
				userDTO2.setUser_name(resultSet.getString("username"));
				userDTO2.setEmail(resultSet.getString("email"));
				userDTO2.setMobileno(resultSet.getString("mobile_no"));
				userDTO2.setBirthdate(resultSet.getString("bdate"));
				userDTO2.setCountry(resultSet.getString("country"));
				userDTO2.setState(resultSet.getString("state"));
				userDTO2.setDistrict(resultSet.getString("district"));
				userDTO2.setCity(resultSet.getString("city"));
				userDTO2.setArea(resultSet.getString("area"));
				userDTO2.setPincode(resultSet.getInt("pincode"));
				userDTO2.setGender(resultSet.getString("gender"));
				userDTO2.setHobbies(resultSet.getString("hobbies"));
				userDTO2.setLanguage(resultSet.getString("language"));
				userDTO2.setPassword(resultSet.getString("password"));
				// userDTO.setProfilePic(resultSet.getBinaryStream("profile_pic"));
				InputStream profilePicStream = resultSet.getBinaryStream("profile_pic");
				if (profilePicStream != null) {
					userDTO2.setConverted_profile_image(conversion.encodeImage(profilePicStream));
				}
				userList.add(userDTO2);
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (statement != null) {
					statement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return userList;
	}

	@Override
	public boolean getUser(UserDTO userDTO) {
		boolean isuserfound = false;
		ResultSet result = null;
		PreparedStatement preparedStatement = null;
		Connection connection = DbConnection.createConnection();
		String FIND_USER = "SELECT * FROM user_info WHERE deleted=0 AND email=? AND password=?";
		try {
			preparedStatement = connection.prepareStatement(FIND_USER);
			preparedStatement.setString(1, userDTO.getEmail());
			preparedStatement.setString(2, userDTO.getPassword());
			result = preparedStatement.executeQuery();
			if (result.next()) {
				isuserfound = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					DbConnection.closeConnection();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return isuserfound;
	}

	@Override
	public boolean deleteUser(int userId) {
		boolean deleteduser = false;
		PreparedStatement preparedStatement = null;
		Connection connection = DbConnection.createConnection();
		String DELETE_USER_SQl = "UPDATE user_info SET deleted=1 WHERE id=?";
		try {
			preparedStatement = connection.prepareStatement(DELETE_USER_SQl);
			preparedStatement.setInt(1, userId);
			deleteduser = preparedStatement.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					DbConnection.closeConnection();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return deleteduser;
	}

	@Override
	public boolean updateUser(UserDTO userDTO) {
		
		boolean isupdate = false;
		PreparedStatement preparedStatement = null;
		Connection connection = DbConnection.createConnection();
		String UPDATE_USER_DETAILS = "UPDATE user_info SET username=?,mobile_no=?,bdate=?,country=?,state=?,district=?,city=?,area=?,pincode=?,gender=?,hobbies=?,language=?,profile_pic=? WHERE id=?";
		try {
			preparedStatement = connection.prepareStatement(UPDATE_USER_DETAILS);
			
			preparedStatement.setString(1, userDTO.getUser_name());
			preparedStatement.setString(2, userDTO.getMobileno());
			preparedStatement.setString(3, userDTO.getBirthdate());
			preparedStatement.setString(4, userDTO.getCountry());
			preparedStatement.setString(5, userDTO.getState());
			preparedStatement.setString(6, userDTO.getDistrict());
			preparedStatement.setString(7, userDTO.getCity());
			preparedStatement.setString(8, userDTO.getArea());
			preparedStatement.setInt(9, userDTO.getPincode());
			preparedStatement.setString(10, userDTO.getGender());
			preparedStatement.setString(11, userDTO.getHobbies());
			preparedStatement.setString(12, userDTO.getLanguage());
			if (userDTO.getProfilePic() != null) {
				preparedStatement.setBlob(13, userDTO.getProfilePic());
			} else {
				preparedStatement.setNull(13, Types.BLOB);
			}
		preparedStatement.setInt(14, userDTO.getUser_id());

			// Execute the update
			int rowsUpdated = preparedStatement.executeUpdate();

			if (rowsUpdated > 0) {
				isupdate = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					DbConnection.closeConnection();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return isupdate;
	}

}