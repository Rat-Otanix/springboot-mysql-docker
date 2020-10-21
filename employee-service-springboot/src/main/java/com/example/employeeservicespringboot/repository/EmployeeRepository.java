package com.example.employeeservicespringboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.employeeservicespringboot.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

	// that's it ... no need to write any code LOL!
	
	// add a method to sort by last name
	public List<Employee> findAllByOrderByLastNameAsc();
	
}
