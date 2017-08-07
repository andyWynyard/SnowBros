package data;

import java.util.Date;
import java.util.List;
import java.util.Set;

import entities.Destination;
import entities.Message;
import entities.Trip;
import entities.User;

public interface TripDAO {

	public Trip createTrip(Trip trip);
	
	public Set<Trip> searchTrip(String search);
	
	public Trip updateTrip(Trip trip);
	
	public Trip deleteTrip(Trip trip);
	
	public List<Trip> allTrips();
	
	public Trip findTripById(int id);
	
	public List<User> getAllUsersOnTrip(int tripId);
	
	public Destination findDestinationByNameOrCreateNewDestination(String name);
	
	public Trip removeBroFromTrip(Trip trip, User bro);
	
	public Trip addMessage(User user, Trip trip, String message, String date);
	
	public List<Message> getMessagesByTripId(int tripId);
}
