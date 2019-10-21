/*http://blog.sina.com.cn/s/blog_a3bd3bd0010187y1.html
*/
var postAjax=function(url,postData,successFunction,options){
	 var returnFlag= false;
	 var defaultOptions = {
		        errorFunction: errorFunction,
		        successArguments: "",
		        errorArguments: "",
		        successMessage: "",
		        type: "post",
		        async: true,
		        contentType: "application/json; charset=utf-8",
		        dataType: "json"
		    };
		    var currentOptions = $.extend(defaultOptions, options);
		    $.ajax({
		        type: currentOptions.type,
		        data: postData,
		        contentType: currentOptions.contentType,
		        dataType: currentOptions.dataType,
		        url: url,
		        async: currentOptions.async,
		        beforeSend: function () {
		         
		        },
		        success: function (resultData) {
		            if (resultData && isSuccess(resultData.code)) {
		                if (currentOptions && currentOptions.successArguments) {
		                    successFunction(resultData, currentOptions.successArguments);
		                } else {
		                    successFunction(resultData);
		                }
		                returnFlag = true;
		            }else{
		                defaultOptions.errorFunction(resultData);
		                console.log(resultData);
		                returnFlag = false;
					}
		        },
		        complete:function(){
		           
				},
		        error: function (result) {
		            returnFlag = false;
		           
		           
		        }
		    });
		    return returnFlag;
};

function isSuccess(result) {
    return (result === "00")
}
function errorFunction(resultData) {
    showMessage(resultData);
}
