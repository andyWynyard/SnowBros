package test;

import static org.junit.Assert.*;

import java.time.LocalDateTime;
import java.time.Month;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Activity;
import entities.Destination;
import entities.ExtraCurr;
import entities.Return;
import entities.Trip;
import entities.User;
import entities.UserRating;

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
//	
//	@Test
//	public void test_that_userType_has_list_of_users_and_user_has_a_type() {
//		User u = em.find(User.class, 1);
////		UserType ut = u.getUserType();
//		assertNotNull(ut);
//		assertEquals(ut.getUsers().size(), 4);
//	}
//	
	@Test
	public void test_that_trip_has_many_users_and_users_have_many_trips() {
		User u = em.find(User.class, 1);
		Trip t = em.find(Trip.class, 2);
		assertEquals(u.getTrips().size(), 2);
		assertEquals(t.getUsers().size(), 3);
	}
	
	@Test
	public void test_that_trip_has_a_destination_and_destination_has_list_of_trips() {
		Trip t = em.find(Trip.class, 1);
		Destination d = t.getDestination();
		assertNotNull(d);
		assertEquals(d.getTrips().size(), 1);
	}
	
	@Test
	public void test_that_trip_has_list_of_extraCurrs_and_extra_currs_have_several_trips() {
		Trip t = em.find(Trip.class, 1);
		List<ExtraCurr> ec = t.getExtraCurrs();
		ExtraCurr ec1 = ec.get(0);
		ExtraCurr ec2 = ec.get(1);
		
		assertNotNull(ec);
		assertNotNull(ec1);
		assertNotNull(ec2);
		
		assertEquals(ec.size(), 3);
		assertEquals(ec1.getName(), "Dat Sweet Sweet Chronic");
		assertEquals(ec2.getName(), "Drank");
		
	}
	
	@Test
	public void test_that_each_trip_has_a_return_and_each_return_has_a_trip() {
		Trip t = em.find(Trip.class, 1);
		Return r = t.getRoundtrip();
		assertNotNull(r);
		LocalDateTime ldt = LocalDateTime.of(2017, Month.DECEMBER, 12, 14, 30, 00);
		assertEquals(r.getReturnTime(), ldt);
		assertEquals(t, r.getTrip());
	}
	
	@Test
	public void test_manyToMany_between_extraCurrs_and_trip() {
		Trip t = em.find(Trip.class, 1);
		ExtraCurr ec = em.find(ExtraCurr.class, 1);
		assertNotNull(ec.getTrips());
		assertNotNull(t.getExtraCurrs());
		assertTrue(ec.getTrips().size() > 0);
		assertTrue(t.getExtraCurrs().size() > 0);
	}
	
	@Test
	public void test_get_from_activity_to_extraCurrs() {
		Activity a = em.find(Activity.class, 1);
		User u = a.getUser();
		assertNotNull(u);
		assertEquals(u.getFirstName(), "Charlie");
		List<Trip> trips = u.getTrips();
		Trip t = trips.get(0);
		assertNotNull(t);
		assertEquals(t.getTitle(), "Charlie's Average sized trip to Shredville");
		List<ExtraCurr> ecs = t.getExtraCurrs();
		assertEquals(ecs.size(), 3);
		ExtraCurr ec = ecs.get(0);
		assertNotNull(ec);
		assertEquals(ec.getName(), "Dat Sweet Sweet Chronic");
	}

}
