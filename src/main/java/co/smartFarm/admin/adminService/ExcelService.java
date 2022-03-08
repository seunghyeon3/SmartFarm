//package co.smartFarm.admin.adminService;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.xssf.streaming.SXSSFSheet;
//import org.apache.poi.xssf.streaming.SXSSFWorkbook;
//import org.json.JSONArray;
//import org.json.JSONObject;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import com.google.gson.JsonArray;
//import com.google.gson.JsonObject;
//
//import co.smartFarm.kit.kitService.KitVO;
//import co.smartFarm.plant.plantService.PlantVO;
//import co.smartFarm.shopping.purHisService.PurHisVO;
//import co.smartFarm.user.memberService.MemberService;
//import co.smartFarm.user.memberService.MemberVO;
//
//@Repository("excelDao")
//public class ExcelService {
//
//	@Autowired
//	MemberService memberDao;
//
//	// ===== 엑셀 다운로드 하기 위한 생성자 =====
//
//	// ===== 회원 리스트 =====
//	public List<MemberVO> makeMemberList() {
//
//		List<MemberVO> list = memberDao.memberSelectList();
//		List<MemberVO> resultList = new ArrayList<MemberVO>();
//
//		for (MemberVO li : list) {
//			MemberVO memberVo = new MemberVO(li.getMem_email(), li.getMem_name(), li.getMem_athr(), li.getMem_fm_req(),
//					li.getMem_fm_result());
//
//			resultList.add(memberVo);
//		}
//
//		return resultList;
//	}
//
//	/**
//	 * 리스트를 간단한 엑셀 워크북 객체로 생성
//	 * 
//	 * @param list
//	 * @return 생성된 워크북
//	 */
//
////	 1. json 형식으로 startDate, endDate, 목록 받아오기(ex 매출, 작물 ...)
////	 2. json에서 목록이랑 startDate, endDate 받아와서 if문 돌리기
////	 		-if문 돌리면서 생성자 만들어서 알아서 잘 돌리기
////	 3. workbook 하나로 합쳐서 잘 넣어보기
//
//	// ===== 회원 리스트를 간단한 엑셀 워크북 객체로 생성 =====
//	public SXSSFWorkbook makeSimpleExcelWorkbook(JSONArray excelList) {
//
//		SXSSFWorkbook workbook = new SXSSFWorkbook();
//		for (int i = 0; i < excelList.length(); i++) {
//			JSONObject jObj = (JSONObject) excelList.get(0);
//			String menu = jObj.getString("menu");
//			if (menu.equals("sales")) {// 매출인 경우
//
//			} else if (menu.equals("kit")) {// 키트인 경우
//				List<KitVO> list = new ArrayList<KitVO>();
//				// 시트 생성
//				SXSSFSheet sheet = workbook.createSheet("매출");
//
//				// 시트 열 너비 설정
//				sheet.setColumnWidth(0, 18000);
//				sheet.setColumnWidth(0, 18000);
//				sheet.setColumnWidth(0, 18000);
//				sheet.setColumnWidth(0, 18000);
//				sheet.setColumnWidth(0, 18000);
//				sheet.setColumnWidth(0, 18000);
//
//				// 헤더 행 생
//				Row headerRow = sheet.createRow(0);
//				// 해당 행의 첫번째 열 셀 생성
//				Cell headerCell = headerRow.createCell(0);
//				headerCell.setCellValue("키트 이름");
//				// 해당 행의 두번째 열 셀 생성
//				headerCell = headerRow.createCell(1);
//				headerCell.setCellValue("용도");
//				// 해당 행의 세번째 열 셀 생성
//				headerCell = headerRow.createCell(2);
//				headerCell.setCellValue("분류");
//				// 해당 행의 네번째 열 셀 생성
//				headerCell = headerRow.createCell(3);
//				headerCell.setCellValue("조회수");
//				// 해당 행의 네번째 열 셀 생성
//				headerCell = headerRow.createCell(4);
//				headerCell.setCellValue("판매수");
//				// 해당 행의 네번째 열 셀 생성
//				headerCell = headerRow.createCell(5);
//				headerCell.setCellValue("관리 현황");
//
//				// 회원 리스트 내용 행 및 셀 생성
//				Row bodyRow = null;
//				Cell bodyCell = null;
//				for (int j = 0; j < list.size(); j++) {
//
//					KitVO kitVo = list.get(j);
//
//					// 행 생성
//					bodyRow = sheet.createRow(j + 1);
//					// 이름
//					bodyCell = bodyRow.createCell(0);
//					bodyCell.setCellValue(kitVo.getKit_name());
//					// 용도
//					bodyCell = bodyRow.createCell(1);
//					bodyCell.setCellValue(kitVo.getKit_prpos());
//					// 분류
//					bodyCell = bodyRow.createCell(2);
//					bodyCell.setCellValue(kitVo.getKit_plant_class());
//					// 조회수
//					bodyCell = bodyRow.createCell(3);
//					bodyCell.setCellValue(kitVo.getKit_hit());
//					// 판매수
//					bodyCell = bodyRow.createCell(4);
//					bodyCell.setCellValue(kitVo.getKit_sale_count());
//					// 관리현황
//					bodyCell = bodyRow.createCell(5);
//					bodyCell.setCellValue(kitVo.getKit_sale_whet());
//
//				} // for j
//
//			} else if (menu.equals("plant")) {// 작물인 경우
//				List<PlantVO> list = new ArrayList<PlantVO>();
//				// 시트 생성
//				SXSSFSheet sheet = workbook.createSheet("작물");
//
//				// 시트 열 너비 설정
//				sheet.setColumnWidth(0, 18000);
//				sheet.setColumnWidth(0, 18000);
//				sheet.setColumnWidth(0, 18000);
//				sheet.setColumnWidth(0, 18000);
//				sheet.setColumnWidth(0, 18000);
//				sheet.setColumnWidth(0, 18000);
//
//				// 헤더 행 생
//				Row headerRow = sheet.createRow(0);
//				// 해당 행의 첫번째 열 셀 생성
//				Cell headerCell = headerRow.createCell(0);
//				headerCell.setCellValue("키트 이름");
//				// 해당 행의 두번째 열 셀 생성
//				headerCell = headerRow.createCell(1);
//				headerCell.setCellValue("용도");
//				// 해당 행의 세번째 열 셀 생성
//				headerCell = headerRow.createCell(2);
//				headerCell.setCellValue("분류");
//				// 해당 행의 네번째 열 셀 생성
//				headerCell = headerRow.createCell(3);
//				headerCell.setCellValue("조회수");
//				// 해당 행의 네번째 열 셀 생성
//				headerCell = headerRow.createCell(4);
//				headerCell.setCellValue("판매수");
//				// 해당 행의 네번째 열 셀 생성
//				headerCell = headerRow.createCell(5);
//				headerCell.setCellValue("관리 현황");
//
//				// 회원 리스트 내용 행 및 셀 생성
//				Row bodyRow = null;
//				Cell bodyCell = null;
//				for (int j = 0; j < list.size(); j++) {
//
//					PlantVO plantVo = list.get(j);
//
//					// 행 생성
//					bodyRow = sheet.createRow(j + 1);
//					// 이름
//					bodyCell = bodyRow.createCell(0);
//					bodyCell.setCellValue(kitVo.getKit_name());
//					// 용도
//					bodyCell = bodyRow.createCell(1);
//					bodyCell.setCellValue(kitVo.getKit_prpos());
//					// 분류
//					bodyCell = bodyRow.createCell(2);
//					bodyCell.setCellValue(kitVo.getKit_plant_class());
//					// 조회수
//					bodyCell = bodyRow.createCell(3);
//					bodyCell.setCellValue(kitVo.getKit_hit());
//					// 판매수
//					bodyCell = bodyRow.createCell(4);
//					bodyCell.setCellValue(kitVo.getKit_sale_count());
//					// 관리현황
//					bodyCell = bodyRow.createCell(5);
//					bodyCell.setCellValue(kitVo.getKit_sale_whet());
//
//				} // for j
//			} else if (menu.equals("member")) { // excelList에 member가 있는 경우
//				List<MemberVO> memList = new ArrayList<MemberVO>();
//				// 시트 생성
//				SXSSFSheet sheet = workbook.createSheet("회원");
//
//				// 시트 열 너비 설정
//				sheet.setColumnWidth(0, 18000);
//				sheet.setColumnWidth(0, 18000);
//				sheet.setColumnWidth(0, 18000);
//				sheet.setColumnWidth(0, 18000);
//				sheet.setColumnWidth(0, 18000);
//
//				// 헤더 행 생
//				Row headerRow = sheet.createRow(0);
//				// 해당 행의 첫번째 열 셀 생성
//				Cell headerCell = headerRow.createCell(0);
//				headerCell.setCellValue("회원 이메일");
//				// 해당 행의 두번째 열 셀 생성
//				headerCell = headerRow.createCell(1);
//				headerCell.setCellValue("회원 이름");
//				// 해당 행의 세번째 열 셀 생성
//				headerCell = headerRow.createCell(2);
//				headerCell.setCellValue("회원 권한");
//				// 해당 행의 네번째 열 셀 생성
//				headerCell = headerRow.createCell(3);
//				headerCell.setCellValue("농부 신청");
//				// 해당 행의 네번째 열 셀 생성
//				headerCell = headerRow.createCell(4);
//				headerCell.setCellValue("신청 승인");
//
//				// 회원 리스트 내용 행 및 셀 생성
//				Row bodyRow = null;
//				Cell bodyCell = null;
//				for (int j = 0; j < memList.size(); j++) {
//
//					MemberVO memberVo = memList.get(j);
//					System.out.println(memberVo.toString());
//					// 행 생성
//					bodyRow = sheet.createRow(j + 1);
//					// 회원 이메일
//					bodyCell = bodyRow.createCell(0);
//					bodyCell.setCellValue(memberVo.getMem_email());
//					// 회원 이름
//					bodyCell = bodyRow.createCell(1);
//					bodyCell.setCellValue(memberVo.getMem_name());
//					// 회원 권한
//					bodyCell = bodyRow.createCell(2);
//					bodyCell.setCellValue(memberVo.getMem_athr());
//					// 농부 신청
//					bodyCell = bodyRow.createCell(3);
//					bodyCell.setCellValue(memberVo.getMem_fm_req());
//					// 농부 신청 결과
//					bodyCell = bodyRow.createCell(4);
//					bodyCell.setCellValue(memberVo.getMem_fm_result());
//
//				} // for j
//
//			} // if
//
//		} // for i
//
//		return workbook;
//
//	}
//
//	/**
//	 * 생성한 엑셀 워크북을 컨트롤레에서 받게해줄 메소드
//	 * 
//	 * @param list
//	 * @return
//	 */
//	public SXSSFWorkbook excelFileDownloadProcess(JSONArray jArray) {
//		return this.makeSimpleExcelWorkbook(jArray);
//	}
//
//}