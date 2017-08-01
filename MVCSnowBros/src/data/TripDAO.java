package data;

import java.util.List;

import entities.ExtraCurr;
import entities.Trip;
import entities.User;

public interface TripDAO {

	public Trip createTrip(Trip trip);
	
	public List<Trip> searchTrip(String title);
	
	public List<Trip> searchTrip(ExtraCurr ec);
	
	public Trip updateTrip(Trip trip);
	
	public Trip deleteTrip(Trip trip);
	
	public List<Trip> allTrips();
	
}
