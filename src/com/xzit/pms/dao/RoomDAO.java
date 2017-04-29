package com.xzit.pms.dao;

import java.util.Date;
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

import com.xzit.pms.po.Building;
import com.xzit.pms.po.Room;

/**
 * A data access object (DAO) providing persistence and search support for Room
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.xzit.pms.po.Room
 * @author MyEclipse Persistence Tools
 */
@Repository("roomDAO")
public class RoomDAO {
	private static final Logger log = LoggerFactory.getLogger(RoomDAO.class);
	// property constants
	public static final String RNAME = "rname";
	public static final String OID = "oid";
	public static final String TYPE = "type";
	public static final String RAREA = "rarea";
    @Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected void initDao() {
		// do nothing
	}

	public void save(Room transientInstance) {
		log.debug("saving Room instance");
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

	public void delete(Room persistentInstance) {
		log.debug("deleting Room instance");
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

	public Room findById(java.lang.Integer id) {
		log.debug("getting Room instance with id: " + id);
		try {
			Room instance = (Room) getCurrentSession().get(
					"com.xzit.pms.po.Room", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Room> findByExample(Room instance) {
		log.debug("finding Room instance by example");
		try {
			List<Room> results = (List<Room>) getCurrentSession()
					.createCriteria("com.xzit.pms.po.Room")
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
		log.debug("finding Room instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Room as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Room> findByRname(Object rname) {
		return findByProperty(RNAME, rname);
	}

	public List<Room> findByOid(Object oid) {
		return findByProperty(OID, oid);
	}

	public List<Room> findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List<Room> findByRarea(Object rarea) {
		return findByProperty(RAREA, rarea);
	}

	public List findAll() {
		log.debug("finding all Room instances");
		try {
			String queryString = "from Room";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List<Room> findAllcharge() {
		log.debug("finding all Room instances");
		try {
			String queryString = "from Room where rid not in (select room.rid from Charge)";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List<Room> findAllhire() {
		log.debug("finding all Room instances");
		try {
			String queryString = "from Room where rid not in (select room.rid from Hire)";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List<Room> findAllresident() {
		log.debug("finding all Room instances");
		try {
			String queryString = "from Room where rid not in (select room.rid from Resident)";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Room merge(Room detachedInstance) {
		log.debug("merging Room instance");
		try {
			Room result = (Room) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Room instance) {
		log.debug("attaching dirty Room instance");
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

	public void attachClean(Room instance) {
		log.debug("attaching clean Room instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static RoomDAO getFromApplicationContext(ApplicationContext ctx) {
		return (RoomDAO) ctx.getBean("RoomDAO");
	}

	public int getCount(String hql) {
		 Query q = getCurrentSession().createQuery(hql);
		 return Integer.parseInt(q.list().get(0).toString());
	}

	public List<Room> queryForPage(String hql1, int offset, int length) {
		 Query q = this.getCurrentSession().createQuery(hql1);
	        q.setFirstResult(offset);
	        q.setMaxResults(length);
	        System.out.println(q.list().size());
	       return q.list();
	}

	public Room findUserID(Integer id) {
		log.debug("finding all Room instances");
		try {
			String queryString = "from Room where users.id ="+id;
			Query queryObject = getCurrentSession().createQuery(queryString);
			return (Room)queryObject.list().get(0);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Room findCheckRoom(String rname2) {
		Query query = this.getCurrentSession().createQuery(" from Room where rname=? ");
		query.setString(0, rname2);
		List<Room> lists = query.list();
		return lists.get(0);
	}
}