package in.akash.service;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.akash.dao.ICustomerDAO;
import in.akash.model.Customer;


@Service
public class CustomerServiceImpl implements ICustomerService {

	@Autowired
	private ICustomerDAO repo;
	
	
	@Override
	public List<Customer> getCustomers() {
		return (List<Customer>) repo.findAll();
	}


	@Override
	public void saveCustomer(Customer customer) {
		repo.save(customer);
	}

	
	@Override
	public Customer getCustomerById(Integer id) {
		Optional<Customer> optional = repo.findById(id);
		return optional.get();
	}


	@Override
	public void deleteCustomerById(Integer id) {
		repo.deleteById(id);
	}

}
