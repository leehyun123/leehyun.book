<%@page import="leehyun.book.refund.domain.Refund"%>
<%@page import="leehyun.book.refund.service.RefundServiceImpl"%>
<%@page import="leehyun.book.refund.service.RefundService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	RefundService refundService = new RefundServiceImpl();

	int refundNum = 0;
	
	try{
		refundNum = Integer.parseInt(request.getParameter("refundNum"));
	}catch(Exception e){
		request.setAttribute("msgFail", 1);
%>
		<jsp:forward page="refundOut.jsp" />
<%
	}
	
	Refund refund = refundService.findRefund(refundNum);
	
	if(refund.getRefundStatus().equals("환불완료"))
		refund.setRefundStatus("환불요청");
	else
		refund.setRefundStatus("환불완료");
	
	refundService.correctRefund(refund);
	request.setAttribute("msgSuc", 1);
%>
<jsp:forward page="refundOut.jsp" />