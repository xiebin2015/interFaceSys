$(function(){
	
	//获取系统信息
	function getSystemData(data){
		var userName = data.log.userName;
		$(".logUserName").html("登陆用户："+data.log.userName);
		var system = "";
		for(name in data){
			if(name=="log"){
				continue;
			}
			system+='<div><h3 data-name='+name+'>'+name+'</h3>'
				  +'<ul data-name='+name+' class="navMidUl"></ul></div>'
		}
			system+="<div class='panel'>点击左边接口查看详情</div>"
			
			
		
		$(".navSystem").html(system);

		
		//系统显示隐藏
		$(".navSystem").on("click","h3",function(){
			$(this).addClass("colorSys");
			$(this).parent().siblings().children("h3	").removeClass("colorSys");
			var markData = $(this).attr("data-name");
			getProductData(data[markData]);
			var liCount = $(this).next().children("li").size();
			var liHeight = $(this).next().children("li").height();
			var ulHeight = liCount*liHeight;
			if($(this).attr("data-name")==markData){
				$(this).next().addClass("disBlock");
				$(this).parent().siblings().children("ul").removeClass("disBlock");
			}
		});
	}
	
	//获取系统数据
	getData(getSystemData);
	
	
	
	
	//获取产品信息
	function getProductData(data){
		var product = "";
		for(name in data){
			product+= "<li><div class='navSystem'  data-name="+name+">"+name+"</div>"
			 	 +"<ul class='navMidUl-Ul' data-name="+name+"></ul></li>"
		}
		$(".navMidUl").html(product);
		
		
		//系统显示隐藏
		$(".navMidUl").on("click","div",function(){
			var markData = $(this).attr("data-name");
			getProtData(data[markData]);
			var liCount = $(this).next().children("li").size();
			var liHeight = $(this).next().children("li").height();
			var ulHeight = liCount*liHeight+(liCount*2);
			if($(this).attr("data-name")==markData){
				$(this).siblings().removeClass("disBlock");
				$(this).next().addClass("disBlock");		
				$(this).parent().siblings().children("ul").removeClass("disBlock");
			}
		});
	}
	
	//获取接口数据
	function getProtData(data){
		// 接口名
		var portS = "";
		// 数据添加到页面
		for(name in data){
			portS+= "<li data-name="+name+">"+name+"</li>";
		}
		$(".navMidUl-Ul").html(portS);
		getProtObj(data);
	}


	// 获取接口信息
	function getProtObj(data){
		var protObj = "";
		for(name in data){
			configData = data[name].config;
			console.log(configData)
			protObj+="<div data-name="+name+" class='navMidBoy-display'><div class='portDes clear'><span>接口描述:</span>"
					+"<p>"+data[name].config.desc+"</p></div>"
					+"<h3 class='stairTitle clear'>Request</h3>"
					+"<div class='col-md-10 am-u-md-10'>"
					+'<pre class="pre">"id":"1000" \t //查询字段</pre></div>'
					+"<h3 class='stairTitle clear'>Response</h3>"
					+"<div class='secondTitle clear'>Success</div>"
					+"<div class='col-md-10 am-u-md-10'>"
					+"<pre class='pre clear'>{<br/> \t //...<br/>}</pre></div>"
					+"<div class='secondTitle clear'>Error</div>"
					+"<div class='col-md-10 am-u-md-10'>"
					+'<pre class="pre">{<br/> \t //...<br/>}</pre></div></div>'
		}
		$(".navMidBody").html(protObj);


		//接口选中状态
		$(".navMidUl-Ul").on("click","li",function(){
			$(".panel").addClass("disNone");
			$(this).addClass("bgStyle");
			$(this).siblings().removeClass("bgStyle");
			if($(this).hasClass("bgStyle")){
				var markData = $(this).attr("data-name");
				$(".navMidBoy-display").each(function(){
					if($(this).attr("data-name")==markData){
						$(this).addClass("disBlock");
						$(this).siblings().removeClass("disBlock");
					}
				})
			}
		})
	}

	
	
})
