package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import data.TripDAO;
import data.UserDAO;
import entities.Trip;

@Controller
public class SnowBroController{
	@Autowired
		private TripDAO td;
	@Autowired
		private UserDAO ud;
	
		@RequestMapping(path = "searchPage.do")
		  public String allTrips(Model model) {
			List<Trip> trips = td.allTrips();
			model.addAttribute("searchresults", null);
		    model.addAttribute("allTrips", trips);
		    return "search.jsp";
		  }

	}



