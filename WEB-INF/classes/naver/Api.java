package naver;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.StringTokenizer;

// 네이버 기계번역 (Papago SMT) API 예제
public class Api {

	public String api(String title, String content) {

		String clientId = "ki2kaob87y";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "ayK4HlXyf07lIvtOPD03Z3wNuGZAM3sXSSEhigPO";// 애플리케이션 클라이언트 시크릿값";
		
		try {
			String apiURL = " https://naveropenapi.apigw.ntruss.com/text-summary/v1/summarize";
			//String str2 = "간편송금 이용금액이 하루 평균 2000억원을 넘어섰다. 한국은행이 17일 발표한 '2019년 상반기중 전자지급서비스 이용 현황'에 따르면 올해 상반기 간편송금서비스 이용금액(일평균)은 지난해 하반기 대비 60.7% 증가한 2005억원으로 집계됐다. 같은 기간 이용건수(일평균)는 34.8% 늘어난 218만건이었다. 간편 송금 시장에는 선불전자지급서비스를 제공하는 전자금융업자와 금융기관 등이 참여하고 있다. 이용금액은 전자금융업자가 하루평균 1879억원, 금융기관이 126억원이었다. 한은은 카카오페이, 토스 등 간편송금 서비스를 제공하는 업체 간 경쟁이 심화되면서 이용규모가 크게 확대됐다고 분석했다. 국회 정무위원회 소속 바른미래당 유의동 의원에 따르면 카카오페이, 토스 등 선불전자지급서비스 제공업체는 지난해 마케팅 비용으로 1000억원 이상을 지출했다. 마케팅 비용 지출규모는 카카오페이가 491억원, 비바리퍼블리카(토스)가 134억원 등 순으로 많았다.";
			//String str = "맨체스터 유나이티드가 김민재(25, 나폴리) 영입을 추진하려고 한다. 이탈리아에서 직접 김민재를 관찰했다. 월드컵이 열리지 않았는데, 벌써 김민재 이적설이 솔솔 피어나고 있다.이탈리아 매체 '칼치오메르카토'는 13일(한국시간) '맨체스터 유나이티드가 김민재를 이탈리아에서 직접 지켜봤다. 나폴리는 김민재 바이아웃 조항 삭제를 위해 재계약 협상을 마련한다'고 알렸다.김민재는 올해 여름 나폴리에 합류했다. 나폴리는 메르텐스, 로렌조 인시네, 칼리두 쿨리발리 등 기존 주전급 선수를 보내고, 김민재를 포함해 잠재력이 큰 선수들로 스쿼드를 채웠다. 검증되지 않은 선수라는 시선도 있었지만, 영입한 모든 선수가 유럽 최고 수준 경기력을 보이면서 무패 행진에 날개를 달았다.김민재는 흐비차 크리바츠켈리아와 최고의 찬사를 받고 있다. 축구전문매체 '후스코어드닷컴'에 따르면 이번 시즌 이탈리아 세리에A 중앙 수비수 최고 평점을 유지하고 있다. 유럽 전체를 통틀어도 20위권에 손꼽힌다. 인상적인 공중볼 다툼에 후방에서 정확하고 질 높은 패스까지 공급했다.디펜딩 챔피언 AC밀란전 등에서 놀라운 활약을 보였다. 유럽축구연맹(UEFA) 챔피언스리그에서도 기복 없이 절정이었다. 전 유럽이 주목하는 선수가 됐고, 페네르바체 시절처럼 이적 반 시즌 만에 이적설이 나왔다.맨체스터 유나이티드와 간헐적으로 연결됐다. 영국 현지에서는 해리 매과이어 대신에 김민재를 추천하면서 맨체스터 유나이티드 이적설에 불을 붙였다. 이후에 잠깐 사라지는 모양이었지만 또 영입설이 나왔다.내년 7월에 발동될 김민재 바이아웃은 5000만 유로(약 706억 원)다. 15일 동안 잠깐 발동되지만, 자본이 두둑한 팀이라면 5000만 유로는 지불하기 쉬운 조건이다. 나폴리도 김민재 영입에 기재한 5000만 유로 헐값이라는 걸 인정했다.";
			String body = "{\"document\": {\"" + title + "\": \"롤드컵 우승팀 엑소더스 '악몽', 디알엑스서 재현되나\",\"content\": \"" + content + "\"},\"option\": {\"language\": \"ko\",\"model\": \"news\",\"tone\": 2,\"summaryCount\": 3}}";
			

			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
			con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
			con.setRequestProperty("Content-Type", "application/json");

			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.write(body.getBytes());
			wr.flush();
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 오류 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			String inputLine;
			StringBuffer result = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				result.append(inputLine);
			}
			br.close();
			
			StringBuffer buf = new StringBuffer();
			
			StringTokenizer stk = new StringTokenizer(result.toString().substring(12, result.length() - 2),"\\n");
				
			while(stk.hasMoreTokens()){
				buf.append(stk.nextToken() + "<br>");
			}
			//out.println("<br>\n" + result.toString());
			//<p> <%=buf.toString()%>
			System.out.println(buf.toString());
			return buf.toString();
		} catch (Exception e) {
			return e.toString();
		}
	}

}