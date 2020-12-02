package org.kosta.model;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public class CustomerDAOImp implements CustomerDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public CustomerVO findCustomerById(String id) {
		CustomerVO cvo = template.selectOne("customer.findCustomerById", id);
		return cvo;
	}
	@Override
	public List<CustomerVO> findCustomerListByAddress(String address){
		List<CustomerVO> list =new LinkedList<CustomerVO>();
		list = template.selectList("customer.findCustomerListByAddress",address);
		return list;
	}
	@Override
	public void registerCustomer(CustomerVO cvo){
		 template.insert("customer.registerCustomer", cvo);
	}
	
}
