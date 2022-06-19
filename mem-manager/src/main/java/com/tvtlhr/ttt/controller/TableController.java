package com.tvtlhr.ttt.controller;

import com.tvtlhr.ttt.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TableController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/members")
    public String show(){
        return "tables";
    }

    @GetMapping("/addNewMem")
    public String addNewMember(){
        return "addNewMem";
    }

}
