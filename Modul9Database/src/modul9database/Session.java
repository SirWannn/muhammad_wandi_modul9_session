/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modul9database;

import java.sql.*;
import java.util.UUID;

public class Session {

    private static String sessionId;

    public static void createSession(String username, String password,
            String fullname, String role) {
        sessionId = UUID.randomUUID().toString();

        String query = "INSERT INTO session (session_id, username, password, "
                + "fullname, role) VALUES (?, ?, ?, ?, ?)";

        try (
                Connection koneksi = DBConnection.getConnection(); PreparedStatement pstmt = koneksi.prepareStatement(query)) {
            pstmt.setString(1, sessionId);
            pstmt.setString(2, username);
            pstmt.setString(3, password);
            pstmt.setString(4, fullname);
            pstmt.setString(5, role);
            pstmt.executeUpdate();

            pstmt.close();
            koneksi.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static String getSessionAttribute(String key) {
        String query = "SELECT " + key + " FROM session where session_id = ?";
        try (
                Connection koneksi = DBConnection.getConnection(); PreparedStatement pstmt = koneksi.prepareStatement(query)) {
            pstmt.setString(1, sessionId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getString(key);
            }

            pstmt.close();
            koneksi.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void clearSession() {
        String query = "DELETE FROM session WHERE session_id = ?";
        try (
                Connection koneksi = DBConnection.getConnection(); PreparedStatement pstmt = koneksi.prepareStatement(query)) {
            pstmt.setString(1, sessionId);
            pstmt.executeUpdate();

            pstmt.close();
            koneksi.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
