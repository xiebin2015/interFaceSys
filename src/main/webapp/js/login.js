//获取登陆数据
function getLogData(data){
	var logData = data.log;
	$(".logButton").on("click",function(){
		var logName = $(".userName").val();
		var logPass = $(".pass").val();
		if(logName==logData.name&&logPass==logData.pass){
			alert("登陆成功，请稍等...")
			setInterval(function(){
				window.location.href="gigold.system.main.html";
			},500)
		}else{
			alert("用户名或密码错误");
		}
	})
}
getData(getLogData);
var boxHeight = $(document).height();
var boxWidth = $(document).width();
$(".logBox").width(boxWidth);
$(".logBox").height(boxHeight);