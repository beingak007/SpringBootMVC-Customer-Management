package in.akash.service;
import java.util.List;

import in.akash.model.Customer;


public interface ICustomerService {
	public List<Customer> getCustomers();
	public void saveCustomer(Customer customer);
	public Customer getCustomerById(Integer id);
	public void deleteCustomerById(Integer id);
}
