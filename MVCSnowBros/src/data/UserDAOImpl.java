package data;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

	// public User findUserByEmail(String email);
	@Override
	public String findUserPasswordByEmail(String email) {
		String query = "SELECT u FROM User u WHERE u.email = :email";
		try {
			User u = em.createQuery(query, User.class).setParameter("email", email).getSingleResult();
			String passWord = u.getPassword();
			return passWord;
		} catch (Exception e) {
			return null;
		}
	}
	
	//********* testing adding a method that retrieves all users from the database

		@Override
		public List<User> getAllUsers() {
			List<User> allUsers = new ArrayList<>();
			String query = "SELECT u FROM User u";
			try {
				allUsers = em.createQuery(query, User.class).getResultList();
				return allUsers;

			} catch (Exception e) {
				return allUsers;
			}
		}
		
		//_______________________________________________________

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
			u.setPicture(user.getPicture());
			u.setFriends(user.getFriends());
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
	public User addFriend(User user, User friend) {
		User u = em.find(User.class, user.getId());
		List<User> friends = u.getFriends();
		if (friends == null) {
			friends = new ArrayList<>();
		}
		friends.add(friend);
		u.setFriends(friends);
		return u;
	}

	@Override
	public User rateUser(User user, int raterId, int rating) {
		User u = null;

		try {
			u = em.find(User.class, user.getId());
			UserRating ur = new UserRating();
			ur.setUser(user);
			ur.setValue(rating);
			ur.setRateId(raterId);
			em.persist(ur);
			em.flush();

		} catch (Exception e) {
			return u;
		}

		return u;
	}

	@Override
	public User findUserById(int id) {
		User u = em.find(User.class, id);
		return u;
	}

	@Override
	public List<User> viewFriends(User user) {
		String query = "SELECT u FROM User u JOIN FETCH u.friends WHERE u.id = :id";
		User u = new User();
		try {
			u = em.createQuery(query, User.class).setParameter("id", user.getId()).getResultList().get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<User> friends = u.getFriends();
		if (friends == null) {
			friends = new ArrayList<>();
		} 
		return friends;
	}

	@Override
	public Set<User> searchForUserByName(String name) {
		List<User> userResults = new ArrayList<>();
		String query = "SELECT u FROM User u WHERE u.firstName LIKE :search OR u.lastName LIKE :search1";
		try {
			userResults = em.createQuery(query, User.class).setParameter("search", "%" + name + "%")
					.setParameter("search1", "%" + name + "%").getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		Set<User> users = new HashSet<>();
		for (User user : userResults) {
			users.add(user);
		}
		return users;
	}

	@Override
	public double getUserRating(User user) {

		String query = "SELECT u FROM User u JOIN FETCH u.userRating WHERE u.id = :id";
		User u = user;
		try {
			u = em.createQuery(query, User.class).setParameter("id", user.getId()).getResultList().get(0);
		} catch (Exception e) {
			return 0;
		}
		List<UserRating> ratings = new ArrayList<>();
		try {
			ratings = u.getUserRating();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (ratings.size() == 0 || ratings == null) {
			return 0;
		}
		double total = 0;
		double counter = ratings.size();
		for (UserRating rating : ratings) {
			total += rating.getValue();
		}
		double rating = total / counter;
		rating = Double.parseDouble(new DecimalFormat("#.##").format(rating));
		return rating;
	}

	@Override
	public List<UserRating> viewUserRating(User user) {

		String query = "SELECT r FROM UserRating r JOIN FETCH r.user WHERE r.user.id = :id";
		List<UserRating> ratings = null;
		try {
			ratings = em.createQuery(query, UserRating.class)
						.setParameter("id", user.getId())
						.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO : Add exception handler?
		}

		return ratings;
	}

	@Override
	public boolean deleteFriend(User user, User bro) {
		List<User> friends = user.getFriends();
		System.out.println(friends);
		boolean remove = false;
		try {
			for (User friend : friends) {
				if (friend.getId() == bro.getId()) {
					friends.remove(friend);
					user.setFriends(friends);
					remove = true;
					break;
				} else {
					remove = false;
					continue;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return remove;
	}
}