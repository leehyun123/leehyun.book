<%@page import="leehyun.book.order.domain.Order"%>
<%@page import="leehyun.book.order.service.OrderServiceImpl"%>
<%@page import="leehyun.book.order.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	OrderService orderService = new OrderServiceImpl();
	
	int orderNum = 0;
	try{
		orderNum = Integer.parseInt(request.getParameter("orderNum"));
	}catch(Exception e){
		request.setAttribute("msgFail", 1);
%>
		<jsp:forward page="ingDeliOut.jsp" />
<%
	}
	Order order = orderService.findOrder(orderNum);
	order.setDeliveryStatus("배송전");
	orderService.correctOrder(order);
	request.setAttribute("msgSuc", 1);
%>
<jsp:forward page="ingDeliOut.jsp" />