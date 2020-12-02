package org.kosta.model;

import java.util.ArrayList;
import java.util.List;

public interface CustomerDAO {

	CustomerVO findCustomerById(String id);

	List<CustomerVO> findCustomerListByAddress(String address);

	void registerCustomer(CustomerVO cvo);

}