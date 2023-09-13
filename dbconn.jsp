<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Statement stmt = null;
try {
	String url = "jdbc:mysql://203.249.22.168:3306/dm";
	String user = "root";
	String password = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	/*
	out.println("데이터베이스 연결 성공!!");
	conn = DriverManager.getConnection(url, user, password);
	out.println("진짜 성공!!!!!!");
	String sql = "select * from posts";
	out.println(sql);
	
	Statement st = conn.createStatement();
	rs = st.executeQuery(sql);
	if(rs.next()){ //검색된 결과가 존재하면 tr
		
		String p_id = rs.getString("p_id"); //columnIndex or columnLabel
		String p_title = rs.getString("p_title"); //columnIndex or columnLabe
		out.println("id: " + p_id + "<br>");
		out.println("p_title: " + p_title + "<br>");
		}
		*/
} catch (SQLException ex) {
	out.println("데이터베이스 연결이 실패되었습니다.<br>");
	out.println("SQLException: " + ex.getMessage());
}

%>
