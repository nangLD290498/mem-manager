package com.tvtlhr.ttt.controller;

import com.tvtlhr.ttt.entity.Family;
import com.tvtlhr.ttt.entity.Group;
import com.tvtlhr.ttt.service.FamilyService;
import com.tvtlhr.ttt.service.GroupService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

@Controller
public class FamilyController {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private FamilyService familyService;

    @Autowired
    private GroupService groupService;

    @GetMapping("/getParam")
    public ModelAndView getAddNewMemberPage(){
        int minAge = familyService.getMinAge();
        int maxAge = familyService.getMaxAge();
        ModelAndView mv = new ModelAndView("redirect:/iniFamily?minAge="+minAge+"&maxAge="+maxAge);
        return mv;
    }

    @GetMapping("/iniFamily")
    public ModelAndView initFamilyPage(@RequestParam int minAge, @RequestParam int maxAge)
    {
        ModelAndView mv = new ModelAndView("iniFamily");
        mv.addObject("min", minAge);
        mv.addObject("max", maxAge);
        return mv;
    }

    @GetMapping("/familyMgt")
    public ModelAndView manageFamilies()
    {
        ModelAndView mv = new ModelAndView("families");
        List<Group> groups = familyService.getAllGroups();
        mv.addObject("groups", groups);
        return mv;
    }

    @RequestMapping(value = "/processFamily", method = {RequestMethod.GET, RequestMethod.POST, RequestMethod.PATCH} )
    public ModelAndView processConfigureFamily(
            @RequestParam Integer groupCount,
            @RequestParam List<Integer> startAge,
            @RequestParam List<Integer> endAge,
            @RequestParam List<Integer> familyCount){
        ModelAndView mv = new ModelAndView("redirect:/familyMgt");
       /* String startAgeString = familyService.processList(startAge);
        String endAgeString = familyService.processList(endAge);
        String familyCountString = familyService.processList(familyCount);

        mv.addObject("startAge", startAgeString);
        mv.addObject("endAge", endAgeString);
        mv.addObject("familyCount", familyCountString);
        mv.addObject("groupCount", groupCount.toString());*/
        familyService.processFamily(groupCount, startAge, endAge, familyCount );

        return mv;
    }


}
