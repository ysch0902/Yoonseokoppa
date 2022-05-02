package global.sesoc.Project_3jo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.Project_3jo.dao.MemberDAO;
import global.sesoc.Project_3jo.vo.MemberVO;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	MemberDAO dao;
	
	//수령인 등록처리..?
	@RequestMapping(value = "order", method = RequestMethod.POST)
	public String order(MemberVO member) {
		int result = dao.insertMember(member);
		if (result != 1) {
			//DB저장에 실패한 경우 가입폼으로 이동
			return "redirect:/";
		}
		//저장 성공한 경우 메인화면으로 이동		
		return "orderconfirmed";
	}
	
}
