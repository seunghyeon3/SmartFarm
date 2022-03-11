package co.smartFarm.admin.adminService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.DateFormatter;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import co.smartFarm.NFT.service.NftService;
import co.smartFarm.NFT.service.NftVO;
import co.smartFarm.kit.kitService.KitService;
import co.smartFarm.kit.kitService.KitVO;
import co.smartFarm.plant.plantService.PlantService;
import co.smartFarm.plant.plantService.PlantVO;
import co.smartFarm.shopping.purHisService.PurHisService;
import co.smartFarm.shopping.purHisService.PurHisVO;
import co.smartFarm.user.memberService.MemberService;
import co.smartFarm.user.memberService.MemberVO;

@Repository("excelDao")
public class ExcelService {

	@Autowired
	MemberService memberDao;

	@Autowired
	KitService kitDao;

	@Autowired
	PlantService plantDao;

	@Autowired
	NftService nftDao;

	@Autowired
	PurHisService purHisDao;

	// ===== 회원 리스트를 간단한 엑셀 워크북 객체로 생성 =====
	public SXSSFWorkbook makeSimpleExcelWorkbook(JSONArray excelList) {

		SXSSFWorkbook workbook = new SXSSFWorkbook();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		for (int i = 0; i < excelList.length(); i++) {

			JSONObject jObj = (JSONObject) excelList.get(i);
			String menu = jObj.getString("menu");

			if (menu.equals("sales")) {// 매출인 경우
				System.out.println("확인하기 !! ===========================");
				
				PurHisVO insertVo = new PurHisVO();
				insertVo.setEnd_date(jObj.getString("endDate"));
				insertVo.setStart_date(jObj.getString("startDate"));
				System.out.println(insertVo.toString());
				List<PurHisVO> list = purHisDao.adminPurHisSelectList(insertVo);
				System.out.println(list.toString());
				
				// 시트 생성
				SXSSFSheet sheetSales = workbook.createSheet("매출");

				// 시트 열 너비 설정
				sheetSales.setColumnWidth(0, 3000);
				sheetSales.setColumnWidth(1, 2000);
				sheetSales.setColumnWidth(2, 5000);
				sheetSales.setColumnWidth(3, 5000);
				sheetSales.setColumnWidth(4, 5000);

				// 헤더 행 생
				Row headerRow = sheetSales.createRow(0);
				
				// 해당 행의 첫번째 열 셀 생성
				Cell headerCell = headerRow.createCell(0);
				headerCell.setCellValue("일자");
				// 해당 행의 두번째 열 셀 생성
				headerCell = headerRow.createCell(1);
				headerCell.setCellValue("판매수");
				// 해당 행의 세번째 열 셀 생성
				headerCell = headerRow.createCell(2);
				headerCell.setCellValue("작물판매금액");
				// 해당 행의 네번째 열 셀 생성
				headerCell = headerRow.createCell(3);
				headerCell.setCellValue("키트판매금액");
				// 해당 행의 네번째 열 셀 생성
				headerCell = headerRow.createCell(4);
				headerCell.setCellValue("총 구매금액");

				// 회원 리스트 내용 행 및 셀 생성
				Row bodyRow = null;
				Cell bodyCell = null;
				for (int j = 0; j < list.size(); j++) {

					PurHisVO purhisVo = list.get(j);
					System.out.println(purhisVo.toString());
					// 행 생성
					bodyRow = sheetSales.createRow(j + 1);
					
					// 일자
					bodyCell = bodyRow.createCell(0);
					bodyCell.setCellValue(purhisVo.getPur_his_pur_day());
					// 판매수
					bodyCell = bodyRow.createCell(1);
					bodyCell.setCellValue(purhisVo.getPur_count());
					// 작물판매금액
					bodyCell = bodyRow.createCell(2);
					bodyCell.setCellValue(purhisVo.getPlant_sum());
					// 키트판매금액
					bodyCell = bodyRow.createCell(3);
					bodyCell.setCellValue(purhisVo.getKit_sum());
					// 총구매액
					bodyCell = bodyRow.createCell(4);
					bodyCell.setCellValue(purhisVo.getPur_sum());

				} // for jf
				
			} else if (menu.equals("kit")) {// 키트인 경우

				List<KitVO> list = new ArrayList<KitVO>();
				list = kitDao.adminKitSelectList();

				// 시트 생성
				SXSSFSheet sheetKit = workbook.createSheet("키트");

				// 시트 열 너비 설정
				sheetKit.setColumnWidth(0, 5000);
				sheetKit.setColumnWidth(1, 2000);
				sheetKit.setColumnWidth(2, 2000);
				sheetKit.setColumnWidth(3, 2000);
				sheetKit.setColumnWidth(4, 2000);
				sheetKit.setColumnWidth(5, 2000);
				sheetKit.setColumnWidth(6, 2000);
				sheetKit.setColumnWidth(7, 2000);
				sheetKit.setColumnWidth(8, 2000);
				sheetKit.setColumnWidth(9, 2000);
				sheetKit.setColumnWidth(10, 5000);
				sheetKit.setColumnWidth(11, 2000);
				sheetKit.setColumnWidth(12, 2000);
				// 헤더 행 생
				Row headerRow = sheetKit.createRow(0);
				Cell headerCell = headerRow.createCell(0);
				headerCell.setCellValue("키트 이름");

				headerCell = headerRow.createCell(1);
				headerCell.setCellValue("용도");

				headerCell = headerRow.createCell(2);
				headerCell.setCellValue("분류");

				headerCell = headerRow.createCell(3);
				headerCell.setCellValue("재배기간");

				headerCell = headerRow.createCell(4);
				headerCell.setCellValue("적정온도");

				headerCell = headerRow.createCell(5);
				headerCell.setCellValue("습도");

				headerCell = headerRow.createCell(6);
				headerCell.setCellValue("일사량");

				headerCell = headerRow.createCell(7);
				headerCell.setCellValue("급액양");

				headerCell = headerRow.createCell(8);
				headerCell.setCellValue("농약양");

				headerCell = headerRow.createCell(9);
				headerCell.setCellValue("키트가격");

				headerCell = headerRow.createCell(10);
				headerCell.setCellValue("조회수");

				headerCell = headerRow.createCell(11);
				headerCell.setCellValue("판매수");

				headerCell = headerRow.createCell(12);
				headerCell.setCellValue("판매 현황");

				// 회원 리스트 내용 행 및 셀 생성
				Row bodyRow = null;
				Cell bodyCell = null;
				for (int j = 0; j < list.size(); j++) {

					KitVO kitVo = list.get(j);

					// 행 생성
					bodyRow = sheetKit.createRow(j + 1);
					// 이름
					bodyCell = bodyRow.createCell(0);
					bodyCell.setCellValue(kitVo.getKit_name());
					// 용도
					bodyCell = bodyRow.createCell(1);
					bodyCell.setCellValue(kitVo.getKit_prpos());
					// 분류
					bodyCell = bodyRow.createCell(2);
					bodyCell.setCellValue(kitVo.getKit_plant_class());

					// 재배기간
					bodyCell = bodyRow.createCell(3);
					bodyCell.setCellValue(kitVo.getKit_grow_day());

					// 적정온도
					bodyCell = bodyRow.createCell(4);
					bodyCell.setCellValue(kitVo.getKit_tp());

					// 습도
					bodyCell = bodyRow.createCell(5);
					bodyCell.setCellValue(kitVo.getKit_hd());

					// 일사량
					bodyCell = bodyRow.createCell(6);
					bodyCell.setCellValue(kitVo.getKit_sun());

					// 급액양
					bodyCell = bodyRow.createCell(7);
					bodyCell.setCellValue(kitVo.getKit_water());

					// 농약양
					bodyCell = bodyRow.createCell(8);
					bodyCell.setCellValue(kitVo.getKit_pes());

					// 키트가격
					bodyCell = bodyRow.createCell(9);
					bodyCell.setCellValue(kitVo.getKit_price());

					// 조회수
					bodyCell = bodyRow.createCell(10);
					bodyCell.setCellValue(kitVo.getKit_hit());

					// 판매수
					bodyCell = bodyRow.createCell(11);
					bodyCell.setCellValue(kitVo.getKit_sale_count());

					// 관리현황
					bodyCell = bodyRow.createCell(12);
					bodyCell.setCellValue(kitVo.getKit_sale_whet());

				} // for j

			} else if (menu.equals("plant")) {// 작물인 경우

				List<PlantVO> list = new ArrayList<PlantVO>();
				list = plantDao.adminSelectPlant();
				// 시트 생성
				SXSSFSheet sheetPlant = workbook.createSheet("작물");

				// 시트 열 너비 설정
				sheetPlant.setColumnWidth(0, 3500);
				sheetPlant.setColumnWidth(1, 3000);
				sheetPlant.setColumnWidth(2, 3000);
				sheetPlant.setColumnWidth(3, 3000);
				sheetPlant.setColumnWidth(4, 3000);
				sheetPlant.setColumnWidth(5, 3000);

				// 헤더 행 생
				Row headerRow = sheetPlant.createRow(0);
				// 해당 행의 첫번째 열 셀 생성
				Cell headerCell = headerRow.createCell(0);
				headerCell.setCellValue("작물 이름");
				// 해당 행의 두번째 열 셀 생성
				headerCell = headerRow.createCell(1);
				headerCell.setCellValue("작물 등급");
				// 해당 행의 세번째 열 셀 생성
				headerCell = headerRow.createCell(2);
				headerCell.setCellValue("작물 종류");
				// 해당 행의 네번째 열 셀 생성
				headerCell = headerRow.createCell(3);
				headerCell.setCellValue("회원");
				// 해당 행의 네번째 열 셀 생성
				headerCell = headerRow.createCell(4);
				headerCell.setCellValue("총재배량");
				// 해당 행의 네번째 열 셀 생성
				headerCell = headerRow.createCell(5);
				headerCell.setCellValue("생산일");

				// 회원 리스트 내용 행 및 셀 생성
				Row bodyRow = null;
				Cell bodyCell = null;
				for (int j = 0; j < list.size(); j++) {

					PlantVO plantVo = list.get(j);

					// 행 생성
					bodyRow = sheetPlant.createRow(j + 1);

					// 작물이름
					bodyCell = bodyRow.createCell(0);
					bodyCell.setCellValue(plantVo.getPlant_name());
					// 작물등급
					bodyCell = bodyRow.createCell(1);
					bodyCell.setCellValue(plantVo.getPlant_grd());
					// 작물종류
					bodyCell = bodyRow.createCell(2);
					bodyCell.setCellValue(plantVo.getPlant_class());
					// 회원
					bodyCell = bodyRow.createCell(3);
					bodyCell.setCellValue(plantVo.getMem_email());
					// 총재배량
					bodyCell = bodyRow.createCell(4);
					bodyCell.setCellValue(plantVo.getPlant_tot_grow_amnt());
					// 생산일
					bodyCell = bodyRow.createCell(5);
					bodyCell.setCellValue(plantVo.getPlant_proc_day());

				} // for j

			} else if (menu.equals("member")) { // excelList에 member가 있는 경우
				// 생성자 받아오기
				List<MemberVO> memList = memberDao.memberSelectList();

				// 시트 생성
				SXSSFSheet sheetMember = workbook.createSheet("회원");

				// 시트 열 너비 설정
				sheetMember.setColumnWidth(0, 7000);
				sheetMember.setColumnWidth(1, 3000);
				sheetMember.setColumnWidth(2, 3000);
				sheetMember.setColumnWidth(3, 5000);
				sheetMember.setColumnWidth(4, 5000);

				// 헤더 행 생
				Row headerRow = sheetMember.createRow(0);
				// 해당 행의 첫번째 열 셀 생성
				Cell headerCell = headerRow.createCell(0);
				headerCell.setCellValue("회원 이메일");
				// 해당 행의 두번째 열 셀 생성
				headerCell = headerRow.createCell(1);
				headerCell.setCellValue("회원 이름");
				// 해당 행의 세번째 열 셀 생성
				headerCell = headerRow.createCell(2);
				headerCell.setCellValue("회원 권한");
				// 해당 행의 네번째 열 셀 생성
				headerCell = headerRow.createCell(3);
				headerCell.setCellValue("농부 신청");
				// 해당 행의 네번째 열 셀 생성
				headerCell = headerRow.createCell(4);
				headerCell.setCellValue("신청 승인");

				// 회원 리스트 내용 행 및 셀 생성
				Row bodyRow = null;
				Cell bodyCell = null;
				for (int j = 0; j < memList.size(); j++) {

					MemberVO memberVo = memList.get(j);
					System.out.println(memberVo.toString());
					// 행 생성
					bodyRow = sheetMember.createRow(j + 1);
					// 회원 이메일
					bodyCell = bodyRow.createCell(0);
					bodyCell.setCellValue(memberVo.getMem_email());
					// 회원 이름
					bodyCell = bodyRow.createCell(1);
					bodyCell.setCellValue(memberVo.getMem_name());
					// 회원 권한
					bodyCell = bodyRow.createCell(2);
					bodyCell.setCellValue(memberVo.getMem_athr());
					// 농부 신청
					bodyCell = bodyRow.createCell(3);
					bodyCell.setCellValue(memberVo.getMem_fm_req());
					// 농부 신청 결과
					bodyCell = bodyRow.createCell(4);
					bodyCell.setCellValue(memberVo.getMem_fm_result());

				} // for j

			} else if (menu.equals("nft")) { // excelList에 nft가 있는 경우

				List<NftVO> list = nftDao.adminNftSelectList();
				// 시트 생성
				SXSSFSheet sheetNft = workbook.createSheet("NFT");

				// 시트 열 너비 설정
				sheetNft.setColumnWidth(0, 3000);
				sheetNft.setColumnWidth(1, 3000);
				sheetNft.setColumnWidth(2, 3000);
				sheetNft.setColumnWidth(3, 3000);
				sheetNft.setColumnWidth(4, 5000);
				sheetNft.setColumnWidth(5, 3000);

				// 헤더 행 생
				Row headerRow = sheetNft.createRow(0);
				Cell headerCell = headerRow.createCell(0);
				headerCell.setCellValue("키트 번호");

				headerCell = headerRow.createCell(1);
				headerCell.setCellValue("용도");

				headerCell = headerRow.createCell(2);
				headerCell.setCellValue("작물 분류");

				headerCell = headerRow.createCell(3);
				headerCell.setCellValue("작물 등급");

				headerCell = headerRow.createCell(4);
				headerCell.setCellValue("키트 이름");

				headerCell = headerRow.createCell(5);
				headerCell.setCellValue("nft 합계");

				// 회원 리스트 내용 행 및 셀 생성
				Row bodyRow = null;
				Cell bodyCell = null;
				for (int j = 0; j < list.size(); j++) {

					NftVO nftVo = list.get(j);
					System.out.println(nftVo.toString());
					// 행 생성
					bodyRow = sheetNft.createRow(j + 1);

					// 키트번호
					bodyCell = bodyRow.createCell(0);
					bodyCell.setCellValue(nftVo.getKit_no());
					// 용도
					bodyCell = bodyRow.createCell(1);
					bodyCell.setCellValue(nftVo.getKit_prpos());
					// 작물분류
					bodyCell = bodyRow.createCell(2);
					bodyCell.setCellValue(nftVo.getKit_plant_class());
					// 작물등급
					bodyCell = bodyRow.createCell(3);
					bodyCell.setCellValue(nftVo.getGrow_diary_grd());
					// 키트이름
					bodyCell = bodyRow.createCell(4);
					bodyCell.setCellValue(nftVo.getKit_name());
					// nft 합계
					bodyCell = bodyRow.createCell(5);
					bodyCell.setCellValue(nftVo.getKit_sum());

				} // for j

			} // if

		} // for i

		return workbook;

	}

	/**
	 * 생성한 엑셀 워크북을 컨트롤레에서 받게해줄 메소드
	 * 
	 * @param list
	 * @return
	 */
	public SXSSFWorkbook excelFileDownloadProcess(JSONArray jArray) {
		return this.makeSimpleExcelWorkbook(jArray);
	}

}