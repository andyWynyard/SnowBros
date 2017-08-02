package controllers;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import data.TripDAO;
import data.UserDAO;
import entities.Destination;
import entities.ExtraCurr;
import entities.Trip;
import entities.User;

@Controller
public class SnowBroController {
	@Autowired
	private TripDAO td;
	@Autowired
	private UserDAO ud;

	/////////////////////////////////////////////////////////
	//////////////////// SEARCH.JSP///////////////////////
	//////////////////////////////////////////////////
	@RequestMapping(path = "searchPage.do")
	public String allTrips(Model model) {
		List<Trip> trips = td.allTrips();
		model.addAttribute("searchresults", null);
		model.addAttribute("allTrips", trips);
		return "search.jsp";
	}

	@RequestMapping(path = "searchTitle.do")
	public String SearchTitle(@RequestParam("searchTitle") String title, Model model) {
		List<Trip> trips = td.searchTrip(title);
		model.addAttribute("searchResults", trips);
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
		User u = null;
		model.addAttribute("user", u);
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
		return "user.jsp";
	}

	@RequestMapping(path = "editProfile.do")
	public String EditProfile(Model model, @RequestParam("firstName") String fName,
			@RequestParam("lastName") String lName, @RequestParam("email") String email,
			@RequestParam("picture") String picture, @RequestParam("password") String password) {
		User user = new User();
		user.setFirstName(fName);
		user.setLastName(lName);
		user.setEmail(email);
		user.setPassword(password);
		user.setPicture(picture);
		ud.updateUser(user);
		model.addAttribute("user", user);
		return "user.jsp";
	}

	/////////////////////////////////////////////////////////
	//////////////////// createEditTrip.jsp///////////////
	///////////////////////////////////////////////////////

	@RequestMapping(path = "createTrip.do")
	public String CreateTrip(Model model, @RequestParam("title") String title,
			@RequestParam("destination") Destination dest, @RequestParam("description") String desc,
			@RequestParam("pointOfOrigin") String pO, @RequestParam("date") Date date,
			@RequestParam("pointOfReturn") String pR, @RequestParam("numberSeats") int seats,
			@RequestParam("extraCurr") ExtraCurr ec) {
		Trip trip = new Trip();
		trip.setTitle(title);
		trip.setDestination(dest);
		trip.setDescription(desc);
		trip.setPointOfOrigin(pO);
		trip.setDate(date);
		trip.setPointOfReturn(pR);
		trip.setNumberSeats(seats);
		// trip.setExtraCurrs(ec);

		model.addAttribute("trip", trip);
		return "trip.jsp";
	}

	@RequestMapping(path = "editTrip.do")
	public String editTrip(Model model, @RequestParam("title") String title,
			@RequestParam("destination") Destination dest, @RequestParam("description") String desc,
			@RequestParam("pointOfOrigin") String pO, @RequestParam("date") Date date,
			@RequestParam("pointOfReturn") String pR, @RequestParam("numberSeats") int seats,
			@RequestParam("extraCurr") ExtraCurr ec) {
		Trip trip = new Trip();
		trip.setTitle(title);
		trip.setDestination(dest);
		trip.setDescription(desc);
		trip.setPointOfOrigin(pO);
		trip.setDate(date);
		trip.setPointOfReturn(pR);
		trip.setNumberSeats(seats);
		// trip.setExtraCurrs(ec);

		model.addAttribute("trip", trip);
		return "trip.jsp";
	}

	//////////////////////////// Index.jsp//////////////////////////////////////////////////////

	// User validate(String email, String password)

	@RequestMapping(path = "getUser.do")
	public String validate(Model model, @RequestParam("email") String email,
			@RequestParam("password") String password) {
		User u = ud.validate(email, password);
		model.addAttribute("user", u);
		return "user.jsp";
	}

	//////////////////////////// Trip and User.jsp/////////////////////////////////////////////

	@RequestMapping(path = "logOut.do", method = RequestMethod.GET)
	public String logout(Model model) {
		return "index.jsp";
	}

	@RequestMapping(path = "getProfilePage.do", method = RequestMethod.GET)
	public String goToProfile(Model model, @RequestParam(name = "userId") int userId) {
		model.addAttribute("user", ud.findUserById(userId)); // ud.findUserById(userId) returns a user object
		return "user.jsp";
	}

	@RequestMapping(path = "editTripPage.do", method = RequestMethod.GET)
	public String goToEditTrip(Model model, @RequestParam(name = "tripId") int tripId) {
		model.addAttribute("trip", td.findTripById(tripId));
		return "createEditTrip.jsp";
	}

	@RequestMapping(path = "addMeToTrip.do", method = RequestMethod.POST)
	public String addMeToTrip(Model model, @RequestParam(name = "userId") int userId,
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
	public String goToEditUserPage(Model model, @RequestParam("userId") int userId) {
		model.addAttribute("user", ud.findUserById(userId));
		return "editProfile.jsp";
	}

	@RequestMapping(path = "deleteTrip.do", method = RequestMethod.POST)
	public String deleteTrip(Model model, @RequestParam("tripId") int tripId, @RequestParam("userId") int userId) {
		td.deleteTrip(td.findTripById(tripId));
		model.addAttribute("user", ud.findUserById(userId));
		return "user.jsp";
	}

	@RequestMapping(path = "deleteUser.do", method = RequestMethod.POST)
	public String deleteUser(Model model, @RequestParam(name = "userId") int userId) {
		ud.deleteUser(ud.findUserById(userId));
		return "index.jsp";
	}

	@RequestMapping(path = "viewTrip.do", method = RequestMethod.GET)
	public String viewTrip(Model model, @RequestParam(name = "tripId") int tripId) {
		model.addAttribute("trip", td.findTripById(tripId));
		return "trip.jsp";
	}

	@RequestMapping(path = "createTripPage.do", method = RequestMethod.GET)
	public String goToCreateTripPage(Model model, @RequestParam(name = "userId") int userId) {
		model.addAttribute("user", ud.findUserById(userId));
		return "createEditTrip.jsp";
	}

	@RequestMapping(path = "searchPage.jsp", method = RequestMethod.GET)
	public String goToSearchPage(Model model, @RequestParam(name = "userId") int userId) {
		model.addAttribute("user", ud.findUserById(userId));
		return "search.jsp";
	}

	// viewFriends.do

}
