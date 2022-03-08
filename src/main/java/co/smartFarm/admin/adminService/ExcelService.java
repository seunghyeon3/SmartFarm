package co.smartFarm.admin.adminService;

import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.smartFarm.user.memberService.MemberService;
import co.smartFarm.user.memberService.MemberVO;

@Repository("excelDao")
public class ExcelService {

	@Autowired
	MemberService memberDao;

	// ===== 엑셀 다운로드 하기 위한 생성자 =====

	// ===== 회원 리스트 =====
	public List<MemberVO> makeMemberList() {

		List<MemberVO> list = memberDao.memberSelectList();
		List<MemberVO> resultList = new ArrayList<MemberVO>();

		for (MemberVO li : list) {
			MemberVO memberVo = new MemberVO(li.getMem_email(), li.getMem_name(), li.getMem_athr(), li.getMem_fm_req(),
					li.getMem_fm_result());

			resultList.add(memberVo);
		}

		return resultList;
	}

	/**
	 * 리스트를 간단한 엑셀 워크북 객체로 생성
	 * 
	 * @param list
	 * @return 생성된 워크북
	 */

//	 1. json 형식으로 startDate, endDate, 목록 받아오기(ex 매출, 작물 ...)
//	 2. json에서 목록이랑 startDate, endDate 받아와서 if문 돌리기
//	 		-if문 돌리면서 생성자 만들어서 알아서 잘 돌리기
//	 3. workbook 하나로 합쳐서 잘 넣어보기

	// ===== 회원 리스트를 간단한 엑셀 워크북 객체로 생성 =====
	public SXSSFWorkbook makeSimpleExcelWorkbook(List<String> list) {

		SXSSFWorkbook workbook = new SXSSFWorkbook();

		if (true) {// 회원리스트의 경우
			List<MemberVO> memList = new ArrayList<MemberVO>();
			// 시트 생성
			SXSSFSheet sheet = workbook.createSheet("회원");

			// 시트 열 너비 설정
			sheet.setColumnWidth(0, 18000);
			sheet.setColumnWidth(0, 18000);
			sheet.setColumnWidth(0, 18000);
			sheet.setColumnWidth(0, 18000);
			sheet.setColumnWidth(0, 18000);

			// 헤더 행 생
			Row headerRow = sheet.createRow(0);
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
			for (int i = 0; i < memList.size(); i++) {

				MemberVO memberVo = memList.get(i);
				System.out.println(memberVo.toString());
				// 행 생성
				bodyRow = sheet.createRow(i + 1);
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
			}
		}//if
		
		return workbook;
	}

	/**
	 * 생성한 엑셀 워크북을 컨트롤레에서 받게해줄 메소드
	 * 
	 * @param list
	 * @return
	 */
	public SXSSFWorkbook excelFileDownloadProcess(List<String> list) {
		return this.makeSimpleExcelWorkbook(list);
	}

}