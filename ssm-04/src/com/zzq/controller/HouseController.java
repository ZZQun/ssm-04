package com.zzq.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzq.common.Constant;
import com.zzq.pojo.HouseList;
import com.zzq.pojo.UserList;
import com.zzq.service.impl.HouseListService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value="/house")
public class HouseController {

    @Resource(name="houseListService")
    private HouseListService houseListService;

    @RequestMapping("/houselist")
    public String houseList(@RequestParam(value="status",required=false)String status,
                            @RequestParam(defaultValue="1",required=true,value="pn") Integer pageNo,Model model){


        Integer pageSize= Constant.PAGESIZE;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<HouseList> houseList = houseListService.findByCondition(status);
        PageInfo<HouseList> pageInfo=new PageInfo<HouseList>(houseList);
        model.addAttribute("pageInfo",pageInfo);

        return "houseList";
    }
}
