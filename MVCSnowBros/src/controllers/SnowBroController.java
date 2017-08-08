package controllers;

import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import data.EncryptionDAO;
import data.TripDAO;
import data.UserDAO;
import entities.Destination;
import entities.Message;
import entities.Trip;
import entities.User;
import entities.UserRating;

@Controller
@SessionAttributes("user")
public class SnowBroController {
	@Autowired
	private TripDAO td;
	@Autowired
	private UserDAO ud;
	@Autowired
	private EncryptionDAO ed;

	@ModelAttribute("user")
	public User initSessionUser() {

		User u = new User();

		return u;

	}
	
	
	@RequestMapping(path="index.do")
	public String getIndex() {
		
		return "index.jsp";
	}
	
	

	/////////////////////////////////////////////////////////
	//////////////////// SEARCH.JSP///////////////////////
	//////////////////////////////////////////////////
	@RequestMapping(path = "searchPage.do")
	public String allTrips(@ModelAttribute("user") User user, Model model) {
		List<Trip> trips = td.allTrips();
		model.addAttribute("searchResults", null);
		model.addAttribute("allTrips", trips);
		model.addAttribute("allBros", ud.getAllUsers());
		model.addAttribute("user", user);
		model.addAttribute("rating", ud.getUserRating(user));
		return "search.jsp";
	}

	@RequestMapping(path = "searchTrip.do")
	public String SearchTitle(@ModelAttribute("user") User user, @RequestParam("searchTitle") String title,
			Model model) {
		Set<Trip> trips = td.searchTrip(title);
		System.out.println("controller......." + trips);
		model.addAttribute("searchResults", trips);
		model.addAttribute("user", user);
		model.addAttribute("rating", ud.getUserRating(user));
		return "search.jsp";
	}

	@RequestMapping(path = "searchUser.do", method = RequestMethod.GET)
	public String searchUser(@ModelAttribute("user") User user, @RequestParam("searchUser") String search,
			Model model) {
		Set<User> users = ud.searchForUserByName(search);
		System.out.println(users);
		model.addAttribute("searchResultsUsers", users);
		model.addAttribute("rating", ud.getUserRating(user));
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
			@RequestParam("picture") String picture, @RequestParam("password") String password)
			throws NoSuchAlgorithmException {
		User user = new User();
		user.setFirstName(fName);
		user.setLastName(lName);
		user.setEmail(email);
		// i need to encrypt the password rt here
		user.setPassword(ed.encrypt(password));
		// .setPassword(password);
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
		List<User> friends = ud.viewFriends(user);
		model.addAttribute("friends", friends);
		System.out.println(ud.getUserRating(user1));
		return "user.jsp";
	}

	/////////////////////////////////////////////////////////
	//////////////////// createEditTrip.jsp///////////////
	///////////////////////////////////////////////////////

	@RequestMapping(path = "createTrip.do")
	public String CreateTrip(@ModelAttribute("user") User user, Model model, @RequestParam("title") String title,
			@RequestParam("destination") String dest, @RequestParam("description") String desc,
			@RequestParam("pointOfOrigin") String pO, @RequestParam("tripdate") String date,
			@RequestParam("pointOfReturn") String pR, @RequestParam("numberSeats") int seats,
			@RequestParam("userId") int userId) {
		Trip trip = new Trip();

		System.out.println("what is given" + date);
		date = date.replaceAll("T", " ");
		System.out.println("what is given" + date);
		Destination d = td.findDestinationByNameOrCreateNewDestination(dest);
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
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
		System.out.println(datey);
		trip.setPointOfReturn(pR);
		trip.setNumberSeats(seats);
		List<User> users = new ArrayList<>();
		users.add(user);
		trip.setUsers(users);
		// trip.setExtraCurrs(ec);
		trip.setOwnerId(userId);
		Trip t = td.createTrip(trip);
		List<Trip> trips = user.getTrips();
		trips.add(trip);
		user.setTrips(trips);

		model.addAttribute("trip", t);
		List<Message> messages = td.getMessagesByTripId(t.getId());
		model.addAttribute("messages", messages);
		model.addAttribute("rating", ud.getUserRating(user));
		model.addAttribute("user", user);
		return "trip.jsp";
	}

