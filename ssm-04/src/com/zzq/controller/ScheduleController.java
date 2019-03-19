package com.zzq.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzq.common.Constant;
import com.zzq.pojo.Schedule;
import com.zzq.service.impl.ScheduleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value = "/schedule")
public class ScheduleController {

    @Resource(name = "scheduleService")
    private ScheduleService scheduleService;

    @RequestMapping("/schedulelist")
    public String scheduleList(@RequestParam(defaultValue="1",required=true,value="pn") Integer pageNo,Model model){
        Integer pageSize= Constant.PAGESIZE;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<Schedule> scheduleList = scheduleService.findByCondition();
        PageInfo<Schedule> pageInfo=new PageInfo<>(scheduleList);
        model.addAttribute("pageInfo",pageInfo);

        return "scheduleList";
    }
}
