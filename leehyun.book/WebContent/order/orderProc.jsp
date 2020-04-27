<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@page import="leehyun.book.orderBooks.service.OrderBooksServiceImpl"%>
<%@page import="leehyun.book.orderBooks.service.OrderBooksService"%>
<%@page import="leehyun.book.orderBooks.domain.OrderBooks"%>
<%@ page import="leehyun.book.order.service.OrderService" %>
<%@ page import="leehyun.book.order.service.OrderServiceImpl" %> 
<%@ page import="leehyun.book.order.domain.Order" %>   
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<% 
	request.setCharacterEncoding("utf-8");

	OrderService orderService = new OrderServiceImpl();
	OrderBooksService orderBooksService = new OrderBooksServiceImpl();
	
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
	
	int orderNum = orderService.findOrderNum();
	orderNum -= 1;
	
	String[] isbns = request.getParameterValues("isbn");
	String[] orderCnts = request.getParameterValues("orderCnt");
	
	System.out.println(isbns[0]);
	
	
	for(int i = 0; i<isbns.length; i++){
		OrderBooks orderBooks = new OrderBooks();
		orderBooks.setOrderNum(orderNum);
		orderBooks.setIsbn(Long.parseLong(isbns[i]));
		orderBooks.setOrderCnt(Integer.parseInt(orderCnts[i]));
		orderBooksService.purchaseOrderBooks(orderBooks);
	}

%>

<c:redirect url="orderEnd.jsp"/>
