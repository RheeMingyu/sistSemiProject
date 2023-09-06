<%@page import="java.util.List"%>
<%@page import="data.dao.PopularSearchesDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<style>
	#shape{
		margin: 40px 20px 40px 20px;
	}
	div.subject,div.list,span{
		cursor: pointer;
	}
</style>
<script>
	$(function(){
		$("div.sa").click(function(){
			$("div.select").hide();
			$("div.age_select").show();
			$("button.btn-danger").trigger("click");
			$("button.btn-success").attr("id","ageBtn");
		});
		$("div.sm").click(function(){
			$("div.select").hide();
			$("div.mbti_select").show();
			$("button.btn-danger").trigger("click");
			$("button.btn-success").attr("id","mbtiBtn");
		});
		$("div.sg").click(function(){
			$("div.select").hide();
			$("div.gender_select").show();
			$("button.btn-danger").trigger("click");
			$("button.btn-success").attr("id","genderBtn");
		});
		$("div.sr").click(function(){
			$("div.select").hide();
			$("div.area_select").show();
			$("button.btn-danger").trigger("click");
			$("button.btn-success").attr("id","areaBtn");
		});
		
		$(document).on("click","#ageBtn",function(){
			var age_v=$("#age").val();
			var s="";
			$.ajax({
				type:"get",
				dataType:"json",
				data:{"age":age_v},
				url:"ageListProc.jsp",
				success:function(res){
					s+="<ol>";
					$.each(res,function(i,e){
						"<li>"+e+"</li>";
					});
					s+="</ol>";
				}
				$("div.la").html(s);
			});
		});
		$(document).on("click","#mbtiBtn",function(){
			var mbti_v=$("#mbti").val();
			var s="";
			$.ajax({
				type:"get",
				dataType:"json",
				data:{"mbti":mbti_v},
				url:"",
				success:function(res){
					
				}
			});
		});
	});
</script>
<body>
	<div id="shape">
		<div><b>������ �α� �˻���</b>&nbsp;&nbsp;&nbsp;<span><i class="bi bi-backspace-fill"></i></span></div>
		<div class="subject age sa">
			<h5>���̴뺰</h5>
		</div>
		<div class="list age la">
		
		</div>
		<div class="subject mbti sm">
			<h5>mbti��</h5>
		</div>
		<div class="list mbti lm">
		
		</div>
		<div class="subject gender sg">
			<h5>����</h5>
		</div>
		<div class="list gender lg">
		
		</div>
		<div class="subject area sr">
			<h5>������</h5>
		</div>
		<div class="list area lr">
		
		</div>
	</div>
	
	<div class="container mt-3">
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal" style="visibility: hidden"></button>
	</div>
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">�������ּ���~!</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body">
					<div class="select age_select">
						<select id="age">
							<option value="10" selected>10��</option>
							<option value="20">20��</option>
							<option value="30">30��</option>
							<option value="40">40��</option>
							<option value="50">50��</option>
							<option value="60">60�� �̻�</option>
						</select>
					</div>
					<div class="select mbti_select">
						<select id="mbti1">
							<option value="e" selected>E</option>
							<option value="i">I</option>
						</select>
						<select id="mbti2">
							<option value="n" selected>N</option>
							<option value="s">S</option>
						</select>
						<select id="mbti3">
							<option value="t" selected>T</option>
							<option value="f">F</option>
						</select>
						<select id="mbti4">
							<option value="p" selected>P</option>
							<option value="j">J</option>
						</select>
					</div>
					<div class="select gender_select">
						<select id="gender">
							<option value="male" selected>��</option>
							<option value="female">��</option>
						</select>
					</div>
					<div class="select area_select">
						<select id="area">
							<option value="����" selected>����Ư����</option>
							<option value="��õ">��õ������</option>
							<option value="���">��⵵</option>
							<option value="����">������</option>
							<option value="���">��û�ϵ�</option>
							<option value="�泲">��û����</option>
							<option value="����">���ֱ�����</option>
							<option value="����">����ϵ�</option>
							<option value="����">���󳲵�</option>
							<option value="�뱸">�뱸������</option>
							<option value="�λ�">�λ걤����</option>
							<option value="���">���ϵ�</option>
							<option value="�泲">��󳲵�</option>
							<option value="����">���ֵ�</option>
						</select>
					</div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-success">����</button>
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">���</button>
				</div>
			
			</div>
		</div>
	</div>
</body>
</html>