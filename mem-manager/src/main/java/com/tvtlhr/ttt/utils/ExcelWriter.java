package com.tvtlhr.ttt.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

@Component
public class ExcelWriter {

    public <T> void writeToExcelInMultiSheetsV2(final String fileName, final Map<String, List<T>> dataAndName, HttpServletResponse response, Class<?> clazz) {
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename="+fileName;
        response.setHeader(headerKey, headerValue);
        File file = null;
        ServletOutputStream fos = null;
        XSSFWorkbook workbook = null;
        try {
            Sheet sheet = null;
            workbook = new XSSFWorkbook();
            /*if (file.exists()) {
                workbook = (XSSFWorkbook) WorkbookFactory.create(new FileInputStream(file));
            } else {
                workbook = new XSSFWorkbook();
            }*/
            for (Map.Entry<String, List<T>> entry : dataAndName.entrySet()) {
                String sheetName = entry.getKey();
                List<T> data = entry.getValue();
                sheet = workbook.createSheet(sheetName);
                List<String> fieldNames = getFieldNamesForClass(clazz);
                int rowCount = 0;
                int columnCount = 0;
                Row row = sheet.createRow(rowCount++);
                for (String fieldName : fieldNames) {
                    Cell cell = row.createCell(columnCount++);
                    cell.setCellValue(fieldName);
                }
                Class<? extends Object> classz = clazz;
                for (T t : data) {
                    row = sheet.createRow(rowCount++);
                    columnCount = 0;
                    for (String fieldName : fieldNames) {
                        Cell cell = row.createCell(columnCount);
                        Method method = null;
                        try {
                            method = classz.getMethod("get" + capitalize(fieldName));
                        } catch (NoSuchMethodException nme) {
                            method = classz.getMethod("get" + fieldName);
                        }
                        Object value = method.invoke(t, (Object[]) null);
                        if (value != null) {
                            if (value instanceof String) {
                                cell.setCellValue((String) value);
                            } else if (value instanceof Long) {
                                cell.setCellValue((Long) value);
                            } else if (value instanceof Integer) {
                                cell.setCellValue((Integer) value);
                            } else if (value instanceof Double) {
                                cell.setCellValue((Double) value);
                            }
                        }
                        columnCount++;
                    }
                }
            }

            //fos = new FileOutputStream(file);
            fos = response.getOutputStream();
            workbook.write(fos);
            fos.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (fos != null) {
                    fos.close();
                }
            } catch (IOException e) {
            }
            try {
                if (workbook != null) {
                    workbook.close();
                }
            } catch (IOException e) {
            }
        }
    }

  /*  public void export(HttpServletResponse response) throws IOException {
        writeHeaderLine();
        writeDataLines();

        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();

        outputStream.close();

    }*/
    public <T> void writeToExcelInMultiSheets(final String fileName, final String sheetName, final List<T> data, HttpServletResponse response) {
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename="+fileName;
        response.setHeader(headerKey, headerValue);
        File file = null;
        ServletOutputStream fos = null;
        XSSFWorkbook workbook = null;
        try {
            //file = new File(fileName);
            Sheet sheet = null;
            workbook = new XSSFWorkbook();
            /*if (file.exists()) {
                workbook = (XSSFWorkbook) WorkbookFactory.create(new FileInputStream(file));
            } else {
                workbook = new XSSFWorkbook();
            }*/
            sheet = workbook.createSheet(sheetName);
            List<String> fieldNames = getFieldNamesForClass(data.get(0).getClass());
            int rowCount = 0;
            int columnCount = 0;
            Row row = sheet.createRow(rowCount++);
            for (String fieldName : fieldNames) {
                Cell cell = row.createCell(columnCount++);
                cell.setCellValue(fieldName);
            }
            Class<? extends Object> classz = data.get(0).getClass();
            for (T t : data) {
                row = sheet.createRow(rowCount++);
                columnCount = 0;
                for (String fieldName : fieldNames) {
                    Cell cell = row.createCell(columnCount);
                    Method method = null;
                    try {
                        method = classz.getMethod("get" + capitalize(fieldName));
                    } catch (NoSuchMethodException nme) {
                        method = classz.getMethod("get" + fieldName);
                    }
                    Object value = method.invoke(t, (Object[]) null);
                    if (value != null) {
                        if (value instanceof String) {
                            cell.setCellValue((String) value);
                        } else if (value instanceof Long) {
                            cell.setCellValue((Long) value);
                        } else if (value instanceof Integer) {
                            cell.setCellValue((Integer) value);
                        } else if (value instanceof Double) {
                            cell.setCellValue((Double) value);
                        }
                    }
                    columnCount++;
                }
            }
            //fos = new FileOutputStream(file);
            fos = response.getOutputStream();
            workbook.write(fos);
            fos.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (fos != null) {
                    fos.close();
                }
            } catch (IOException e) {
            }
            try {
                if (workbook != null) {
                    workbook.close();
                }
            } catch (IOException e) {
            }
        }
    }

    // retrieve field names from a POJO class
    private List<String> getFieldNamesForClass(Class<?> clazz) throws Exception {
        List<String> fieldNames = new ArrayList<String>();
        Field[] fields = clazz.getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            fieldNames.add(fields[i].getName());
        }
        return fieldNames;
    }

    // capitalize the first letter of the field name for retriving value of the
    // field later
    private String capitalize(String s) {
        if (s.length() == 0)
            return s;
        return s.substring(0, 1).toUpperCase() + s.substring(1);
    }

}
