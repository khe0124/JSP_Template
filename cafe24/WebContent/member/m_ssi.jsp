<!-- 공통페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ssi.jsp 공통페이지 -->
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.utility.*" %>
<%@ page import="net.member.*"%>

<jsp:useBean id="dao" class="net.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="dto" class="net.member.MemberDTO"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8");%>