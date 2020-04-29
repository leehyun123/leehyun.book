<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "java.io.IOException" %>
<%
	String attachPath = "/admin/img";
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
	
	request.setAttribute("title", mRequest.getParameter("title"));
	request.setAttribute("attachName", mRequest.getFilesystemName("attachFile"));
	
	}catch(IOException e){
		e.printStackTrace();
		throw e;
	}
%> 
<jsp:forward page="01.html"/>