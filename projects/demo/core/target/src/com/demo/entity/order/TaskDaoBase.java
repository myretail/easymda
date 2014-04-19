// license-header java merge-point
//
// Attention: Generated code! Do not modify by hand!
// Generated by: SpringHibernateDaoBase.vsl in andromda-spring-cartridge.
//
package com.demo.entity.order;

/**
 * <p>
 * Base Spring DAO Class: is able to create, update, remove, load, and find
 * objects of type <code>com.demo.entity.order.Task</code>.
 * </p>
 *
 * @see com.demo.entity.order.Task
 */
public abstract class TaskDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements com.demo.entity.order.TaskDao
{

    private com.demo.entity.order.TaskFormDao taskFormDao;

    /**
     * Sets the reference to <code>taskFormDao</code>.
     */
    public void setTaskFormDao(com.demo.entity.order.TaskFormDao taskFormDao)
    {
        this.taskFormDao = taskFormDao;
    }

    /**
     * Gets the reference to <code>taskFormDao</code>.
     */
    protected com.demo.entity.order.TaskFormDao getTaskFormDao()
    {
        return this.taskFormDao;
    }

    /**
     * @see com.demo.entity.order.TaskDao#load(int, java.lang.Long)
     */
    public java.lang.Object load(final int transform, final java.lang.Long id)
    {
        if (id == null)
        {
            throw new IllegalArgumentException(
                "Task.load - 'id' can not be null");
        }
        final java.lang.Object entity = this.getHibernateTemplate().get(com.demo.entity.order.TaskImpl.class, id);
        return transformEntity(transform, (com.demo.entity.order.Task)entity);
    }

    /**
     * @see com.demo.entity.order.TaskDao#load(java.lang.Long)
     */
    public com.demo.entity.order.Task load(java.lang.Long id)
    {
        return (com.demo.entity.order.Task)this.load(TRANSFORM_NONE, id);
    }

    /**
     * @see com.demo.entity.order.TaskDao#loadAll()
     */
    public java.util.Collection loadAll()
    {
        return this.loadAll(TRANSFORM_NONE);
    }

    /**
     * @see com.demo.entity.order.TaskDao#loadAll(int)
     */
    public java.util.Collection loadAll(final int transform)
    {
        return this.loadAll(transform, -1, -1);
    }

    /**
     * @see com.demo.entity.order.TaskDao#loadAll(int, int)
     */
    public java.util.Collection loadAll(final int pageNumber, final int pageSize)
    {
        return this.loadAll(TRANSFORM_NONE, pageNumber, pageSize);
    }

