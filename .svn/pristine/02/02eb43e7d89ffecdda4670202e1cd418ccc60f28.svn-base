/**
 * 
 */

var wsUri = "ws://192.168.207.26:8081/ctw/test2";
$(function(){
	  websocket = new WebSocket(wsUri);
	  websocket.onopen = function(evt) {
	    };
	    
	    websocket.onmessage = function (event) {
	 		var htmlCode ="";
	    	var param =JSON.parse(event.data);
			var division =param.division;
	    	
	    if(division == 'message') {
	    	mssCount();
	  	    mssList();

			
	    	swal("쪽지가 도착하였습니다.", "", "success")
	    	
		   $(".mss").html("new");
		}else if(division == 'comnotice'){
			$(".board").html("new");
		}
	    	
	
	    };
	    
	    mssCount();
	    mssList();

	    
})

function mssList(){
    
	   $.ajax({
		   url : "mssListAjax",
		   dataType:"json",
		   type: "POST",
		   success:function(res){
			   var j = 0;
			   var code= "";
			   
			$.each(res,function(i,v){
				
				if (j<=5) {
					code+="<li style='background-color: #dbdbdb;'>";
					code+="<i class='fa fa-envelope-o'></i> "+v.mem_nm+"-"+v.mss_sj;
					code+="</li>";
				}
            
				
				j++;
			})
			$(".slimScrollDiv").html(code);
		   }	   
	
	   }); 
}

function mssCount(){
	   $.ajax({
		   url : "mssCount",
		   dataType:"json",
		   type: "POST",
		   success:function(res){
			  // alert(res.count);
				$(".mcnt").html(res.count);
		   }	   
	
	   });
	
}

