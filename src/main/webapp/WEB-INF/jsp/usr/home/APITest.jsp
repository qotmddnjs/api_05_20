<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API TEST"></c:set>
<script>
	const API_KEY = 'Z8ejFvwSUpB39PwetSZWTVGeVI1H0cyC6kOQ8ZG0LPq57y00Cb03PF9eaj%2BUj%2B1V%2BK%2BORS%2BZz37Agq6TUKDVmA%3D%3D';

	async function getCData() {
		const url = 'http://apis.data.go.kr/1790387/covid19CurrentStatusKorea/covid19CurrentStatusKoreaJason?serviceKey='
				+ API_KEY;
		const response = await
		fetch(url);
		const data = await
		response.json();
		console.log("data", data);
	}
	getCData();
</script>
<%@ include file="../common/head.jspf"%>


<%@ include file="../common/foot.jspf"%>
