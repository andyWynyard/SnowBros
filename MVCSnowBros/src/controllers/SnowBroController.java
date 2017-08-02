package controllers;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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

	@RequestMapping(path = "searchExtra.do")
	public String SearchTitle(@RequestParam("searchEC") ExtraCurr ec, Model model) {
		List<Trip> trips = td.searchTrip(ec);
		model.addAttribute("searchResults", trips);
		return "search.jsp";
	}

	@RequestMapping(path = "searchUser.do")
	public String SearchTitle(@RequestParam("searchUser") User u, Model model) {
		List<Trip> trips = ud.userTrips(u);
		model.addAttribute("searchResults", trips);
		return "search.jsp";
	}

	/////////////////////////////////////////////////////////
	//////////////////// createEditProfile.jsp///////////////
	///////////////////////////////////////////////////////

	@RequestMapping(path = "createProfile1.do")
	public String CreateProfile(Model model) {
		return "createEditProfile.jsp";
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
		ud.create(user);
		model.addAttribute("user", user);
		return "user.jsp";
	}

	@RequestMapping(path = "createProfile.do")
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
	public String CreateTrip(Model model, @RequestParam("title") String title, @RequestParam("destination") Destination dest,
			@RequestParam("description") String desc, @RequestParam("pointOfOrigin") String pO,
			@RequestParam("date") Date date, @RequestParam("pointOfReturn") String pR,
			@RequestParam("numberSeats") int seats, @RequestParam("extraCurr") ExtraCurr ec) {
		Trip trip = new Trip();
		trip.setTitle(title);
		trip.setDestination(dest);
		trip.setDescription(desc);
		trip.setPointOfOrigin(pO);
		trip.setDate(date);
		trip.setPointOfReturn(pR);
		trip.setNumberSeats(seats);
		//trip.setExtraCurrs(ec);
		
		model.addAttribute("trip", trip);
		return "trip.jsp";
	}

	@RequestMapping(path = "editTrip.do")
	public String editTrip(Model model, @RequestParam("title") String title, @RequestParam("destination") Destination dest,
			@RequestParam("description") String desc, @RequestParam("pointOfOrigin") String pO,
			@RequestParam("date") Date date, @RequestParam("pointOfReturn") String pR,
			@RequestParam("numberSeats") int seats, @RequestParam("extraCurr") ExtraCurr ec) {
		Trip trip = new Trip();
		trip.setTitle(title);
		trip.setDestination(dest);
		trip.setDescription(desc);
		trip.setPointOfOrigin(pO);
		trip.setDate(date);
		trip.setPointOfReturn(pR);
		trip.setNumberSeats(seats);
		//trip.setExtraCurrs(ec);
		
		model.addAttribute("trip", trip);
		return "trip.jsp";
	}
	
}
