package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Trip;
import entities.User;
import entities.UserRating;

@Transactional
@Repository
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User create(User user) {
		try {
			System.out.println("*************************************************"+user);
			em.persist(user);
			
			em.flush();

			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public User validate(String email, String password) {
		String query = "SELECT u FROM User u WHERE u.email = :email";
		User user = null;
		try {
			List<User> users = em.createQuery(query, User.class).setParameter("email", email).getResultList();
			user = users.get(0);
			return user;
		} catch (Exception e) {
			return user;
		}
	}

	@Override
	public List<Trip> userTrips(User user) {
		List<Trip> userTrips = new ArrayList<>();
		String query = "SELECT u.trips FROM User u WHERE u.id = :id";
		try {
			userTrips = em.createQuery(query, Trip.class).setParameter("id", user.getId()).getResultList();
			return userTrips;

		} catch (Exception e) {
			return userTrips;
		}
	}

	@Override
	public User updateUser(User user) {
		try {
			User u = em.find(User.class, user.getId());
			u.setActivities(user.getActivities());
			u.setEmail(user.getEmail());
			u.setFirstName(user.getFirstName());
			u.setLastName(user.getLastName());
			u.setPassword(user.getPassword());
			u.setPhoneNumber(user.getPhoneNumber());
			u.setTrips(user.getTrips());
			u.setUserRating(user.getUserRating());
			u.setUserType(user.isUserType());
			return u;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public User deleteUser(User user) {
		try {
			User u = em.find(User.class, user.getId());
			// Remove managed entity
			em.remove(u);
			// Return detached entity
			return u;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public User addFriends(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User rateUser(User user, int rating) {
		User u = null;

		try {
			u = em.find(User.class, user.getId());
			UserRating ur = new UserRating();
			ur.setUser(user);
			ur.setValue(rating);
			em.persist(ur);
			em.flush();

		} catch (Exception e) {
			// TODO: handle exception
			return u;
		}

		return u;
	}
	
	@Override
	public User findUserById(int id) {
		User u = em.find(User.class, id);
		return u;
	}

}
