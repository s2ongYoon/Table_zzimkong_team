package com.table.zzimkong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.table.zzimkong.service.PaymentService;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.ReservationVO;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService service;
		
	@GetMapping("payment")
	public String payment(HttpSession session, Model model, HttpServletRequest request,
								@Param("res_num") int res_num, @Param("user_id") int user_id) {
		// 세션에 저장된 아이디로 회원정보확인 하기 위해 일단 세션에 임의의 값 넣음
		session.setAttribute("uId", "user2");
		
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "login");
			return "forward";
		}
		
		System.out.println(session.getAttribute("uId"));
		
		// 예약정보를 불러오기 위해 임의로 값넣음
		request.setAttribute("res_num", res_num);
		
		// 예약정보조회
		ReservationVO resForPay = service.getReservation(res_num);
		
		// 포인트조회
		MemberVO member = service.getPoint(user_id);
		
		model.addAttribute("res", resForPay);
		
		return "payment/payment";
	}
	
	@PostMapping("paymentPro")
	public String paymentPro(HttpSession session, Model model) {
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "login");
			return "forward";
		}
		
		return"";
	}

	@GetMapping("payment/info")
	public String payment_info(HttpSession session, Model model) {
		
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "login");
			return "forward";
		}
		
		
		return "payment/payment_info";
	}
}
