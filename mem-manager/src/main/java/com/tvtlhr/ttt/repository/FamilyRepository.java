package com.tvtlhr.ttt.repository;

import com.tvtlhr.ttt.entity.Family;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FamilyRepository extends JpaRepository<Family, Integer> {

}
