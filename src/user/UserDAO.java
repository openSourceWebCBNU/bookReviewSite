// 로그인, 회원가입 정보 DB와 연동

package user;

import jdk.jshell.spi.ExecutionControlProvider;

import java.rmi.server.ExportException;
import java.sql.*;

public class UserDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/dokdoks";
            String dbID = "root";
            String dbPassword = "991112";
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public User getUser(String user_id) {
        String SQL = "SELECT * FROM user WHERE user_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();

            if(rs.next())
            {
                User user = new User();
                user.setUser_id(rs.getString(1));
                user.setUser_password(rs.getString(2));
                user.setUser_name(rs.getString(3));
                user.setUser_email(rs.getString(4));
                return user;
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int login(String user_id, String user_password) {
        String SQL = "SELECT user_password FROM user WHERE user_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                if(rs.getString(1).equals(user_password)) {
                    return 1;
                } else {
                    return 0;
                }
            }
            return -1;
        } catch(Exception e) {
            e.printStackTrace();
        }

        return -2;
    }

    public int join(User user) {
        String SQL = "INSERT INTO user VALUES (?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUser_id());
            pstmt.setString(2, user.getUser_password());
            pstmt.setString(3, user.getUser_name());
            pstmt.setString(4, user.getUser_email());
            return pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int confirm(String user_id, String user_password) {
        String SQL = "SELECT user_password FROM user WHERE user_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                if(rs.getString(1).equals(user_password)) {
                    return 1;
                }
                else
                    return 0;
            }
        } catch(Exception e)
        {
            e.printStackTrace();
        }
        return -2;
    }

    public int modify(User user) {
        String SQL = "UPDATE user SET user_password = ?, user_name = ?, user_email = ? WHERE user_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUser_password());
            pstmt.setString(2, user.getUser_name());
            pstmt.setString(3, user.getUser_email());
            pstmt.setString(4, user.getUser_id());
            return pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }

        return -1;
    }
}
