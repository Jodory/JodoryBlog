<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Program"%>
<%@ page import="dao.ProgramRepository"%>

<%
	//완료
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

	ArrayList<Program> cartList = (ArrayList<Program>) session.getAttribute("cartlist");
	Program goodsQnt = new Program();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getProgramId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>
