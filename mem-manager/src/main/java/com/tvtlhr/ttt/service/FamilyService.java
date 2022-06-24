package com.tvtlhr.ttt.service;

import com.tvtlhr.ttt.entity.Group;

import java.util.List;

public interface FamilyService {
    int getMinAge();

    int getMaxAge();

    void editFamilyAndGroupName(List<String> groupNames, List<String> familyNames);
    List<Group> getAllGroups();

    void processFamily(Integer groupCount, List<Integer> startAge, List<Integer> endAge, List<Integer> familyCount);

    String processList(List<Integer> list);
}
