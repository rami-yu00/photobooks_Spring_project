function deletePhoto(e){
    console.log(e);
    
}//end


var sel_files = [];
$(document).ready(function(){
//=====================[post Ajax]========================// 
    $('#postBtn').on('click', function(e){
        var formData = new FormData();
        var inputFile = $("input[name='postFile']");
        var postCaption= $("textarea[name='postCaption']").val();
        var userNo= $("input[name='postUserNo']").val();
        var userId= $("input[name='postUserId']").val();
        var files = inputFile[0].files;
        var postFileCount = files.length;
        
        
        if(postFileCount == 0){
            alert("사진을 선택해 주세요!");
            return false; 
       }
       if(postCaption == null || postCaption == ""){
            alert("post 내용을 입력해 주세요!");
            return false; 
       }
       if(postFileCount > 5){
            alert("이미지 업로드는 최대 5개 입니다.");
            return false; 
       }
       //add filedate to formdata
       formData.append("postUserNo", userNo);
       formData.append("postCaption", postCaption);
       formData.append("postUserId", userId);
       formData.append("postFileCount", postFileCount);
       
       for(var i= 0; i<files.length; i++){
            formData.append("postFile", files[i]);
       }
       $.ajax({
            url: '/photobook/post/upload',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            data: formData,
            type: 'POST',
            success: function(result){
                location.href = '/photobook/index';
            },
            beforeSend: function(){
                
            },
            complete: function(){
                
            },
            error: function (jqXHR) { 
            console.log('error '+jqXHR);
            } 
       });
    })
    

//=====================[preview Image]========================//      
    $('#uplodePostImg').on('change', function(e){
        var f_length = $('#uplodePostImg')[0].files.length;
        var pw_viewList_wrap = document.getElementById("pw_viewList_wrap");
        var viewList = document.getElementById("View_list");
        var vwrapW = pw_viewList_wrap.clientWidth;
        var itemW = 154.73;
        var vlistW = f_length * itemW;
        var index = 0 ;
        
        //back, next Btn show
        if(vwrapW<vlistW){
            $("#pw_back_btn").addClass("show");
            $("#pw_next_btn").addClass("show");
        }else{
            $("#pw_back_btn").removeClass("show");
            $("#pw_next_btn").removeClass("show");
        }
        $("#pw_back_btn").on('click',back);
        $("#pw_next_btn").on('click',next);
        function back() {
            if (index === 0) return; 
            index -= 1;
            viewList.style.transform = `translate3d(-${itemW * index}px, 0, 0)`;
        };
        function next() {
            if (index === (f_length-1)) return;
            index += 1;
            viewList.style.transform = `translate3d(-${itemW * index}px, 0, 0)`;
        };
        
        if( $('#uplodePostImg')[0].files.length >5 ){ 
            alert("이미지 업로드는 최대 5개 입니다.");
            $("#View_list").empty();
            return false; 
        }
        const formData = new FormData();
        for(var i= 0; i<e.target.files.length; i++){
            formData.append("uplodePostImg"+i, e.target.files[i]);
        }
        sel_files = [];
        $("#View_list").empty();
        
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        filesArr.forEach(function(f){
            if(!f.type.match("image.*")){
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
            sel_files.push(f);
            var reader = new FileReader();
             reader.onload = function(e) {
               var html = '<li  class="file_label write m-2 " style="background-image: url('+e.target.result+');"></li>';
               $("#View_list").append(html);
            }
            reader.readAsDataURL(f);
        })

    });
    
})



