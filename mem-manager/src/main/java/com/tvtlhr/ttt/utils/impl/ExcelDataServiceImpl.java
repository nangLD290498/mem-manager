package com.tvtlhr.ttt.utils.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.tvtlhr.ttt.entity.DowloadObject;
import com.tvtlhr.ttt.entity.Member;
import com.tvtlhr.ttt.repository.MemberRepository;
import com.tvtlhr.ttt.utils.IExcelDataService;
import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;


@Service
public class ExcelDataServiceImpl implements IExcelDataService {


    @Autowired
    MemberRepository memberRepository;

    Workbook workbook;

    public List<DowloadObject> getExcelDataAsList(File file) {

        List<String> list = new ArrayList<String>();

        // Create a DataFormatter to format and get each cell's value as String
        DataFormatter dataFormatter = new DataFormatter();

        // Create the Workbook
        try {
            workbook = WorkbookFactory.create(file);
        } catch (EncryptedDocumentException | IOException e) {
            e.printStackTrace();
        } catch (InvalidFormatException e) {
            throw new RuntimeException(e);
        }

        // Retrieving the number of sheets in the Workbook
        System.out.println("-------Workbook has '" + workbook.getNumberOfSheets() + "' Sheets-----");

        // Getting the Sheet at index zero
        Sheet sheet = workbook.getSheetAt(0);

        // Getting number of columns in the Sheet
        int noOfColumns = sheet.getRow(0).getLastCellNum();
        System.out.println("-------Sheet has '"+noOfColumns+"' columns------");

        // Using for-each loop to iterate over the rows and columns
        for (Row row : sheet) {
            for (int i =0; i<11;i++) {
                String cellValue = null;
                if(row.getCell(i) != null) {
                    if(row.getCell(i).getCellType() == Cell.CELL_TYPE_NUMERIC){
                        cellValue =  String.valueOf((int) row.getCell(i).getNumericCellValue());
                    }else{
                        cellValue = row.getCell(i).getStringCellValue();
                    }
                }
                list.add(cellValue);
            }
        }

        // filling excel data and creating list as List<Invoice>
        List<DowloadObject> invList = createList(list, noOfColumns);

        // Closing the workbook
        try {
            workbook.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return invList;
    }



    private List<DowloadObject> createList(List<String> excelData, int noOfColumns) {

        ArrayList<DowloadObject> invList = new ArrayList<>();

        int i = noOfColumns;
        do {
            DowloadObject dowloadObject = new DowloadObject();
            dowloadObject.setTen(excelData.get(i));
            dowloadObject.setSBD(excelData.get(i + 1));
            dowloadObject.setNhom(excelData.get(i + 2));
            dowloadObject.setGia_dinh(excelData.get(i + 3));
            dowloadObject.setTuoi(Integer.parseInt(excelData.get(i + 4)));
            dowloadObject.setSdt(excelData.get(i + 5));
            dowloadObject.setGioi_tinh(excelData.get(i + 6));
            dowloadObject.setDiem_danh(excelData.get(i + 7));
            dowloadObject.setTen_nguoi_than(excelData.get(i + 8));
            dowloadObject.setMoi_quan_he(excelData.get(i + 9));
            dowloadObject.setSdt_nguoi_than(excelData.get(i + 10));

            invList.add(dowloadObject);
            i = i + (noOfColumns);

        } while (i < excelData.size());
        return invList;
    }
}
