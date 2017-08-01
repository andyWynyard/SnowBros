package test;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Activity;
import entities.User;

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
		assertEquals(u.getActivities().get(0), "Skiing");
		Activity a = em.find(Activity.class, 1);
		User u2 = a.getUser();
		assertNotNull(u2);
		assertEquals(u2.getFirstName(), "Chuck");
	}

}
