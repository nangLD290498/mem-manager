package com.tvtlhr.ttt.utils;

import com.tvtlhr.ttt.entity.Member;
import com.tvtlhr.ttt.repository.MemberRepository;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import org.slf4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import java.util.stream.Collectors;

@Component
public class Utils {

    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Value("${code.value}")
    private String codePrefix;

    @Autowired
    private MemberRepository memberRepository;

    public String generateCode(){
        String generatedcode = "";
        List<String> memberCodes = memberRepository.findAll().stream().map(Member::getCode).collect(Collectors.toList());
        if(CollectionUtils.isEmpty(memberCodes)){
            generatedcode = "0001";
        }else {
            Integer index = 1;
            for (String code : memberCodes) {
                int codePrefixLength = 0;
                if(codePrefix != null) {
                    codePrefixLength=codePrefix.length();
                }
                index = Math.max(index, Integer.parseInt(code));
            }
            index ++;
            logger.info("Index: " + index + " length: " + index.toString().length());
            switch (index.toString().length()){
                case 1:
                    generatedcode = "000".concat(index.toString());
                    break;
                case 2:
                    generatedcode = "00".concat(index.toString());
                    break;
                case 3:
                    generatedcode = "0".concat(index.toString());
                    break;
                default:
                    generatedcode = index.toString();
            }
        }
        return codePrefix.concat(generatedcode);
    }

    public String intToStringCode(Integer index){
        String generatedcode="";
        logger.info("Index: " + index + " length: " + index.toString().length());
        switch (index.toString().length()){
            case 1:
                generatedcode = "000".concat(index.toString());
                break;
            case 2:
                generatedcode = "00".concat(index.toString());
                break;
            case 3:
                generatedcode = "0".concat(index.toString());
                break;
            default:
                generatedcode = index.toString();
        }
        return generatedcode;
    }

    public File convertMultiPartToFile(MultipartFile file ) throws IOException {
        File convFile = new File( "uploaded\\" + file.getOriginalFilename() );
        FileOutputStream fos = new FileOutputStream( convFile );
        fos.write( file.getBytes() );
        fos.close();
        return convFile;
    }
}
