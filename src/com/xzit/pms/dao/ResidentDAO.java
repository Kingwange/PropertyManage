package com.xzit.pms.dao;

import java.util.List;
import java.util.Set;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import static org.hibernate.criterion.Example.create;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.xzit.pms.po.Resident;

/**
 * A data access object (DAO) providing persistence and search support for
 * Resident entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.xzit.pms.po.Resident
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class ResidentDAO {
	private static final Logger log = LoggerFactory
			.getLogger(ResidentDAO.class);
	// property constants
	public static final String RNAME = "rname";
	public static final String RSEX = "rsex";
	public static final String IDENTITY = "identity";
	public static final String TEL = "tel";
	public static final String REAMRK = "reamrk";

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

	public void save(Resident transientInstance) {
		log.debug("saving Resident instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Resident persistentInstance) {
		log.debug("deleting Resident instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Resident findById(java.lang.Integer id) {
		log.debug("getting Resident instance with id: " + id);
		try {
			Resident instance = (Resident) getCurrentSession().get(
					"com.xzit.pms.po.Resident", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Resident> findByExample(Resident instance) {
		log.debug("finding Resident instance by example");
		try {
			List<Resident> results = (List<Resident>) getCurrentSession()
					.createCriteria("com.xzit.pms.po.Resident")
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
		log.debug("finding Resident instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Resident as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Resident> findByRname(Object rname) {
		return findByProperty(RNAME, rname);
	}

	public List<Resident> findByRsex(Object rsex) {
		return findByProperty(RSEX, rsex);
	}

	public List<Resident> findByIdentity(Object identity) {
		return findByProperty(IDENTITY, identity);
	}

	public List<Resident> findByTel(Object tel) {
		return findByProperty(TEL, tel);
	}

	public List<Resident> findByReamrk(Object reamrk) {
		return findByProperty(REAMRK, reamrk);
	}

	public List findAll() {
		log.debug("finding all Resident instances");
		try {
			String queryString = "from Resident";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Resident merge(Resident detachedInstance) {
		log.debug("merging Resident instance");
		try {
			Resident result = (Resident) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Resident instance) {
		log.debug("attaching dirty Resident instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Resident instance) {
		log.debug("attaching clean Resident instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ResidentDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ResidentDAO) ctx.getBean("ResidentDAO");
	}
}