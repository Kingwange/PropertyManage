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

import com.xzit.pms.po.Building;
import com.xzit.pms.po.Cleanmanage;

/**
 * A data access object (DAO) providing persistence and search support for
 * Cleanmanage entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.xzit.pms.po.Cleanmanage
 * @author MyEclipse Persistence Tools
 */
@Repository("cleanmanageDAO")
public class CleanmanageDAO {
	private static final Logger log = LoggerFactory
			.getLogger(CleanmanageDAO.class);
	// property constants
	public static final String CMNAME = "cmname";
	public static final String SEX = "sex";
	public static final String TEL = "tel";
	public static final String ADDRESS = "address";
	public static final String CLEANAREA = "cleanarea";
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

	public void save(Cleanmanage transientInstance) {
		log.debug("saving Cleanmanage instance");
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

	public void delete(Cleanmanage persistentInstance) {
		log.debug("deleting Cleanmanage instance");
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

	public Cleanmanage findById(java.lang.Integer id) {
		log.debug("getting Cleanmanage instance with id: " + id);
		try {
			Cleanmanage instance = (Cleanmanage) getCurrentSession().get(
					"com.xzit.pms.po.Cleanmanage", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Cleanmanage> findByExample(Cleanmanage instance) {
		log.debug("finding Cleanmanage instance by example");
		try {
			List<Cleanmanage> results = (List<Cleanmanage>) getCurrentSession()
					.createCriteria("com.xzit.pms.po.Cleanmanage")
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
		log.debug("finding Cleanmanage instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Cleanmanage as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Cleanmanage> findByCmname(Object cmname) {
		return findByProperty(CMNAME, cmname);
	}

	public List<Cleanmanage> findBySex(Object sex) {
		return findByProperty(SEX, sex);
	}

	public List<Cleanmanage> findByTel(Object tel) {
		return findByProperty(TEL, tel);
	}

	public List<Cleanmanage> findByAddress(Object address) {
		return findByProperty(ADDRESS, address);
	}

	public List<Cleanmanage> findByCleanarea(Object cleanarea) {
		return findByProperty(CLEANAREA, cleanarea);
	}

	public List<Cleanmanage> findByRemark(Object remark) {
		return findByProperty(REMARK, remark);
	}

	public List findAll() {
		log.debug("finding all Cleanmanage instances");
		try {
			String queryString = "from Cleanmanage";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Cleanmanage merge(Cleanmanage detachedInstance) {
		log.debug("merging Cleanmanage instance");
		try {
			Cleanmanage result = (Cleanmanage) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Cleanmanage instance) {
		log.debug("attaching dirty Cleanmanage instance");
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

	public void attachClean(Cleanmanage instance) {
		log.debug("attaching clean Cleanmanage instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CleanmanageDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (CleanmanageDAO) ctx.getBean("CleanmanageDAO");
	}

	public int getCount(String hql) {
		 Query q = getCurrentSession().createQuery(hql);
		 return Integer.parseInt(q.list().get(0).toString());
	}

	public List<Cleanmanage> queryForPage(String hql1, int offset, int length) {
		Query q = this.getCurrentSession().createQuery(hql1);
        q.setFirstResult(offset);
        q.setMaxResults(length);
        System.out.println(q.list().size());
        return q.list();
	}
}