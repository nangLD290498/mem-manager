package com.tvtlhr.ttt.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
@Data
public class Family {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int familyId;

    @ManyToOne
    @JoinColumn(name="groupId", nullable = true)
    private Group group;

    @Column
    @NotNull
    private String name;

    @OneToMany(mappedBy="family")
    private List<Member> members;
}
