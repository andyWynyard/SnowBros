package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "extra_curr")
public class ExtraCurr {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String name;

    // Linked to Trip class
    @ManyToMany(mappedBy = "extraCurrs")
    private List<Trip> trips;

    // GETTERS AND SETTERS BELOW

    public String getName() {
        return name;
    }


    public List<Trip> getTrips() {
		return trips;
	}


	public void setTrips(List<Trip> trips) {
		this.trips = trips;
	}


	public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }


	@Override
	public String toString() {
		return "ExtraCurr [id=" + id + ", name=" + name + ", trips=" + trips + "]";
	}

}