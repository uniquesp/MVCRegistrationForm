package com.controller;

import java.util.List;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.UserDao;
import com.dao.UserDaoInterfaces;
import com.model.UserDTO;

@WebServlet("/user_controller")
@MultipartConfig
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDaoInterfaces userDao;

	public void init() {
		userDao = new UserDao();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String op = request.getParameter("method");
		switch (op) {
		case "registration":
			InsertOrUpdateUser(request, response);
			break;
		case "login":
			LoginUser(request, response);
			break;
		case "delete":
			Delete_User(request, response);
			break;
		case "update":
			InsertOrUpdateUser(request, response);
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + op);

		}
	}

	public void LoginUser(HttpServletRequest request, HttpServletResponse response) {
		UserDTO userDTO = new UserDTO();
		String email = request.getParameter("user_mail");
		String password = request.getParameter("password");
		userDTO.setEmail(email);
		userDTO.setPassword(password);
		if (email != null && password != null) {
			try {
				if (userDao.getUser(userDTO)) {
					HttpSession session = request.getSession();
					session.setAttribute("user_mail", userDTO.getEmail());
					Display_User(userDTO, request, response);
				} else {
					response.getWriter().write("<script>window.alert('Incorrect Email or Password')</script>");
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");
					requestDispatcher.include(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void InsertOrUpdateUser(HttpServletRequest request, HttpServletResponse response) {
		UserDTO userDTO = new UserDTO();
		userDTO.setUser_name(request.getParameter("user_name"));
		userDTO.setEmail(request.getParameter("user_mail"));
		userDTO.setMobileno(request.getParameter("mobile_no"));
		userDTO.setBirthdate(request.getParameter("bdate"));
		userDTO.setCountry(request.getParameter("country"));
		userDTO.setState(request.getParameter("state"));
		userDTO.setDistrict(request.getParameter("district"));
		userDTO.setCity(request.getParameter("city"));
		userDTO.setArea(request.getParameter("area"));
		userDTO.setPincode(Integer.parseInt(request.getParameter("pincode")));
		userDTO.setGender(request.getParameter("gender"));
		userDTO.setHobbies(request.getParameter("hobbies"));
		userDTO.setPassword(request.getParameter("password"));
		String[] languages = request.getParameterValues("language");
		String languageString = (languages != null) ? String.join(",", languages) : "";
		//String languageString = (languages != null) ? String.join(" ", languages) : ""; //space seprated
		userDTO.setLanguage(languageString);
		if (isValidUser(userDTO)) {
			try {
			//	InputStream profilePicInputStream = null;
				Part filePart = request.getPart("profile_pic");
				if (filePart != null) {
					userDTO.setProfilePic(filePart.getInputStream());
				}
				String action = request.getParameter("action"); //  getting it to anlayze which form is coming register or updation
				if(action!=null) {
					if(action.equalsIgnoreCase("registeruser")){
						userDao.registerUser(userDTO);
						response.sendRedirect("Login.jsp");
					}else if(action.equalsIgnoreCase("updateuser")) {
						userDTO.setUser_id(Integer.parseInt(request.getParameter("userid")));
						userDao.updateUser(userDTO);
						Display_User(userDTO, request, response);
					}else {
						response.getWriter().write("<script>alert('Something Went Wrong!!!');</script>");					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void Delete_User(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("userid"));
		if(userDao.deleteUser(id)) {
			UserDTO userDTO = new UserDTO();
			Display_User(userDTO, request, response);
		}else {
			try {
				response.getWriter().write("<script>window.alert('Something went wrong!!!')</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
	}

	public void Display_User(UserDTO userDto, HttpServletRequest request, HttpServletResponse response) {
		try {
			response.sendRedirect("UserDetails.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private boolean isValidUser(UserDTO userDTO) {
		// Validate userDTO fields
		return userDTO.getUser_name() != null && userDTO.getEmail() != null && userDTO.getMobileno() != null
				&& userDTO.getBirthdate() != null && userDTO.getCountry() != null && userDTO.getState() != null
				&& userDTO.getDistrict() != null && userDTO.getCity() != null && userDTO.getArea() != null
				&& userDTO.getGender() != null && userDTO.getHobbies() != null && userDTO.getPassword() != null
				&& userDTO.getLanguage() != null && !userDTO.getUser_name().equals("") && !userDTO.getEmail().equals("")
				&& !userDTO.getMobileno().equals("") && !userDTO.getBirthdate().equals("")
				&& !userDTO.getCountry().equals("") && !userDTO.getState().equals("")
				&& !userDTO.getDistrict().equals("") && !userDTO.getCity().equals("") && !userDTO.getArea().equals("")
				&& !userDTO.getGender().equals("") && !userDTO.getHobbies().equals("")
				&& !userDTO.getPassword().equals("") && !userDTO.getLanguage().equals("");
	}

}
