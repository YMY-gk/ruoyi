package com.ruoyi.activiti.contrellor;
import com.ruoyi.activiti.Exception.ActException;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.file.FileUtils;

import org.activiti.bpmn.model.BpmnModel;
import org.activiti.bpmn.model.FlowNode;
import org.activiti.bpmn.model.SequenceFlow;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.image.ProcessDiagramGenerator;
import org.activiti.image.impl.DefaultProcessDiagramGenerator;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.*;

@Controller
@RequestMapping("/activiti")
public class ActivitiController extends BaseController {
    @Autowired
    RepositoryService repositoryService;
    @Autowired
    RuntimeService runtimeService;
    @Autowired
    TaskService taskService;
     @Autowired
     HistoryService historyService;
     @Autowired
     ProcessEngine processEngine;

    private String prefix = "system/activi";

    @RequiresPermissions("monitor:activiti:process")
    @GetMapping("/process")
    public String processlist()
    {
        return prefix + "/processlist";
    }

    @RequiresPermissions("monitor:activiti:processlist")
    @PostMapping("/process/list")
    @ResponseBody
    public TableDataInfo fundProcessDefinition() {
        TableDataInfo table= new TableDataInfo();
        //流程定义查询对象，用于查询act_re_procdef表
        ProcessDefinitionQuery query = repositoryService.createProcessDefinitionQuery();
        //添加查询条件
        //  query.processDefinitionKey("holiday");
        query.orderByDeploymentId().desc();
        //分页查询
     //   query.listPage(0, 10);
        List<ProcessDefinition> list = query.list();
        List<HashMap<String,Object>> ret = new ArrayList<HashMap<String,Object>>();
        for (ProcessDefinition processDefinition : list) {
            HashMap<String,Object> map = new HashMap<>();
            System.out.println("流程定义ID:"+processDefinition.getId());
            System.out.println("流程定义的名称:"+processDefinition.getName());
            System.out.println("流程定义的key:"+processDefinition.getKey());
            System.out.println("流程定义的版本:"+processDefinition.getVersion());
            System.out.println("资源名称bpmn文件:"+processDefinition.getResourceName());
            System.out.println("资源名称png文件:"+processDefinition.getDiagramResourceName());
            System.out.println("部署对象ID:"+processDefinition.getDeploymentId());
            map.put("id",processDefinition.getId());
            map.put("name",processDefinition.getName());
            map.put("key",processDefinition.getKey());
            map.put("EngineVersion",processDefinition.getEngineVersion());
            map.put("ResourceName",processDefinition.getResourceName());
            map.put("DiagramResourceName",processDefinition.getDiagramResourceName());
            map.put("DiagramResourceName()",processDefinition.getDiagramResourceName());
            map.put("DeploymentId",processDefinition.getDeploymentId());
            map.put("Category",processDefinition.getCategory());
            map.put("Description",processDefinition.getDescription());
            map.put("Version",processDefinition.getVersion());
            map.put("GraphicalNotation",processDefinition.hasGraphicalNotation());
            map.put("StartFormKey",processDefinition.hasStartFormKey());
            map.put("Suspended",processDefinition.isSuspended());
            map.put("TenantId",processDefinition.getTenantId());
            ret.add(map);
        }
        table.setRows(ret);
        table.setTotal(ret.size());

        table.setCode(0);
        return table;
    }

    @RequiresPermissions("monitor:activiti:processlist")
    @PostMapping("/process/delete")
    @ResponseBody
    public AjaxResult deleteProcessDefinition(String ids) {
        TableDataInfo table= new TableDataInfo();

        // 使用部署ID，完成删除
        String deploymentId=ids; //601
        /**
         * 不带级联的操作删除、
         * 只能删除没有启动的流程，如果流程启动，就会抛出异常
         */
        // processEngine.getRepositoryService().deleteDeployment(deploymentId);
        /**
         * 级联操作
         *  不管是流程是否启动、都可以删除
         */
        repositoryService.deleteDeployment(ids, true);
        return toAjax(1);
    }

