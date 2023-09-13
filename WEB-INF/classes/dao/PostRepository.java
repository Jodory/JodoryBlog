package dao;

import dto.Post;
import java.util.ArrayList;

public class PostRepository {
	
	private ArrayList<Post> listOfPosts = new ArrayList<Post>();
	private static PostRepository instance = new PostRepository();
	
	public static PostRepository getInstance() {
		return instance;
	}
	
	public void addPost(Post post) {
		listOfPosts.add(post);
	}

	public PostRepository() {
		Post post1 = new Post();
		post1.setTitle("스크립트 태그");
		post1.setCategory("지능웹설계");
		post1.setContent("스크립트태그\r\n"
				+ "	- 선언문태그<%! %>\r\n"
				+ "		* 선언문 태그에 사용 한 것들은 전역변수 또는 전역 메소드로 사용됨.\r\n"
				+ "			* 선언문 태그에 작성한 메소드는 순서에 상관없이 사용가능\r\n"
				+ "	- 스크립틀릿태그<% %>\r\n"
				+ "		* 선언문태그와 스크립틀릿 태그는 ;\"세미콜론\"이 꼭 필요함\r\n"
				+ "		* 스크립틀릿태그 내부에 사용한 변수는 지역변수로서 ++count 같은것들 사용해도 한번만 증가된다.\r\n"
				+ "		ex)\r\n"
				+ "		<% int count = 0;>\r\n"
				+ "		<% out.println(++count);> --> 1\r\n"
				+ "	- 표현문태그 <%= %>");
		post1.setPostId("POST1");
		post1.setDate("2022.11.21. 23:59");
		post1.setFilename("JSPB1234.jpg");

		Post post2 = new Post();
		post2.setTitle("디렉티브 태그");
		post2.setCategory("지능웹설계");
		post2.setContent("3. 디렉티브 태그@\r\n"
				+ "	- page \r\n"
				+ "		*가능한 최상단에 선언하는 것을 권장\r\n"
				+ "		<%@ page language = \"\" conteType = \"\" pageEncoding=\"\" import = \"java.util.Calendar\" session = \"\" buffer = \"\" autoFlush =\"\" info \"\" errorPage = \"\" isErrorPage = \"\" is ELIgnored =\"\" isScriptingEnabled\r\n"
				+ "		1. language - > 기본값: java\r\n"
				+ "		2. contentType -> 기본값: text/html\r\n"
				+ "			if 다른 text/xml 등 이용할 때\r\n"
				+ "				meta 및 !DOCTYPE html 등 지워줘야함\r\n"
				+ "		3. import 자바 클래스를 사용할 때 설정\r\n"
				+ "			* 둘이상의 클래스를 포함하는 경우 쉼표로 구분!!! + import 형식으로 사용할 때에는 () 제외\r\n"
				+ "				ex) <%@ page import = \"java.util.Scanner, java.util.Calendar, java.util.Date\"\r\n"
				+ "		4. session(중요, 책에 안나옴)\r\n"
				+ "			기본값: true 세션을 사용\r\n"
				+ "			<%@ page session = \"true\"%> -> 내장객체를 사용하기 위한 설정(?)\r\n"
				+ "		5. buffer\r\n"
				+ "			*기본값 : 8KB \r\n"
				+ "			if 버퍼를 채우지 않고 웹브라우저로 직접 보내려면\r\n"
				+ "				<%@ page buffer =\"none\"%>\r\n"
				+ "		6. autoFlush\r\n"
				+ "			* 기본값: true\r\n"
				+ "				-> 버퍼가 채워질 때마다 자동으로 버퍼를 비운다.\r\n"
				+ "		7. isThreadSafe\r\n"
				+ "			* 기본값: true\r\n"
				+ "				-> 동시에 처리됨\r\n"
				+ "			if false설정시\r\n"
				+ "				-> 순차적 처리\r\n"
				+ "		8. info\r\n"
				+ "			-> 주석문\r\n"
				+ "		9. errorPage(중요)\r\n"
				+ "			- if 해당 페이지가 오류가 나오면 오류페이지를 사용하지 않고 특정 오류 페이지로 이동\r\n"
				+ "			ex) <%@ page errorPage = \"ex.jsp\"%>\r\n"
				+ "			★★★ sendRedirect(\"\")와 다른 것임\r\n"
				+ "				- 본래 페이지가 오류가 뜰 시 이동을 하게 되는데 주체는 원래 페이지 그대로임\r\n"
				+ "				ex) A.jsp에서 오류가 나면, A.jsp에 있는 모든것들 날리고  errorPage=\"B.jsp\"로 인해\r\n"
				+ "					화면에는 B.jsp가 보임, but url은 A.jsp가 그대로임.	★ ch04액션태그에서 배우는 forward태그와 동일하게 title까지 B.jsp의 title을 사용하게 됨\r\n"
				+ "				★★★중요한것: 문법오류(Syntax 오류) 는 그냥 오류라 page 이동 되지 않음\r\n"
				+ "		10. isErrorPage (errorPage)와 같이 쓰여야 하며\r\n"
				+ "			isErrorPage(\"somewhere.jsp\") 여기서 somewhere.jsp에 사용하는 디렉티브 태그이다.\r\n"
				+ "			ex) somewhere.jsp 내부에 <%@ isErrorPage = \"true\" %> 설정시\r\n"
				+ "				이전 페이지에서 생겼던 오류들을\r\n"
				+ "				<%\r\n"
				+ "					exception.printStackTrace(new java.io.PrintWriter(out));\r\n"
				+ "					out.flush(); # 위 둘은 세트임\r\n"
				+ "				%>\r\n"
				+ "		11. isELignored\r\n"
				+ "			- 기본값: false	->	\"${}\"를 사용할 수 있다.\r\n"
				+ "			 true	->	\"${}\"를 사용할 수 없다.			\r\n"
				+ "			\r\n"
				+ "	- include\r\n"
				+ "		<%@ include file = \"파일명\" %>\r\n"
				+ "			* 세미콜론 쓰면 안됨\r\n"
				+ "			얘 같은 경우도 주체는 본인이고 다른 파일을 불러오는 거임\r\n"
				+ "		뒤에 배울 include와는 다르다.\r\n"
				+ "		요건 조금 정적에 가깝다고나 할까?\r\n"
				+ "\r\n"
				+ "	- taglib\r\n"
				+ "		<%@ taglib uri = \"http://java.sun.com/jsp/jstl/core\" prefix=\"c\" %>\r\n"
				+ "		WEB-INF에 jar 3개 추가.\r\n"
				+ "		<c:forEach var = \"k\" begin = \"1\" end = \"10 step =\"1\">\r\n"
				+ "			<c:out value = \"${k}하나 추가\"/>\r\n"
				+ "		</c:forEach>");
		post2.setPostId("POST2");
		post2.setDate("2022.11.22. 11:24");
		post2.setFilename("JSPB1235.jpg");

		Post post3 = new Post();
		post3.setTitle("액션태그");
		post3.setCategory("지능웹설계");
		post3.setContent("액션태그는 반드시 끝나는 태그 />로 마무리 해야함	-> 끝 태그 없을 시 오류 \r\n"
				+ "	- forward\r\n"
				+ "		★ 버퍼를 모두 날리고(앞 뒤 전부 날림) 넘기는데 title까지 받는다 but 주소는 그대로\r\n"
				+ "			-> 주소만 동일한채 <jsp:forward page = \"ex.jsp\">ex.jsp로 덮어씌운다 생각하면 쉽다.\r\n"
				+ "	- include\r\n"
				+ "		★ 디렉티브 include와 다르게 액션태그는 동적페이지에 사용되고, 현재페이지의 삽이하는 형식이 아닌 별도의 파일로 요청 흐름을 넘긴다.\r\n"
				+ "		<jsp:include page = \"include.jsp\">	-> 액션태그\r\n"
				+ "		<%@ include file = \"include.jsp\"%>	-> 디렉티브태그\r\n"
				+ "\r\n"
				+ "	- param\r\n"
				+ "		★ 중요: form태그에는 method 속성값으로 post와 get이 있는데\r\n"
				+ "		get은 url에 value값이 보이고, post는 숨겨져서 내부처리 된다.\r\n"
				+ "		★ 한글을 value값으로 내보낼 경우 java.net.URLEncoder.encode(\"한글\")로 감싸서 내보내야함\r\n"
				+ "			ex) <jsp:param name =\"korean\" value = \"<%=java.net.URLEncoder.encode(\"한글내보내기\")%>\" >\r\n"
				+ "				forward 혹은 include 된 jsp파일에서 사용할때\r\n"
				+ "					--> <%=java.netURLDecoder.decode(request.getParameter(\"korean\")%>\r\n"
				+ "					--> String str = request.getParameter(\"korean\");\r\n"
				+ "						 <%= java.netURLDecoder.decode(str)%>\r\n"
				+ "				\r\n"
				+ "		★ param태그 혼자 사용할 수 없으며, forward 또는 include 액션태그와 같이 사용해야 함\r\n"
				+ "			☆ 속성값으로는 name과 value가 있다.\r\n"
				+ "			ex) <jsp:include page = \"includeEx.jsp\"> \r\n"
				+ "					<jsp:param name = \"date\" value = \"<%=(new java.util.Date()).toLocaleString()%>\">\r\n"
				+ "				</jsp:include>\r\n"
				+ "\r\n"
				+ "	★★★★★자바빈즈 개중요★★★★★★\r\n"
				+ "	- 자바빈즈태그(useBean)\r\n"
				+ "		※ 규칙필요!!\r\n"
				+ "			1. 자바 클래스는 java.io.Serializable 인터페이스 구현해야함\r\n"
				+ "			2. 기본생성자 필요\r\n"
				+ "			3. 모든 필드(모든변수)는 private접근지정자로 설정해야함\r\n"
				+ "			4. 모든 필드(모든변수)는 getter/setter()메소드가 존재해야함\r\n"
				+ "		☆ useBean의 속성들: id, class, scope가 존재함\r\n"
				+ "			ex) <jsp:useBean id = \"rd\" class = \"java.util.Random\" scope = \"session\"/>\r\n"
				+ "				-> rd.random()  --> 설정한 id명을 통해 클래스내부의 메소드를 사용할  수 있다.\r\n"
				+ "\r\n"
				+ "	- setProperty\r\n"
				+ "		->클래스 내부에 있는 setter()메소드를 통해서도 설정 할 수 있지만 다른 방법으로\r\n"
				+ "			-> <jsp:setPoperty name = \"자바빈즈 식별이름\" property = \"클래스 내부 필드이름\" value = \"변수에 설정할 값\" />\r\n"
				+ "				ex)	<jsp:useBean id = \"person\" class = \"ch04.com.dao.Person\" scope = \"session\"/>\r\n"
				+ "					<jsp:setProperty name = \"person\" property = \"name\" value =\"조성운\"/>\r\n"
				+ "					<p> <%=person.name%>	--> \"조성운\" 출력\r\n"
				+ "	- getProperty\r\n"
				+ "");
		post3.setPostId("POST3");
		post3.setDate("2022.11.23. 02:02");
		post3.setFilename("JSPB1236.jpg");

		listOfPosts.add(post1);
		listOfPosts.add(post2);
		listOfPosts.add(post3);
	}

	public ArrayList<Post> getAllPosts() {
		return listOfPosts;
	}

	public Post getPostById(String postId) {
		Post postById = null;

		for (int i = 0; i < listOfPosts.size(); i++) {
			Post post = listOfPosts.get(i);
			if (post != null && post.getPostId() != null && post.getPostId().equals(postId)) {
				postById = post;
				break;
			}
		}
		return postById;
	}
}
