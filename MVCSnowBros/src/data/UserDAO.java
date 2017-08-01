package data;

import java.util.List;

import entities.Trip;
import entities.User;

public interface UserDAO {

	
	public User create(User user);
	
	public User validate(User user, String password);
	
	public List<Trip> userTrips(User user);
	
	public User updateUser(User user);
	
	public User deleteUser(User user);
	
	public User addFriends(User user);
}
