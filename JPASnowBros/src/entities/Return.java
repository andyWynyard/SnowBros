package entities;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table (name = "return1")
public class Return {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne()
	@JoinColumn(name = "trip_id")
	private Trip trip;
	
	@Column(name = "return")
	private Boolean roundTrip;
	
	@Column(name = "return_time")
	private LocalDateTime returnTime;

	public Trip getTrip() {
		return trip;
	}

	public void setTrip(Trip trip) {
		this.trip = trip;
	}

	public Boolean getRoundTrip() {
		return roundTrip;
	}

	public void setRoundTrip(Boolean roundTrip) {
		this.roundTrip = roundTrip;
	}

	public LocalDateTime getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(LocalDateTime returnTime) {
		this.returnTime = returnTime;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Return [id=" + id + ", roundTrip=" + roundTrip + ", returnTime=" + returnTime + "]";
	}
	
}
