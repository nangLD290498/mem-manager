package com.tvtlhr.ttt.entity;

import lombok.Data;
import lombok.ToString;
import org.springframework.format.annotation.NumberFormat;

import javax.persistence.*;
import javax.validation.constraints.*;

@Entity
@Data
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne
    @JoinColumn(name="family_id", nullable = true, referencedColumnName = "id")
    @ToString.Exclude
    private Family family;

    @Column(unique = true)
    private String code;

    @Column
    @NotBlank(message = "Tên không thể bỏ trống")
    private String name;

    @Column
    @NotNull(message = "Tuổi không thể bỏ trống")
    private int age;

    public String getAgeString() {
        return age+"";
    }

    @Column
    @NumberFormat
    private String phoneNumber;

    @Column
    @NotNull
    private String isAtending;


    @Column
    private String gender;

    @Column
    private String relativeName;

    @Column
    private String relationship;

    @Column
    @NumberFormat
    private String relativePhoneNumber;

}
