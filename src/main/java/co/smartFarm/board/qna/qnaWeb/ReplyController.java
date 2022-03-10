package co.smartFarm.board.qna.qnaWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.smartFarm.board.qna.qnaService.QnaVO;
import co.smartFarm.board.qna.qnaService.ReplyService;
import co.smartFarm.board.qna.qnaService.ReplyVO;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyDao;

//	@RequestMapping(value = "/replyadd.do")
//	@ResponseBody
//	public String replyInsert(@RequestBody ReplyVO reply, Model model, HttpServletRequest request)
//			throws IllegalStateException, IOException {
//		HttpSession session = request.getSession();
//		MemberVO memberVO = (MemberVO) session.getAttribute("member");
//		try {
//
//			reply.setMem_name(memberVO.getMem_name());
//			replyDao.replyInsert(reply);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "success";
//
//	}
//
//	@RequestMapping(value = "/replycommend.do")
//	@ResponseBody
//	public List<ReplyVO> ajax_commentList(@RequestBody ReplyVO replyVO, HttpServletRequest request) throws Exception {
//
//		// 해당 게시물 댓글
//		return replyDao.replySelectList(replyVO);
//
//	}
	 //답글 등록 Form
	 @RequestMapping(value = "/replyinsertForm.do")
	 public String replyInsert(Model model,QnaVO qnavo) {		  		 
		 return "board/replyinsertForm";
	 }		
	//답글 쓰기
	 @RequestMapping(value = "/replyinsert.do")
	 public String replyInsert(ReplyVO reply, Model model) {
		replyDao.replyInsert(reply);
		model.addAttribute("reply", replyDao.replySelectList());
		return "redirect:/qna.do?reply.no";
		 
	 }
}
