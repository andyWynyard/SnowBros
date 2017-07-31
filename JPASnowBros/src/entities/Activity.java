package entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Activity {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private int experenice;

	public int getExperenice() {
		return experenice;
	}

	public void setExperenice(int experenice) {
		this.experenice = experenice;
	}

	@ManyToMany(mappedBy = "activities")
	List<User> users;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "Activity [id=" + id + ", name=" + name + ", experenice=" + experenice + "]";
	}

}