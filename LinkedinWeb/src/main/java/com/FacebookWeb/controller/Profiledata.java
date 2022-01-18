package com.FacebookWeb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.FacebookWeb.entity.FacebookUser;
import com.FacebookWeb.service.FacebookServiceInterface;
import com.FacebookWeb.utility.ServiceFactory;
import com.google.gson.Gson;

/**
 * Servlet implementation class Profiledata
 */
public class Profiledata extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
	PrintWriter out=response.getWriter();
		
		
		String email=request.getParameter("searchProfile");
		
		FacebookUser fbu=new FacebookUser();
		fbu.setEmail(email);
		FacebookServiceInterface facebookservice=ServiceFactory.createObject();
		FacebookUser fbuData=facebookservice.loadProfile(fbu);
		
		System.out.println(fbuData.getCity());
		System.out.println(fbuData.getAge());
		
		Gson json=new Gson();
		String fbuDataJson=json.toJson(fbuData);
		System.out.println(fbuDataJson);
		out.println(fbuDataJson);
		
		
		
		
//		FacebookUser fbudataSend=new FacebookUser();
//		fbudataSend.setAge(age);
//		fbudataSend.setCity(city);
//		fbudataSend.set(city);
//		fbudataSend.setEmail(email);
		
//		Hibernate.initialize(fbuData);
	/*	FacebookUser fbhi= initializeAndUnproxy(fbuData);*/
		
	}
	
	
//	public static <T> T initializeAndUnproxy(T entity) {
//	    if (entity == null) {
//	        throw new 
//	           NullPointerException("Entity passed for initialization is null");
//	    }
//
////	    Hibernate.initialize(entity);
//	    if (entity instanceof HibernateProxy) {
//	        entity = (T) ((HibernateProxy) entity).getHibernateLazyInitializer()
//	                .getImplementation();
//	    }
//	    return entity;
//	}


}
