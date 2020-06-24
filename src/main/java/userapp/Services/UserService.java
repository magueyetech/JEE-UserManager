package userapp.Services;

import org.hibernate.Session;
import org.hibernate.Transaction;
import userapp.Utils.HibernateUtil;
import userapp.User;

import javax.ejb.Stateless;
import java.util.List;

@Stateless
public class UserService implements IUser {

    private Session session;

    public UserService() {
        session = HibernateUtil.getSession();
    }

    @Override
    public List<User> findAll() {
        return session.createQuery("SELECT u FROM users u").list();
    }

    @Override
    public void add(User user) {
        Transaction t = session.getTransaction();
        try {
            t.begin();
            session.save(user);
            t.commit();
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        }
    }

    @Override
    public User update(User user) {
        Transaction t = session.getTransaction();
        try {
            t.begin();
            session.merge(user);
            t.commit();
            return findById(user.getId());
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
            return null;
        }
    }

    @Override
    public Boolean delete(User user) {
        Transaction t = session.getTransaction();
        try {
            t.begin();
            session.remove(user);
            t.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
            return false;
        }
    }

    @Override
    public User findById(int id) {
        return session.find(User.class, id);
    }

    @Override
    public User findByLoginAndPassword(String login, String password) {
        try {
            return (User) session.createQuery("SELECT u FROM users u WHERE u.login=:login AND u.mot_de_passe=:password")
                    .setParameter("login", login)
                    .setParameter("password", password)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
