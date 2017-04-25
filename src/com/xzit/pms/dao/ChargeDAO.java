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

import com.xzit.pms.po.Charge;

/**
 * A data access object (DAO) providing persistence and search support for
 * Charge entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.xzit.pms.po.Charge
 * @author MyEclipse Persistence Tools
 */
@Repository("chargeDAO")
public class ChargeDAO {
	private static final Logger log = LoggerFactory.getLogger(ChargeDAO.class);
	// property constants
	public static final String CNAME = "cname";
	public static final String PRICE = "price";
	public static final String CHARGESTATE = "chargestate";
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

	public void save(Charge transientInstance) {
		log.debug("saving Charge instance");
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

	public void delete(Charge persistentInstance) {
		log.debug("deleting Charge instance");
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

	public Charge findById(java.lang.Integer id) {
		log.debug("getting Charge instance with id: " + id);
		try {
			Charge instance = (Charge) getCurrentSession().get(
					"com.xzit.pms.po.Charge", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Charge> findByExample(Charge instance) {
		log.debug("finding Charge instance by example");
		try {
			List<Charge> results = (List<Charge>) getCurrentSession()
					.createCriteria("com.xzit.pms.po.Charge")
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
		log.debug("finding Charge instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Charge as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Charge> findByCname(Object cname) {
		return findByProperty(CNAME, cname);
	}

	public List<Charge> findByPrice(Object price) {
		return findByProperty(PRICE, price);
	}

	public List<Charge> findByChargestate(Object chargestate) {
		return findByProperty(CHARGESTATE, chargestate);
	}

	public List<Charge> findByRemark(Object remark) {
		return findByProperty(REMARK, remark);
	}

	public List findAll() {
		log.debug("finding all Charge instances");
		try {
			String queryString = "from Charge";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Charge merge(Charge detachedInstance) {
		log.debug("merging Charge instance");
		try {
			Charge result = (Charge) getCurrentSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Charge instance) {
		log.debug("attaching dirty Charge instance");
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

	public void attachClean(Charge instance) {
		log.debug("attaching clean Charge instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ChargeDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ChargeDAO) ctx.getBean("ChargeDAO");
	}
	public int getCount(String hql) {
		Query q = getCurrentSession().createQuery(hql);
		 return Integer.parseInt(q.list().get(0).toString());
	}

	public List<Charge> queryForPage(String hql1, int offset, int length) {
		Query q = this.getCurrentSession().createQuery(hql1);
        q.setFirstResult(offset);
        q.setMaxResults(length);
        System.out.println(q.list().size());
        return q.list();
	}
}