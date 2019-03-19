package com.zzq.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzq.common.Constant;
import com.zzq.pojo.HouseList;
import com.zzq.pojo.Solve;
import com.zzq.service.impl.SolveService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value = "/solve")
public class SolveController {

    @Resource(name = "solveService")
    private SolveService solveService;

    @RequestMapping(value = "/solvelist")
    public String solveList (@RequestParam(value="status",required=false)String status,
                             @RequestParam(value="name",required=false)String name,
                             @RequestParam(value="address",required=false)String address,
                             @RequestParam(value="userlist_id",required=false)Integer userlist_id,
                             @RequestParam(defaultValue="1",required=true,value="pn") Integer pageNo,Model model){
        Integer pageSize= Constant.PAGESIZE;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<Solve> solveList = solveService.findByCondition(status,name,address,userlist_id);
        PageInfo<Solve> pageInfo=new PageInfo<>(solveList);
        model.addAttribute("pageInfo",pageInfo);

        return "solveList";
    }
}
