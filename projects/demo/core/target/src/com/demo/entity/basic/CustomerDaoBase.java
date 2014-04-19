// license-header java merge-point
//
// Attention: Generated code! Do not modify by hand!
// Generated by: SpringHibernateDaoBase.vsl in andromda-spring-cartridge.
//
package com.demo.entity.basic;

/**
 * <p>
 * Base Spring DAO Class: is able to create, update, remove, load, and find
 * objects of type <code>com.demo.entity.basic.Customer</code>.
 * </p>
 *
 * @see com.demo.entity.basic.Customer
 */
public abstract class CustomerDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements com.demo.entity.basic.CustomerDao
{

    /**
     * @see com.demo.entity.basic.CustomerDao#load(int, java.lang.Long)
     */
    public java.lang.Object load(final int transform, final java.lang.Long id)
    {
        if (id == null)
        {
            throw new IllegalArgumentException(
                "Customer.load - 'id' can not be null");
        }
        final java.lang.Object entity = this.getHibernateTemplate().get(com.demo.entity.basic.CustomerImpl.class, id);
        return transformEntity(transform, (com.demo.entity.basic.Customer)entity);
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#load(java.lang.Long)
     */
    public com.demo.entity.basic.Customer load(java.lang.Long id)
    {
        return (com.demo.entity.basic.Customer)this.load(TRANSFORM_NONE, id);
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#loadAll()
     */
    public java.util.Collection loadAll()
    {
        return this.loadAll(TRANSFORM_NONE);
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#loadAll(int)
     */
    public java.util.Collection loadAll(final int transform)
    {
        return this.loadAll(transform, -1, -1);
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#loadAll(int, int)
     */
    public java.util.Collection loadAll(final int pageNumber, final int pageSize)
    {
        return this.loadAll(TRANSFORM_NONE, pageNumber, pageSize);
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#loadAll(int, int, int)
     */
    public java.util.Collection loadAll(final int transform, final int pageNumber, final int pageSize)
    {
        try
        {
            final org.hibernate.Criteria criteria = this.getSession(false).createCriteria(com.demo.entity.basic.CustomerImpl.class);
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
     * @see com.demo.entity.basic.CustomerDao#create(com.demo.entity.basic.Customer)
     */
    public com.demo.entity.basic.Customer create(com.demo.entity.basic.Customer customer)
    {
        return (com.demo.entity.basic.Customer)this.create(TRANSFORM_NONE, customer);
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#create(int transform, com.demo.entity.basic.Customer)
     */
    public java.lang.Object create(final int transform, final com.demo.entity.basic.Customer customer)
    {
        if (customer == null)
        {
            throw new IllegalArgumentException(
                "Customer.create - 'customer' can not be null");
        }
        this.getHibernateTemplate().save(customer);
        return this.transformEntity(transform, customer);
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#create(java.util.Collection)
     */
    public java.util.Collection create(final java.util.Collection entities)
    {
        return create(TRANSFORM_NONE, entities);
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#create(int, java.util.Collection)
     */
    public java.util.Collection create(final int transform, final java.util.Collection entities)
    {
        if (entities == null)
        {
            throw new IllegalArgumentException(
                "Customer.create - 'entities' can not be null");
        }
        this.getHibernateTemplate().execute(
            new org.springframework.orm.hibernate3.HibernateCallback()
            {
                public java.lang.Object doInHibernate(org.hibernate.Session session)
                    throws org.hibernate.HibernateException
                {
                    for (java.util.Iterator entityIterator = entities.iterator(); entityIterator.hasNext();)
                    {
                        create(transform, (com.demo.entity.basic.Customer)entityIterator.next());
                    }
                    return null;
                }
            },
            true);
        return entities;
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#create(java.lang.String, java.lang.String)
     */
    public com.demo.entity.basic.Customer create(
        java.lang.String customerName,
        java.lang.String custEnum)
    {
        return (com.demo.entity.basic.Customer)this.create(TRANSFORM_NONE, customerName, custEnum);
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#create(int, java.lang.String, java.lang.String)
     */
    public java.lang.Object create(
        final int transform,
        java.lang.String customerName,
        java.lang.String custEnum)
    {
        com.demo.entity.basic.Customer entity = new com.demo.entity.basic.CustomerImpl();
        entity.setCustomerName(customerName);
        entity.setCustEnum(custEnum);
        return this.create(transform, entity);
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#update(com.demo.entity.basic.Customer)
     */
    public void update(com.demo.entity.basic.Customer customer)
    {
        if (customer == null)
        {
            throw new IllegalArgumentException(
                "Customer.update - 'customer' can not be null");
        }
        this.getHibernateTemplate().update(customer);
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#update(java.util.Collection)
     */
    public void update(final java.util.Collection entities)
    {
        if (entities == null)
        {
            throw new IllegalArgumentException(
                "Customer.update - 'entities' can not be null");
        }
        this.getHibernateTemplate().execute(
            new org.springframework.orm.hibernate3.HibernateCallback()
            {
                public java.lang.Object doInHibernate(org.hibernate.Session session)
                    throws org.hibernate.HibernateException
                {
                    for (java.util.Iterator entityIterator = entities.iterator(); entityIterator.hasNext();)
                    {
                        update((com.demo.entity.basic.Customer)entityIterator.next());
                    }
                    return null;
                }
            },
            true);
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#remove(com.demo.entity.basic.Customer)
     */
    public void remove(com.demo.entity.basic.Customer customer)
    {
        if (customer == null)
        {
            throw new IllegalArgumentException(
                "Customer.remove - 'customer' can not be null");
        }
        this.getHibernateTemplate().delete(customer);
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#remove(java.lang.Long)
     */
    public void remove(java.lang.Long id)
    {
        if (id == null)
        {
            throw new IllegalArgumentException(
                "Customer.remove - 'id' can not be null");
        }
        com.demo.entity.basic.Customer entity = this.load(id);
        if (entity != null)
        {
            this.remove(entity);
        }
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#remove(java.util.Collection)
     */
    public void remove(java.util.Collection entities)
    {
        if (entities == null)
        {
            throw new IllegalArgumentException(
                "Customer.remove - 'entities' can not be null");
        }
        this.getHibernateTemplate().deleteAll(entities);
    }
    /**
     * @see com.demo.entity.basic.CustomerDao#getCustomer(com.demo.entity.basic.CustomerVO, int, int, java.lang.String)
     */
    public java.util.List getCustomer(final com.demo.entity.basic.CustomerVO Customer, final int pageNumber, final int pageSize, final java.lang.String orderBy)
    {
        if (Customer == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.CustomerDao.getCustomer(com.demo.entity.basic.CustomerVO Customer, int pageNumber, int pageSize, java.lang.String orderBy) - 'Customer' can not be null");
        }
        if (orderBy == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.CustomerDao.getCustomer(com.demo.entity.basic.CustomerVO Customer, int pageNumber, int pageSize, java.lang.String orderBy) - 'orderBy' can not be null");
        }
        try
        {
            return this.handleGetCustomer(Customer, pageNumber, pageSize, orderBy);
        }
        catch (Throwable th)
        {
            throw new java.lang.RuntimeException(
            "Error performing 'com.demo.entity.basic.CustomerDao.getCustomer(com.demo.entity.basic.CustomerVO Customer, int pageNumber, int pageSize, java.lang.String orderBy)' --> " + th,
            th);
        }
    }

     /**
      * Performs the core logic for {@link #getCustomer(com.demo.entity.basic.CustomerVO, int, int, java.lang.String)}
      */
    protected abstract java.util.List handleGetCustomer(com.demo.entity.basic.CustomerVO Customer, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception;

    /**
     * Allows transformation of entities into value objects
     * (or something else for that matter), when the <code>transform</code>
     * flag is set to one of the constants defined in <code>com.demo.entity.basic.CustomerDao</code>, please note
     * that the {@link #TRANSFORM_NONE} constant denotes no transformation, so the entity itself
     * will be returned.
     * <p>
     * This method will return instances of these types:
     * <ul>
     *   <li>{@link com.demo.entity.basic.Customer} - {@link #TRANSFORM_NONE}</li>
     *   <li>{@link com.demo.entity.basic.CustomerVO} - {@link TRANSFORM_CUSTOMERVO}</li>
     * </ul>
     *
     * If the integer argument value is unknown {@link #TRANSFORM_NONE} is assumed.
     *
     * @param transform one of the constants declared in {@link com.demo.entity.basic.CustomerDao}
     * @param entity an entity that was found
     * @return the transformed entity (i.e. new value object, etc)
     * @see #transformEntities(int,java.util.Collection)
     */
    protected java.lang.Object transformEntity(final int transform, final com.demo.entity.basic.Customer entity)
    {
        java.lang.Object target = null;
        if (entity != null)
        {
            switch (transform)
            {
                case TRANSFORM_CUSTOMERVO :
                    target = toCustomerVO(entity);
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
     * {@link #transformEntity(int,com.demo.entity.basic.Customer)}
     * method. This method does not instantiate a new collection.
     * <p>
     * This method is to be used internally only.
     *
     * @param transform one of the constants declared in <code>com.demo.entity.basic.CustomerDao</code>
     * @param entities the collection of entities to transform
     * @see #transformEntity(int,com.demo.entity.basic.Customer)
     */
    protected void transformEntities(final int transform, final java.util.Collection entities)
    {
        switch (transform)
        {
            case TRANSFORM_CUSTOMERVO :
                toCustomerVOCollection(entities);
                break;
            case TRANSFORM_NONE : // fall-through
                default:
                // do nothing;
        }
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#toEntities(java.util.Collection)
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
     * (which result in an array of entities) to {@link com.demo.entity.basic.Customer}
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
                else if (input instanceof com.demo.entity.basic.Customer)
                {
                    result = input;
                }
                return result;
            }
        };

    protected com.demo.entity.basic.Customer toEntity(java.lang.Object[] row)
    {
        com.demo.entity.basic.Customer target = null;
        if (row != null)
        {
            final int numberOfObjects = row.length;
            for (int ctr = 0; ctr < numberOfObjects; ctr++)
            {
                final java.lang.Object object = row[ctr];
                if (object instanceof com.demo.entity.basic.Customer)
                {
                    target = (com.demo.entity.basic.Customer)object;
                    break;
                }
            }
        }
        return target;
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#toCustomerVOCollection(java.util.Collection)
     */
    public final void toCustomerVOCollection(java.util.Collection entities)
    {
        if (entities != null)
        {
            org.apache.commons.collections.CollectionUtils.transform(entities, CUSTOMERVO_TRANSFORMER);
        }
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#toCustomerVOArray(java.util.Collection)
     */
    public final com.demo.entity.basic.CustomerVO[] toCustomerVOArray(java.util.Collection entities)
    {
        com.demo.entity.basic.CustomerVO[] result = null;
        if (entities != null)
        {
            final java.util.Collection collection = new java.util.ArrayList(entities);
            this.toCustomerVOCollection(collection);
            result = (com.demo.entity.basic.CustomerVO[]) collection.toArray(new com.demo.entity.basic.CustomerVO[0]);
        }
        return result;
    }

    /**
     * Default implementation for transforming the results of a report query into a value object. This
     * implementation exists for convenience reasons only. It needs only be overridden in the
     * {@link CustomerDaoImpl} class if you intend to use reporting queries.
     * @see com.demo.entity.basic.CustomerDao#toCustomerVO(com.demo.entity.basic.Customer)
     */
    protected com.demo.entity.basic.CustomerVO toCustomerVO(java.lang.Object[] row)
    {
        return this.toCustomerVO(this.toEntity(row));
    }

    /**
     * This anonymous transformer is designed to transform entities or report query results
     * (which result in an array of objects) to {@link com.demo.entity.basic.CustomerVO}
     * using the Jakarta Commons-Collections Transformation API.
     */
    private org.apache.commons.collections.Transformer CUSTOMERVO_TRANSFORMER =
        new org.apache.commons.collections.Transformer()
        {
            public java.lang.Object transform(java.lang.Object input)
            {
                java.lang.Object result = null;
                if (input instanceof com.demo.entity.basic.Customer)
                {
                    result = toCustomerVO((com.demo.entity.basic.Customer)input);
                }
                else if (input instanceof java.lang.Object[])
                {
                    result = toCustomerVO((java.lang.Object[])input);
                }
                return result;
            }
        };

    /**
     * @see com.demo.entity.basic.CustomerDao#customerVOToEntityCollection(java.util.Collection)
     */
    public final void customerVOToEntityCollection(java.util.Collection instances)
    {
        if (instances != null)
        {
            for (final java.util.Iterator iterator = instances.iterator(); iterator.hasNext();)
            {
                // - remove an objects that are null or not of the correct instance
                if (!(iterator.next() instanceof com.demo.entity.basic.CustomerVO))
                {
                    iterator.remove();
                }
            }
            org.apache.commons.collections.CollectionUtils.transform(instances, CustomerVOToEntityTransformer);
        }
    }

    private final org.apache.commons.collections.Transformer CustomerVOToEntityTransformer =
        new org.apache.commons.collections.Transformer()
        {
            public java.lang.Object transform(java.lang.Object input)
            {
                return customerVOToEntity((com.demo.entity.basic.CustomerVO)input);
            }
        };


    /**
     * @see com.demo.entity.basic.CustomerDao#toCustomerVO(com.demo.entity.basic.Customer, com.demo.entity.basic.CustomerVO)
     */
    public void toCustomerVO(
        com.demo.entity.basic.Customer source,
        com.demo.entity.basic.CustomerVO target)
    {
        target.setCustomerName(source.getCustomerName());
        target.setId((source.getId() == null ? 0 : source.getId().longValue()));
        target.setCustEnum(source.getCustEnum());
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#toCustomerVO(com.demo.entity.basic.Customer)
     */
    public com.demo.entity.basic.CustomerVO toCustomerVO(final com.demo.entity.basic.Customer entity)
    {
        com.demo.entity.basic.CustomerVO target = null;
        if (entity != null)
        {
            target = new com.demo.entity.basic.CustomerVO();
            this.toCustomerVO(entity, target);
        }
        return target;
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#customerVOToEntity(com.demo.entity.basic.CustomerVO, com.demo.entity.basic.Customer)
     */
    public void customerVOToEntity(
        com.demo.entity.basic.CustomerVO source,
        com.demo.entity.basic.Customer target,
        boolean copyIfNull)
    {
        if (copyIfNull || source.getCustomerName() != null)
        {
            target.setCustomerName(source.getCustomerName());
        }
        if (copyIfNull || source.getCustEnum() != null)
        {
            target.setCustEnum(source.getCustEnum());
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
     * @see com.demo.entity.basic.CustomerDao#search(int, int, int, com.demo.Search)
     */
    public com.demo.PaginationResult search(final int transform, final int pageNumber, final int pageSize, final com.demo.Search search)
    {
        try
        {
            search.setPageNumber(pageNumber);
            search.setPageSize(pageSize);
            final com.demo.PropertySearch propertySearch = new com.demo.PropertySearch(
                this.getSession(false), com.demo.entity.basic.CustomerImpl.class, search);
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
     * @see com.demo.entity.basic.CustomerDao#search(int, int, com.demo.Search)
     */
    public com.demo.PaginationResult search(final int pageNumber, final int pageSize, final com.demo.Search search)
    {
        return this.search(TRANSFORM_NONE, pageNumber, pageSize, search);
    }

    /**
     * @see com.demo.entity.basic.CustomerDao#search(int, com.demo.Search)
     */
    public java.util.Set search(final int transform, final com.demo.Search search)
    {
        try
        {
            final com.demo.PropertySearch propertySearch = new com.demo.PropertySearch(
                this.getSession(false), com.demo.entity.basic.CustomerImpl.class, search);
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
     * @see com.demo.entity.basic.CustomerDao#search(com.demo.Search)
     */
    public java.util.Set search(final com.demo.Search search)
    {
        return this.search(TRANSFORM_NONE, search);
    }

    // spring-hibernate-dao-base merge-point
}