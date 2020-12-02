package org.kosta.controller;

import java.util.List;

import org.kosta.model.CustomerDAO;
import org.kosta.model.CustomerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerController {
	
		@Autowired
		private CustomerDAO customerDAO;
		
		@GetMapping("findCustomerById.do")
		public ModelAndView findCustomerById(String id) {
			CustomerVO cvo = customerDAO.findCustomerById(id);
			if(cvo != null)
				return new ModelAndView("find-customer-ok","findCustomerById",cvo);
			else
				return new ModelAndView("find-customer-fail");
		}
		@GetMapping("findCustomerListByAddress.do")
		public ModelAndView findCustomerListByAddress(String address) {
			List<CustomerVO>  list = customerDAO.findCustomerListByAddress(address);
			if(list!=null)
				return new ModelAndView("findbyAddress_ok","findCustomerListByAddress",list);
			else
				return new ModelAndView("findbyAddress_fail");
		}
		@PostMapping("registerCustomer.do")
		public String  registerCustomer(CustomerVO registerCVO) {
			System.out.println(registerCVO.getId());
			CustomerVO IsId = customerDAO.findCustomerById(registerCVO.getId());
			if(IsId == null) {
				customerDAO.registerCustomer(registerCVO);
				return "redirect:registerCustomerResult.do?id="+registerCVO.getId();
//				return "redirect:views/register_customer_result.jsp";
			}
			else
				return "redirect:views/duplicatedId_result.jsp";
		}
		
		@RequestMapping("registerCustomerResult.do")
		public ModelAndView registerCustomerResult(String id) {
			return new ModelAndView("register_customer_result","cvo",customerDAO.findCustomerById(id));
		}
		
}
