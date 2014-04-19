// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.demo.service.basic;
			import com.demo.entity.basic.Prod;
		import com.demo.entity.basic.ProdDao;
		import com.demo.entity.basic.ProdVO;
				
import java.util.Collection;
import java.util.Random;
import java.util.List;

/**
 * @see com.demo.service.basic.ProdManageService
 */
public class ProdManageServiceImpl
    extends com.demo.service.basic.ProdManageServiceBase
{

    /**
     * @see com.demo.service.basic.ProdManageService#createProd(com.demo.entity.basic.ProdVO)
     */
    protected long handleCreateProd(com.demo.entity.basic.ProdVO Prod)
		throws java.lang.Exception
    {
        // @todo implement public long createProd(com.demo.entity.basic.ProdVO Prod) createProd
			return this.getProdDao().create(this.getProdDao().prodVOToEntity(Prod)).getId();
	    }
	
    /**
     * @see com.demo.service.basic.ProdManageService#updateProd(com.demo.entity.basic.ProdVO)
     */
    protected void handleUpdateProd(com.demo.entity.basic.ProdVO Prod)
		throws java.lang.Exception
    {
        // @todo implement public void updateProd(com.demo.entity.basic.ProdVO Prod) updateProd
			Prod entity =this.getProdDao().load(Prod.getId());
    	this.getProdDao().prodVOToEntity(Prod, entity, false);
    	this.getProdDao().update(entity);
		
	    }
	
    /**
     * @see com.demo.service.basic.ProdManageService#deleteProd(long)
     */
    protected void handleDeleteProd(long id)
		throws java.lang.Exception
    {
        // @todo implement public void deleteProd(long id) deleteProd
			this.getProdDao().remove(id);
	    }
	
    /**
     * @see com.demo.service.basic.ProdManageService#getProd(com.demo.entity.basic.ProdVO, int, int, java.lang.String)
     */
    protected com.demo.entity.basic.ProdVO[] handleGetProd(com.demo.entity.basic.ProdVO Prod, int pageNumber, int pageSize, java.lang.String orderBy)
		throws java.lang.Exception
    {
        // @todo implement public com.demo.entity.basic.ProdVO[] getProd(com.demo.entity.basic.ProdVO Prod, int pageNumber, int pageSize, java.lang.String orderBy) getProd
			ProdDao infoDao=this.getProdDao();
	 	Collection infos = infoDao.getProd(Prod, pageNumber, pageSize, orderBy);
	 	return infoDao.toProdVOArray(infos);
	    }
	
}
