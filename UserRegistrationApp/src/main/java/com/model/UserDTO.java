package com.model;

import java.io.InputStream;
import java.io.Serializable;
import java.util.Arrays;

public class UserDTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private int user_id;
	private String user_name;
	private String email;
	private String mobileno;
	private String birthdate;
	private String country;
	private String state;
	private String district;
	private String city;
	private String area;
	private int pincode;
	private String gender;
	private String hobbies;
	private String language;
	private InputStream profilePic; // To store image
	private String password;
	private int serial_no; //To display it on dashboard
	private String converted_profile_image; // TO store converted image
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getConverted_profile_image() {
		return converted_profile_image;
	}

	public void setConverted_profile_image(String converted_profile_image) {
		this.converted_profile_image = converted_profile_image;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getHobbies() {
		return hobbies;
	}

	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public InputStream getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(InputStream profilePic) {
		this.profilePic = profilePic;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getSerial_no() {
		return serial_no;
	}

	public void setSerial_no(int serial_no) {
		this.serial_no = serial_no;
	}

	public UserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public UserDTO(int user_id, String user_name, String email, String mobileno, String birthdate, String country,
			String state, String district, String city, String area, int pincode, String gender, String hobbies,
			String language, InputStream profilePic, String password, int serial_no, String converted_profile_image) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.email = email;
		this.mobileno = mobileno;
		this.birthdate = birthdate;
		this.country = country;
		this.state = state;
		this.district = district;
		this.city = city;
		this.area = area;
		this.pincode = pincode;
		this.gender = gender;
		this.hobbies = hobbies;
		this.language = language;
		this.profilePic = profilePic;
		this.password = password;
		this.serial_no = serial_no;
		this.converted_profile_image = converted_profile_image;
	}
	@Override
	public String toString() {
		return "UserDTO [user_id=" + user_id + ", user_name=" + user_name + ", email=" + email + ", mobileno="
				+ mobileno + ", birthdate=" + birthdate + ", country=" + country + ", state=" + state + ", district="
				+ district + ", city=" + city + ", area=" + area + ", pincode=" + pincode + ", gender=" + gender
				+ ", hobbies=" + hobbies + ", language=" + language + ", profilePic=" + profilePic + ", password="
				+ password + ", serial_no=" + serial_no + ", converted_profile_image=" + converted_profile_image + "]";
	}
}