package com.hx.hxjob.controller.manager;

import com.hx.hxjob.model.Download;
import com.hx.hxjob.service.DownloadService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;


/**
 * @Program: com.hx.hxjob.controller.manager
 * @Description: 下载专区
 * @Created: 2020/02/12 19:32
 */
@RequestMapping("load")
@Controller
public class DownloadController {
    @Resource
    private DownloadService downloadService;

    @RequestMapping("download")
    private String download() {
        return "manager/download";
    }
    /**
    * @Description 新增下载
    * @Params [params]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    **/
    @RequestMapping("addDown")
    @ResponseBody
    private Map<String, Object> addDown(@RequestParam() Map<String, String> params) {
        return this.downloadService.addDown(params);
    }

    /**
    * @Description 下载列表
    * @Params [params]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    **/
    @RequestMapping("downList")
    @ResponseBody
    private Map<String, Object> downList(@RequestParam() Map<String, String> params) {
        return this.downloadService.downList(params);
    }

    /**
    * @Description 修改界面
    * @Params [id]
    * @Return Download
    **/
    @RequestMapping("editDown/{id}")
    @ResponseBody
    private Download editDown(@PathVariable String id) {
        return this.downloadService.editDown(id);
    }

    /**
    * @Description 提交修改
    * @Params [params]
    * @Return java.util.Map<java.lang.String,java.lang.Object>
    **/
    @RequestMapping("submitEditDown")
    @ResponseBody
    private Map<String, Object> submitEditDown(@RequestParam() Map<String, String> params) {
        return this.downloadService.submitEditDown(params);
    }
   /**
   * @Description 删除数据
   * @Params [id]
   * @Return java.util.Map<java.lang.String,java.lang.Object>
   **/
    @RequestMapping("deleteDown/{id}")
    @ResponseBody
    private Map<String, Object> deleteDown(@PathVariable String id) {
        return this.downloadService.deleteDown(id);
    }
}
