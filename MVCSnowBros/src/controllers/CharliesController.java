package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import data.TripDAO;
import data.UserDAO;
import entities.Trip;
import entities.User;

@Controller
public class CharliesController {
	@Autowired
	private TripDAO td;
	@Autowired
	private UserDAO ud;

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
		return "createEditProfile.jsp";
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
}

// viewFriends.do
