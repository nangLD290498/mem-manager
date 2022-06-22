package com.tvtlhr.ttt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FamilyController {

    @GetMapping("/familyMgtPage")
    public String getAddNewMemberPage(){
        return "families";
    }

    @GetMapping("/iniFamily")
    public String initFamilyPage(){
        return "iniFamily";
    }

    @RequestMapping(name = "/processFamily", method = {RequestMethod.POST})
    public ModelAndView processConfigureFamily(
            @RequestParam String groupCount,
            @RequestParam String[] startAge,
            @RequestParam String[] endAge,
            @RequestParam String[] familyCount){
        ModelAndView mv = new ModelAndView();


        return mv;
    }
}