    @RequiresPermissions("monitor:activiti:task")
    @GetMapping("/task")
    public String tasklist()
    {
        return prefix + "/tasklist";
    }
    @RequiresPermissions("monitor:activiti:tasklist")
    @PostMapping("/task/list")
    @ResponseBody
    public TableDataInfo fundProcessTask() {
        TableDataInfo table= new TableDataInfo();
        List<Task> list = taskService.createTaskQuery()//创建任务查询
                .list();
        /**
         *     手工查询
         *      List<Task> tasks = taskService.createNativeTaskQuery()
         *         .sql("SELECT count(*) FROM " + managementService.getTableName(Task.class) + " T WHERE T.NAME_ = #{taskName}")
         *         .parameter("taskName", "gonzoTask")
         *         .list();
         *
         *       long count = taskService.createNativeTaskQuery()
         *         .sql("SELECT count(*) FROM " + managementService.getTableName(Task.class) + " T1, "
         *                + managementService.getTableName(VariableInstanceEntity.class) + " V1 WHERE V1.TASK_ID_ = T1.ID_")
         *         .count();
         */
        if (list != null && list.size() > 0) {
            List<HashMap<String,Object>> ret = new ArrayList<HashMap<String,Object>>();
            for (Task task : list) {
                HashMap<String,Object> map = new HashMap<>();
                System.out.println("任务ID:" + task.getId());
                System.out.println("任务名称:" + task.getName());
                System.out.println("任务的创建时间:" + task.getCreateTime());
                System.out.println("任务的办理人:" + task.getAssignee());
                System.out.println("流程实例ID:" + task.getProcessInstanceId());
                System.out.println("执行对象ID:" + task.getExecutionId());
                System.out.println("流程定义ID:" + task.getProcessDefinitionId());
                map.put("id",task.getId());
                map.put("name",task.getName());
                map.put("CreateTime",task.getCreateTime());
                map.put("Assignee",task.getAssignee());
                map.put("ProcessInstanceId",task.getProcessInstanceId());
                map.put("ExecutionId",task.getExecutionId());
                map.put("ProcessDefinitionId()",task.getProcessDefinitionId());
                map.put("ClaimTim",task.getClaimTime());
                map.put("Category",task.getCategory());
                map.put("Description",task.getDescription());
                map.put("Owner",task.getOwner());
                map.put("ParentTaskId",task.getParentTaskId());
                map.put("ProcessInstanceId",task.getProcessInstanceId());
                map.put("Suspended",task.isSuspended());
                map.put("TenantId",task.getTenantId());
                ret.add(map);
            }
            table.setRows(ret);
            table.setTotal(ret.size());

            table.setCode(0);
        }
        return table;
    }
    @RequiresPermissions("monitor:activiti:complete")
    @PostMapping("/task/complete")
    @ResponseBody
    public AjaxResult completeProcessDefinition(String ids) {
        taskService.complete(ids);
        return toAjax(1);
    }
    @RequiresPermissions("monitor:activiti:install")
    @GetMapping("/install")
    @ResponseBody
    public  void install() {
        //进行部署,将对应的流程定义文件生成到数据库当中，作为记录进行保存
        Deployment deployment = repositoryService.createDeployment()
                .addClasspathResource("proces/holiday.bpmn")     //加载流程文件
                .addClasspathResource("proces/holiday.png")
                .name("请假流程").key("holiday")       //设置流程名
                .deploy();              //部署
    }
    @RequiresPermissions("monitor:activiti:start")
    @GetMapping("/start")
    @ResponseBody
    public AjaxResult start(String id) {
        //流程定义的key
        //使用流程定义的key启动流程实例,key对应helloworld.bpmn文件中id的属性值，使用key值启动，默认是按照最新版本的流程定义启动
        ProcessInstance pi = runtimeService.startProcessInstanceByKey(id);
        return toAjax(1);

    }
    @RequiresPermissions("monitor:activiti:suspend")
    @GetMapping("/suspend")
    @ResponseBody
    public AjaxResult suspend(String id) {
        //流程定义的key
        //使用流程定义的key启动流程实例,key对应helloworld.bpmn文件中id的属性值，使用key值启动，默认是按照最新版本的流程定义启动
        runtimeService.suspendProcessInstanceById(id);
        return toAjax(1);

    }
    @GetMapping("/task/edit")
    public String add()
    {
        return prefix + "/add";
    }

    /** 显示流程图
     * @param request
     */
    @ResponseBody
    @RequestMapping("/displayFlowCurrPic")
    public void displayFlowCurrPic(HttpServletRequest request, HttpServletResponse response){
        BufferedImage img = new BufferedImage(300, 150, BufferedImage.TYPE_INT_RGB);
        String deploymentId="12501";
        try {
            ProcessDefinition  processDefinition=repositoryService.createProcessDefinitionQuery().deploymentId(deploymentId)//使用部署对象ID查询
                    .singleResult();
            List<Task> activeTasks=taskService.createTaskQuery().processDefinitionId(processDefinition.getId()).list();
            // 已执行的节点ID集合
            List<String> executedActivityIdList = new ArrayList<String>();
            List<String> highLines = new ArrayList<String>();
            List<String> highNodes = new ArrayList<String>();
            //log.info("获取已经执行的节点ID");

            BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinition.getId());
            for(Task tk:activeTasks){
                executedActivityIdList.add(tk.getTaskDefinitionKey());
                highLines.addAll(getHighLines(bpmnModel,tk.getTaskDefinitionKey()));
                highNodes.addAll(getHighNodes(bpmnModel,tk.getTaskDefinitionKey()));
            }
            // 获取流程图图像字符流
            InputStream imageStream = new DefaultProcessDiagramGenerator().generateDiagram(bpmnModel, "png",
                    highNodes, highLines, "宋体", "宋体", "宋体", null, 1.0);
            // 输出资源内容到相应对象
            byte[] b = new byte[1024];
            int len;
            while ((len = imageStream.read(b, 0, 1024)) != -1) {
                response.getOutputStream().write(b, 0, len);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取高亮的线
     * @param bpmnModel
     * @param key
     * @return
     */
    private Set<String> getHighLines(BpmnModel bpmnModel, String key){
        FlowNode fl=(FlowNode) bpmnModel.getFlowElement(key);
        List<SequenceFlow> pvmTransitions = fl.getIncomingFlows();
        Set<String> highLines=new HashSet<>();
        for(SequenceFlow sf:pvmTransitions){
            highLines.add(sf.getId());
            if(StringUtils.isNotBlank(sf.getSourceRef())){
                highLines.addAll(getHighLines(bpmnModel,sf.getSourceRef()));
            }
        }
        return highLines;
    }
    /**
     * 获取高亮的线
     * @param bpmnModel
     * @param key
     * @return
     */
    private Set<String> getHighNodes(BpmnModel bpmnModel,String key){
        FlowNode fl=(FlowNode) bpmnModel.getFlowElement(key);
        List<SequenceFlow> sequenceFlows = fl.getIncomingFlows();
        Set<String> highNodes=new HashSet<>();
        highNodes.add(key);
        for(SequenceFlow sf:sequenceFlows){
            if(StringUtils.isNotBlank(sf.getSourceRef())){
                highNodes.addAll(getHighNodes(bpmnModel,sf.getSourceRef()));
            }
        }
        return highNodes;
    }

}