    /**
     * @see com.demo.entity.order.TaskDao#loadAll(int, int, int)
     */
    public java.util.Collection loadAll(final int transform, final int pageNumber, final int pageSize)
    {
        try
        {
            final org.hibernate.Criteria criteria = this.getSession(false).createCriteria(com.demo.entity.order.TaskImpl.class);
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
     * @see com.demo.entity.order.TaskDao#create(com.demo.entity.order.Task)
     */
    public com.demo.entity.order.Task create(com.demo.entity.order.Task task)
    {
        return (com.demo.entity.order.Task)this.create(TRANSFORM_NONE, task);
    }

    /**
     * @see com.demo.entity.order.TaskDao#create(int transform, com.demo.entity.order.Task)
     */
    public java.lang.Object create(final int transform, final com.demo.entity.order.Task task)
    {
        if (task == null)
        {
            throw new IllegalArgumentException(
                "Task.create - 'task' can not be null");
        }
        this.getHibernateTemplate().save(task);
        return this.transformEntity(transform, task);
    }

    /**
     * @see com.demo.entity.order.TaskDao#create(java.util.Collection)
     */
    public java.util.Collection create(final java.util.Collection entities)
    {
        return create(TRANSFORM_NONE, entities);
    }

    /**
     * @see com.demo.entity.order.TaskDao#create(int, java.util.Collection)
     */
    public java.util.Collection create(final int transform, final java.util.Collection entities)
    {
        if (entities == null)
        {
            throw new IllegalArgumentException(
                "Task.create - 'entities' can not be null");
        }
        this.getHibernateTemplate().execute(
            new org.springframework.orm.hibernate3.HibernateCallback()
            {
                public java.lang.Object doInHibernate(org.hibernate.Session session)
                    throws org.hibernate.HibernateException
                {
                    for (java.util.Iterator entityIterator = entities.iterator(); entityIterator.hasNext();)
                    {
                        create(transform, (com.demo.entity.order.Task)entityIterator.next());
                    }
                    return null;
                }
            },
            true);
        return entities;
    }

    /**
     * @see com.demo.entity.order.TaskDao#create(double, double, java.lang.String)
     */
    public com.demo.entity.order.Task create(
        double num,
        double volumne,
        java.lang.String remark)
    {
        return (com.demo.entity.order.Task)this.create(TRANSFORM_NONE, num, volumne, remark);
    }

    /**
     * @see com.demo.entity.order.TaskDao#create(int, double, double, java.lang.String)
     */
    public java.lang.Object create(
        final int transform,
        double num,
        double volumne,
        java.lang.String remark)
    {
        com.demo.entity.order.Task entity = new com.demo.entity.order.TaskImpl();
        entity.setNum(num);
        entity.setVolumne(volumne);
        entity.setRemark(remark);
        return this.create(transform, entity);
    }

    /**
     * @see com.demo.entity.order.TaskDao#create(double, com.demo.entity.order.TaskForm, double)
     */
    public com.demo.entity.order.Task create(
        double num,
        com.demo.entity.order.TaskForm taskForm,
        double volumne)
    {
        return (com.demo.entity.order.Task)this.create(TRANSFORM_NONE, num, taskForm, volumne);
    }

    /**
     * @see com.demo.entity.order.TaskDao#create(int, double, com.demo.entity.order.TaskForm, double)
     */
    public java.lang.Object create(
        final int transform,
        double num,
        com.demo.entity.order.TaskForm taskForm,
        double volumne)
    {
        com.demo.entity.order.Task entity = new com.demo.entity.order.TaskImpl();
        entity.setNum(num);
        entity.setTaskForm(taskForm);
        entity.setVolumne(volumne);
        return this.create(transform, entity);
    }

    /**
     * @see com.demo.entity.order.TaskDao#update(com.demo.entity.order.Task)
     */
    public void update(com.demo.entity.order.Task task)
    {
        if (task == null)
        {
            throw new IllegalArgumentException(
                "Task.update - 'task' can not be null");
        }
        this.getHibernateTemplate().update(task);
    }

    /**
     * @see com.demo.entity.order.TaskDao#update(java.util.Collection)
     */
    public void update(final java.util.Collection entities)
    {
        if (entities == null)
        {
            throw new IllegalArgumentException(
                "Task.update - 'entities' can not be null");
        }
        this.getHibernateTemplate().execute(
            new org.springframework.orm.hibernate3.HibernateCallback()
            {
                public java.lang.Object doInHibernate(org.hibernate.Session session)
                    throws org.hibernate.HibernateException
                {
                    for (java.util.Iterator entityIterator = entities.iterator(); entityIterator.hasNext();)
                    {
                        update((com.demo.entity.order.Task)entityIterator.next());
                    }
                    return null;
                }
            },
            true);
    }

    /**
     * @see com.demo.entity.order.TaskDao#remove(com.demo.entity.order.Task)
     */
    public void remove(com.demo.entity.order.Task task)
    {
        if (task == null)
        {
            throw new IllegalArgumentException(
                "Task.remove - 'task' can not be null");
        }
        this.getHibernateTemplate().delete(task);
    }

    /**
     * @see com.demo.entity.order.TaskDao#remove(java.lang.Long)
     */
    public void remove(java.lang.Long id)
    {
        if (id == null)
        {
            throw new IllegalArgumentException(
                "Task.remove - 'id' can not be null");
        }
        com.demo.entity.order.Task entity = this.load(id);
        if (entity != null)
        {
            this.remove(entity);
        }
    }

    /**
     * @see com.demo.entity.order.TaskDao#remove(java.util.Collection)
     */
    public void remove(java.util.Collection entities)
    {
        if (entities == null)
        {
            throw new IllegalArgumentException(
                "Task.remove - 'entities' can not be null");
        }
        this.getHibernateTemplate().deleteAll(entities);
    }
    /**
     * @see com.demo.entity.order.TaskDao#getTask(com.demo.entity.order.TaskVO, int, int, java.lang.String)
     */
    public java.util.List getTask(final com.demo.entity.order.TaskVO Task, final int pageNumber, final int pageSize, final java.lang.String orderBy)
    {
        if (Task == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.TaskDao.getTask(com.demo.entity.order.TaskVO Task, int pageNumber, int pageSize, java.lang.String orderBy) - 'Task' can not be null");
        }
        if (orderBy == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.TaskDao.getTask(com.demo.entity.order.TaskVO Task, int pageNumber, int pageSize, java.lang.String orderBy) - 'orderBy' can not be null");
        }
        try
        {
            return this.handleGetTask(Task, pageNumber, pageSize, orderBy);
        }
        catch (Throwable th)
        {
            throw new java.lang.RuntimeException(
            "Error performing 'com.demo.entity.order.TaskDao.getTask(com.demo.entity.order.TaskVO Task, int pageNumber, int pageSize, java.lang.String orderBy)' --> " + th,
            th);
        }
    }

     /**
      * Performs the core logic for {@link #getTask(com.demo.entity.order.TaskVO, int, int, java.lang.String)}
      */
    protected abstract java.util.List handleGetTask(com.demo.entity.order.TaskVO Task, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception;

    /**
     * Allows transformation of entities into value objects
     * (or something else for that matter), when the <code>transform</code>
     * flag is set to one of the constants defined in <code>com.demo.entity.order.TaskDao</code>, please note
     * that the {@link #TRANSFORM_NONE} constant denotes no transformation, so the entity itself
     * will be returned.
     * <p>
     * This method will return instances of these types:
     * <ul>
     *   <li>{@link com.demo.entity.order.Task} - {@link #TRANSFORM_NONE}</li>
     *   <li>{@link com.demo.entity.order.TaskVO} - {@link TRANSFORM_TASKVO}</li>
     * </ul>
     *
     * If the integer argument value is unknown {@link #TRANSFORM_NONE} is assumed.
     *
     * @param transform one of the constants declared in {@link com.demo.entity.order.TaskDao}
     * @param entity an entity that was found
     * @return the transformed entity (i.e. new value object, etc)
     * @see #transformEntities(int,java.util.Collection)
     */
    protected java.lang.Object transformEntity(final int transform, final com.demo.entity.order.Task entity)
    {
        java.lang.Object target = null;
        if (entity != null)
        {
            switch (transform)
            {
                case TRANSFORM_TASKVO :
                    target = toTaskVO(entity);
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
     * {@link #transformEntity(int,com.demo.entity.order.Task)}
     * method. This method does not instantiate a new collection.
     * <p>
     * This method is to be used internally only.
     *
     * @param transform one of the constants declared in <code>com.demo.entity.order.TaskDao</code>
     * @param entities the collection of entities to transform
     * @see #transformEntity(int,com.demo.entity.order.Task)
     */
    protected void transformEntities(final int transform, final java.util.Collection entities)
    {
        switch (transform)
        {
            case TRANSFORM_TASKVO :
                toTaskVOCollection(entities);
                break;
            case TRANSFORM_NONE : // fall-through
                default:
                // do nothing;
        }
    }

    /**
     * @see com.demo.entity.order.TaskDao#toEntities(java.util.Collection)
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
     * (which result in an array of entities) to {@link com.demo.entity.order.Task}
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
                else if (input instanceof com.demo.entity.order.Task)
                {
                    result = input;
                }
                return result;
            }
        };

    protected com.demo.entity.order.Task toEntity(java.lang.Object[] row)
    {
        com.demo.entity.order.Task target = null;
        if (row != null)
        {
            final int numberOfObjects = row.length;
            for (int ctr = 0; ctr < numberOfObjects; ctr++)
            {
                final java.lang.Object object = row[ctr];
                if (object instanceof com.demo.entity.order.Task)
                {
                    target = (com.demo.entity.order.Task)object;
                    break;
                }
            }
        }
        return target;
    }

    /**
     * @see com.demo.entity.order.TaskDao#toTaskVOCollection(java.util.Collection)
     */
    public final void toTaskVOCollection(java.util.Collection entities)
    {
        if (entities != null)
        {
            org.apache.commons.collections.CollectionUtils.transform(entities, TASKVO_TRANSFORMER);
        }
    }

    /**
     * @see com.demo.entity.order.TaskDao#toTaskVOArray(java.util.Collection)
     */
    public final com.demo.entity.order.TaskVO[] toTaskVOArray(java.util.Collection entities)
    {
        com.demo.entity.order.TaskVO[] result = null;
        if (entities != null)
        {
            final java.util.Collection collection = new java.util.ArrayList(entities);
            this.toTaskVOCollection(collection);
            result = (com.demo.entity.order.TaskVO[]) collection.toArray(new com.demo.entity.order.TaskVO[0]);
        }
        return result;
    }

    /**
     * Default implementation for transforming the results of a report query into a value object. This
     * implementation exists for convenience reasons only. It needs only be overridden in the
     * {@link TaskDaoImpl} class if you intend to use reporting queries.
     * @see com.demo.entity.order.TaskDao#toTaskVO(com.demo.entity.order.Task)
     */
    protected com.demo.entity.order.TaskVO toTaskVO(java.lang.Object[] row)
    {
        return this.toTaskVO(this.toEntity(row));
    }

    /**
     * This anonymous transformer is designed to transform entities or report query results
     * (which result in an array of objects) to {@link com.demo.entity.order.TaskVO}
     * using the Jakarta Commons-Collections Transformation API.
     */
    private org.apache.commons.collections.Transformer TASKVO_TRANSFORMER =
        new org.apache.commons.collections.Transformer()
        {
            public java.lang.Object transform(java.lang.Object input)
            {
                java.lang.Object result = null;
                if (input instanceof com.demo.entity.order.Task)
                {
                    result = toTaskVO((com.demo.entity.order.Task)input);
                }
                else if (input instanceof java.lang.Object[])
                {
                    result = toTaskVO((java.lang.Object[])input);
                }
                return result;
            }
        };

    /**
     * @see com.demo.entity.order.TaskDao#taskVOToEntityCollection(java.util.Collection)
     */
    public final void taskVOToEntityCollection(java.util.Collection instances)
    {
        if (instances != null)
        {
            for (final java.util.Iterator iterator = instances.iterator(); iterator.hasNext();)
            {
                // - remove an objects that are null or not of the correct instance
                if (!(iterator.next() instanceof com.demo.entity.order.TaskVO))
                {
                    iterator.remove();
                }
            }
            org.apache.commons.collections.CollectionUtils.transform(instances, TaskVOToEntityTransformer);
        }
    }

    private final org.apache.commons.collections.Transformer TaskVOToEntityTransformer =
        new org.apache.commons.collections.Transformer()
        {
            public java.lang.Object transform(java.lang.Object input)
            {
                return taskVOToEntity((com.demo.entity.order.TaskVO)input);
            }
        };


    /**
     * @see com.demo.entity.order.TaskDao#toTaskVO(com.demo.entity.order.Task, com.demo.entity.order.TaskVO)
     */
    public void toTaskVO(
        com.demo.entity.order.Task source,
        com.demo.entity.order.TaskVO target)
    {
        // No conversion for target.num (can't convert source.getNum():double to com.demo.entity.basic.NumberQuery)
        // No conversion for target.volumne (can't convert source.getVolumne():double to com.demo.entity.basic.NumberQuery)
        target.setRemark(source.getRemark());
        target.setId((source.getId() == null ? 0 : source.getId().longValue()));
        // No conversion for target.taskForm (can't convert source.getTaskForm():com.demo.entity.order.TaskForm to com.demo.entity.order.TaskFormVO)
    }

    /**
     * @see com.demo.entity.order.TaskDao#toTaskVO(com.demo.entity.order.Task)
     */
    public com.demo.entity.order.TaskVO toTaskVO(final com.demo.entity.order.Task entity)
    {
        com.demo.entity.order.TaskVO target = null;
        if (entity != null)
        {
            target = new com.demo.entity.order.TaskVO();
            this.toTaskVO(entity, target);
        }
        return target;
    }

    /**
     * @see com.demo.entity.order.TaskDao#taskVOToEntity(com.demo.entity.order.TaskVO, com.demo.entity.order.Task)
     */
    public void taskVOToEntity(
        com.demo.entity.order.TaskVO source,
        com.demo.entity.order.Task target,
        boolean copyIfNull)
    {
        // No conversion for target.num (can't convert source.getNum():com.demo.entity.basic.NumberQuery to double)
        // No conversion for target.volumne (can't convert source.getVolumne():com.demo.entity.basic.NumberQuery to double)
        if (copyIfNull || source.getRemark() != null)
        {
            target.setRemark(source.getRemark());
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
     * @see com.demo.entity.order.TaskDao#search(int, int, int, com.demo.Search)
     */
    public com.demo.PaginationResult search(final int transform, final int pageNumber, final int pageSize, final com.demo.Search search)
    {
        try
        {
            search.setPageNumber(pageNumber);
            search.setPageSize(pageSize);
            final com.demo.PropertySearch propertySearch = new com.demo.PropertySearch(
                this.getSession(false), com.demo.entity.order.TaskImpl.class, search);
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
     * @see com.demo.entity.order.TaskDao#search(int, int, com.demo.Search)
     */
    public com.demo.PaginationResult search(final int pageNumber, final int pageSize, final com.demo.Search search)
    {
        return this.search(TRANSFORM_NONE, pageNumber, pageSize, search);
    }

    /**
     * @see com.demo.entity.order.TaskDao#search(int, com.demo.Search)
     */
    public java.util.Set search(final int transform, final com.demo.Search search)
    {
        try
        {
            final com.demo.PropertySearch propertySearch = new com.demo.PropertySearch(
                this.getSession(false), com.demo.entity.order.TaskImpl.class, search);
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
     * @see com.demo.entity.order.TaskDao#search(com.demo.Search)
     */
    public java.util.Set search(final com.demo.Search search)
    {
        return this.search(TRANSFORM_NONE, search);
    }

    // spring-hibernate-dao-base merge-point
}