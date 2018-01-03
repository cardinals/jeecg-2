package com.jeecg.purchase.service;
import com.jeecg.purchase.entity.PurchaseEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface PurchaseServiceI extends CommonService{
	
 	public void delete(PurchaseEntity entity) throws Exception;
 	
 	public Serializable save(PurchaseEntity entity) throws Exception;
 	
 	public void saveOrUpdate(PurchaseEntity entity) throws Exception;
 	
}
