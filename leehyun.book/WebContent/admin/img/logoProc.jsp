<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "java.io.IOException" %>
<%@page import="leehyun.book.img.service.ImgServiceImpl"%>
<%@page import="leehyun.book.img.service.ImgService"%>
<%@page import="leehyun.book.img.domain.Img"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
	ImgService imgService = new ImgServiceImpl();

	request.setAttribute("suc", null);
	request.setAttribute("noc", null);

	String attachPath = "/img";
	int fileMaxSize = 1024 * 1024 * 5;
	String enctype = "utf-8";
	
	ServletContext ctx = getServletContext();
	attachPath = ctx.getRealPath(attachPath);
	
	System.out.println("attachPath: " + attachPath);
	request.setCharacterEncoding("utf-8");
	
	MultipartRequest mRequest = null;
	try{
	
	mRequest = new MultipartRequest(request,
			attachPath, fileMaxSize, enctype,
			new DefaultFileRenamePolicy());
	
	Img img = new Img();
	
		if(mRequest.getFilesystemName("uploadFile") != null){
		img.setImgNum(1);
		img.setImgUrl(mRequest.getFilesystemName("uploadFile"));
		imgService.correctImg(img);
		request.setAttribute("suc", 1);
	}else
		request.setAttribute("noc", 1);
	}catch(IOException e){
		e.printStackTrace();
		throw e;
	}
%> 
<jsp:forward page="logoOut.jsp"/>