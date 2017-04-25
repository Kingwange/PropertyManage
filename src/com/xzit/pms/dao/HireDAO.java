package com.xzit.pms.dao;
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
import com.xzit.pms.po.Hire;

/**
 * A data access object (DAO) providing persistence and search support for Hire
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.xzit.pms.po.Hire
 * @author MyEclipse Persistence Tools
 */
@Repository("hireDAO")
public class HireDAO {
	private static final Logger log = LoggerFactory.getLogger(HireDAO.class);
	// property constants
	public static final String HNAME = "hname";
	public static final String HTEL = "htel";
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

	public void save(Hire transientInstance) {
		log.debug("saving Hire instance");
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

	public void delete(Hire persistentInstance) {
		log.debug("deleting Hire instance");
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

	public Hire findById(java.lang.Integer id) {
		log.debug("getting Hire instance with id: " + id);
		try {
			Hire instance = (Hire) getCurrentSession().get(
					"com.xzit.pms.po.Hire", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Hire> findByExample(Hire instance) {
		log.debug("finding Hire instance by example");
		try {
			List<Hire> results = (List<Hire>) getCurrentSession()
					.createCriteria("com.xzit.pms.po.Hire")
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
		log.debug("finding Hire instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Hire as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Hire> findByHname(Object hname) {
		return findByProperty(HNAME, hname);
	}

	public List<Hire> findByHtel(Object htel) {
		return findByProperty(HTEL, htel);
	}

	public List<Hire> findByRemark(Object remark) {
		return findByProperty(REMARK, remark);
	}

	public List findAll() {
		log.debug("finding all Hire instances");
		try {
			String queryString = "from Hire";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Hire merge(Hire detachedInstance) {
		log.debug("merging Hire instance");
		try {
			Hire result = (Hire) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Hire instance) {
		log.debug("attaching dirty Hire instance");
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

	public void attachClean(Hire instance) {
		log.debug("attaching clean Hire instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static HireDAO getFromApplicationContext(ApplicationContext ctx) {
		return (HireDAO) ctx.getBean("HireDAO");
	}

	public int getCount(String hql) {
		Query q = getCurrentSession().createQuery(hql);
		return Integer.parseInt(q.list().get(0).toString());
	}

	public List<Hire> queryForPage(String hql1, int offset, int length) {
		Query q = this.getCurrentSession().createQuery(hql1);
        q.setFirstResult(offset);
        q.setMaxResults(length);
        System.out.println(q.list().size());
        return q.list();
	}
}