package controllers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import data.TripDAO;
import data.UserDAO;
import entities.Destination;
import entities.ExtraCurr;
import entities.Trip;
import entities.User;

@Controller
@SessionAttributes("user")
public class SnowBroController {
	@Autowired
	private TripDAO td;
	@Autowired
	private UserDAO ud;

	@ModelAttribute("user")
	public User initSessionUser() {

		User u = new User();

		return u;

	}

	/////////////////////////////////////////////////////////
	//////////////////// SEARCH.JSP///////////////////////
	//////////////////////////////////////////////////
	@RequestMapping(path = "searchPage.do")
	public String allTrips(@ModelAttribute("user") User user, Model model) {
		List<Trip> trips = td.allTrips();
		model.addAttribute("searchResults", null);
		model.addAttribute("allTrips", trips);
		model.addAttribute("user",user);
		return "search.jsp";
	}

	@RequestMapping(path = "searchTrip.do")
	public String SearchTitle(@ModelAttribute("user")User user,@RequestParam("searchTitle") String title, Model model) {
		Set<Trip> trips = td.searchTrip(title);
		System.out.println("controller......." + trips);
		model.addAttribute("searchResults", trips);
		model.addAttribute("user",user);
		return "search.jsp";
	}
	
	@RequestMapping(path = "searchUser.do", method = RequestMethod.GET)
	public String searchUser(@ModelAttribute("user") User user, @RequestParam("searchUser") String search, Model model) {
		Set<User> users = ud.searchForUserByName(search);
		System.out.println(users);
		model.addAttribute("searchBros", users);
		model.addAttribute("user", user);
		return "search.jsp";
	}

	// @RequestMapping(path = "searchExtra.do")
	// public String SearchTitle(@RequestParam("searchEC") ExtraCurr ec, Model
	// model) {
	// List<Trip> trips = td.searchTrip(ec.getName());
	// model.addAttribute("searchResults", trips);
	// return "search.jsp";
	// }
	//
	// @RequestMapping(path = "searchUser.do")
	// public String SearchTitle(@RequestParam("searchUser") User u, Model model) {
	// List<Trip> trips = ud.userTrips(u);
	// model.addAttribute("searchResults", trips);
	// return "search.jsp";
	// }

	/////////////////////////////////////////////////////////
	//////////////////// createEditProfile.jsp///////////////
	///////////////////////////////////////////////////////

	@RequestMapping(path = "createProfile1.do")
	public String CreateProfile(Model model) {
		return "createProfile.jsp";
	}

	@RequestMapping(path = "createProfile.do")
	public String CreateProfile(Model model, @RequestParam("firstName") String fName,
			@RequestParam("lastName") String lName, @RequestParam("email") String email,
			@RequestParam("picture") String picture, @RequestParam("password") String password) {
		User user = new User();
		user.setFirstName(fName);
		user.setLastName(lName);
		user.setEmail(email);
		user.setPassword(password);
		user.setPicture(picture);
		user.setUserType(false);
		ud.create(user);
		model.addAttribute("user", user);
		model.addAttribute("rating", ud.getUserRating(user));
		return "index.jsp";
	}

	@RequestMapping(path = "editProfile.do")
	public String EditProfile(@ModelAttribute("user") User user, Model model, @RequestParam("firstName") String fName,
			@RequestParam("lastName") String lName, @RequestParam("email") String email,
			@RequestParam("picture") String picture, @RequestParam("password") String password) {
		User user1 = ud.findUserById(user.getId());
		user1.setFirstName(fName);
		user1.setLastName(lName);
		user1.setEmail(email);
		user1.setPassword(password);
		user1.setPicture(picture);
		ud.updateUser(user1);
		model.addAttribute("user", user1);
		model.addAttribute("rating", ud.getUserRating(user1));
		System.out.println(ud.getUserRating(user1));
		return "user.jsp";
	}

	/////////////////////////////////////////////////////////
	//////////////////// createEditTrip.jsp///////////////
	///////////////////////////////////////////////////////

