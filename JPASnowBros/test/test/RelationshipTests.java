package test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Activity;
import entities.Trip;
import entities.User;
import entities.UserRating;
import entities.UserType;

public class RelationshipTests {
	
	private EntityManagerFactory emf;
	private EntityManager em;
	
	@Before
	public void setUp() throws Exception{
		emf = Persistence.createEntityManagerFactory("SnowBros");
		em = emf.createEntityManager();
	}
	
	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	public void test_that_users_have_list_of_activities_and_activity_has_one_user() {
		User u = em.find(User.class, 1);
		List<Activity> activities = u.getActivities();
		assertNotNull(activities);
		assertEquals(u.getActivities().get(0).getName(), "Skiing");
		Activity a = em.find(Activity.class, 1);
		User u2 = a.getUser();
		assertNotNull(u2);
		assertEquals(u2.getFirstName(), "Charlie");
	}
	
	@Test
	public void test_that_user_has_many_ratings_and_ratings_has_a_user() {
		User u = em.find(User.class, 1);
		List<UserRating> ratings = u.getUserRating();
		assertNotNull(ratings);
		assertEquals(u.getUserRating().get(0).getValue(), 4);
		UserRating ur = em.find(UserRating.class, 1);
		User u2 = ur.getUser();
		assertNotNull(u2);
		assertEquals(u2.getFirstName(), "Charlie");
	}
	
	@Test
	public void test_that_userType_has_list_of_users_and_user_has_a_type() {
		User u = em.find(User.class, 1);
		UserType ut = u.getUserType();
		assertNotNull(ut);
		assertEquals(ut.getUsers().size(), 4);
	}
	
	@Test
	public void test_that_trip_has_many_users_and_users_have_many_trips() {
		User u = em.find(User.class, 1);
		Trip t = em.find(Trip.class, 2);
		assertEquals(u.getTrips().size(), 3);
		assertEquals(t.getUsers().size(), 3);
		
	}

}
