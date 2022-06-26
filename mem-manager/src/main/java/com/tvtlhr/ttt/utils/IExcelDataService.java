package com.tvtlhr.ttt.utils;

import com.tvtlhr.ttt.entity.DowloadObject;
import com.tvtlhr.ttt.entity.Member;

import java.io.File;
import java.util.List;


public interface IExcelDataService {

    List<DowloadObject> getExcelDataAsList(File file);

}
