package entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "destination")
public class Destination {
    
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
    private int id;
    
    private String name;
    
    @OneToMany(mappedBy="destination", fetch = FetchType.EAGER)
    private List<Trip> trips;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

	public List<Trip> getTrips() {
		return trips;
	}

	public void setTrips(List<Trip> trips) {
		this.trips = trips;
	}

	@Override
	public String toString() {
		return "Destination [id=" + id + ", name=" + name + "]";
	}

}