<!-- 공통페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ssi.jsp 공통페이지 -->
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.utility.*" %>
<%@ page import="net.notice.*"%>

<jsp:useBean id="dao" class="net.notice.NoticeDAO"></jsp:useBean>
<jsp:useBean id="dto" class="net.notice.NoticeDTO"></jsp:useBean>

<jsp:useBean id="mdao" class="net.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="mdto" class="net.member.MemberDTO"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8");%>

<% 
//검색
 String col = request.getParameter("col");  //검색컬럼
 String word = request.getParameter("word");//검색단어
 
 //String값이 null이면 공백문자열 반환
 col = Utility.checkNull(col);
 word = Utility.checkNull(word);
 
 



%>