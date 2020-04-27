<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ISBN = (String)request.getParameter("ISBN");

	Cookie cookie = null;
	/* cookie = new Cookie("ISBN"+ISBN, "1");
	cookie.setMaxAge(60 * 60 * 24 * 365);
	cookie.setPath("/");
	response.addCookie(cookie); */
	cookie = new Cookie("ISBN9791136705358", "9791136705358");
	cookie.setMaxAge(60 * 60 * 24 * 365);
	cookie.setPath("/");
	response.addCookie(cookie);
	cookie = new Cookie("ISBN9788972756194", "9788972756194");
	cookie.setMaxAge(60 * 60 * 24 * 365);
	cookie.setPath("/");
	response.addCookie(cookie);
	cookie = new Cookie("ISBN9788931460735", "9788931460735");
	cookie.setMaxAge(60 * 60 * 24 * 365);
	cookie.setPath("/");
	response.addCookie(cookie);
	cookie = new Cookie("ISBN9788932903200", "9788932903200");
	cookie.setMaxAge(60 * 60 * 24 * 365);
	cookie.setPath("/");
	response.addCookie(cookie);
	cookie = new Cookie("ISBN9788932919126", "9788932919126");
	cookie.setMaxAge(60 * 60 * 24 * 365);
	cookie.setPath("/");
	response.addCookie(cookie);
%>

<c:redirect url="cartOut.jsp"/>