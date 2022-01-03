<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" type="text/css" href="css/intro.css">

<script src="js/intro.js"></script>

<article>
	<h2 class="intro_title">자기차량</h2>
	<input type="hidden" id="inputKind" name="inputKind" value="${kind}" />
	
	<%@ include file="map_subMenu.jsp" %>
	
	<div class="map_box">
		<img class="map" src="img/map.jpg">
		<img class="way" src="img/car.jpg">
	</div>
</article>
	
	
<%@ include file="../footer.jsp"%>