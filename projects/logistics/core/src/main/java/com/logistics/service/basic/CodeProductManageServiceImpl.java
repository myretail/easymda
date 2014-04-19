// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.service.basic;

import java.util.Collection;
import java.util.Random;

import com.logistics.entity.basic.WlCustCodeDao;
import com.logistics.entity.basic.WlCustCodeVO;
import com.logistics.entity.basic.WlCustProductDao;
import com.logistics.entity.basic.WlCustProductVO;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
/**
 * @see com.logistics.service.basic.CodeProductManageService
 */
public class CodeProductManageServiceImpl
    extends com.logistics.service.basic.CodeProductManageServiceBase
{

    /**
     * @see com.logistics.service.basic.CodeProductManageService#getCodeByParCodeIDAndCustID(long, long)
     */
    protected  com.logistics.entity.basic.WlCustCodeVO[] handleGetCodeByParCodeIDAndCustID(long codeID, long custID, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	WlCustCodeDao codeDao=this.getWlCustCodeDao();
 	    Collection CustCodeDao = codeDao.getCodeByParCodeIDAndCustID(codeID,custID,pageNumber,pageSize,orderBy);
 	   codeDao.toWlCustCodeVOCollection(CustCodeDao);
        return  (WlCustCodeVO[])CustCodeDao.toArray(new WlCustCodeVO[0]);
    }

    /**
     * @see com.logistics.service.basic.CodeProductManageService#createCode(com.logistics.entity.basic.WlCustCodeVO)
     */
    protected  long handleCreateCode(com.logistics.entity.basic.WlCustCodeVO code)
        throws java.lang.Exception
    {
    	Random rd = new Random();
    	code.setId(System.currentTimeMillis()+rd.nextInt());
        //final com.logistics.entity.basic.WlCustCode entity=this.getWlCustCodeDao().wlCustCodeVOToEntity(code);
        return this.getWlCustCodeDao().create(this.getWlCustCodeDao().wlCustCodeVOToEntity(code)).getId();    
    }

    /**
     * @see com.logistics.service.basic.CodeProductManageService#updateCode(com.logistics.entity.basic.WlCustCodeVO)
     */
    protected  void handleUpdateCode(com.logistics.entity.basic.WlCustCodeVO code)
        throws java.lang.Exception
    {
    	final com.logistics.entity.basic.WlCustCode entity = this.getWlCustCodeDao().wlCustCodeVOToEntity(code);
    		//this.getWlCustCodeDao().load(code.getId());
    	this.getWlCustCodeDao().update(entity);
    }

    /**
     * @see com.logistics.service.basic.CodeProductManageService#deleteCode(long)
     */
    protected  void handleDeleteCode(long id)
        throws java.lang.Exception
    {
    	this.getWlCustCodeDao().remove(id);
    }

    /**
     * @see com.logistics.service.basic.CodeProductManageService#getProductsBy(java.lang.String, java.lang.String, java.lang.String, java.lang.String, long)
     */
    protected  com.logistics.entity.basic.WlCustProductVO[] handleGetProductsBy(java.lang.String code, java.lang.String name, java.lang.String type, java.lang.String model, long codeid, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	System.out.println("custProduct--code===="+code);
    	WlCustProductDao proDao=this.getWlCustProductDao();
 	    Collection CustProductDao = proDao.getProductsBy(code,name,type,model,codeid,pageNumber,pageSize,orderBy);
        proDao.toWlCustProductVOCollection(CustProductDao);
        return  (WlCustProductVO[])CustProductDao.toArray(new WlCustProductVO[0]);
    }

    /**
     * @see com.logistics.service.basic.CodeProductManageService#createProduct(com.logistics.entity.basic.WlCustProductVO)
     */
    protected  long handleCreateProduct(com.logistics.entity.basic.WlCustProductVO product)
        throws java.lang.Exception
    {
    	Random rd = new Random();
        product.setId(System.currentTimeMillis()+rd.nextInt());
        final com.logistics.entity.basic.WlCustProduct entity=this.getWlCustProductDao().wlCustProductVOToEntity(product);
        return this.getWlCustProductDao().create(entity).getId();
    }

    /**
     * @see com.logistics.service.basic.CodeProductManageService#updateProduct(com.logistics.entity.basic.WlCustProductVO)
     */
    protected  void handleUpdateProduct(com.logistics.entity.basic.WlCustProductVO product)
        throws java.lang.Exception
    {
    	final com.logistics.entity.basic.WlCustProduct entity = this.getWlCustProductDao().wlCustProductVOToEntity(product);
    		//this.getWlCustProductDao().load(product.getId());
    	this.getWlCustProductDao().update(entity);
        
    }

    /**
     * @see com.logistics.service.basic.CodeProductManageService#deleteProduct(long)
     */
    protected  void handleDeleteProduct(long id)
        throws java.lang.Exception
    {
    	this.getWlCustProductDao().remove(id);
    	
    }

    /**
     * @see com.logistics.service.basic.CodeProductManageService#getCodeVO(com.logistics.entity.basic.WlCustCodeVO)
     */
    protected  com.logistics.entity.basic.WlCustCodeVO[] handleGetCodeVO(com.logistics.entity.basic.WlCustCodeVO codevo, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	Collection CustCodeDao = this.getWlCustCodeDao().getCodeVO(codevo,pageNumber,pageSize,orderBy);
        this.getWlCustCodeDao().toWlCustCodeVOCollection(CustCodeDao);
        return  (WlCustCodeVO[])CustCodeDao.toArray(new WlCustCodeVO[0]);    
    }

	@Override
	protected WlCustProductVO[] handleGetWlCustProduct(WlCustProductVO WlCustProduct, int pageNumber, int pageSize,String orderBy) throws Exception {
		WlCustProductDao dao=this.getWlCustProductDao();
		Collection CustProductDao = dao.getWlCustProduct(WlCustProduct, pageNumber, pageSize, orderBy);
    	dao.toWlCustProductVOCollection(CustProductDao);
        return  (WlCustProductVO[])CustProductDao.toArray(new WlCustProductVO[0]);    
	}

}