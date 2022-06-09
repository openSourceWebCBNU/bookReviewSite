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
                board.setIsbn(rs.getString(6));
                board.setBook_title(rs.getString(7));
                board.setBook_author(rs.getString(8));
                board.setPublisher(rs.getString(9));
                board.setPub_date(rs.getString(10));
                board.setCategory(rs.getString(11));
                board.setCover(rs.getString(12));
                board.setLike(rs.getInt(13));
                board.setAvaliable(rs.getInt(14));
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

    public int write(Board board, String user_id, String isbn, String book_title, String book_author, String publisher,
                     String pub_date, String category, String cover)
    {
        String SQL = "INSERT INTO post VALUES (NULL,?,?,NOW(),?,?,?,?,?,?,?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, board.getPost_title());
            pstmt.setString(2, board.getPost_text());
            pstmt.setString(3, user_id);
            pstmt.setString(4, isbn);
            pstmt.setString(5, book_title);
            pstmt.setString(6, book_author);
            pstmt.setString(7, publisher);
            pstmt.setString(8, pub_date);
            pstmt.setString(9, category);
            pstmt.setString(10, cover);
            pstmt.setInt(11, 0);
            pstmt.setInt(12, 1);
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

    public int delete(Integer post_id) {
        String SQL = "UPDATE post SET avaliable=0 WHERE post_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, post_id);
            return pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
