<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title><tiles:getAsString name="title"/></title>
</head>
<body>

<div class="header">
  <tiles:insertAttribute name="header" />
</div>

<div style="margin-top: 200px"></div>
<div class="container">
	<tiles:insertAttribute name="body" />
</div>

<div class="footer">
  <tiles:insertAttribute name="footer" />
</div>

</body>
</html>