// license-header java merge-point
//
// Attention: Generated code! Do not modify by hand!
// Generated by: SpringHibernateDaoBase.vsl in andromda-spring-cartridge.
//
package com.demo.entity.orga;

/**
 * <p>
 * Base Spring DAO Class: is able to create, update, remove, load, and find
 * objects of type <code>com.demo.entity.orga.Orga</code>.
 * </p>
 *
 * @see com.demo.entity.orga.Orga
 */
public abstract class OrgaDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements com.demo.entity.orga.OrgaDao
{

    /**
     * @see com.demo.entity.orga.OrgaDao#load(int, java.lang.Long)
     */
    public java.lang.Object load(final int transform, final java.lang.Long id)
    {
        if (id == null)
        {
            throw new IllegalArgumentException(
                "Orga.load - 'id' can not be null");
        }
        final java.lang.Object entity = this.getHibernateTemplate().get(com.demo.entity.orga.OrgaImpl.class, id);
        return transformEntity(transform, (com.demo.entity.orga.Orga)entity);
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#load(java.lang.Long)
     */
    public com.demo.entity.orga.Orga load(java.lang.Long id)
    {
        return (com.demo.entity.orga.Orga)this.load(TRANSFORM_NONE, id);
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#loadAll()
     */
    public java.util.Collection loadAll()
    {
        return this.loadAll(TRANSFORM_NONE);
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#loadAll(int)
     */
    public java.util.Collection loadAll(final int transform)
    {
        return this.loadAll(transform, -1, -1);
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#loadAll(int, int)
     */
    public java.util.Collection loadAll(final int pageNumber, final int pageSize)
    {
        return this.loadAll(TRANSFORM_NONE, pageNumber, pageSize);
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#loadAll(int, int, int)
     */
    public java.util.Collection loadAll(final int transform, final int pageNumber, final int pageSize)
    {
        try
        {
            final org.hibernate.Criteria criteria = this.getSession(false).createCriteria(com.demo.entity.orga.OrgaImpl.class);
            if (pageNumber > 0 && pageSize > 0)
            {
                criteria.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
                criteria.setMaxResults(pageSize);
            }
            final java.util.Collection results = criteria.list();
            this.transformEntities(transform, results);
            return results;
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    protected int calculateFirstResult(int pageNumber, int pageSize)
    {
        int firstResult = 0;
        if (pageNumber > 0)
        {
            firstResult = (pageNumber - 1) * pageSize;
        }
        return firstResult;
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#create(com.demo.entity.orga.Orga)
     */
    public com.demo.entity.orga.Orga create(com.demo.entity.orga.Orga orga)
    {
        return (com.demo.entity.orga.Orga)this.create(TRANSFORM_NONE, orga);
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#create(int transform, com.demo.entity.orga.Orga)
     */
    public java.lang.Object create(final int transform, final com.demo.entity.orga.Orga orga)
    {
        if (orga == null)
        {
            throw new IllegalArgumentException(
                "Orga.create - 'orga' can not be null");
        }
        this.getHibernateTemplate().save(orga);
        return this.transformEntity(transform, orga);
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#create(java.util.Collection)
     */
    public java.util.Collection create(final java.util.Collection entities)
    {
        return create(TRANSFORM_NONE, entities);
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#create(int, java.util.Collection)
     */
    public java.util.Collection create(final int transform, final java.util.Collection entities)
    {
        if (entities == null)
        {
            throw new IllegalArgumentException(
                "Orga.create - 'entities' can not be null");
        }
        this.getHibernateTemplate().execute(
            new org.springframework.orm.hibernate3.HibernateCallback()
            {
                public java.lang.Object doInHibernate(org.hibernate.Session session)
                    throws org.hibernate.HibernateException
                {
                    for (java.util.Iterator entityIterator = entities.iterator(); entityIterator.hasNext();)
                    {
                        create(transform, (com.demo.entity.orga.Orga)entityIterator.next());
                    }
                    return null;
                }
            },
            true);
        return entities;
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#create(java.lang.String, java.lang.String, java.lang.String, java.lang.String, long)
     */
    public com.demo.entity.orga.Orga create(
        java.lang.String orgaName,
        java.lang.String orgaCode,
        java.lang.String sno,
        java.lang.String remark,
        long parentId)
    {
        return (com.demo.entity.orga.Orga)this.create(TRANSFORM_NONE, orgaName, orgaCode, sno, remark, parentId);
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#create(int, java.lang.String, java.lang.String, java.lang.String, java.lang.String, long)
     */
    public java.lang.Object create(
        final int transform,
        java.lang.String orgaName,
        java.lang.String orgaCode,
        java.lang.String sno,
        java.lang.String remark,
        long parentId)
    {
        com.demo.entity.orga.Orga entity = new com.demo.entity.orga.OrgaImpl();
        entity.setOrgaName(orgaName);
        entity.setOrgaCode(orgaCode);
        entity.setSno(sno);
        entity.setRemark(remark);
        entity.setParentId(parentId);
        return this.create(transform, entity);
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#update(com.demo.entity.orga.Orga)
     */
    public void update(com.demo.entity.orga.Orga orga)
    {
        if (orga == null)
        {
            throw new IllegalArgumentException(
                "Orga.update - 'orga' can not be null");
        }
        this.getHibernateTemplate().update(orga);
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#update(java.util.Collection)
     */
    public void update(final java.util.Collection entities)
    {
        if (entities == null)
        {
            throw new IllegalArgumentException(
                "Orga.update - 'entities' can not be null");
        }
        this.getHibernateTemplate().execute(
            new org.springframework.orm.hibernate3.HibernateCallback()
            {
                public java.lang.Object doInHibernate(org.hibernate.Session session)
                    throws org.hibernate.HibernateException
                {
                    for (java.util.Iterator entityIterator = entities.iterator(); entityIterator.hasNext();)
                    {
                        update((com.demo.entity.orga.Orga)entityIterator.next());
                    }
                    return null;
                }
            },
            true);
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#remove(com.demo.entity.orga.Orga)
     */
    public void remove(com.demo.entity.orga.Orga orga)
    {
        if (orga == null)
        {
            throw new IllegalArgumentException(
                "Orga.remove - 'orga' can not be null");
        }
        this.getHibernateTemplate().delete(orga);
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#remove(java.lang.Long)
     */
    public void remove(java.lang.Long id)
    {
        if (id == null)
        {
            throw new IllegalArgumentException(
                "Orga.remove - 'id' can not be null");
        }
        com.demo.entity.orga.Orga entity = this.load(id);
        if (entity != null)
        {
            this.remove(entity);
        }
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#remove(java.util.Collection)
     */
    public void remove(java.util.Collection entities)
    {
        if (entities == null)
        {
            throw new IllegalArgumentException(
                "Orga.remove - 'entities' can not be null");
        }
        this.getHibernateTemplate().deleteAll(entities);
    }
    /**
     * @see com.demo.entity.orga.OrgaDao#getOrga(com.demo.entity.orga.OrgaVO, int, int, java.lang.String)
     */
    public java.util.List getOrga(final com.demo.entity.orga.OrgaVO Orga, final int pageNumber, final int pageSize, final java.lang.String orderBy)
    {
        if (Orga == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.OrgaDao.getOrga(com.demo.entity.orga.OrgaVO Orga, int pageNumber, int pageSize, java.lang.String orderBy) - 'Orga' can not be null");
        }
        if (orderBy == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.OrgaDao.getOrga(com.demo.entity.orga.OrgaVO Orga, int pageNumber, int pageSize, java.lang.String orderBy) - 'orderBy' can not be null");
        }
        try
        {
            return this.handleGetOrga(Orga, pageNumber, pageSize, orderBy);
        }
        catch (Throwable th)
        {
            throw new java.lang.RuntimeException(
            "Error performing 'com.demo.entity.orga.OrgaDao.getOrga(com.demo.entity.orga.OrgaVO Orga, int pageNumber, int pageSize, java.lang.String orderBy)' --> " + th,
            th);
        }
    }

     /**
      * Performs the core logic for {@link #getOrga(com.demo.entity.orga.OrgaVO, int, int, java.lang.String)}
      */
    protected abstract java.util.List handleGetOrga(com.demo.entity.orga.OrgaVO Orga, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception;

    /**
     * Allows transformation of entities into value objects
     * (or something else for that matter), when the <code>transform</code>
     * flag is set to one of the constants defined in <code>com.demo.entity.orga.OrgaDao</code>, please note
     * that the {@link #TRANSFORM_NONE} constant denotes no transformation, so the entity itself
     * will be returned.
     * <p>
     * This method will return instances of these types:
     * <ul>
     *   <li>{@link com.demo.entity.orga.Orga} - {@link #TRANSFORM_NONE}</li>
     *   <li>{@link com.demo.entity.orga.OrgaVO} - {@link TRANSFORM_ORGAVO}</li>
     * </ul>
     *
     * If the integer argument value is unknown {@link #TRANSFORM_NONE} is assumed.
     *
     * @param transform one of the constants declared in {@link com.demo.entity.orga.OrgaDao}
     * @param entity an entity that was found
     * @return the transformed entity (i.e. new value object, etc)
     * @see #transformEntities(int,java.util.Collection)
     */
    protected java.lang.Object transformEntity(final int transform, final com.demo.entity.orga.Orga entity)
    {
        java.lang.Object target = null;
        if (entity != null)
        {
            switch (transform)
            {
                case TRANSFORM_ORGAVO :
                    target = toOrgaVO(entity);
                    break;
                case TRANSFORM_NONE : // fall-through
                default:
                    target = entity;
            }
        }
        return target;
    }

    /**
     * Transforms a collection of entities using the
     * {@link #transformEntity(int,com.demo.entity.orga.Orga)}
     * method. This method does not instantiate a new collection.
     * <p>
     * This method is to be used internally only.
     *
     * @param transform one of the constants declared in <code>com.demo.entity.orga.OrgaDao</code>
     * @param entities the collection of entities to transform
     * @see #transformEntity(int,com.demo.entity.orga.Orga)
     */
    protected void transformEntities(final int transform, final java.util.Collection entities)
    {
        switch (transform)
        {
            case TRANSFORM_ORGAVO :
                toOrgaVOCollection(entities);
                break;
            case TRANSFORM_NONE : // fall-through
                default:
                // do nothing;
        }
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#toEntities(java.util.Collection)
     */
    public void toEntities(final java.util.Collection results)
    {
        if (results != null)
        {
            org.apache.commons.collections.CollectionUtils.transform(results, ENTITYTRANSFORMER);
        }
    }

    /**
     * This anonymous transformer is designed to transform report query results
     * (which result in an array of entities) to {@link com.demo.entity.orga.Orga}
     * using the Jakarta Commons-Collections Transformation API.
     */
    private org.apache.commons.collections.Transformer ENTITYTRANSFORMER =
        new org.apache.commons.collections.Transformer()
        {
            public java.lang.Object transform(java.lang.Object input)
            {
                java.lang.Object result = null;
                if (input instanceof java.lang.Object[])
                {
                    result = toEntity((java.lang.Object[])input);
                }
                else if (input instanceof com.demo.entity.orga.Orga)
                {
                    result = input;
                }
                return result;
            }
        };

    protected com.demo.entity.orga.Orga toEntity(java.lang.Object[] row)
    {
        com.demo.entity.orga.Orga target = null;
        if (row != null)
        {
            final int numberOfObjects = row.length;
            for (int ctr = 0; ctr < numberOfObjects; ctr++)
            {
                final java.lang.Object object = row[ctr];
                if (object instanceof com.demo.entity.orga.Orga)
                {
                    target = (com.demo.entity.orga.Orga)object;
                    break;
                }
            }
        }
        return target;
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#toOrgaVOCollection(java.util.Collection)
     */
    public final void toOrgaVOCollection(java.util.Collection entities)
    {
        if (entities != null)
        {
            org.apache.commons.collections.CollectionUtils.transform(entities, ORGAVO_TRANSFORMER);
        }
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#toOrgaVOArray(java.util.Collection)
     */
    public final com.demo.entity.orga.OrgaVO[] toOrgaVOArray(java.util.Collection entities)
    {
        com.demo.entity.orga.OrgaVO[] result = null;
        if (entities != null)
        {
            final java.util.Collection collection = new java.util.ArrayList(entities);
            this.toOrgaVOCollection(collection);
            result = (com.demo.entity.orga.OrgaVO[]) collection.toArray(new com.demo.entity.orga.OrgaVO[0]);
        }
        return result;
    }

    /**
     * Default implementation for transforming the results of a report query into a value object. This
     * implementation exists for convenience reasons only. It needs only be overridden in the
     * {@link OrgaDaoImpl} class if you intend to use reporting queries.
     * @see com.demo.entity.orga.OrgaDao#toOrgaVO(com.demo.entity.orga.Orga)
     */
    protected com.demo.entity.orga.OrgaVO toOrgaVO(java.lang.Object[] row)
    {
        return this.toOrgaVO(this.toEntity(row));
    }

    /**
     * This anonymous transformer is designed to transform entities or report query results
     * (which result in an array of objects) to {@link com.demo.entity.orga.OrgaVO}
     * using the Jakarta Commons-Collections Transformation API.
     */
    private org.apache.commons.collections.Transformer ORGAVO_TRANSFORMER =
        new org.apache.commons.collections.Transformer()
        {
            public java.lang.Object transform(java.lang.Object input)
            {
                java.lang.Object result = null;
                if (input instanceof com.demo.entity.orga.Orga)
                {
                    result = toOrgaVO((com.demo.entity.orga.Orga)input);
                }
                else if (input instanceof java.lang.Object[])
                {
                    result = toOrgaVO((java.lang.Object[])input);
                }
                return result;
            }
        };

    /**
     * @see com.demo.entity.orga.OrgaDao#orgaVOToEntityCollection(java.util.Collection)
     */
    public final void orgaVOToEntityCollection(java.util.Collection instances)
    {
        if (instances != null)
        {
            for (final java.util.Iterator iterator = instances.iterator(); iterator.hasNext();)
            {
                // - remove an objects that are null or not of the correct instance
                if (!(iterator.next() instanceof com.demo.entity.orga.OrgaVO))
                {
                    iterator.remove();
                }
            }
            org.apache.commons.collections.CollectionUtils.transform(instances, OrgaVOToEntityTransformer);
        }
    }

    private final org.apache.commons.collections.Transformer OrgaVOToEntityTransformer =
        new org.apache.commons.collections.Transformer()
        {
            public java.lang.Object transform(java.lang.Object input)
            {
                return orgaVOToEntity((com.demo.entity.orga.OrgaVO)input);
            }
        };


    /**
     * @see com.demo.entity.orga.OrgaDao#toOrgaVO(com.demo.entity.orga.Orga, com.demo.entity.orga.OrgaVO)
     */
    public void toOrgaVO(
        com.demo.entity.orga.Orga source,
        com.demo.entity.orga.OrgaVO target)
    {
        target.setOrgaName(source.getOrgaName());
        target.setOrgaCode(source.getOrgaCode());
        target.setSno(source.getSno());
        target.setRemark(source.getRemark());
        target.setId((source.getId() == null ? 0 : source.getId().longValue()));
        target.setParentId(source.getParentId());
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#toOrgaVO(com.demo.entity.orga.Orga)
     */
    public com.demo.entity.orga.OrgaVO toOrgaVO(final com.demo.entity.orga.Orga entity)
    {
        com.demo.entity.orga.OrgaVO target = null;
        if (entity != null)
        {
            target = new com.demo.entity.orga.OrgaVO();
            this.toOrgaVO(entity, target);
        }
        return target;
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#orgaVOToEntity(com.demo.entity.orga.OrgaVO, com.demo.entity.orga.Orga)
     */
    public void orgaVOToEntity(
        com.demo.entity.orga.OrgaVO source,
        com.demo.entity.orga.Orga target,
        boolean copyIfNull)
    {
        if (copyIfNull || source.getOrgaName() != null)
        {
            target.setOrgaName(source.getOrgaName());
        }
        if (copyIfNull || source.getOrgaCode() != null)
        {
            target.setOrgaCode(source.getOrgaCode());
        }
        if (copyIfNull || source.getSno() != null)
        {
            target.setSno(source.getSno());
        }
        if (copyIfNull || source.getRemark() != null)
        {
            target.setRemark(source.getRemark());
        }
        if (copyIfNull || source.getParentId() != 0)
        {
            target.setParentId(source.getParentId());
        }
    }

    /**
     * Gets the current <code>principal</code> if one has been set,
     * otherwise returns <code>null</code>.
     *
     * @return the current principal
     */
    protected java.security.Principal getPrincipal()
    {
        return com.demo.PrincipalStore.get();
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#search(int, int, int, com.demo.Search)
     */
    public com.demo.PaginationResult search(final int transform, final int pageNumber, final int pageSize, final com.demo.Search search)
    {
        try
        {
            search.setPageNumber(pageNumber);
            search.setPageSize(pageSize);
            final com.demo.PropertySearch propertySearch = new com.demo.PropertySearch(
                this.getSession(false), com.demo.entity.orga.OrgaImpl.class, search);
            final java.util.List results = propertySearch.executeAsList();
            this.transformEntities(transform, results);
            return new com.demo.PaginationResult(results.toArray(new java.lang.Object[0]), propertySearch.getTotalCount());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#search(int, int, com.demo.Search)
     */
    public com.demo.PaginationResult search(final int pageNumber, final int pageSize, final com.demo.Search search)
    {
        return this.search(TRANSFORM_NONE, pageNumber, pageSize, search);
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#search(int, com.demo.Search)
     */
    public java.util.Set search(final int transform, final com.demo.Search search)
    {
        try
        {
            final com.demo.PropertySearch propertySearch = new com.demo.PropertySearch(
                this.getSession(false), com.demo.entity.orga.OrgaImpl.class, search);
            final java.util.Set results = propertySearch.executeAsSet();
            this.transformEntities(transform, results);
            return results;
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    /**
     * @see com.demo.entity.orga.OrgaDao#search(com.demo.Search)
     */
    public java.util.Set search(final com.demo.Search search)
    {
        return this.search(TRANSFORM_NONE, search);
    }

    // spring-hibernate-dao-base merge-point
}