<%@page import="leehyun.book.order.service.OrderBooksServiceImpl"%>
<%@page import="leehyun.book.order.service.OrderBooksService"%>
<%@page import="leehyun.book.order.service.OrderServiceImpl"%>
<%@page import="leehyun.book.order.service.OrderService"%>
<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%
	int orderNum = Integer.parseInt(request.getParameter("orderNum"));
	
	OrderService orderService = new OrderServiceImpl();
	OrderBooksService orderBooksService = new OrderBooksServiceImpl();
	orderService.cancelOrder(orderNum);
	orderBooksService.cancelOrderBooks(orderNum);
	
	request.setAttribute("success", 1);
%>
<jsp:forward page="orderOut.jsp"/>
