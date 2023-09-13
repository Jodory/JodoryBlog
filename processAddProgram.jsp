<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%-- <%@ page import = "dao.ProgramRepository" %>
<%@ page import = "dto.Program" %> --%>

<%
	request.setCharacterEncoding("UTF-8");
	String filename = "";
	//String realFolder = "C:\\Users\\zmdk9\\Desktop\\조성운\\경기대학교공부\\3학년\\2022_2학기_수업\\수_오전_지능형웹설계(정경용)\\예제\\newProgram\\src\\main\\webapp\\resources\\images";
	String realFolder = request.getSession().getServletContext().getRealPath("./resources/images"); 
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

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
	String fname = (String)files.nextElement(); */
	String fileName = multi.getFilesystemName("programImage");

	
	String sql = "insert into program values(?,?,?,?,?,?,?,?,?)";
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
	pstmt.executeUpdate();
	
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
	
	response.sendRedirect("/MyBlog/programs/programs.jsp");
%>