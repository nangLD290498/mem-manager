package com.tvtlhr.ttt.service.impl;

import com.tvtlhr.ttt.entity.Family;
import com.tvtlhr.ttt.entity.Group;
import com.tvtlhr.ttt.entity.Member;
import com.tvtlhr.ttt.repository.FamilyRepository;
import com.tvtlhr.ttt.repository.GroupRepository;
import com.tvtlhr.ttt.repository.MemberRepository;
import com.tvtlhr.ttt.service.MemberService;
import com.tvtlhr.ttt.utils.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    MemberRepository memberRepository;

    @Autowired
    FamilyRepository familyRepository;

    @Autowired
    GroupRepository groupRepository;

    @Autowired
    Utils utils;

    @Override
    public boolean saveAll(List<Member> members) {
        if(members == null) return false;
        List<Member> memList = memberRepository.saveAll(members);
        return memList.size() !=0;
    }

    @Override
    public void submitAttention(List<Integer> idList) {
        for (Integer id: idList) {
            memberRepository.updateAttentionByid(id);
        }
    }

    @Override
    public List<Member> searchMembers(String gender, String age, String isAtending) {
         int ageInt = 0;
        try{
            if(!age.equals("all"))  ageInt = Integer.parseInt(age);
        }catch (Exception e){
            return null;
        }
        List<Member> members = memberRepository.findAll();
        if(!gender.equals("all")){
            members = members.stream().filter(member -> member.getGender().equals(gender)).collect(Collectors.toList());
        }
        if(!age.equals("all")){
            members = members.stream().filter(member -> member.getAge() == Integer.parseInt(age)).collect(Collectors.toList());
        }
        if(!isAtending.equals("all")){
            members = members.stream().filter(member -> member.getIsAtending().equals(isAtending)).collect(Collectors.toList());
        }

        return members;
    }

    @Override
    public boolean updateMember(Member member, Integer familyId) {
        Optional<Member> origin = memberRepository.findById(member.getId());
        Family newFamily = null;
        if(familyId != null) {
            newFamily = familyRepository.getReferenceById(familyId);
        }
        if(memberRepository.existsInDB(member.getId(),
                member.getName(),
                member.getPhoneNumber(),
                member.getCode(),
                member.getAge(),
                member.getGender(),
                member.getIsAtending(),
                member.getRelativeName(),
                member.getRelationship(),
                member.getRelativePhoneNumber()) &&
                (origin.get().getFamily() == null ||
                        familyId == origin.get().getFamily().getId())) return false;

        member.setFamily(newFamily);
        Member mem = memberRepository.save(member);
        return mem != null;
    }

    @Override
    public Optional<Member> findByID(int id) {
        return memberRepository.findById(id);
    }

    @Override
    public boolean deleteMember(String code) {
        memberRepository.deleteByCode(code);
        return true;
    }

    @Override
    public Member getByCode(String code) {
        return memberRepository.findByCode(code);
    }

    @Override
    public List<Member> getAllMembers() {
        return memberRepository.findAll();
    }

    @Override
    public Member createNewMember(Member member) {
        if(memberRepository.existsMemberByNameAndPhoneNumber(member.getName(), member.getPhoneNumber())){
            return null;
        }
        String code = utils.generateCode();
        member.setCode(code);
        // set family cho member
        int age = member.getAge();
        String gender = member.getGender();
        //Group group = findGroup(age);
        //logger.info("tuổi "+ age+ " thuộc từ "+ group.getStartAge()+" đến "+ group.getEndAge());
        List<Family> families = familyRepository.findAll();
        //if(group != null){
            // todo
            //families = findFamilyBaseOnQuantity(group);
            //logger.info(families.get(0).getMembers().size() + "||" + families.size());
        logger.info("11" + families.toString());
            families = findFamilyBaseOnGender(families, gender);
        logger.info("22" + families.toString());
            families = findFamilyBaseOnAge(families, member);
        //}
        logger.info("33" + families.toString());
        if(families.size() != 0){
            member.setFamily(families.get(0));
        }
        memberRepository.save(member);
        return member;
    }

    @Override
    public void deleteAll() {
        memberRepository.deleteAll();
        groupRepository.deleteAll();
    }

    private Group findGroup(int age){
        List<Group> groups = groupRepository.findAll(Sort.by(Sort.Direction.DESC, "endAge"));
        if(groups == null || groups.size() == 0) return null;
        if(age > groups.get(0).getEndAge()) return groups.get(0);
        if(age < groups.get(groups.size()-1).getStartAge()) return groups.get(groups.size()-1);
        for(int i=0; i<groups.size(); i++){
            Group g = groups.get(i);
            if(g.getEndAge() >= age && g.getStartAge() <= age){
                return g;
            }
        }
        return null;
    }

    private List<Family> findFamilyBaseOnQuantity(Group group){
        List<Family> originalFamilies = group.getFamilies();
        List<Integer> sizes = originalFamilies.stream().map(family -> family.getMembers().size()).collect(Collectors.toList());
        int min = sizes.stream()
                .mapToInt(v -> v)
                .min().orElseThrow(NoSuchElementException::new);
        return originalFamilies.stream().filter(family -> family.getMembers().size() == min).collect(Collectors.toList());
    }

    private List<Family> findFamilyBaseOnGender(List<Family> families, String gender){
        List<Family> results = new ArrayList<>();
        Map<Family, Integer> map = new HashMap<>();
        /*for (Family family: families) {
            List<Member> members = family.getMembers().stream().filter(member -> member.getGender().equals(gender)).collect(Collectors.toList());
            map.put(family, members.size());
            //logger.info(gender+ "||" +members.size());
        }
        int min = new ArrayList<Integer>(map.values()).stream()
                .mapToInt(v -> v)
                .min().orElseThrow(NoSuchElementException::new);

        map.forEach( (k,v) -> {
            if(v==min){
                results.add(k);
            }
        });*/
        return familyRepository.findAll().stream().filter(family -> family.getMembers().get(0).getGender().equals(gender)).collect(Collectors.toList());
    }

    private List<Family> findFamilyBaseOnAge(List<Family> families, Member member){
        List<Family> results = new ArrayList<>();
        //Map<Family, Integer> map = new HashMap<>();
        //for (Family family: families) {
            results = families.stream().filter(family1 -> family1.getGroup().getStartAge() <= member.getAge() && family1.getGroup().getEndAge() >= member.getAge()).collect(Collectors.toList());
            /*List<Member> members = family.getMembers().stream().filter(member -> member.getGender().equals(gender)).collect(Collectors.toList());
            map.put(family, members.size());*/
            //logger.info(gender+ "||" +members.size());
        //}
        if(results.size() == 0){
            results=findFamilyBaseOnGender(familyRepository.findAll(), member.getGender());
        }
        return results;
    }
}
