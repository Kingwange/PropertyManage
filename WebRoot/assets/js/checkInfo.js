/*  
            检测时间是否为空 */  
        function checkNull(id){  
            //开始时间  
            if(id == "starttime"){  
                startTime = $("#starttime").val();  
                  
                if(isNull(startTime)){  
                	$("#stime").html("入住时间不能为空");
                    return false;  
                }  
                return true;  
            }  
              
            //结束时间  
            if(id == "endtime"){  
                endTime = $("#endtime").val();  
                  
                if(isNull(endTime)){  
                	$("#etime").html("到期时间不能为空");
                    return false;  
                }  
                return true;  
            }  
        }  
          
        /* 
            检测开始时间是否小于结束时间（字符串也可以之间比较难控制相差的时间长度，使用毫秒计算） */  
        function checkDate(){  
            var startTimeMills = getDateMillsByDateString("starttime");  
            var endTIimeMills =  getDateMillsByDateString("endtime");  
            //开始时间和结束世间的最大间隔：3天  
           // var interval = 365*24*60*60*1000;  
            if(startTimeMills < endTIimeMills &&  (endTIimeMills - startTimeMills)>0 ){  
            	return true;  
            }  
            $("#etime").html("到期时间必须大于入住时间");
            return false;  
        }  
          
        /* 
      */  
       
          
        //将字符串时间(yyyy-MM-dd HH:mm:ss)转换成毫秒  
        function getDateMillsByDateString(timeId){  
            var timeStr = $("#" + timeId).val();  
              
            var dateAndTimeArray = timeStr.split(" ");  
            var dateArray = dateAndTimeArray[0].split("-");  
            var timeArray = dateAndTimeArray[1].split(":");  
              
            var date = new Date(dateArray[0],dateArray[1],dateArray[2],timeArray[0],timeArray[1]);  
              
            var dateMills = date.getTime();  
              
            return dateMills;  
        }  
          
          
        //判断字符串时间是否为空  
        function isNull(timeString){  
            if(timeString == null || timeString == ""){  
                return true;  
            }  
            return false;  
        } 
  //租赁管理
        function saveHire(){
            if(!checkNull('starttime')){
            	$("#stime").html("入住时间不能为空");
                return ;  
            }  
            if(!checkNull('endtime')){ 
            	$("#etime").html("到期时间不能为空");
                return;  
            }  
            if(!checkDate()){ 
            	$("#etime").html("到期时间必须大于入住时间");
                return;  
            } 
            var addHireinfo = $("#addHireForm").serialize();
      	  $.post("saveHire.action",addHireinfo,function(data){
      		  $("#admin-content").html(data);
      	  });
        }  
        function updateHire(){
        	if(!checkNull('starttime')){
            	$("#stime").html("入住时间不能为空");
                return ;  
            }  
            if(!checkNull('endtime')){ 
            	$("#etime").html("到期时间不能为空");
                return;  
            }  
            if(!checkDate()){ 
            	$("#etime").html("到期时间必须大于入住时间");
                return;  
            } 
       	 var updateHireInfo = $("#updateHireForm").serialize();
         $.post("updateHire.action",updateHireInfo,function(data){
       	  $("#admin-content").html(data);
           });
       }