package com.prj.users.notification.dao;

import com.prj.users.notification.service.Notice;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NoticeDao {

    private String URL;
	private String USERNAME;
	private String PASSWORD;

	public List<Notice> getAllNotifications(int companyId) throws SQLException {
        List<Notice> notifications = new ArrayList<>();
        String query = "SELECT * FROM NOTIFICATIONS WHERE COMPANY_ID = ?";
        
        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, companyId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
            	Notice notice = new Notice(
                        rs.getInt("ID"),
                        rs.getString("MESSAGE"),
                        rs.getString("TIMESTAMP"),
                        rs.getInt("COMPANY_ID")
                );
                notifications.add(notice);
            }
        }
        return notifications;
    }

    public void addNotification(Notice notice) throws SQLException {
        String query = "INSERT INTO NOTIFICATIONS (MESSAGE, TIMESTAMP, COMPANY_ID) VALUES (?, ?, ?)";
        
        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, notice.getNotification());
            pstmt.setString(2, notice.getRecieveddate());
            pstmt.setInt(3, notice.getCompanyIdx());
            pstmt.executeUpdate();
        }
    }
}
