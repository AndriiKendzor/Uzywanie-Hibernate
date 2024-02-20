package program;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import program.users;
import program.HibernateUtil;
public class UsersDAO {
    public void saveUser(users users) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the user object
            session.save(users);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                // rollback modifications
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void updateUser(users users) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // update the user object
            session.update(users);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void deleteUser(int id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            users user = session.get(users.class, id);
            if (user != null) {
                session.delete(user);
                System.out.println("User is deleted");
            }

            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public users getUser(int id) {
        Transaction transaction = null;
        users user = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get a user object
            user = session.get(users.class, id);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return user;
    }

    @SuppressWarnings("unchecked")
    public List<users> getAllUsers() {
        Transaction transaction = null;
        List<users> listOfUsers = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get a user object
            listOfUsers = session.createQuery("from users").getResultList();

            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return listOfUsers;
    }
}
