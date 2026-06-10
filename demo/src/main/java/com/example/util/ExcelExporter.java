package com.example.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import jakarta.servlet.http.HttpServletResponse;

/**
 * Utility class để chuyển đổi List<Map<String, Object>> sang file Excel
 */
public class ExcelExporter {

    /**
     * Xuất dữ liệu từ List<Map<String, Object>> sang file Excel
     * 
     * @param data      Danh sách dữ liệu (List<Map<String, Object>>)
     * @param filePath  Đường dẫn file Excel cần lưu
     * @param sheetName Tên của Sheet (mặc định: "Sheet1")
     * @throws IOException nếu có lỗi ghi file
     */
    public static void exportToExcel(List<Map<String, Object>> data, String filePath, String sheetName)
            throws IOException {
        if (data == null || data.isEmpty()) {
            throw new IllegalArgumentException("Dữ liệu không được rỗng");
        }

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet(sheetName != null ? sheetName : "Sheet1");

        // Lấy các cột từ bản ghi đầu tiên
        Map<String, Object> firstRecord = data.get(0);
        Set<String> columns = firstRecord.keySet();

        // Tạo header row
        Row headerRow = sheet.createRow(0);
        CellStyle headerStyle = createHeaderStyle(workbook);
        CellStyle dataStyle = createDataStyle(workbook);

        int columnIndex = 0;
        for (String columnName : columns) {
            Cell cell = headerRow.createCell(columnIndex);
            cell.setCellValue(columnName);
            cell.setCellStyle(headerStyle);
            columnIndex++;
        }

        // Ghi dữ liệu
        int rowIndex = 1;
        for (Map<String, Object> record : data) {
            Row row = sheet.createRow(rowIndex);
            columnIndex = 0;
            for (String columnName : columns) {
                Cell cell = row.createCell(columnIndex);
                Object value = record.get(columnName);
                setCellValue(cell, value);
                cell.setCellStyle(dataStyle);
                columnIndex++;
            }
            rowIndex++;
        }

        // Auto-resize các cột
        for (int i = 0; i < columns.size(); i++) {
            sheet.autoSizeColumn(i);
        }

        // Ghi file
        try (FileOutputStream fos = new FileOutputStream(filePath)) {
            workbook.write(fos);
        } finally {
            workbook.close();
        }
    }

    /**
     * Xuất dữ liệu sang file Excel với sheet name mặc định
     */
    public static void exportToExcel(List<Map<String, Object>> data, String filePath) throws IOException {
        exportToExcel(data, filePath, "Sheet1");
    }

    /**
     * Xuất dữ liệu trực tiếp ra HttpServletResponse để download
     * 
     * @param data      Danh sách dữ liệu
     * @param response  HttpServletResponse
     * @param fileName  Tên file Excel (không cần .xlsx)
     * @param sheetName Tên sheet
     * @throws IOException nếu có lỗi
     */
    public static void exportToResponse(List<Map<String, Object>> data, HttpServletResponse response,
            String fileName, String sheetName) throws IOException {
        if (data == null || data.isEmpty()) {
            throw new IllegalArgumentException("Dữ liệu không được rỗng");
        }

        // Thiết lập response header
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + ".xlsx\"");
        response.setCharacterEncoding("UTF-8");

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet(sheetName != null ? sheetName : "Sheet1");

        // Lấy các cột từ bản ghi đầu tiên
        Map<String, Object> firstRecord = data.get(0);
        Set<String> columns = firstRecord.keySet();

        // Tạo header row
        Row headerRow = sheet.createRow(0);
        CellStyle headerStyle = createHeaderStyle(workbook);
        CellStyle dataStyle = createDataStyle(workbook);

        int columnIndex = 0;
        for (String columnName : columns) {
            Cell cell = headerRow.createCell(columnIndex);
            cell.setCellValue(columnName);
            cell.setCellStyle(headerStyle);
            columnIndex++;
        }

        // Ghi dữ liệu
        int rowIndex = 1;
        for (Map<String, Object> record : data) {
            Row row = sheet.createRow(rowIndex);
            columnIndex = 0;
            for (String columnName : columns) {
                Cell cell = row.createCell(columnIndex);
                Object value = record.get(columnName);
                setCellValue(cell, value);
                cell.setCellStyle(dataStyle);
                columnIndex++;
            }
            rowIndex++;
        }

        // Auto-resize các cột
        for (int i = 0; i < columns.size(); i++) {
            sheet.autoSizeColumn(i);
        }

        // Ghi ra response
        try (OutputStream out = response.getOutputStream()) {
            workbook.write(out);
            out.flush();
        } finally {
            workbook.close();
        }
    }

    /**
     * Xuất dữ liệu ra response với tên sheet mặc định
     */
    public static void exportToResponse(List<Map<String, Object>> data, HttpServletResponse response,
            String fileName) throws IOException {
        exportToResponse(data, response, fileName, "Sheet1");
    }

    /**
     * Tạo style cho header
     */
    private static CellStyle createHeaderStyle(Workbook workbook) {
        CellStyle style = workbook.createCellStyle();

        // Font
        Font font = workbook.createFont();
        font.setBold(true);
        font.setColor(IndexedColors.WHITE.getIndex());
        font.setFontHeightInPoints((short) 12);
        style.setFont(font);

        // Background
        style.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex());
        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);

        // Alignment
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setVerticalAlignment(VerticalAlignment.CENTER);

        // Border
        style.setBorderTop(BorderStyle.THIN);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);

        return style;
    }

    /**
     * Tạo style cho data cell
     */
    private static CellStyle createDataStyle(Workbook workbook) {
        CellStyle style = workbook.createCellStyle();

        // Border
        style.setBorderTop(BorderStyle.THIN);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);

        // Alignment
        style.setVerticalAlignment(VerticalAlignment.CENTER);

        return style;
    }

    /**
     * Thiết lập giá trị cho cell dựa trên kiểu dữ liệu
     */
    private static void setCellValue(Cell cell, Object value) {
        if (value == null) {
            cell.setCellValue("");
        } else if (value instanceof String str) {
            cell.setCellValue(str);
        } else if (value instanceof Integer integer) {
            cell.setCellValue(integer);
        } else if (value instanceof Double dbl) {
            cell.setCellValue(dbl);
        } else if (value instanceof Float flt) {
            cell.setCellValue(flt);
        } else if (value instanceof Long lng) {
            cell.setCellValue(lng);
        } else if (value instanceof Boolean bool) {
            cell.setCellValue(bool);
        } else if (value instanceof java.util.Date date) {
            cell.setCellValue(date);
        } else if (value instanceof java.sql.Date sqlDate) {
            cell.setCellValue(sqlDate);
        } else {
            cell.setCellValue(value.toString());
        }
    }
}
