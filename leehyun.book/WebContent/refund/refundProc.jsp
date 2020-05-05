<%@page import="leehyun.book.refund.domain.RefundBooks"%>
<%@page import="leehyun.book.refund.service.RefundBooksServiceImpl"%>
<%@page import="leehyun.book.refund.service.RefundBooksService"%>
<%@page import="leehyun.book.refund.service.RefundServiceImpl"%>
<%@page import="leehyun.book.refund.service.RefundService"%>
<%@page import="leehyun.book.refund.domain.Refund"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	RefundService refundService = new RefundServiceImpl();
	RefundBooksService refundBooksService = new RefundBooksServiceImpl();
	Refund refund = new Refund();
	
	refund.setOrderNum(Integer.parseInt(request.getParameter("orderNum")));
	refundService.requestRefund(refund);
	int cnt = Integer.parseInt(request.getParameter("cnt"));
	
	int refundNum = refundService.getRefundNum()-1;
	
	for(int i = 0; i < cnt; i++){
		RefundBooks refundBooks = new RefundBooks();
		refundBooks.setRefundNum(refundNum);
		refundBooks.setIsbn(Long.parseLong(request.getParameter("isbn" + i)));
		refundBooks.setRefundCnt(Integer.parseInt(request.getParameter("cnt" + i)));
		refundBooksService.requestRefundBooks(refundBooks);
	}
	
	request.setAttribute("msg", 1);
%>
	<jsp:forward page="refundOut.jsp" />