<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dto.Program" %>
<%@ page import = "dao.ProgramRepository" %>
<%
	// 완료
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("programs.jsp");
		return;
	}

	ProgramRepository dao = ProgramRepository.getInstance();

	Program program = dao.getProgramById(id);
	if (program == null) {
		response.sendRedirect("exceptionNoProgramId.jsp");
	}

	ArrayList<Program> goodsList = dao.getAllPrograms();
	Program goods = new Program();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getProgramId().equals(id)) { 			
			break;
		}
	}
	
	ArrayList<Program> list = (ArrayList<Program>) session.getAttribute("cartlist");
	if (list == null) { 
		list = new ArrayList<Program>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	Program goodsQnt = new Program();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getProgramId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	}

	response.sendRedirect("program.jsp?id=" + id);
%>