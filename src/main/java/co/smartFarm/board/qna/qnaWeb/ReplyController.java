package co.smartFarm.board.qna.qnaWeb;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.smartFarm.board.qna.qnaService.ReplyService;
import co.smartFarm.board.qna.qnaService.ReplyVO;
import co.smartFarm.user.memberService.MemberVO;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyDao;

	@RequestMapping(value = "/replyadd.do")
	@ResponseBody
	public String replyInsert(@RequestBody ReplyVO reply, HttpServletRequest request) // requestbody replyvo 맵핑 
			throws IllegalStateException, IOException {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); 
		try {

			reply.setMem_name(memberVO.getMem_name());
			replyDao.replyInsert(reply);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";

	}

	@RequestMapping(value = "/replycommend.do")
	@ResponseBody
	public List<ReplyVO> ajax_commentList(@RequestBody ReplyVO replyVO, HttpServletRequest request) throws Exception {
         // 받은 데이터 requestbody에 보내서 replyvo에 맵핑   
		// 해당 게시물 댓글
		return replyDao.replySelectList(replyVO); 

	}
	// 답글 삭제
	
	 @RequestMapping(value = "/replydelete.do") 
	 public String replyDelete(@RequestParam(value = "reply_no") int reply_no, Model model) {
		 System.out.println(reply_no); 
		 ReplyVO reply = new ReplyVO();
		 reply.setReply_no(reply_no);
		 replyDao.replyDelete(reply);
		 model.addAttribute("reply", replyDao.replySelectList()); 
		 return "redirect:/qnaselect.do"; 
	 }
	 
	 
}
