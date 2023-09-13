package dao;

import dto.Program;
import java.sql.*;
import java.util.ArrayList;

public class ProgramRepository {
	
	private ArrayList<Program> listOfPrograms = new ArrayList<Program>();
	private static ProgramRepository instance = new ProgramRepository();
	
	public static ProgramRepository getInstance() {
		return instance;
	}
	public void addProgram(Program program) {
		listOfPrograms.add(program);
	}
	public ProgramRepository() {
		Program program1 = new Program();
		program1.setProgramId("JSPB1234");
		program1.setName("이름");
		program1.setUnitPrice(15000);
		program1.setReleaseDate("2018/03/02");
		program1.setRecentUpdate("2018/03/02");
		program1.setProducer("한빛미디어");
		program1.setCategory("카테고리");
		program1.setDescription("워드나 PPT 문서를 만들 수 있나요? 그러면 문제 없습니다." + "지금 바로 웹페이지 제작에 도전해보세요. 지금 당장 컴퓨터가 없어도 괜찮습니다."
				+ "코드와 실행 화면이 바로 보여서 눈으...");
		program1.setFilename("JSPB1234.jpg");

		Program program2 = new Program();
		program2.setProgramId("JSPB1234");
		program2.setName("이름");
		program2.setUnitPrice(15000);
		program2.setReleaseDate("2018/03/02");
		program2.setRecentUpdate("2018/03/02");
		program2.setProducer("한빛미디어");
		program2.setCategory("카테고리");
		program2.setDescription("워드나 PPT 문서를 만들 수 있나요? 그러면 문제 없습니다." + "지금 바로 웹페이지 제작에 도전해보세요. 지금 당장 컴퓨터가 없어도 괜찮습니다."
				+ "코드와 실행 화면이 바로 보여서 눈으...");
		program2.setFilename("JSPB1234.jpg");
		
		Program program3 = new Program();
		program3.setProgramId("JSPB1234");
		program3.setName("이름");
		program3.setUnitPrice(15000);
		program3.setReleaseDate("2018/03/02");
		program3.setRecentUpdate("2018/03/02");
		program3.setProducer("한빛미디어");
		program3.setCategory("카테고리");
		program3.setDescription("워드나 PPT 문서를 만들 수 있나요? 그러면 문제 없습니다." + "지금 바로 웹페이지 제작에 도전해보세요. 지금 당장 컴퓨터가 없어도 괜찮습니다."
				+ "코드와 실행 화면이 바로 보여서 눈으...");
		program3.setFilename("JSPB1234.jpg");

		listOfPrograms.add(program1);
		listOfPrograms.add(program2);
		listOfPrograms.add(program3);
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String url = "jdbc:mysql://localhost:3306/myblogdb";
			String user = "root";
			String password = "1234";
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException ex) {
			System.out.println("데이터베이스 연결이 실패되었습니다.");
			System.out.println("SQLException: " + ex.getMessage());
		}

		
		String sql = "select * from program";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Program program = new Program();
				program.setProgramId(rs.getString("p_id"));
				program.setName(rs.getString("p_name"));
				program.setUnitPrice(rs.getInt("p_unitPrice"));
				program.setReleaseDate(rs.getString("p_releaseDate"));
				program.setRecentUpdate(rs.getString("p_recentUpdate"));
				program.setProducer(rs.getString("p_producer"));
				program.setCategory(rs.getString("p_category"));
				program.setDescription(rs.getString("p_description"));
				program.setFilename(rs.getString("p_fileName"));

				listOfPrograms.add(program);
			}
			if (rs != null)
				rs.close();
				if (pstmt != null)
				pstmt.close();
				if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public ArrayList<Program> getAllPrograms() {
		return listOfPrograms;
	}

	public Program getProgramById(String programId) {
		Program programById = null;

		for (int i = 0; i < listOfPrograms.size(); i++) {
			Program program = listOfPrograms.get(i);
			if (program != null && program.getProgramId() != null && program.getProgramId().equals(programId)) {
				programById = program;
				break;
			}
		}
		return programById;
	}

}
