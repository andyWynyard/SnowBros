package entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.print.attribute.standard.Destination;

@Entity
public class Trip {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int id;

	@OneToMany(mappedBy = "trip")
	private ExtraCurr ec;

	private String title;

	@ManyToOne
	@JoinColumn(name = "destination_id")
	private Destination destination;

	@ManyToMany(mappedBy = "trips")
	private List<User> users;

	@Column(name = "number_seats")
	private int numberSeats;

	@Column(name = "point_of_origin")
	private String pointOfOrigin;

	private Date date;

	@Column(name = "point_of_return")
	private String pointOfReturn;

	private String description;

	@Column(name = "destination_id")
	private int destinationId;

	@OneToOne(mappedBy = "trip")
	private Return roundtrip;

	// gets and sets

	public String getTitle() {
		return title;
	}

	public Return getRoundtrip() {
		return roundtrip;
	}

	public void setRoundtrip(Return roundtrip) {
		this.roundtrip = roundtrip;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getNumberSeats() {
		return numberSeats;
	}

	public void setNumberSeats(int numberSeats) {
		this.numberSeats = numberSeats;
	}

	public String getPointOfOrigin() {
		return pointOfOrigin;
	}

	public void setPointOfOrigin(String pointOfOrigin) {
		this.pointOfOrigin = pointOfOrigin;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getPointOfReturn() {
		return pointOfReturn;
	}

	public void setPointOfReturn(String pointOfReturn) {
		this.pointOfReturn = pointOfReturn;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getDestinationId() {
		return destinationId;
	}

	public void setDestinationId(int destinationId) {
		this.destinationId = destinationId;
	}

	public int getId() {
		return id;
	}

	public ExtraCurr getEc() {
		return ec;
	}

	public void setEc(ExtraCurr ec) {
		this.ec = ec;
	}

	public Destination getDestination() {
		return destination;
	}

	public void setDestination(Destination destination) {
		this.destination = destination;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "Trip [id=" + id + ", title=" + title + ", numberSeats=" + numberSeats + ", pointOfOrigin="
				+ pointOfOrigin + ", date=" + date + ", pointOfReturn=" + pointOfReturn + ", description=" + description
				+ ", destinationId=" + destinationId + "]";
	}

}