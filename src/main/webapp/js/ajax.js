
	function getData(fn){
		$.ajax({
			type:"get",
			dataType:"json",
			url:"json/test.json",
	        	success:fn,
			error:function(){
				console.log('服务器忙，请稍后再试');
			}
		});
	}

