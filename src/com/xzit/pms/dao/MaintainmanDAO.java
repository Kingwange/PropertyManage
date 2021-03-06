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

import com.xzit.pms.po.Building;
import com.xzit.pms.po.Maintainman;

/**
 * A data access object (DAO) providing persistence and search support for
 * Maintainman entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.xzit.pms.po.Maintainman
 * @author MyEclipse Persistence Tools
 */
@Repository("maintainmanDAO")
public class MaintainmanDAO {
	private static final Logger log = LoggerFactory
			.getLogger(MaintainmanDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String REPAIRTYPE = "repairtype";
	public static final String TEL = "tel";
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

	public void save(Maintainman transientInstance) {
		log.debug("saving Maintainman instance");
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

	public void delete(Maintainman persistentInstance) {
		log.debug("deleting Maintainman instance");
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

	public Maintainman findById(java.lang.Integer id) {
		log.debug("getting Maintainman instance with id: " + id);
		try {
			Maintainman instance = (Maintainman) getCurrentSession().get(
					"com.xzit.pms.po.Maintainman", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Maintainman> findByExample(Maintainman instance) {
		log.debug("finding Maintainman instance by example");
		try {
			List<Maintainman> results = (List<Maintainman>) getCurrentSession()
					.createCriteria("com.xzit.pms.po.Maintainman")
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
		log.debug("finding Maintainman instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Maintainman as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Maintainman> findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List<Maintainman> findByRepairtype(Object repairtype) {
		return findByProperty(REPAIRTYPE, repairtype);
	}

	public List<Maintainman> findByTel(Object tel) {
		return findByProperty(TEL, tel);
	}

	public List findAll() {
		log.debug("finding all Maintainman instances");
		try {
			String queryString = "from Maintainman";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Maintainman merge(Maintainman detachedInstance) {
		log.debug("merging Maintainman instance");
		try {
			Maintainman result = (Maintainman) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Maintainman instance) {
		log.debug("attaching dirty Maintainman instance");
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

	public void attachClean(Maintainman instance) {
		log.debug("attaching clean Maintainman instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static MaintainmanDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (MaintainmanDAO) ctx.getBean("MaintainmanDAO");
	}

	public int getCount(String hql) {
		Query q = getCurrentSession().createQuery(hql);
	    return Integer.parseInt(q.list().get(0).toString());
	}

	public List<Maintainman> queryForPage(String hql1, int offset, int length) {
		    Query q = this.getCurrentSession().createQuery(hql1);
	        q.setFirstResult(offset);
	        q.setMaxResults(length);
	        System.out.println(q.list().size());
	       return q.list();
	}
}