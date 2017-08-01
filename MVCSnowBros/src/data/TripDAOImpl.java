package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.ExtraCurr;
import entities.Trip;

@Transactional
@Repository
public class TripDAOImpl implements TripDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Trip createTrip(Trip trip) {
		try {
			em.persist(trip);

		} catch (Exception e) {
			return null;
		}
		em.flush();

		return trip;
	}

	@Override
	public List<Trip> searchTrip(String title) {
		List<Trip> trips = null;

		try {
			trips = em.createQuery("Select t FROM Trip t Where t.title LIKE :title", Trip.class)
					.setParameter("title", "%" + title + "%").getResultList();
			em.persist(trips);
			em.flush();

		} catch (Exception e) {

			return null;
		}

		return trips;
	}

	@Override
	public List<Trip> searchTrip(ExtraCurr ec) {
		List<Trip> trips = new ArrayList<>();

		try {
			trips = em.createQuery("Select ec.trips FROM ExtraCurr ec Where ec.id = :id", Trip.class)
					.setParameter("name", "%" + ec.getId() + "%").getResultList();
			em.persist(trips);
			em.flush();

		} catch (Exception e) {
			trips = null;
		}

		return trips;
	}

	@Override
	public Trip updateTrip(Trip trip) {
		Trip tripupdated = em.find(Trip.class, trip.getId());
		// update object
		tripupdated.setDate(trip.getDate());
		tripupdated.setDescription(trip.getDescription());
		tripupdated.setDestination(trip.getDestination());
		tripupdated.setExtraCurrs(trip.getExtraCurrs());
		tripupdated.setNumberSeats(trip.getNumberSeats());
		tripupdated.setPointOfOrigin(trip.getPointOfOrigin());
		tripupdated.setPointOfReturn(trip.getPointOfReturn());
		tripupdated.setRoundtrip(trip.getRoundtrip());
		tripupdated.setTitle(trip.getTitle());
		tripupdated.setUsers(trip.getUsers());

		em.persist(tripupdated);
		em.flush();

		return tripupdated;

	}

	@Override
	public Trip deleteTrip(Trip trip) {
		Trip trip1 = null;
		try {
			trip1 = em.find(Trip.class, trip.getId());
			em.remove(trip1);

		} catch (Exception e) {
			e.printStackTrace();
			trip1 = null;
		}

		return trip1;

	}

	@Override
	public List<Trip> allTrips() {
		return em.createQuery("Select t FROM Trip t", Trip.class).getResultList();

	}

}
