package entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user_type")
public class UserType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    // Linked to User class
    @OneToMany(mappedBy = "userType")
    private List<User> users;

    private boolean admin;
    
    //GETTERS AND SETTERS BELOW

    public boolean isAdmin() {
        return admin;
    }

    public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public int getId() {
        return id;
    }

	@Override
	public String toString() {
		return "UserType [id=" + id + ", users=" + users + ", admin=" + admin + "]";
	}

    
}