package com.tvtlhr.ttt.entity;

import com.tvtlhr.ttt.service.FamilyService;
import com.tvtlhr.ttt.service.impl.FamilyServiceImpl;
import lombok.Data;
import lombok.ToString;
import org.springframework.format.annotation.NumberFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Data
public class DowloadObject {

    private String ten;

    private String SBD;

    private String nhom;

    private String gia_dinh;

    private int tuoi;

    private String sdt;

    private String gioi_tinh;

    private String diem_danh;

    private String ten_nguoi_than;

    private String moi_quan_he;

    private String sdt_nguoi_than;

    public static List<DowloadObject> fromMember(List<Member> members){
        List<DowloadObject> result = new ArrayList<>();

        for (Member member: members) {
            DowloadObject dowloadObject = new DowloadObject();
            dowloadObject.setTen(member.getName());
            dowloadObject.setTuoi(member.getAge());
            dowloadObject.setGioi_tinh(member.getGender());
            if(member.getFamily() !=null && member.getFamily().getGroup() != null) {
                dowloadObject.setNhom(member.getFamily().getGroup().getGroupName());
            }else{
                dowloadObject.setNhom("");
            }
            if(member.getFamily() !=null) {
                dowloadObject.setGia_dinh(member.getFamily().getName());
            }else {
                dowloadObject.setGia_dinh("");
            }
            dowloadObject.setSBD(member.getCode());
            dowloadObject.setSdt(member.getPhoneNumber());
            dowloadObject.setDiem_danh(Objects.equals(member.getIsAtending(), "true") ?"tham gia":"không tham gia");
            dowloadObject.setTen_nguoi_than(member.getRelativeName());
            dowloadObject.setMoi_quan_he(member.getRelationship());
            dowloadObject.setSdt_nguoi_than(member.getRelativePhoneNumber());
            result.add(dowloadObject);
        }
        return result;
    }


}
