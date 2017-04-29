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

import com.xzit.pms.po.Complaint;

/**
 * A data access object (DAO) providing persistence and search support for
 * Complaint entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.xzit.pms.po.Complaint
 * @author MyEclipse Persistence Tools
 */
@Repository("complaintDAO")
public class ComplaintDAO {
	private static final Logger log = LoggerFactory
			.getLogger(ComplaintDAO.class);
	// property constants
	public static final String CPCONTENT = "cpcontent";
	public static final String STATE = "state";
	public static final String HANDLEINFO = "handleinfo";
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

	public void save(Complaint transientInstance) {
		log.debug("saving Complaint instance");
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

	public void delete(Complaint persistentInstance) {
		log.debug("deleting Complaint instance");
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

	public Complaint findById(java.lang.Integer id) {
		log.debug("getting Complaint instance with id: " + id);
		try {
			Complaint instance = (Complaint) getCurrentSession().get(
					"com.xzit.pms.po.Complaint", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Complaint> findByExample(Complaint instance) {
		log.debug("finding Complaint instance by example");
		try {
			List<Complaint> results = (List<Complaint>) getCurrentSession()
					.createCriteria("com.xzit.pms.po.Complaint")
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
		log.debug("finding Complaint instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Complaint as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Complaint> findByCpcontent(Object cpcontent) {
		return findByProperty(CPCONTENT, cpcontent);
	}

	public List<Complaint> findByState(Object state) {
		return findByProperty(STATE, state);
	}

	public List<Complaint> findByHandleinfo(Object handleinfo) {
		return findByProperty(HANDLEINFO, handleinfo);
	}

	public List findAll() {
		log.debug("finding all Complaint instances");
		try {
			String queryString = "from Complaint";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Complaint merge(Complaint detachedInstance) {
		log.debug("merging Complaint instance");
		try {
			Complaint result = (Complaint) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Complaint instance) {
		log.debug("attaching dirty Complaint instance");
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

	public void attachClean(Complaint instance) {
		log.debug("attaching clean Complaint instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ComplaintDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ComplaintDAO) ctx.getBean("ComplaintDAO");
	}

	public int getCount(String hql) {
		Query q = getCurrentSession().createQuery(hql);
	    return Integer.parseInt(q.list().get(0).toString());
	}

	public List<Complaint> queryForPage(String hql1, int offset, int length) {
		Query q = this.getCurrentSession().createQuery(hql1);
        q.setFirstResult(offset);
        q.setMaxResults(length);
        System.out.println(q.list().size());
       return q.list();
	}
}