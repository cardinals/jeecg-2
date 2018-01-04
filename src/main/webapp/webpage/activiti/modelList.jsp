<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:0px;border:0px">
  	<t:datagrid name="modelList" checkbox="false" pagination="true" fitColumns="true" title="流程模型" actionUrl="modelController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="true"  queryMode="single"  width="10"></t:dgCol>
   <t:dgCol title="模型KEY"  field="KEY"  queryMode="single"  width="80"></t:dgCol>
   <t:dgCol title="模型NAME"  field="NAME"  queryMode="single"  width="80"></t:dgCol>
   <t:dgCol title="VERSION"  field="VERSION"  queryMode="single"  width="60"></t:dgCol>
   <t:dgCol title="元数据"  field="metaInfo"  queryMode="single"  width="120"></t:dgCol>
   
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgToolBar title="创建" icon="icon-add" url="modelController.do?goAdd" funname="add"></t:dgToolBar>
     <t:dgToolBar title="部署" icon="icon-add" url="" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="modelController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="导出" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
   <t:dgDelOpt title="删除" url="modelController.do?doDel&id={id}" urlclass="ace_button"  urlfont="fa-trash-o"/>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
 $(document).ready(function(){
 });
 

//导出
function ExportXls() {
	JeecgExcelExport("modelController.do?exportXls","purchaseList");
}

 </script>