package com.jeecg.activiti;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ModelQuery;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.jeecg.purchase.controller.PurchaseController;
import com.jeecg.purchase.entity.PurchaseEntity;

/**
 * activiti 模型管理中心[BPMN模型的设计,部署,导出等主要方法]
 * @author hhp
 *
 */
@Controller
@RequestMapping("/modelController")
public class ModelController {
	private static final Logger logger = Logger.getLogger(PurchaseController.class);
	@Autowired
	private RepositoryService repositoryService;
	@Autowired
	private SystemService systemService;
	
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("activiti/modelList");
	}
	
	@RequestMapping(params = "datagrid")
	public void datagrid(PurchaseEntity purchase,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(PurchaseEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, purchase, request.getParameterMap());
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		ModelQuery modelQuery = repositoryService.createModelQuery();
        List<Model> list = modelQuery.listPage(0, 10);
		//this.purchaseService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd() {
		return new ModelAndView("activiti/model-add");
	}
	
/*	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(PurchaseEntity purchase, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "采购主表添加成功";
		try{
			//purchaseService.save(purchase);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "采购主表添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}*/
	
	@RequestMapping(params = "doAdd")
    public void create(@RequestParam("name") String name, @RequestParam("key") String key, @RequestParam("description") String description,
            HttpServletRequest request, HttpServletResponse response) {
		logger.info("name: "+name+" key: "+key+" des: "+description);
		try {
            ObjectMapper objectMapper = new ObjectMapper();
            ObjectNode editorNode = objectMapper.createObjectNode();
            editorNode.put("id", "canvas");
            editorNode.put("resourceId", "canvas");
            ObjectNode stencilSetNode = objectMapper.createObjectNode();
            stencilSetNode.put("namespace", "http://b3mn.org/stencilset/bpmn2.0#");
            editorNode.put("stencilset", stencilSetNode);
            Model modelData = repositoryService.newModel();

            ObjectNode modelObjectNode = objectMapper.createObjectNode();
            modelObjectNode.put(ModelDataJsonConstants.MODEL_NAME, name);
            modelObjectNode.put(ModelDataJsonConstants.MODEL_REVISION, 1);
            description = StringUtils.defaultString(description);
            modelObjectNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION, description);
            modelData.setMetaInfo(modelObjectNode.toString());
            modelData.setName(name);
            modelData.setKey(StringUtils.defaultString(key));

            repositoryService.saveModel(modelData);
            repositoryService.addModelEditorSource(modelData.getId(), editorNode.toString().getBytes("utf-8"));
            logger.info(request.getContextPath()+"/modeler/service/editor?id=" + modelData.getId());
            response.sendRedirect(request.getContextPath() + "/modeler/service/editor?id=" + modelData.getId());
            return;
        } catch (Exception e) {
            logger.error("创建模型失败：", e);
        }
    }
}
