// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.basic;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;

import com.logistics.util.QueryAssCriteria;
/**
 * @see com.logistics.entity.basic.WlPlace
 */
public class WlPlaceDaoImpl
    extends com.logistics.entity.basic.WlPlaceDaoBase
{
    /**
     * @see com.logistics.entity.basic.WlPlaceDao#getPlacevoByType(java.lang.String)
     */
    protected java.util.List handleGetPlacevoByType(java.lang.String type)
    {
    	final Session session = getSession(false);

        try
        {
        	Query 	sqlQuery = session.createSQLQuery("select {WlPlace.*} from Wl_Place as WlPlace  where {WlPlace.placeType} like :placetype ").addEntity("WlPlace",com.logistics.entity.basic.WlPlaceImpl.class);
        	sqlQuery.setString("placetype",type);
        	List places = sqlQuery.list();

        	return places;
//        	
//            final Criteria criteria = session.createCriteria(com.logistics.entity.basic.WlPlaceImpl.class);
//
//            
//            if (type != null){
//                criteria.add(Expression.ilike("placeType", type, MatchMode.START));
//                criteria.add(Expression.sizeEq("placeType", type.length()+3));
//            }
//            
//            criteria.setMaxResults(250);
//
//            return criteria.list();
        	
        	
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
}

    /**
     * @see com.logistics.entity.basic.WlPlaceDao#getPlacevoByParentPlaceId(long)
     */
    protected java.util.List handleGetPlacevoByParentPlaceId(long parentPlaceId)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.basic.WlPlaceImpl.class);

            
            criteria.add(Expression.eq("parentPlaceId", new java.lang.Long(parentPlaceId)));
            
            criteria.setMaxResults(250);

            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
}

    /**
     * @see com.logistics.entity.basic.WlPlaceDao#getPlacevoByPostCode(java.lang.String)
     */
    protected java.util.List handleGetPlacevoByPostCode(java.lang.String post)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.basic.WlPlaceImpl.class);

            
            if (post != null)
                criteria.add(Expression.ilike("postCode", post, MatchMode.START));
            
            criteria.setMaxResults(250);

            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
}

    /**
     * @see com.logistics.entity.basic.WlPlaceDao#getPlacevoByPostCode(java.lang.String)
     */
    protected java.util.List handleGetPlaceVO(java.lang.String placeName,java.lang.String postCode ,java.lang.String placeType,java.lang.String remark)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.basic.WlPlaceImpl.class);

            
            if (placeName != null)
                criteria.add(Expression.like("placeName", placeName, MatchMode.START));
            if (postCode != null)
                criteria.add(Expression.like("postCode", postCode, MatchMode.START));
            if (placeType != null)
                criteria.add(Expression.like("placeType", placeType, MatchMode.START));
            if (remark != null)
                criteria.add(Expression.like("remark", remark, MatchMode.START));
            
            criteria.setMaxResults(250);

            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
}
    
    
    /**
     * @see com.logistics.entity.basic.WlPlaceDao#getPlaceByName(java.lang.String)
     */
    protected java.util.List handleGetPlaceByName(java.lang.String name)
    {
        // @todo implement public java.util.List handleGetPlaceByName(java.lang.String name)
        return null;
}

    /**
     * @see com.logistics.entity.basic.WlPlaceDao#createPlace(com.logistics.entity.basic.WlPlaceVO)
     */
    protected long handleCreatePlace(com.logistics.entity.basic.WlPlaceVO place)
    {
        // @todo implement public long handleCreatePlace(com.logistics.entity.basic.WlPlaceVO place)
        return 0;
}

    /**
     * @see com.logistics.entity.basic.WlPlaceDao#updatePlaces(java.util.List)
     */
    protected void handleUpdatePlaces(java.util.List places)
    {
        // @todo implement public void handleUpdatePlaces(java.util.List places)
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.basic.WlPlace.handleUpdatePlaces(java.util.List places) Not implemented!");
}

    /**
     * @see com.logistics.entity.basic.WlPlaceDao#deletePlaces(long[])
     */
    protected void handleDeletePlaces(long[] ids)
    {
        // @todo implement public void handleDeletePlaces(long[] ids)
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.basic.WlPlace.handleDeletePlaces(long[] ids) Not implemented!");
}

    /**
     * @see com.logistics.entity.basic.WlPlaceDao#getAllPlacevo()
     */
    protected java.util.List handleGetAllPlacevo()
    {
        // @todo implement public java.util.List handleGetAllPlacevo()
        return null;
}

    /**
     * @see com.logistics.entity.basic.WlPlaceDao#getPlaceDojoStringByArea(java.lang.String)
     */
    protected java.lang.String handleGetPlaceDojoStringByArea(java.lang.String area)
    {
        // @todo implement public java.lang.String handleGetPlaceDojoStringByArea(java.lang.String area)
        return null;
}

    /**
     * @see com.logistics.entity.basic.WlPlaceDao#toWlPlaceVO(com.logistics.entity.basic.WlPlace, com.logistics.entity.basic.WlPlaceVO)
     */
    public void toWlPlaceVO(
        com.logistics.entity.basic.WlPlace source,
        com.logistics.entity.basic.WlPlaceVO target)
    {
        // @todo verify behavior of toWlPlaceVO
        super.toWlPlaceVO(source, target);
    }


    /**
     * @see com.logistics.entity.basic.WlPlaceDao#toWlPlaceVO(com.logistics.entity.basic.WlPlace)
     */
    public com.logistics.entity.basic.WlPlaceVO toWlPlaceVO(final com.logistics.entity.basic.WlPlace entity)
    {
        // @todo verify behavior of toWlPlaceVO
        return super.toWlPlaceVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.basic.WlPlace loadWlPlaceFromWlPlaceVO(com.logistics.entity.basic.WlPlaceVO wlPlaceVO)
    {
        // @todo implement loadWlPlaceFromWlPlaceVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.basic.loadWlPlaceFromWlPlaceVO(com.logistics.entity.basic.WlPlaceVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.basic.WlPlace wlPlace = this.load(wlPlaceVO.getId());
        if (wlPlace == null)
        {
            wlPlace = com.logistics.entity.basic.WlPlace.Factory.newInstance();
        }
        return wlPlace;
        */
    }

    
    /**
     * @see com.logistics.entity.basic.WlPlaceDao#wlPlaceVOToEntity(com.logistics.entity.basic.WlPlaceVO)
     */
    public com.logistics.entity.basic.WlPlace wlPlaceVOToEntity(com.logistics.entity.basic.WlPlaceVO wlPlaceVO)
    {
        // @todo verify behavior of wlPlaceVOToEntity
        com.logistics.entity.basic.WlPlace entity = this.loadWlPlaceFromWlPlaceVO(wlPlaceVO);
        this.wlPlaceVOToEntity(wlPlaceVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.basic.WlPlaceDao#wlPlaceVOToEntity(com.logistics.entity.basic.WlPlaceVO, com.logistics.entity.basic.WlPlace)
     */
    public void wlPlaceVOToEntity(
        com.logistics.entity.basic.WlPlaceVO source,
        com.logistics.entity.basic.WlPlace target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlPlaceVOToEntity
        super.wlPlaceVOToEntity(source, target, copyIfNull);
    }

	@Override
	protected List handleGetWlPlace(WlPlaceVO WlPlace, int pageNumber,int pageSize, String orderBy) throws Exception {
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.basic.WlPlaceImpl.class);
            if (WlPlace != null) QueryAssCriteria.getPlaceCriteria(WlPlace,criteria);
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      WlPlace or=new com.logistics.entity.basic.WlPlaceImpl();
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