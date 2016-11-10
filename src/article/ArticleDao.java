package article;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ArticleDao {

	private static ArticleDao instance = new ArticleDao();
	
	public static ArticleDao getInstance(){
		return instance;
	}
	
	private ArticleDao(){
		
	}
	
	private Connection getConnection() throws Exception {
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/articledb");
		return ds.getConnection();
		
	}
	
	public List<Article> selectAllDao(int start, int end){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Article> articleList = null;
		String sql = "";
		try{
			conn = getConnection();
			sql = "select * from board order by ref desc, re_step acs limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				articleList = new ArrayList<Article>(end);
				do{
					Article article = new Article();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setSubject(rs.getString("subject"));
					article.setContent(rs.getString("content"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip")); 
					
					articleList.add(article);
					
				} while(rs.next());
				
			}
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null){ try{rs.close();}catch(SQLException e){} }
			if(pstmt != null){ try{pstmt.close();}catch(SQLException e){} }
			if(conn != null){ try{conn.close();}catch(SQLException e){}}
		}
		
		return articleList;
		
	}
	
	
}