	@RequestMapping(path = "editTrip.do")
	public String editTrip(@ModelAttribute("user") User user, Model model, @RequestParam("title") String title,
			@RequestParam("destination") String dest, @RequestParam("description") String desc,
			@RequestParam("pointOfOrigin") String pO, @RequestParam("date") String date,
			@RequestParam("pointOfReturn") String pR, @RequestParam("numberSeats") int seats,
			/* @RequestParam("extraCurr") ExtraCurr ec, */ @RequestParam("userId") int userId) {
		Trip trip = new Trip();
		Destination d = td.findDestinationByNameOrCreateNewDestination(dest);
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		System.out.println("what is given" + date);
		date = date.replaceAll("T", " ");
		System.out.println("what is given" + date);
		Date datey = new Date();
		try {
			datey = format.parse(date);
			System.out.println(datey);
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
		trip.setOwnerId(userId);
		// trip.setExtraCurrs(ec);
		model.addAttribute("user", user);
		model.addAttribute("rating", ud.getUserRating(user));
		model.addAttribute("trip", trip);
		List<Message> messages = td.getMessagesByTripId(trip.getId());
		model.addAttribute("messages", messages);
		return "trip.jsp";
	}

	//////////////////////////// Index.jsp//////////////////////////////////////////////////////

	// User validate(String email, String password)

	@RequestMapping(path = "getUser.do")
	public String validate(User user, Errors errors, Model model) {

		// ************* testing encryption ************************************
		// validate password
		String email = user.getEmail();
		String password = user.getPassword();
		System.out.println(ud.findUserPasswordByEmail(email) + " from database");
		System.out.println(password + " from user");
		boolean passWordMatches = ed.matches(password, ud.findUserPasswordByEmail(email));
		// print out true or false for password matching
		System.out.println(passWordMatches);
		User u = ud.validate(email, password);
		if (u == null) {
			errors.rejectValue("email", "error.email",
		  		    "The email you entered is not associated with an account, please try another, or create a new account");
		}
		else if (!passWordMatches) {
			errors.rejectValue("password", "error.password", "Invalid password");
		}
		else if (u != null && passWordMatches) {
			if (u.isUserType() == true) {
				model.addAttribute("user", u);
				model.addAttribute("allUsers", ud.getAllUsers());
				model.addAttribute("allTrips", td.allTrips());
				return "admin.jsp";
			} else if (u.isUserType() == false) {
				model.addAttribute("user", u);
				model.addAttribute("rating", ud.getUserRating(u));
				List<User> friends = ud.viewFriends(u);
				model.addAttribute("friends", friends);
				return "user.jsp";
			}
			return "index.jsp";
		} 
		
		if (errors.getErrorCount() != 0) {
		      // If there are any errors, return the login form.
		      return "index.jsp";
		}
		//If no errors, send the user forward to the profile view.
	    return "user.jsp";
		
		
		

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
		List<User> friends = ud.viewFriends(user);
		model.addAttribute("friends", friends);
		System.out.println(ud.getUserRating(user));
		return "user.jsp";
	}

	@RequestMapping(path = "editTripPage.do", method = RequestMethod.GET)
	public String goToEditTrip(@ModelAttribute("user") User user, Model model,
			@RequestParam(name = "tripId") int tripId) {
		model.addAttribute("trip", td.findTripById(tripId));
		model.addAttribute("rating", ud.getUserRating(user));
		model.addAttribute("user", user);
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
		List<User> riders = td.findTripById(tripId).getUsers();
		boolean riderCheck = false;
		for (User user2 : riders) {
			if (user2.getId() == user.getId()) {
				riderCheck = true;
			}
		}
		List<Message> messages = td.getMessagesByTripId(t.getId());
		model.addAttribute("messages", messages);
		model.addAttribute("rider", riderCheck);
		model.addAttribute("trip", t);
		model.addAttribute("rating", ud.getUserRating(user));
		model.addAttribute("user", user);
		return "trip.jsp";
	}

	@RequestMapping(path = "editUserPage.do", method = RequestMethod.GET)
	public String goToEditUserPage(@ModelAttribute("user") User user, Model model, @RequestParam("userId") int userId) {
		model.addAttribute("user", ud.findUserById(userId));
		model.addAttribute("rating", ud.getUserRating(user));
		return "editProfile.jsp";
	}

	@RequestMapping(path = "deleteTrip.do", method = RequestMethod.POST)
	public String deleteTrip(@ModelAttribute("user") User user, Model model, @RequestParam("tripId") int tripId,
			@RequestParam("userId") int userId) {
		td.deleteTrip(td.findTripById(tripId));
		model.addAttribute("user", ud.findUserById(userId));
		model.addAttribute("rating", ud.getUserRating(user));
		List<User> friends = ud.viewFriends(user);
		model.addAttribute("friends", friends);
		return "user.jsp";
	}

	@RequestMapping(path = "deleteTripAdmin.do", method = RequestMethod.POST)
	public String deleteTripadmin(@ModelAttribute("user") User user, Model model, @RequestParam("tripId") int tripId) {
		td.deleteTrip(td.findTripById(tripId));
		model.addAttribute("allUsers", ud.getAllUsers());
		model.addAttribute("allTrips", td.allTrips());
		return "admin.jsp";
	}

	@RequestMapping(path = "deleteUserAdmin.do", method = RequestMethod.POST)
	public String deleteUserAdmin(@ModelAttribute("user") User user, Model model,
			@RequestParam(name = "deleteId") int userId) {
		ud.deleteUser(ud.findUserById(userId));
		model.addAttribute("allUsers", ud.getAllUsers());
		model.addAttribute("allTrips", td.allTrips());
		return "admin.jsp";
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
		model.addAttribute("rating", ud.getUserRating(user));
		model.addAttribute("user", user);

		List<User> riders = td.findTripById(tripId).getUsers();
		boolean riderCheck = false;
		for (User user2 : riders) {
			if (user2.getId() == user.getId()) {
				riderCheck = true;
			}
		}
		model.addAttribute("rider", riderCheck);
		List<Message> messages = td.getMessagesByTripId(tripId);
		model.addAttribute("messages", messages);

		return "trip.jsp";
	}

	@RequestMapping(path = "postMessage.do", method = RequestMethod.POST)
	public String postMessageToTrip(@ModelAttribute("user") User user, Model model, @RequestParam("tripId") int tripId,
			@RequestParam("message") String message) {
		model.addAttribute("rating", ud.getUserRating(user));
		model.addAttribute("user", user);

		List<User> riders = td.findTripById(tripId).getUsers();
		boolean riderCheck = false;
		for (User user2 : riders) {
			if (user2.getId() == user.getId()) {
				riderCheck = true;
			}
		}
		Trip trip = td.findTripById(tripId);

		Date date = new Date();

		trip = td.addMessage(user, trip, message, date);

		List<Message> messages = td.getMessagesByTripId(tripId);
		model.addAttribute("trip", trip);
		model.addAttribute("messages", messages);
		model.addAttribute("rider", riderCheck);

		return "trip.jsp";
	}

	@RequestMapping(path = "createTripPage.do", method = RequestMethod.GET)
	public String goToCreateTripPage(@ModelAttribute("user") User user, Model model,
			@RequestParam(name = "userId") int userId) {
		model.addAttribute("user", ud.findUserById(userId));
		model.addAttribute("rating", ud.getUserRating(user));
		return "createTrip.jsp";
	}

	///////////////////////////////////////////////////
	///////////// FRIEND STUFF ////////////////////////
	//////////////////////////////////////////////////

	@RequestMapping(path = "addFriend.do", method = RequestMethod.POST)
	public String addFriend(@ModelAttribute("user") User user, @RequestParam(name = "broId") int broId, Model model) {
		User friend = ud.findUserById(broId);
		user = ud.addFriend(user, friend);

		model.addAttribute("user", user);
		model.addAttribute("rating", ud.getUserRating(user));
		model.addAttribute("friend", ud.viewFriends(user));
		return "user.jsp";
	}

	@RequestMapping(path = "ViewUser.do", method = RequestMethod.GET)
	public String goToBrosUserPage(@ModelAttribute("user") User user, Model model, @RequestParam("broId") int broId) {
		model.addAttribute("user", user);
		model.addAttribute("rating", ud.getUserRating(user));
		User u = ud.findUserById(broId);
		List<User> friends;
		if (ud.viewFriends(user) == null) {
			friends = new ArrayList<>();
		} else {
			friends = ud.viewFriends(user);
		}
		List<UserRating> ratings = ud.viewUserRating(u);
		if (ratings == null) {
			ratings = new ArrayList<>();
		}
		boolean b = true;
		boolean previousRater = true;
		for (User use : friends) {
			if (use.getId() == u.getId()) {
				b = false;
				break;
			}
		}
		
			for (UserRating ur : ratings) {
				if (ur.getRateId() == user.getId()) {
					previousRater = false;
					break;
				}
				 else {
					previousRater = true;
				}
			}
		
		model.addAttribute("addFriend", b);
		model.addAttribute("previousRater", previousRater);
		model.addAttribute("brorating", ud.getUserRating(u));
		model.addAttribute("bro", u);

		return "bro.jsp";
	}

	@RequestMapping(path = "rate.do", method = RequestMethod.GET)
	public String goToRate(@ModelAttribute("user") User user, Model model, @RequestParam("broId") int broId,
			@RequestParam("rating") int rating) {
		model.addAttribute("user", user);
		model.addAttribute("rating", ud.getUserRating(user));
		ud.rateUser(ud.findUserById(broId), user.getId(), rating);
		User u = ud.findUserById(broId);
		List<User> friends;
		if (ud.viewFriends(user) == null) {
			friends = new ArrayList<>();
		} else {
			friends = ud.viewFriends(user);
		}
		boolean b = true;
		for (User use : friends) {
			if (use.getId() == u.getId()) {
				b = false;
				break;
			}
		}
		model.addAttribute("addFriend", b);
		model.addAttribute("brorating", ud.getUserRating(u));
		model.addAttribute("bro", u);

		return "bro.jsp";
	}

	@RequestMapping(path = "deleteFriend.do", method = RequestMethod.POST)
	public String deleteFriend(@ModelAttribute("user") User user, @RequestParam(name = "broId") int broId,
			@RequestParam(name = "userId") int userId, Model model) {
		User bro = ud.findUserById(broId);
		User user1 = ud.findUserById(userId);
		user.setFriends(ud.viewFriends(user1));

		ud.deleteFriend(user, bro);
		ud.updateUser(user);

		model.addAttribute("user", user);
		model.addAttribute("rating", ud.getUserRating(user));

		model.addAttribute("friends", ud.viewFriends(user));
		return "user.jsp";
	}

	@RequestMapping(path = "removeBroFromTrip.do", method = RequestMethod.POST)
	public String removeBroFromTrip(@ModelAttribute("user") User user, @RequestParam(name = "broId") int broId,
			@RequestParam(name = "userId") int userId, @RequestParam(name = "tripId") int tripId, Model model) {
		User user1 = ud.findUserById(userId);
		User bro = ud.findUserById(broId);
		Trip trip = td.findTripById(tripId);
		trip.setUsers(td.getAllUsersOnTrip(tripId));

		trip = td.removeBroFromTrip(trip, bro);
		td.updateTrip(trip);

		model.addAttribute("trip", td.findTripById(tripId));
		model.addAttribute("rating", ud.getUserRating(user1));
		model.addAttribute("user", user1);
		List<User> riders = td.findTripById(tripId).getUsers();
		boolean riderCheck = false;
		for (User user2 : riders) {
			if (user2.getId() == user1.getId()) {
				riderCheck = true;
			}
		}
		model.addAttribute("rider", riderCheck);
		List<Message> messages = td.getMessagesByTripId(trip.getId());
		model.addAttribute("messages", messages);
		return "trip.jsp";
	}

}
