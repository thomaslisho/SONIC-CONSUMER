package com.punisher;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.punisher.model.Student;

@Controller
public class StudentController {
	@Autowired
	RestTemplate restTemplate;
	ObjectMapper mapper = new ObjectMapper();
	HttpHeaders headers = new HttpHeaders();
	static final String SONIC_URL = "http://localhost:8888/student/";
	{
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
	}
	
	@PostMapping("add")
	public String addStudent(Student st){   
	    HttpEntity <Student> entity = new HttpEntity<Student>(st, headers);
	    restTemplate.exchange(SONIC_URL, HttpMethod.POST, entity, String.class);
	    return "redirect:/";
	}
	
	@RequestMapping("saveOrUpdate")
	public String updateStudent(Student st){
		System.out.println(st);
	    HttpEntity <Student> entity = new HttpEntity<Student>(st, headers);
	    restTemplate.exchange(SONIC_URL, HttpMethod.PUT, entity, String.class);
	    return "redirect:/";
	}
	
	@RequestMapping("/")
	public ModelAndView home() throws JsonProcessingException {
	    HttpEntity <String> entity = new HttpEntity<String>(headers);
	    String s =  restTemplate.exchange(SONIC_URL, HttpMethod.GET, entity, String.class).getBody();
	    return new ModelAndView("home.jsp").
	    		   addObject("list", mapper.readValue(s, new TypeReference<List<Student>>(){}));
	}
	
	@GetMapping("update")
	public ModelAndView updatePage(int id) throws JsonMappingException, JsonProcessingException {
		HttpEntity <String> entity = new HttpEntity<String>(headers);
	    String s =  restTemplate.exchange(SONIC_URL+id, HttpMethod.GET, entity, String.class).getBody();
		Student st = mapper.readValue(s, new TypeReference<Student>() {});
		return new ModelAndView("edit.jsp").addObject("st", st);
	}

	@RequestMapping("delete/{id}")
	public String deleteStudent(@PathVariable int id) {
	    HttpEntity<Student> entity = new HttpEntity<Student>(headers);
	    if(restTemplate.exchange(SONIC_URL+id, HttpMethod.DELETE, entity, Boolean.class).getBody())
	    System.out.println("Deleted the Student with ID: "+id);
	    return "redirect:/";
	}
	
}
