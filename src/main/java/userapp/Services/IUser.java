package userapp.Services;

import userapp.User;

import javax.ejb.Local;
import java.util.List;

@Local
public interface IUser {
    public List<User> findAll();

    public void add(User user);

    public User update(User user);

    public Boolean delete(User user);

    public User findById(int id);

    public User findByLoginAndPassword(String login, String password);
}
