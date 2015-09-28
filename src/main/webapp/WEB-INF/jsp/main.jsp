<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>独孤九剑</title>
<link rel="stylesheet" type="text/css" href="info/css/amazeui.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="info/js/jquery.min.js"></script>

<script type="text/javascript">

   var contextPath='<%=request.getContextPath()%>';
   var pageNum=1;
   var pages=0;
   var pageSize=3;
   
   function loadInterFacePage(params){
	   params.data.pageSize=pageSize;
	   $.ajax({
			type : "POST",
			url : params.url,
			data : params.data,
			async : false,
			error : function(request) {
				alert("Connection error");
			},
			success : function(data) {
				var listStr = "";
				$.each(data.messageInfo.success.list,function(index,rowData){
					listStr += 
						'<tr data-id='+rowData.id+'>'+
							'<td  width=60 class="am-primary">'+ (index+1)+ '</td>'+ 
							'<td class="textLeft">'+ rowData.ifName+ '</td>'+ 
							'<td class="textLeft">'+ rowData.ifDesc+ '</td>'+ 
							'<td width=200>'+
							   '<a tagert="＃" href="queryDetailById/'+rowData.id+'" class="">查看详情</a>&nbsp;&nbsp;'+
							   '<a href="getUpdateInterFaceById/'+rowData.id+'" class="">修改</a>&nbsp;&nbsp;'+
							   '<a href="#" id="'+rowData.id+'" class="deleteBtn">删除</a>'+
							'<td>'+
						'</tr>';
				});
				$("#propDateShowBody").html(listStr);
				//添加页码
				var pagesStr='';
				pageNum=parseInt(data.messageInfo.success.pageNum);
				pages=parseInt(data.messageInfo.success.pages);
				if(data.messageInfo.success.isFirstPage||pages==0){
				     pagesStr+='<li class="am-pagination-first am-disabled">';
				}else{
					pagesStr+='<li class="am-pagination-first">';
				}
				pagesStr+='<a class="">第一页</a></li>';
				if(data.messageInfo.success.hasPreviousPage){
					pagesStr+= '<li class="am-pagination-prev"><a class="">上一页</a></li>'
				}else{
					pagesStr+= '<li class="am-pagination-prev am-disabled"><a class="">上一页</a></li>'
				}
				//添加分页信息
				$.each(data.messageInfo.success.navigatepageNums,function(index,pageInfo){
					//添加页码
					if(data.messageInfo.success.pageNum==pageInfo){
						pagesStr+='<li class="am-active"><a class="">'+pageInfo+'</a></li>';
					}else{
						pagesStr+='<li class=""><a class="">'+pageInfo+'</a></li>';
					}
					
				});
				
				if(data.messageInfo.success.hasNextPage){
					pagesStr+='<li class="am-pagination-next "><a class="">下一页</a></li>'
				}else{
					pagesStr+='<li class="am-pagination-next am-disabled"><a class="">下一页</a></li>';
				}
				if(data.messageInfo.success.isLastPage){
					pagesStr+='<li class="am-pagination-last am-disabled"><a class="">最末页</a></li>';
				}else{
					pagesStr+='<li class="am-pagination-last"><a class="">最末页</a></li>';
				}
				$(".pageUl").html(pagesStr);
				
			}
		});

	   
   }
   
  
   
	$(function() {
		
		loadInterFacePage({
			  url:"getAllInterFace",
			  data:{
					"pageNum" : $("#pageNum").val(),
					"interFaceInfo.ifName":$("#ifName").val()
				} 
			
		});
		
		$("#search").click(function() {
			
			$('#srearchFrom').submit(function() {
				loadInterFacePage({
					url:"queryByName",
					data : {
						"pageNum":1,
						"interFaceInfo.ifName":$("#ifName").val()
					}
				});
				return false;
			});

		});
		
		
		$(document).on("click",".pageUl li",function(){
			var textNum = $(this).text();
			if("第一页"==textNum){
				textNum=1;
			}
			if("上一页"==textNum){ 
				textNum=pageNum-1;
			}
			if("最末页"==textNum){
				textNum=pages;
			}
			if("下一页"==textNum){
				textNum=pageNum+1;
			}
			
		  var ifName=$("#ifName").val();
		  var url="getAllInterFaces";
		  if(ifName!=null){
			  url="queryByName";
		  }
		  
		  loadInterFacePage({
				  url:url,
				  data:{
						"pageNum" : textNum,
						"pageSize" : 1,
						"interFaceInfo.ifName":$("#ifName").val()
					} 
			}); 
			
		 });

		$("#propDateShow").on("click", ".deleteBtn", function() {
		      $('#my-confirm').modal({
		        relatedTarget: this,
		        onConfirm: function(options) {
		          var deleteId = $(this.relatedTarget).parent().parent().attr("data-id");
		          $.ajax({
						type : "POST",
						url : "deleteInterFaceById",
						data:{
							"id":deleteId
						},
						async : false,
						error : function(request) {
							alert("Connection error");
						},
						success : function(data) {
							if(data.messageInfo.success){
								self.location.href=contextPath+"/goQueryPanel";
							}
							
						}
					}); 
		          
		        }
		      });
		});

	});
	
</script>
</head>
<body>
	<header data-am-widget="header" class="am-header am-titlebar am-header-default">
	<h1 class="am-header-title">
		<a href="#title-link" class="">独孤九剑</a>
	</h1>
  <h>欢迎${userInfo.userName}登录系统</h>
	<div class="am-header-right am-header-nav">
		<a href="#right-link" class=""> <i
			class="am-header-icon am-icon-bars" title="开发ing..."> </i>
			<div class="am-dropdown" data-am-dropdown>
				<button class="am-btn am-btn-primary am-dropdown-toggle"
					data-am-dropdown-toggle>
					查看功能<span class="am-icon-caret-down"></span>
				</button>
				<ul class="am-dropdown-content">
					<li><a href="goQueryPanel">接口查询</a></li>
					<!-- <li><a href="goAddInterFace">添加系统</a></li>
					<li><a href="#">添加产品</a></li> -->
					<li><a href="goAddInterFace" target="_blank">添加接口</a></li>
				</ul>
			</div>
		</a>
	</div>
	</header>
	<div class="filtrate">
		<form id="srearchFrom">
			<!--搜索-->
			<div class="search">

				<input id="ifName" name="ifName" placeholder="输入需要查找的内容" />
				<button id="search">查找</button>

			</div>
		</form>
	</div>

	<nav class="navMid">
	<table id="propDateShow"
		class="am-table am-table-bordered am-table-hover am-table-compact am-table-centered">
		
		<thead>
		     <th>序号</th>
		     <th>接口名</th>
		     <th>接口功能描述</th>
		     <th>操作</th>
		
		</thead>
		<tbody id="propDateShowBody">
		
		</tbody>
	</table>

	<ul data-am-widget="pagination"
		class="am-pagination am-pagination-default pageUl">
	</ul>

<!-- 删除确认 -->
<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
			  <div class="am-modal-dialog">
			    <div class="am-modal-hd">Gigold</div>
			    <div class="am-modal-bd">
			      你，确定要删除这条记录吗？
			    </div>
			    <div class="am-modal-footer">
			      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
			      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
			    </div>
			  </div>
			</div>


	</nav>
    <input type="hidden" id="pageNum" value="1"/>
	<script src="info/js/amazeui.min.js"></script>
	<script type="text/javascript" src="js/gigold.system.main.js"></script>
</body>

</html>