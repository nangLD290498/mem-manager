package com.tvtlhr.ttt.controller;

import com.tvtlhr.ttt.entity.Member;
import com.tvtlhr.ttt.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

@Controller
public class TableController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/members")
    public String show(){
        return "tables";
    }

    @GetMapping("/addNewMemForm")
    public String getAddNewMemberPage(Model model){
        model.addAttribute("member", new Member());
        return "addNewMem";
    }

    @RequestMapping(value = "/addNewMem", method = RequestMethod.POST)
    public String addNewMember(
            @Validated @ModelAttribute("member")Member member,
            BindingResult result){
        if(result.hasErrors()){
            return "addNewMem";
        }
        boolean isSaved = memberService.createNewMember(member);
        if(isSaved) return "tables";
        else return "addNewMem";
    }

}
