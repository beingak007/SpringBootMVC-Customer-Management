package in.akash.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import in.akash.model.Customer;
import in.akash.service.ICustomerService;


@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
	
	@Autowired
	private ICustomerService service;
	
	//Data Rendering:: Data is traveling from controller to View:
	
	@GetMapping(value = "/list")
	public String listCustomers(Map<String, Object> map) {
		
		//Retrieving:
		List<Customer> customers = service.getCustomers();
		customers.forEach(System.out::println);
		
		map.put("customers", customers);
		
		return "list-customers";
	}
	
	@GetMapping(value = "/showForm")
	public String showFormForAdd(Map<String, Object> map) {
		
		Customer customer = new Customer();
		map.put("customer", customer);
		
		return "customer-form";
	}
	
	 
	//Data Binding: Data is coming from the view to the controller:
	
	//Save customer and insert customer both. Since we're using Data JPA, if id == null then insert else update.
	
	@PostMapping(value = "/saveCustomer")
	public String saveCustomer(@ModelAttribute(value = "customer")Customer customer) {
		System.out.println(customer);
		
		//Data Inserting in the DataBase
		service.saveCustomer(customer);
		
		return "redirect:/customer/list";
	}
	
	
	@GetMapping(value = "/showFormUpdate")
	public String showFormUpdate(@RequestParam(value = "customerId") Integer id, Map<String, Object> map) {
		
		Customer customer = service.getCustomerById(id);
		map.put("customer", customer);
		
		return  "customer-form";
	}
	
	
	@GetMapping(value = "/showFormDelete")
	public String showFormDelete(@RequestParam(value = "customerId") Integer id) {
		service.deleteCustomerById(id);
		return "redirect:/customer/list";
	}
	
}


