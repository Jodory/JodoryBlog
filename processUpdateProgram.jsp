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
	
	String id = multi.getParameter("original_id");
	String programId = multi.getParameter("programId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice"); //Integer
	String producer = multi.getParameter("producer");	
	String description = multi.getParameter("editordata");
	String category = multi.getParameter("category");
	String releaseDate = multi.getParameter("releaseDate");
	String recentUpdate = multi.getParameter("recentUpdate");

	Integer price;
	
	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
	
	
	/* Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement(); */
	String fileName = multi.getFilesystemName("programImage");	

	
		String sql = "select * from program where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (fileName != null) {
				sql = "UPDATE program SET p_id=?, p_name=?, p_unitPrice=?, p_releaseDate=?, p_recentUpdate=?, p_producer=?, p_category=?, p_description=?, p_fileName=? WHERE p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, programId);
				pstmt.setString(2, name);
				pstmt.setInt(3, price);
				pstmt.setString(4, releaseDate);
				pstmt.setString(5, recentUpdate);
				pstmt.setString(6, producer);
				pstmt.setString(7, category);
				pstmt.setString(8, description);
				pstmt.setString(9, fileName);
				pstmt.setString(10, id);
				pstmt.executeUpdate();
			} else {
				sql = "UPDATE program SET p_id=?, p_name=?, p_unitPrice=?, p_releaseDate=?, p_recentUpdate=?, p_producer=?, p_category=?, p_description=? WHERE p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, programId);
				pstmt.setString(2, name);
				pstmt.setInt(3, price);
				pstmt.setString(4, releaseDate);
				pstmt.setString(5, recentUpdate);
				pstmt.setString(6, producer);
				pstmt.setString(7, category);
				pstmt.setString(8, description);
				pstmt.setString(9, id);
				pstmt.executeUpdate();
			}
		}
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

	response.sendRedirect("/MyBlog/programs/editProgram.jsp?edit=update");
%>


