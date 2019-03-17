package com.zzq.controller;


import com.zzq.common.Constant;
import com.zzq.pojo.HouseList;
import com.zzq.pojo.Paid;
import com.zzq.service.impl.HouseListService;
import com.zzq.service.impl.PaidService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value="/paid")
public class PaidController {

    @Resource(name="paidService")
    private PaidService paidService;

    @RequestMapping("/paidlist")
    public String paidList(@RequestParam(value="status",required=false)String status,
                            @RequestParam(value="name",required=false)String name,
                            @RequestParam(value="address",required=false)String address,
                            @RequestParam(value="userlist_id",required=false)Integer userlist_id,
                            @RequestParam(value="pageNo",required=false)Integer pageNo,Model model){
        if(pageNo == null){
            pageNo = 1;
        }
        //获取用户信息集合
        List<Paid> paidList = paidService.findByCondition(status, name, address, userlist_id, pageNo, Constant.PAGESIZE);
        //获取用户信息的总数
        Integer total = paidService.findCountByCondition(status,name,address,userlist_id);
        Integer totalPage = total%Constant.PAGESIZE==0?total/Constant.PAGESIZE:total/Constant.PAGESIZE+1;
        model.addAttribute("paidList",paidList);
        model.addAttribute("total",total);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("status",status);
        model.addAttribute("pageNo",pageNo);
        return "paidList";
    }
}
