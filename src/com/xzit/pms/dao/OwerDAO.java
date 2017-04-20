package com.xzit.pms.dao;

import java.util.ArrayList;
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
import com.xzit.pms.po.Ower;

/**
 * A data access object (DAO) providing persistence and search support for Ower
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.xzit.pms.po.Ower
 * @author MyEclipse Persistence Tools
 */
@Repository("owerDAO")
public class OwerDAO {
	private static final Logger log = LoggerFactory.getLogger(OwerDAO.class);
	// property constants
	public static final String ONAME = "oname";
	public static final String IDENTITY = "identity";
	public static final String TEL = "tel";
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

	public void save(Ower transientInstance) {
		log.debug("saving Ower instance");
		Transaction tran=getCurrentSession().beginTransaction();
		try {
			getCurrentSession().save(transientInstance);
			System.out.println("成功");
			log.debug("save successful");
		} catch (RuntimeException re) {
			System.out.println("失败");
			log.error("save failed", re);
			throw re;
		}
		tran.commit();
		getCurrentSession().flush();
		getCurrentSession().close();
		
	}

	public void delete(Ower persistentInstance) {
		log.debug("deleting Ower instance");
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

	public Ower findById(java.lang.Integer id) {
		log.debug("getting Ower instance with id: " + id);
		try {
			Ower instance = (Ower) getCurrentSession().get(
					"com.xzit.pms.po.Ower", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Ower> findByExample(Ower instance) {
		log.debug("finding Ower instance by example");
		try {
			List<Ower> results = (List<Ower>) getCurrentSession()
					.createCriteria("com.xzit.pms.po.Ower")
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
		log.debug("finding Ower instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Ower as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Ower> findByOname(Object oname) {
		return findByProperty(ONAME, oname);
	}

	public List<Ower> findByIdentity(Object identity) {
		return findByProperty(IDENTITY, identity);
	}

	public List<Ower> findByTel(Object tel) {
		return findByProperty(TEL, tel);
	}

	public List<Ower> findByRemark(Object remark) {
		return findByProperty(REMARK, remark);
	}

	public List findAll() {
		log.debug("finding all Ower instances");
		try {
			String queryString = "from Ower";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Ower merge(Ower detachedInstance) {
		log.debug("merging Ower instance");
		try {
			Ower result = (Ower) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Ower instance) {
		log.debug("attaching dirty Ower instance");
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

	public void attachClean(Ower instance) {
		log.debug("attaching clean Ower instance");
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

	      public List<Ower> queryForPage(String hql1,int offset, int length) {
	         Query q = this.getCurrentSession().createQuery(hql1);
	         q.setFirstResult(offset);
	         q.setMaxResults(length);
	         System.out.println(q.list().size());
	        return q.list();
	     }

   
      public int getCount(String hql) {
        Query q = getCurrentSession().createQuery(hql);
        return Integer.parseInt(q.list().get(0).toString());
     }

	public static OwerDAO getFromApplicationContext(ApplicationContext ctx) {
		return (OwerDAO) ctx.getBean("OwerDAO");
	}

}