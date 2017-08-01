package entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_type")
public class UserType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    // Linked to User class
    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    private boolean admin;
    
    
    //GETTERS AND SETTERS BELOW



    public boolean isAdmin() {
        return admin;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        return "UserType [id=" + id + ", user=" + user + ", admin=" + admin + "]";
    }
    
}