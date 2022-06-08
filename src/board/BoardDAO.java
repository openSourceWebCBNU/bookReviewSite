package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public BoardDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/dokdoks";
            String dbID = "root";
            String dbPassword = "991112";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public Board getBoard(int post_id) {
        String SQL = "SELECT * FROM post WHERE post_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, post_id);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                Board board = new Board();
                board.setPost_id(rs.getInt(1));
                board.setPost_title(rs.getString(2));
                board.setPost_text(rs.getString(3));
                board.setPost_date(rs.getString(4));
                board.setUser_id(rs.getString(5));
                board.setBook_title(rs.getString(6));
                board.setBook_author(rs.getString(7));
                board.setPub_date(rs.getString(8));
                board.setCategory(rs.getString(9));
                return board;
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getNext() {
        String SQL = "SELECT post_id FROM post ORDER BY post_id desc";
        try {
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                return rs.getInt(1) + 1;
            }
            return 1;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public String getDate() {
        String SQL = "SELECT now()";
        try {
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                return rs.getString(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public int write(String post_title, String user_id, String post_text) {
        String SQL = "INSERT INTO post VALUES(?,?,?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext());
            pstmt.setString(2, post_title);
            pstmt.setString(3, post_text);
            pstmt.setString(4, getDate());
            pstmt.setString(5, user_id);
            return pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public ArrayList<Board> getList(int pageNumber) {
        String SQL = "SELECT * FROM post WHERE post_id < ? ORDER BY post_id DESC LIMIT 10";
        ArrayList<Board> list = new ArrayList<Board>();
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                Board board = new Board();
                board.setPost_id(rs.getInt(1));
                board.setPost_title(rs.getString(2));
                board.setPost_text(rs.getString(3));
                board.setPost_date(rs.getString(4));
                board.setUser_id(rs.getString(5));
                list.add(board);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean nextPage(int pageNumber) {
        String SQL = "SELECT * FROM post WHERE post_id < ? ORDER BY post_id DESC LIMIT 10";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                return true;
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
