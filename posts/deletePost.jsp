<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>
<%
	String postId = request.getParameter("id");	

	String sql = "select * from posts";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		sql = "delete from posts where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, postId);
		pstmt.executeUpdate();
		
		int delPostNum = Integer.parseInt(postId);
		
		sql = "SELECT * FROM posts ORDER BY p_id DESC LIMIT 1";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			int lastNum = rs.getInt("p_id");
		for(int i = delPostNum; i < lastNum; i++){
			sql = "UPDATE posts SET p_id=? WHERE p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i);
			pstmt.setInt(2, i+1);	
			pstmt.executeUpdate();
		}
		
		}
		else
			out.println("일치하는 게시물이 없습니다");
	}
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
 	response.sendRedirect("editPost.jsp?edit=delete");
%>
