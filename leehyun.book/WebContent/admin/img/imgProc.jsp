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
	int cnt = 0;
	
	for(int i = 2; i<= 4; i++){
		if(mRequest.getFilesystemName("attachFile" + (i - 2)) != null){
			img.setImgNum(i);
			img.setImgUrl(mRequest.getFilesystemName("attachFile" + (i - 2)));
			imgService.correctImg(img);
		}else{
			cnt++;
		}
		
		if(cnt == 3){
			request.setAttribute("noc", 1);
		}else{
			request.setAttribute("suc", 1);
		}
	}
	}catch(IOException e){
		e.printStackTrace();
		throw e;
	}
%> 
<jsp:forward page="imgOut.jsp"/>