package entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_rating")
public class UserRating {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;
    
    private int value;
    
    public User getUser() {
        return user;
    }
    
    public void setUserId(User user) {
        this.user = user;
    }
    public int getId() {
        return id;
    }
    
    public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
    public String toString() {
        return "UserRating [id=" + id + "]";
    }

}