	@RequestMapping(path = "createTrip.do")
	public String CreateTrip(@ModelAttribute("user") User user, Model model, @RequestParam("title") String title,
			@RequestParam("destination") String dest, @RequestParam("description") String desc,
			@RequestParam("pointOfOrigin") String pO, @RequestParam("date") String date,
			@RequestParam("pointOfReturn") String pR, @RequestParam("numberSeats") int seats,
			@RequestParam("extraCurrs") String ec, @RequestParam("userId") int userId) {
		Trip trip = new Trip();
		Destination d = td.findDestinationByNameOrCreateNewDestination(dest);
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm a");
		Date datey = new Date();
		try {
			datey = format.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		trip.setTitle(title);
		trip.setDestination(d);
		trip.setDescription(desc);
		trip.setPointOfOrigin(pO);
		trip.setDate(datey);
		trip.setPointOfReturn(pR);
		trip.setNumberSeats(seats);
		List<User> users = new ArrayList<>();
		users.add(user);
		trip.setUsers(users);
		// trip.setExtraCurrs(ec);
		trip.setOwnerId(userId);
		Trip t = td.createTrip(trip);
		List <Trip> trips= user.getTrips();
		trips.add(trip);
		user.setTrips(trips);
		System.out.println(user.getTrips());
		System.out.println(trip.getUsers());
		model.addAttribute("trip", t);
		model.addAttribute("user",user);
		return "trip.jsp";
	}

	@RequestMapping(path = "editTrip.do")
	public String editTrip(@ModelAttribute("user") User user, Model model, @RequestParam("title") String title,
			@RequestParam("destination") Destination dest, @RequestParam("description") String desc,
			@RequestParam("pointOfOrigin") String pO, @RequestParam("date") Date date,
			@RequestParam("pointOfReturn") String pR, @RequestParam("numberSeats") int seats,
			@RequestParam("extraCurr") ExtraCurr ec, @RequestParam("userId") int userId) {
		Trip trip = new Trip();
		trip.setTitle(title);
		trip.setDestination(dest);
		trip.setDescription(desc);
		trip.setPointOfOrigin(pO);
		trip.setDate(date);
		trip.setPointOfReturn(pR);
		trip.setNumberSeats(seats);
		trip.setOwnerId(userId);
		// trip.setExtraCurrs(ec);
		model.addAttribute("user",user);
		model.addAttribute("trip", trip);
		return "trip.jsp";
	}

	//////////////////////////// Index.jsp//////////////////////////////////////////////////////

	// User validate(String email, String password)

	@RequestMapping(path = "getUser.do")
	public String validate(@ModelAttribute("user") User user, Model model, @RequestParam("email") String email,
			@RequestParam("password") String password) {
		User u = ud.validate(email, password);
		if (u != null) {

			model.addAttribute("user", u);
			model.addAttribute("rating", ud.getUserRating(u));

			return "user.jsp";

		} else {
			return "index.jsp";

		}

	}

	//////////////////////////// Trip and
	//////////////////////////// User.jsp/////////////////////////////////////////////

	@RequestMapping(path = "logOut.do", method = RequestMethod.GET)
	public String logout(SessionStatus ss, Model model) {
		
		ss.setComplete();
		return "index.jsp";
	}

	@RequestMapping(path = "getProfilePage.do", method = RequestMethod.GET)
	public String goToProfile(@ModelAttribute("user") User user, Model model,
			@RequestParam(name = "userId") int userId) {
		model.addAttribute("user", ud.findUserById(userId)); // ud.findUserById(userId) returns a user object
		model.addAttribute("rating", ud.getUserRating(user));
		System.out.println(ud.getUserRating(user));
		return "user.jsp";
	}

	@RequestMapping(path = "editTripPage.do", method = RequestMethod.GET)
	public String goToEditTrip(@ModelAttribute("user") User user, Model model,
			@RequestParam(name = "tripId") int tripId) {
		model.addAttribute("trip", td.findTripById(tripId));
		return "editTrip.jsp";
	}

	@RequestMapping(path = "addMeToTrip.do", method = RequestMethod.POST)
	public String addMeToTrip(@ModelAttribute("user") User user, Model model, @RequestParam(name = "userId") int userId,
			@RequestParam(name = "tripId") int tripId) {
		Trip t = td.findTripById(tripId);
		User u = ud.findUserById(userId);
		t.setNumberSeats(t.getNumberSeats() - 1);
		List<User> users = t.getUsers();
		System.out.println(users.toString());
		users.add(u);
		t.setUsers(users);
		System.out.println(t.getUsers().toString());
		td.updateTrip(t);

		model.addAttribute("trip", t);
		return "trip.jsp";
	}

	@RequestMapping(path = "editUserPage.do", method = RequestMethod.GET)
	public String goToEditUserPage(@ModelAttribute("user") User user, Model model, @RequestParam("userId") int userId) {
		model.addAttribute("user", ud.findUserById(userId));
		return "editProfile.jsp";
	}

	@RequestMapping(path = "deleteTrip.do", method = RequestMethod.POST)
	public String deleteTrip(@ModelAttribute("user") User user, Model model, @RequestParam("tripId") int tripId,
			@RequestParam("userId") int userId) {
		td.deleteTrip(td.findTripById(tripId));
		model.addAttribute("user", ud.findUserById(userId));
		model.addAttribute("rating", ud.getUserRating(user));
		return "user.jsp";
	}

	@RequestMapping(path = "deleteUser.do", method = RequestMethod.POST)
	public String deleteUser(@ModelAttribute("user") User user, Model model,
			@RequestParam(name = "userId") int userId) {
		ud.deleteUser(ud.findUserById(userId));
		return "index.jsp";
	}

	@RequestMapping(path = "viewTrip.do", method = RequestMethod.GET)
	public String viewTrip(@ModelAttribute("user") User user, Model model, @RequestParam(name = "tripId") int tripId) {
		model.addAttribute("trip", td.findTripById(tripId));
		return "trip.jsp";
	}

	@RequestMapping(path = "createTripPage.do", method = RequestMethod.GET)
	public String goToCreateTripPage(@ModelAttribute("user") User user, Model model,
			@RequestParam(name = "userId") int userId) {
		model.addAttribute("user", ud.findUserById(userId));
		return "createTrip.jsp";
	}


	///////////////////////////////////////////////////
	///////////// FRIEND STUFF ////////////////////////
	//////////////////////////////////////////////////
	
	@RequestMapping(path = "addFriend.do", method = RequestMethod.POST)
	public String addFriend(@ModelAttribute("user") User user, Model model,
			@RequestParam(name = "friendId") int friendId) {
		User friend = ud.findUserById(friendId);
		user = ud.addFriend(user, friend);
		
		model.addAttribute("user", user);
		model.addAttribute("rating", ud.getUserRating(user));
		return "user.jsp";
	}
	
	@RequestMapping(path = "viewFriends.do", method = RequestMethod.GET)
	public String viewFriends(@ModelAttribute("user") User user, Model model) {
		
		List<User> friends = ud.viewFriends(user);
		model.addAttribute("allFriends", friends);
		model.addAttribute("user", user);
		return "friendsList.jsp";
	}
	
	

}
