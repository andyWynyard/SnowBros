package entities;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "trip")
public class Trip {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "owner_id")
	private int ownerId;
	

	@OrderBy("id DESC")
	@OneToMany(mappedBy = "trip", cascade=CascadeType.REMOVE)
	private List<Message> messages;
	
	@ManyToMany(cascade=CascadeType.REMOVE)
	@JoinTable(name = "trip_ec",
	joinColumns = @JoinColumn(name = "trip_id"),
	inverseJoinColumns = @JoinColumn(name = "ec_id")
			)
	private List<ExtraCurr> extraCurrs;

	private String title;

	@ManyToOne(cascade=CascadeType.REMOVE)
	@JoinColumn(name = "destination_id")
	private Destination destination;

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name = "user_trip",
			joinColumns = @JoinColumn(name = "trip_id"),
			inverseJoinColumns = @JoinColumn(name = "user_id")
					)
	private List<User> users;

	@Column(name = "number_seats")
	private int numberSeats;

	@Column(name = "point_of_origin")
	private String pointOfOrigin;

	
	private String date;

	@Column(name = "point_of_return")
	private String pointOfReturn;

	private String description;


	@OneToOne(cascade=CascadeType.REMOVE, mappedBy = "trip")
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
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

	public int getId() {
		return id;
	}

	public List<ExtraCurr> getExtraCurrs() {
		return extraCurrs;
	}

	public void setExtraCurrs(List<ExtraCurr> extraCurrs) {
		this.extraCurrs = extraCurrs;
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
	
	public int getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}
	
	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	@Override
	public String toString() {
		return "Trip [id=" + id + ", ownerId=" + ownerId + ", title=" + title
				+ ", destination=" + destination + ", users=" + users + ", numberSeats=" + numberSeats
				+ ", pointOfOrigin=" + pointOfOrigin + ", date=" + date + ", pointOfReturn=" + pointOfReturn
				+ ", description=" + description + ", roundtrip=" + roundtrip + "]";
	}


}