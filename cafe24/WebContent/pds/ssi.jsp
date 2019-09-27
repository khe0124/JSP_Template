<!-- 공통페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ssi.jsp 공통페이지 -->
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!-- 파일전송 -->
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<%@ page import="net.utility.*" %>
<%@ page import="net.pds.*"%>

<jsp:useBean id="dao" class="net.pds.pdsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="net.pds.pdsDTO"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8");%>