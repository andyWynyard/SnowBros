package data;

import java.util.List;
import java.util.Set;

import entities.Trip;
import entities.User;

public interface UserDAO {

	
	public User create(User user);
	
	//testing need to add a method for getting all users
	public List<User> getAllUsers();
	
	public User validate(String email, String password);
	
	public List<Trip> userTrips(User user);
	
	public User updateUser(User user);
	
	public User deleteUser(User user);
	
	public User addFriend(User user, User friend);

	public User rateUser(User user, int raterId, int rating);
	
	public User findUserById(int id);
	
	public String findUserPasswordByEmail(String email);

	public Set<User> searchForUserByName(String name);
	
	public List<User> viewFriends(User user);
	
	public double getUserRating(User user);
	
}
