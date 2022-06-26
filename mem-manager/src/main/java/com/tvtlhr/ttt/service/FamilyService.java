package com.tvtlhr.ttt.service;

import com.tvtlhr.ttt.entity.DowloadObject;
import com.tvtlhr.ttt.entity.Family;
import com.tvtlhr.ttt.entity.Group;
import com.tvtlhr.ttt.entity.Member;

import java.util.List;

public interface FamilyService {


    List<Member> toMember(List<DowloadObject> dowloadObjects);

    List<Family> getByGroup(Integer id);

    int getMinAge();

    int getMaxAge();

    void editFamilyAndGroupName(List<String> groupNames, List<String> familyNames);
    List<Group> getAllGroups();

    void processFamily(Integer groupCount, List<Integer> startAge, List<Integer> endAge, List<Integer> familyCount);

    String processList(List<Integer> list);

    Family getById(Integer id);

    List<Family> getAll();
}
