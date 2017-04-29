package com.xzit.pms.dao;

import java.util.List;
import java.util.Set;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import static org.hibernate.criterion.Example.create;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.xzit.pms.po.Maintainman;
import com.xzit.pms.po.Room;
import com.xzit.pms.po.Security;
import com.xzit.pms.po.Users;

/**
 * A data access object (DAO) providing persistence and search support for Users
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.xzit.pms.po.Users
 * @author MyEclipse Persistence Tools
 */
@Repository("usersDAO")
public class UsersDAO {
	private static final Logger log = LoggerFactory.getLogger(UsersDAO.class);
	// property constants
	public static final String USERNAME = "username";
	public static final String PASSWORD = "password";
	public static final String AUTHORITY = "authority";
    @Autowired
	private SessionFactory sessionFactory;
	private Query query;
	private Users user=new Users(); 
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected void initDao() {
		// do nothing
	}

	public void save(Users transientInstance) {
		log.debug("saving Users instance");
		Transaction tran=getCurrentSession().beginTransaction();
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
		tran.commit();
		getCurrentSession().flush();
		getCurrentSession().close();
	}

	public void delete(Users persistentInstance) {
		log.debug("deleting Users instance");
		Transaction tran=getCurrentSession().beginTransaction();
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
		tran.commit();
		getCurrentSession().flush();
		getCurrentSession().close();
	}

	public Users findById(java.lang.Integer id) {
		log.debug("getting Users instance with id: " + id);
		try {
			Users instance = (Users) getCurrentSession().get(
					"com.xzit.pms.po.Users", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Users> findByExample(Users instance) {
		log.debug("finding Users instance by example");
		try {
			List<Users> results = (List<Users>) getCurrentSession()
					.createCriteria("com.xzit.pms.po.Users")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Users instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Users as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Users> findByUsername(Object username) {
		return findByProperty(USERNAME, username);
	}

	public List<Users> findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List<Users> findByAuthority(Object authority) {
		return findByProperty(AUTHORITY, authority);
	}

	public List findAll() {
		log.debug("finding all Users instances");
		try {
			String queryString = "from Users ";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	@SuppressWarnings("unchecked")
	public List<Users> findAllmaintainman() {
		
			String queryString = "from Users where  authority = 'C' and  id not in (select users.id from Maintainman) ";
			Query queryObject = getCurrentSession().createQuery(queryString);
			System.out.println(queryObject.list().size());
			return queryObject.list();
		
	}
	public List<Users> findAllroom() {
		
			String queryString = "from Users where authority = 'B' and id not in (select users.id from Room) ";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		
	}
	public Users merge(Users detachedInstance) {
		log.debug("merging Users instance");
		try {
			Users result = (Users) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Users instance) {
		log.debug("attaching dirty Users instance");
		Transaction tran=getCurrentSession().beginTransaction();
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
		tran.commit();
		getCurrentSession().flush();
		getCurrentSession().close();
	}

	public void attachClean(Users instance) {
		log.debug("attaching clean Users instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	@SuppressWarnings("unchecked")
	public Users usersLogin(Users users) {
	    
		query = this.getCurrentSession().createQuery(" from Users where username=? and password=? ");
		query.setString(0, users.getUsername());
		query.setString(1, users.getPassword());
		List<Users> lists = query.list();
		if (lists.size() > 0) {
			user = lists.get(0);
		} else {
			System.out.println("失败");
			user = null;
		}
		return user;
	
}

public int getCount(String hql) {
	Query q = getCurrentSession().createQuery(hql);
    return Integer.parseInt(q.list().get(0).toString());
}

public List<Users> queryForPage(String hql1, int offset, int length) {
	Query q = this.getCurrentSession().createQuery(hql1);
    q.setFirstResult(offset);
    q.setMaxResults(length);
   return q.list();
}


	public static UsersDAO getFromApplicationContext(ApplicationContext ctx) {
		return (UsersDAO) ctx.getBean("UsersDAO");
	}

	public Users findcheckName(String username) {
		query = this.getCurrentSession().createQuery(" from Users where username=? ");
		query.setString(0, username);
		List<Users> lists = query.list();
		return lists.get(0);
	}

}