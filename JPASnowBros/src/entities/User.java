package entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;



@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToMany(cascade=CascadeType.REMOVE)
	@JoinTable(name = "user_friend",
	joinColumns = @JoinColumn(name = "user_id"),
	inverseJoinColumns = @JoinColumn(name = "friend_id")
			)
	private List<User> friends;
	
	@Column(name = "first_name")
	
	private String firstName;
	
	@Column(name = "last_name")
	private String lastName;
	
	@OneToMany(cascade=CascadeType.REMOVE, mappedBy = "user")
	private List<UserRating> userRating;
	
	@Column(name="admin")
	private boolean userType;
	
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy = "user")
	private List<Activity> activities;
	
	@ManyToMany(cascade=CascadeType.REMOVE,mappedBy = "users", fetch = FetchType.EAGER)
	private List<Trip> trips;
	
	private String email;
	
	@Column(name = "phone_number")
	private String phoneNumber;

	private String password;
	
	private String picture;
	
//	GETTERS AND SETTERS (GET HER? I HARDLY KNOW HER!) BELOW.

	public String getFirstName() {
		return firstName;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getId() {
		return id;
	}
	
	public List<Activity> getActivities() {
		return activities;
	}

	public void setActivities(List<Activity> activities) {
		this.activities = activities;
	}
	

	public List<UserRating> getUserRating() {
		return userRating;
	}

	public void setUserRating(List<UserRating> userRating) {
		this.userRating = userRating;
	}


	

	public boolean isUserType() {
		return userType;
	}

	public void setUserType(boolean userType) {
		this.userType = userType;
	}

	public List<Trip> getTrips() {
		return trips;
	}

	public void setTrips(List<Trip> trips) {
		this.trips = trips;
	}
	
	public List<User> getFriends() {
		return friends;
	}

	public void setFriends(List<User> friends) {
		this.friends = friends;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName 
				+ ", userType=" + userType + ", email=" + email + ", phoneNumber=" + phoneNumber + ", password="
				+ password + ", picture=" + picture + "]";
	}

}
