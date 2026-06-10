package com.example.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class QuanLySQL {
    private static final String DB_URL = "jdbc:sqlite:./data.db";

    public void ChayLenhSQL(String sql) {
        try {
            Class.forName("org.sqlite.JDBC");
            try (Connection conn = DriverManager.getConnection(DB_URL);
                    Statement stmt = conn.createStatement()) {
                stmt.execute(sql);
                System.out.println("SQL thực thi thành công: " + sql);
            } catch (SQLException e) {
                System.err.println("Lỗi thực thi SQL: " + e.getMessage());
                throw new RuntimeException("Lỗi thực thi SQL", e);
            }
        } catch (ClassNotFoundException e) {
            // System.err.println("Không tìm thấy SQLite JDBC driver");
            throw new RuntimeException("Không tìm thấy SQLite JDBC driver", e);
        }
    }

    public List<Map<String, Object>> LayTruyVan(String sql) {
        List<Map<String, Object>> results = new ArrayList<>();
        try {
            Class.forName("org.sqlite.JDBC");
            try (Connection conn = DriverManager.getConnection(DB_URL);
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql)) {

                ResultSetMetaData metaData = rs.getMetaData();
                int columnCount = metaData.getColumnCount();

                while (rs.next()) {
                    Map<String, Object> row = new HashMap<>();
                    for (int i = 1; i <= columnCount; i++) {
                        String columnName = metaData.getColumnName(i);
                        Object value = rs.getObject(i);
                        row.put(columnName, value);
                    }
                    results.add(row);
                }
            } catch (SQLException e) {
                System.err.println("Lỗi thực thi SQL: " + e.getMessage());
                throw new RuntimeException("Lỗi thực thi SQL", e);
            }
        } catch (ClassNotFoundException e) {
            System.err.println("Không tìm thấy SQLite JDBC driver");
            throw new RuntimeException("Không tìm thấy SQLite JDBC driver", e);
        }
        return results;
    }
}
