package com.tvtlhr.ttt.service.impl;

import com.tvtlhr.ttt.entity.Family;
import com.tvtlhr.ttt.entity.Group;
import com.tvtlhr.ttt.entity.Member;
import com.tvtlhr.ttt.repository.FamilyRepository;
import com.tvtlhr.ttt.repository.GroupRepository;
import com.tvtlhr.ttt.repository.MemberRepository;
import com.tvtlhr.ttt.service.FamilyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class FamilyServiceImpl implements FamilyService {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    FamilyRepository familyRepository;

    @Autowired
    MemberRepository memberRepository;

    @Autowired
    GroupRepository groupRepository;

    @Override
    public int getMinAge() {
        Member member= memberRepository.findTop1ByOrderByAgeAsc();
        return member.getAge();
    }

    @Override
    public int getMaxAge() {
        Member member= memberRepository.findTop1ByOrderByAgeDesc();
        return member.getAge();
    }

    @Override
    public void editFamilyAndGroupName(List<String> groupNames, List<String> familyNames) {
        List<Group> groups = groupRepository.findAll();

        int count = 0;
        for(int i =0; i<groups.size();i++){
            groups.get(i).setGroupName(groupNames.get(i));
            List<Family> families = groups.get(i).getFamilies();
            int index = count;
            for(int j=0; j< families.size();j++ ){
                index = count + j;
                families.get(j).setName(familyNames.get(index));
            }
            count += families.size();
            groupRepository.save(groups.get(i));
        }
    }

    @Override
    public List<Group> getAllGroups() {
        return groupRepository.findAll();
    }

    @Override
    public void processFamily(Integer groupCount, List<Integer> startAge, List<Integer> endAge, List<Integer> familyCount) {
        groupRepository.deleteAll();
        for(int i=1; i<= groupCount; i++){
            // create groups
            Group group = new Group();
            group.setGroupName("Nhóm " + i);
            group.setStartAge(startAge.get(i-1));
            group.setEndAge(endAge.get(i-1));
            // create family
            logger.info("age range " + startAge.get(i-1) + "||" +endAge.get(i-1));
            List<Member> membersInGroup = membersInGroup(startAge.get(i-1), endAge.get(i-1));
            logger.info(membersInGroup.size() + " || "+membersInGroup.toString());
            List<Family> families = new ArrayList<>();
            int numberOfFamilies = familyCount.get(i-1);
            for(int j= 1; j<= numberOfFamilies; j++){
                Family family = new Family();
                family.setName("Gia đình " + j);
                logger.info("Gia đình " + j);
                List<Member> membersInFamily = new ArrayList<>();
                for(int k =1; k <= membersInGroup.size(); k++ ){
                    if(k % numberOfFamilies == j || k % numberOfFamilies==0){
                        membersInFamily.add(membersInGroup.get(k-1));
                    }
                }
                family.setMembers(membersInFamily);
                families.add(family);
            }
            group.setFamilies(families);
            groupRepository.save(group);
        }
    }

    @Override
    public String processList(List<Integer> list) {
        String toString = "";
        for (Integer item: list) {
            toString += item+ ",";
        }
        StringBuffer buffer = new StringBuffer(toString);
        buffer = buffer.deleteCharAt(buffer.length()-1);
        return buffer.toString();
    }

    List<Member> membersInGroup(Integer startAge, Integer endAge){
        return memberRepository.findByAgeBetweenOrderByGenderAscAgeDesc(startAge, endAge);
    }
}
