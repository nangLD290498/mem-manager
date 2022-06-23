package com.tvtlhr.ttt.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity(name = "family_group")
@Data
public class Group {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @OneToMany(cascade = {CascadeType.ALL}, targetEntity = Family.class)
    @JoinColumn(name = "group_id", referencedColumnName = "id")
    private List<Family> families;

    @Column
    @NotNull
    private String groupName;

    @Column
    private Integer startAge;

    @Column
    private Integer endAge;
}
