package com.xzit.pms.dao;

import java.util.Date;
import java.util.List;

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

import com.xzit.pms.po.Maintain;
import com.xzit.pms.po.Maintainman;

/**
 * A data access object (DAO) providing persistence and search support for
 * Maintain entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.xzit.pms.po.Maintain
 * @author MyEclipse Persistence Tools
 */
@Repository("maintainDAO")
public class MaintainDAO {
	private static final Logger log = LoggerFactory
			.getLogger(MaintainDAO.class);
	// property constants
	public static final String MCONTENT = "mcontent";
	public static final String MNAME = "mname";
	public static final String MTEL = "mtel";
	public static final String TYPE = "type";
	public static final String REMARK = "remark";
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

	public void save(Maintain transientInstance) {
		log.debug("saving Maintain instance");
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

	public void delete(Maintain persistentInstance) {
		log.debug("deleting Maintain instance");
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

	public Maintain findById(java.lang.Integer id) {
		log.debug("getting Maintain instance with id: " + id);
		try {
			Maintain instance = (Maintain) getCurrentSession().get(
					"com.xzit.pms.po.Maintain", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Maintain> findByExample(Maintain instance) {
		log.debug("finding Maintain instance by example");
		try {
			List<Maintain> results = (List<Maintain>) getCurrentSession()
					.createCriteria("com.xzit.pms.po.Maintain")
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
		log.debug("finding Maintain instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Maintain as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Maintain> findByMcontent(Object mcontent) {
		return findByProperty(MCONTENT, mcontent);
	}

	public List<Maintain> findByMname(Object mname) {
		return findByProperty(MNAME, mname);
	}

	public List<Maintain> findByMtel(Object mtel) {
		return findByProperty(MTEL, mtel);
	}

	public List<Maintain> findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List<Maintain> findByRemark(Object remark) {
		return findByProperty(REMARK, remark);
	}

	public List findAll() {
		log.debug("finding all Maintain instances");
		try {
			String queryString = "from Maintain";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Maintain merge(Maintain detachedInstance) {
		log.debug("merging Maintain instance");
		try {
			Maintain result = (Maintain) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Maintain instance) {
		log.debug("attaching dirty Maintain instance");
		Transaction tran=getCurrentSession().beginTransaction();
		
			getCurrentSession().saveOrUpdate(instance);
			
		tran.commit();
		getCurrentSession().flush();
		getCurrentSession().close();
	}

	public void attachClean(Maintain instance) {
		log.debug("attaching clean Maintain instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static MaintainDAO getFromApplicationContext(ApplicationContext ctx) {
		return (MaintainDAO) ctx.getBean("MaintainDAO");
	}

	public int getCount(String hql) {
		Query q = getCurrentSession().createQuery(hql);
	    return Integer.parseInt(q.list().get(0).toString());
	}

	public List<Maintain> queryForPage(String hql1, int offset, int length) {
		 Query q = this.getCurrentSession().createQuery(hql1);
	        q.setFirstResult(offset);
	        q.setMaxResults(length);
	        System.out.println(q.list().size());
	       return q.list();
	}
}