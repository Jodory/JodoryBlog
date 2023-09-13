<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
	String filename = "";
	String realFolder = request.getSession().getServletContext().getRealPath("./resources/images");
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
			new DefaultFileRenamePolicy());
	int postId = Integer.parseInt(multi.getParameter("id"));
	String title = multi.getParameter("title");
	String content = multi.getParameter("editordata");
	String category = multi.getParameter("category");


	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);	

	
		String sql = "select * from posts where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postId);
		rs = pstmt.executeQuery();

		if (rs.next()) {
				sql = "UPDATE posts SET p_title=?, p_category=?, p_content=? WHERE p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, title);
				pstmt.setString(2, category);
				pstmt.setString(3, content);
				pstmt.setInt(4, postId);
				pstmt.executeUpdate();
		}
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

	response.sendRedirect("/MyBlog/posts/editPost.jsp?edit=update");
%>


