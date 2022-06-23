package com.tvtlhr.ttt.repository;

import com.tvtlhr.ttt.entity.Family;
import com.tvtlhr.ttt.entity.Group;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GroupRepository extends JpaRepository<Group, Integer> {

}
