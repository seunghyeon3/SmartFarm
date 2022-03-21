package co.smartFarm.shopping.purHisWeb;

import java.util.ArrayList;
import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.smartFarm.shopping.purHisService.PurHisService;
import co.smartFarm.shopping.purHisService.PurHisVO;
import co.smartFarm.user.memberService.MemberVO;

@Controller
public class PurHisController {

   @Autowired
   PurHisService purHisDao;

   // ===== 구매 후 pur_his 테이블에 구매내역 입력 + cart 테이블에서 구매한 내역 삭제 =====
   @PostMapping(value = "/insertPurHis.do", produces = "application/text;charset=utf8")
   @ResponseBody
   public String insertPurHis(@RequestBody String req) {

      System.out.println(req);
      JSONArray jArray = new JSONArray(req);
      List<PurHisVO> list = new ArrayList<PurHisVO>();
      JSONObject memObj = jArray.getJSONObject(jArray.length() - 1);
      System.out.println("====");
      System.out.println(memObj.toString());
      for (int i = 0; i < jArray.length() - 1; i++) {
         JSONObject jObject = jArray.getJSONObject(i);
         PurHisVO purhisVo = new PurHisVO();

         if (jObject.getString("cart_option").contains("K")) {
            int kitNo = Integer.parseInt(jObject.getString("cart_option").substring(1));
            purhisVo.setKit_no(kitNo);
            purhisVo.setPlant_sale_no(0);
         } else {
            int plantNo = Integer.parseInt(jObject.getString("cart_option").substring(1));
            purhisVo.setPlant_sale_no(plantNo);
            purhisVo.setKit_no(0);
         }
         purhisVo.setMem_email(jObject.getString("mem_email"));

         purhisVo.setPur_his_addr(memObj.getString("buyer_addr"));
         purhisVo.setPur_his_recv(memObj.getString("buyer_name"));
         purhisVo.setPur_his_price(jObject.getInt("cart_price"));
         purhisVo.setPur_his_sale_count(jObject.getInt("cart_sale_count"));
         purhisVo.setPur_his_tel(memObj.getString("buyer_tel"));
         list.add(purhisVo);
      }
      
      for (int i = 0; i < list.size(); i++) {
         purHisDao.purHisInsert(list.get(i));
      }
      
      return "1";
   }
   
   @RequestMapping("purHisSelect.do")
   @ResponseBody
   public List<PurHisVO> purHisSelect(){
      if(SecurityContextHolder.getContext().getAuthentication().getPrincipal()  instanceof MemberVO) {
         MemberVO memberVo =  (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
         return purHisDao.purHisSelect(memberVo.getMem_email());
         
      }
      return null;
      
   }
   
   // ===== 구매하고 하루 뒤에 배송상태를 C1(배송시작)으로 변경, 사흘 뒤에는 C2(배송완료)로 변경 =====
   @Scheduled(cron="0 0 17 * * *")
   public void changeState () {
	   int result = purHisDao.selectPurHisCount();
	   if(result>0) {
		   purHisDao.purHisUpdateState();
	   }
   }
}
