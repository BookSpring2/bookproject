package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
@RequestMapping("member/")
public class MemberController {
	// dao 불러오기
	@Autowired
	private MemberDAO dao;
	
	// 회원가입 화면이동
	@GetMapping("join.do")
	public String member_join(Model model)
	{
		model.addAttribute("main_jsp","../member/join.jsp");
		return "main/main";
	}
	

	// 아이디 중복체크
	@GetMapping("idcheck.do")
	@ResponseBody
	public String member_idcheck(String id)
	{
		String msg="";
		int count=dao.memberIdCheck(id);
		msg=String.valueOf(count);
		return msg;
	}
	
	// 회원가입폼 전송
	@PostMapping("join_ok.do")
	public String member_join_ok(MemberVO vo)
	{
		dao.memberInsert(vo);
		return "redirect:../main/main.do";
	}
	
	// 로그인화면 이동
	@GetMapping("login.do")
	public String member_login_ok(Model model)
	{
		model.addAttribute("main_jsp","../member/login.jsp");
		return "main/main";
	}
	
	// 로그인처리
	@PostMapping("login_ok.do")
	@ResponseBody
	public String member_login_ok(String id,String pwd,HttpSession session)
	{
		String msg="";
		MemberVO vo=dao.isLogin(id, pwd);
		if(vo.getMsg().equals("OK"))
		{
			session.setAttribute("id", vo.getUser_id());
			session.setAttribute("name", vo.getName());
		}
		msg=vo.getMsg();
		return msg;
	}
	
	// 로그아웃처리
	@GetMapping("logout.do")
	public String member_logout(HttpSession session)
	{
		  session.invalidate();
		  return "redirect:../main/main.do";
	}
	
}
