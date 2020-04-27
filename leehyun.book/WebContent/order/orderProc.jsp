<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ page import="leehyun.book.order.service.OrderService" %>
<%@ page import="leehyun.book.order.service.OrderServiceImpl" %> 
<%@ page import="leehyun.book.order.domain.Order" %>   
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<% 
	request.setCharacterEncoding("utf-8");

	OrderService orderService = new OrderServiceImpl();
	
	String receiver = request.getParameter("receiver");
	String baseAddr = request.getParameter("baseAddr");
	String detailAddr = request.getParameter("detailAddr");
	String receiverTel = request.getParameter("receiverTel");
	String deliveryReq = request.getParameter("deliveryReq");
	String paymentType = request.getParameter("paymentType");
	int userNum = (int)session.getAttribute("sessionUserNum");
	
	Order order = new Order();
	order.setUserNum(userNum);
	order.setReceiver(receiver);
	order.setBaseAddr(baseAddr);
	order.setDetailAddr(detailAddr);
	order.setReceiverTel(receiverTel);
	order.setRequest(deliveryReq);
	order.setPaymentType(paymentType);
	order.setDeliveryStatus("배송전");
	
	orderService.purchase(order);
	
	System.out.println(userNum);
	System.out.println(receiver);
	System.out.println(baseAddr);
	System.out.println(detailAddr);
	System.out.println(receiverTel);
	System.out.println(deliveryReq);
	System.out.println(paymentType);
	
%>