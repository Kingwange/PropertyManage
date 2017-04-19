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

import com.xzit.pms.po.Security;

/**
 * A data access object (DAO) providing persistence and search support for
 * Security entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.xzit.pms.po.Security
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class SecurityDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SecurityDAO.class);
	// property constants
	public static final String SNAME = "sname";
	public static final String SEX = "sex";
	public static final String IDENTITY = "identity";
	public static final String TEL = "tel";
	public static final String JOB = "job";
	public static final String ADDRESS = "address";
	public static final String TERRITORY = "territory";
	public static final String WORKTTYPE = "workttype";
	public static final String REMARK = "remark";

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

	public void save(Security transientInstance) {
		log.debug("saving Security instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Security persistentInstance) {
		log.debug("deleting Security instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Security findById(java.lang.Integer id) {
		log.debug("getting Security instance with id: " + id);
		try {
			Security instance = (Security) getCurrentSession().get(
					"com.xzit.pms.po.Security", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Security> findByExample(Security instance) {
		log.debug("finding Security instance by example");
		try {
			List<Security> results = (List<Security>) getCurrentSession()
					.createCriteria("com.xzit.pms.po.Security")
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
		log.debug("finding Security instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Security as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Security> findBySname(Object sname) {
		return findByProperty(SNAME, sname);
	}

	public List<Security> findBySex(Object sex) {
		return findByProperty(SEX, sex);
	}

	public List<Security> findByIdentity(Object identity) {
		return findByProperty(IDENTITY, identity);
	}

	public List<Security> findByTel(Object tel) {
		return findByProperty(TEL, tel);
	}

	public List<Security> findByJob(Object job) {
		return findByProperty(JOB, job);
	}

	public List<Security> findByAddress(Object address) {
		return findByProperty(ADDRESS, address);
	}

	public List<Security> findByTerritory(Object territory) {
		return findByProperty(TERRITORY, territory);
	}

	public List<Security> findByWorkttype(Object workttype) {
		return findByProperty(WORKTTYPE, workttype);
	}

	public List<Security> findByRemark(Object remark) {
		return findByProperty(REMARK, remark);
	}

	public List findAll() {
		log.debug("finding all Security instances");
		try {
			String queryString = "from Security";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Security merge(Security detachedInstance) {
		log.debug("merging Security instance");
		try {
			Security result = (Security) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Security instance) {
		log.debug("attaching dirty Security instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Security instance) {
		log.debug("attaching clean Security instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static SecurityDAO getFromApplicationContext(ApplicationContext ctx) {
		return (SecurityDAO) ctx.getBean("SecurityDAO");
	}
}