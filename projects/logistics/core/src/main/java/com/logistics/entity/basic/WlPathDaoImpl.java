// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.basic;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;


import com.logistics.util.QueryAssCriteria;
import com.logistics.util.QueryAssCriteriaOrder;

/**
 * @see com.logistics.entity.basic.WlPath
 */
public class WlPathDaoImpl
    extends com.logistics.entity.basic.WlPathDaoBase
{
    /**
     * @see com.logistics.entity.basic.WlPathDao#findByCriteria(com.logistics.entity.basic.WlPathCriteriaVO)
     */
    protected java.util.List handleFindByCriteria(com.logistics.entity.basic.WlPathCriteriaVO criteria)
    {
        // @todo implement public java.util.List handleFindByCriteria(com.logistics.entity.basic.WlPathCriteriaVO criteria)
        return null;
}

    /**
     * @see com.logistics.entity.basic.WlPathDao#getPathvoByPathName(java.lang.String)
     */
    protected java.util.List handleGetPathvoByPathName(java.lang.String name)
    {
        // @todo implement public java.util.List handleGetPathvoByPathName(java.lang.String name)
        return null;
}

    /**
     * @see com.logistics.entity.basic.WlPathDao#getPathvoByStartPalce(long)
     */
    protected java.util.List handleGetPathvoByStartPalce(long startPlaceID)
    {
        // @todo implement public java.util.List handleGetPathvoByStartPalce(long startPlaceID)
        return null;
}

    /**
     * @see com.logistics.entity.basic.WlPathDao#getPathvoByEndPlace(long)
     */
    protected java.util.List handleGetPathvoByEndPlace(long endPlaceID)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.basic.WlPathImpl.class);

           // criteria.add(Expression.eq("endPlace", new java.lang.Long(endPlaceID)));
           criteria.createCriteria("endPlace").add(Expression.eq("id", endPlaceID));
            
            criteria.setMaxResults(250);

            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
}

    /**
     * @see com.logistics.entity.basic.WlPathDao#getAllPathvo()
     */
    protected java.util.List handleGetAllPathvo()
    {
        return (List)this.loadAll();
    }

    /**
     * @see com.logistics.entity.basic.WlPathDao#createPaths(java.util.List)
     */
    protected long[] handleCreatePaths(java.util.List paths)
    {
        // @todo implement public long[] handleCreatePaths(java.util.List paths)
        return null;
}

    /**
     * @see com.logistics.entity.basic.WlPathDao#updatePaths(java.util.List)
     */
    protected void handleUpdatePaths(java.util.List paths)
    {
        // @todo implement public void handleUpdatePaths(java.util.List paths)
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.basic.WlPath.handleUpdatePaths(java.util.List paths) Not implemented!");
}

    /**
     * @see com.logistics.entity.basic.WlPathDao#deletePaths(long[])
     */
    protected void handleDeletePaths(long[] ids)
    {
        // @todo implement public void handleDeletePaths(long[] ids)
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.basic.WlPath.handleDeletePaths(long[] ids) Not implemented!");
}

    /**
     * @see com.logistics.entity.basic.WlPathDao#toWlPathVO(com.logistics.entity.basic.WlPath, com.logistics.entity.basic.WlPathVO)
     */
    public void toWlPathVO(
        com.logistics.entity.basic.WlPath source,
        com.logistics.entity.basic.WlPathVO target)
    {
        // @todo verify behavior of toWlPathVO
        super.toWlPathVO(source, target);
        target.setEndPlaceID(this.getWlPlaceDao().toWlPlaceVO(source.getEndPlace()));
        //target.setEndPlace(source.getEndPlace().getPlaceName());
        target.setStartPlaceID(this.getWlPlaceDao().toWlPlaceVO(source.getStartPlace()));
        NumberQuery tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getDistance());
        target.setDistance(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getLoanStandard());
        target.setLoanStandard(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getTime());
        target.setTime(tempNum);
        //target.setStartPlace(source.getStartPlace().getPlaceName());
        // WARNING! No conversion for target.startPlace (can't convert source.getStartPlace():com.logistics.entity.basic.WlPlace to java.lang.String
        // WARNING! No conversion for target.endPlace (can't convert source.getEndPlace():com.logistics.entity.basic.WlPlace to java.lang.String
    }


    /**
     * @see com.logistics.entity.basic.WlPathDao#toWlPathVO(com.logistics.entity.basic.WlPath)
     */
    public com.logistics.entity.basic.WlPathVO toWlPathVO(final com.logistics.entity.basic.WlPath entity)
    {
        // @todo verify behavior of toWlPathVO
    	
        return super.toWlPathVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.basic.WlPath loadWlPathFromWlPathVO(com.logistics.entity.basic.WlPathVO wlPathVO)
    {
        // @todo implement loadWlPathFromWlPathVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.basic.loadWlPathFromWlPathVO(com.logistics.entity.basic.WlPathVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.basic.WlPath wlPath = this.load(wlPathVO.getId());
        if (wlPath == null)
        {
            wlPath = com.logistics.entity.basic.WlPath.Factory.newInstance();
        }
        return wlPath;
        
    }

    
    /**
     * @see com.logistics.entity.basic.WlPathDao#wlPathVOToEntity(com.logistics.entity.basic.WlPathVO)
     */
    public com.logistics.entity.basic.WlPath wlPathVOToEntity(com.logistics.entity.basic.WlPathVO wlPathVO)
    {
        // @todo verify behavior of wlPathVOToEntity
        com.logistics.entity.basic.WlPath entity = this.loadWlPathFromWlPathVO(wlPathVO);
        this.wlPathVOToEntity(wlPathVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.basic.WlPathDao#wlPathVOToEntity(com.logistics.entity.basic.WlPathVO, com.logistics.entity.basic.WlPath)
     */
    public void wlPathVOToEntity(
        com.logistics.entity.basic.WlPathVO source,
        com.logistics.entity.basic.WlPath target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlPathVOToEntity
        super.wlPathVOToEntity(source, target, copyIfNull);
        if(source.getDistance()!=null)target.setDistance(source.getDistance().getUpNumber());
        if(source.getEndPlaceID()!=null)target.setEndPlace(this.getWlPlaceDao().load(source.getEndPlaceID().getId()));
        if(source.getStartPlaceID()!=null)target.setStartPlace(this.getWlPlaceDao().load(source.getStartPlaceID().getId()));
        if(source.getLoanStandard()!=null)target.setLoanStandard(source.getLoanStandard().getUpNumber());
        if(source.getTime()!=null)target.setTime(source.getTime().getUpNumber());
        
    }

	protected List handleGetPathVO(String pathName, double distance, double loanStandard, double time, long startPlaceId, long endPlaceId, String startPlace, String endPlace) throws Exception {
		 final Session session = getSession(false);

	        try
	        {
	            final Criteria criteria = session.createCriteria(com.logistics.entity.basic.WlPathImpl.class);

	            if (pathName != null)
	                criteria.add(Expression.ilike("pathName", pathName, MatchMode.START));
	            criteria.add(Expression.eq("distance", new java.lang.Double(distance)));
	            criteria.add(Expression.eq("loanStandard", new java.lang.Double(loanStandard)));
	            criteria.add(Expression.eq("time", new java.lang.Double(time)));
	            criteria.createCriteria("startPlace").add(Expression.eq("id", startPlaceId));
	            criteria.createCriteria("endPlace").add(Expression.eq("id", endPlaceId));
	            //if (startPlace != null) 
	            //if (endPlace != null) 
	            criteria.setMaxResults(250);

	            return criteria.list();
	        }
	        catch (org.hibernate.HibernateException ex)
	        {
	            throw super.convertHibernateAccessException(ex);
	        }
	}

	@Override
	protected List handleGetWlPath(WlPathVO WlPath, int pageNumber,	int pageSize, String orderBy) throws Exception {
		
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.basic.WlPathImpl.class);
            if (WlPath != null) QueryAssCriteria.getPathCriteria(WlPath,criteria);
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      WlPath or=new com.logistics.entity.basic.WlPathImpl();
		     or.setId(new Long(totalCount));
		     //or.setRemark(new Integer(totalCount).toString());
		     if (pageNumber > 0 && pageSize > 0)
		     {
		     	criteria.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
		     	criteria.setMaxResults(pageSize);
		     }else{
		     	criteria.setMaxResults(100);
		     }
		     List re=criteria.list();
		     re.add(or);
		     return re;
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
	}

}
