package data;

import java.util.List;

import entities.Trip;
import entities.User;

public interface UserDAO {

	
	public User create(User user);
	
	public User validate(String email, String password);
	
	public List<Trip> userTrips(User user);
	
	public User updateUser(User user);
	
	public User deleteUser(User user);
	
	public User addFriend(User user, User friend);

	public User rateUser(User user, int rating);
	
	public User findUserById(int id);
	
	public List<User> searchForUserByName(String name);
	
	public List<User> viewFriends(User user);
}
