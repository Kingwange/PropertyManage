package com.xzit.pms.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import static org.hibernate.criterion.Example.create;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.xzit.pms.po.Equipment;

/**
 * A data access object (DAO) providing persistence and search support for
 * Equipment entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.xzit.pms.po.Equipment
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class EquipmentDAO {
	private static final Logger log = LoggerFactory
			.getLogger(EquipmentDAO.class);
	// property constants
	public static final String ENAME = "ename";
	public static final String ENUMBER = "enumber";
	public static final String VENDOR = "vendor";
	public static final String MAINTENANCETIME = "maintenancetime";
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

	public void save(Equipment transientInstance) {
		log.debug("saving Equipment instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Equipment persistentInstance) {
		log.debug("deleting Equipment instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Equipment findById(java.lang.Integer id) {
		log.debug("getting Equipment instance with id: " + id);
		try {
			Equipment instance = (Equipment) getCurrentSession().get(
					"com.xzit.pms.po.Equipment", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Equipment> findByExample(Equipment instance) {
		log.debug("finding Equipment instance by example");
		try {
			List<Equipment> results = (List<Equipment>) getCurrentSession()
					.createCriteria("com.xzit.pms.po.Equipment")
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
		log.debug("finding Equipment instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Equipment as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Equipment> findByEname(Object ename) {
		return findByProperty(ENAME, ename);
	}

	public List<Equipment> findByEnumber(Object enumber) {
		return findByProperty(ENUMBER, enumber);
	}

	public List<Equipment> findByVendor(Object vendor) {
		return findByProperty(VENDOR, vendor);
	}

	public List<Equipment> findByMaintenancetime(Object maintenancetime) {
		return findByProperty(MAINTENANCETIME, maintenancetime);
	}

	public List<Equipment> findByRemark(Object remark) {
		return findByProperty(REMARK, remark);
	}

	public List findAll() {
		log.debug("finding all Equipment instances");
		try {
			String queryString = "from Equipment";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Equipment merge(Equipment detachedInstance) {
		log.debug("merging Equipment instance");
		try {
			Equipment result = (Equipment) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Equipment instance) {
		log.debug("attaching dirty Equipment instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Equipment instance) {
		log.debug("attaching clean Equipment instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static EquipmentDAO getFromApplicationContext(ApplicationContext ctx) {
		return (EquipmentDAO) ctx.getBean("EquipmentDAO");
	}
}