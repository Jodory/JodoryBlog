<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>

<%


	request.setCharacterEncoding("UTF-8");
	String filename = "";
	//String realFolder = "C:\\Users\\zmdk9\\Desktop\\조성운\\경기대학교공부\\3학년\\2022_2학기_수업\\수_오전_지능형웹설계(정경용)\\예제\\newPost\\src\\main\\webapp\\resources\\images";
	String realFolder = request.getSession().getServletContext().getRealPath("./resources/images"); 
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	//String PostId = multi.getParameter("postId");
	String title = multi.getParameter("title");
	String content = multi.getParameter("editordata");
	String category = multi.getParameter("category");
	
	
	
	java.util.Date day = new java.util.Date();
	int year = day.getYear() + 1900;
	int month = day.getMonth() + 1;
	int days = day.getDate();
	int hour = day.getHours();
	int minute = day.getMinutes();
	
	String M, d, h, m;
	if (month < 10){
		M = "0" + month;
	}else{M = month+"";}
	if (days < 10){
		d = "0" + days;
	}else{d = days+"";}
	if (hour < 10){
		h = "0" + hour;
	}else{h = hour+"";}
	if (minute < 10){
		m = "0" + minute;
	}else{m = minute+"";}
		
		
	String date = year + "." + M + "." + d + ". " + h + ":" + m;
	
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	String sql = "SELECT * FROM posts ORDER BY p_id DESC LIMIT 1";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if(rs.next()){
		int lastNum = rs.getInt("p_id") + 1;
	
	sql = "insert into posts values(?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, lastNum);
	pstmt.setString(2, title);
	pstmt.setString(3, category);
	pstmt.setString(4, content);
	pstmt.setString(5, date);
	pstmt.setString(6, fileName);
	pstmt.executeUpdate();
	}
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
	response.sendRedirect("/MyBlog/posts/posts.jsp");
%>
