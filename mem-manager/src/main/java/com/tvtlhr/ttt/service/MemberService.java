package com.tvtlhr.ttt.service;

import com.tvtlhr.ttt.entity.Member;

import java.util.List;
import java.util.Optional;

public interface MemberService {

    List<Member> searchMembers(String gender, String age);

    boolean updateMember(Member member);

    Optional<Member> findByID(int id);

    boolean deleteMember(String code);

    Member getByCode(String code);

    List<Member> getAllMembers();

    String createNewMember(Member member);
}
