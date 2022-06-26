package com.tvtlhr.ttt.controller;

import com.tvtlhr.ttt.entity.DowloadObject;
import com.tvtlhr.ttt.entity.Family;
import com.tvtlhr.ttt.entity.Group;
import com.tvtlhr.ttt.entity.Member;
import com.tvtlhr.ttt.service.FamilyService;
import com.tvtlhr.ttt.service.GroupService;
import com.tvtlhr.ttt.service.MemberService;
import com.tvtlhr.ttt.utils.ExcelWriter;
import com.tvtlhr.ttt.utils.IExcelDataService;
import com.tvtlhr.ttt.utils.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FamilyController {
    //Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private FamilyService familyService;

    @Autowired
    private GroupService groupService;

    @Autowired
    private MemberService memberService;


    @Autowired
    private ExcelWriter writer;

    @Autowired
    private Utils utils;

    @Autowired
    IExcelDataService iExcelDataService;

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

    @GetMapping("/editFamilyName")
    public ModelAndView editFamilyNamePage(@RequestParam(required = false) String duplicate)
    {
        ModelAndView mv = new ModelAndView("familyNameInput");
        List<Group> groups = familyService.getAllGroups();
        mv.addObject("groups", groups);
        if(duplicate != null && duplicate.equals("true")){
            mv.addObject("message", "Tên các nhóm và gia đình không được trùng nhau");
        }
        return mv;
    }

    @GetMapping("/processEditFamilyName")
    public ModelAndView editFamilyName(
            @RequestParam List<String> groupName,
            @RequestParam List<String> familyName
    )
    {
        if(groupName.stream().distinct().count() != groupName.size() ||
                familyName.stream().distinct().count() != familyName.size()){
            ModelAndView mv = new ModelAndView("redirect:/editFamilyName?duplicate=true");
            return mv;
        }
        ModelAndView mv = new ModelAndView("redirect:/familyMgt");
        mv.addObject("message", "Đã chỉnh sửa tên nhóm, tên gia đình");
        familyService.editFamilyAndGroupName(groupName, familyName);
        return mv;
    }

    @GetMapping("/familyMgt")
    public ModelAndView manageFamilies(
            @RequestParam(required = false) String message
    )
    {
        ModelAndView mv = new ModelAndView("families");
        List<Group> groups = familyService.getAllGroups();
        for (Group group: groups) {
            for (Family family: group.getFamilies()) {
                Collections.sort(family.getMembers(), (m1, m2) -> m2.getAge() - m1.getAge());
            }
        }
        mv.addObject("groups", groups);
        if(message != null) mv.addObject("message", message);
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

    @GetMapping("/exportFamilyToExcel")
    public ModelAndView exportFamilyToExcel(@RequestParam List<Integer> familyId, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/familyMgt");
        if(familyId != null && familyId.size() > 0){
            Map<String, List<DowloadObject>> data = new HashMap<>();
            for (Integer id: familyId) {
                Family  family = familyService.getById(id);
                List<Member> members= family.getMembers();
                List<DowloadObject> dowloadObjects = DowloadObject.fromMember(members);
                data.put(family.getName().concat(" - ").concat(family.getGroup().getGroupName()), dowloadObjects);
            }
            try {
                writer.writeToExcelInMultiSheetsV2("gia_dinh.xlsx", data, response, DowloadObject.class);
            }catch (Exception e){}
        } else {
            mv.setViewName("redirect:/familyMgt");
        }
        return mv;
    }

    @PostMapping("/saveExcelTODb")
    public ModelAndView saveExcelTODb(
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        ModelAndView mv = new ModelAndView("redirect:/members");
        File excelFile = utils.convertMultiPartToFile(file);
        List<DowloadObject> dowloadObjectList = iExcelDataService.getExcelDataAsList(excelFile);
        //logger.info(dowloadObjectList.toString());
        boolean saved = false;
        try {
            List<Member> members = familyService.toMember(dowloadObjectList);
            //logger.info(members.toString());
            saved = memberService.saveAll(members);
        }catch (Exception e){}
        if(saved) {
            mv.addObject("message", "Đã Tải excel thành công");
        }else{
            mv.addObject("message", "Kiểm tra lại file excel !!");
        }
        return mv;
    }
}
