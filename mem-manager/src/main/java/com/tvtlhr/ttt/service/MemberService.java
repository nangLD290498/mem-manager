package com.tvtlhr.ttt.service;

import com.tvtlhr.ttt.entity.Member;

import java.util.List;
import java.util.Optional;

public interface MemberService {

    boolean saveAll(List<Member> members);
    void submitAttention(List<Integer> idList);

    List<Member> searchMembers(String gender, String age, String isAtending);

    boolean updateMember(Member member, Integer familyId);

    Optional<Member> findByID(int id);

    boolean deleteMember(String code);

    Member getByCode(String code);

    List<Member> getAllMembers();

    Member createNewMember(Member member);

    void deleteAll();
}
