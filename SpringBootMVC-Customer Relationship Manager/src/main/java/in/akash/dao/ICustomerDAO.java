package in.akash.dao;

import org.springframework.data.repository.CrudRepository;

import in.akash.model.Customer;

public interface ICustomerDAO extends CrudRepository<Customer, Integer> {

}
