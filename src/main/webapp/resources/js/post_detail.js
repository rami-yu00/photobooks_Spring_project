//post file 2개 이상을 경우 버튼 보이기, post별로 컨트롤 하기위해 arry 에 저장하기

//post Data 담을 arry list.
var post_list = [];

function loadPost(post_no){
    /*var post_no =Number(imgList.getAttribute("data-post-no")); */
    var imgList_element= document.getElementById("dimg_list");
    var dimg_list_columns = Number(imgList_element.getAttribute("data-columns")); 
    
    //post file 2개 이상을 경우 arry 에 저장
    if(dimg_list_columns >= 2){
       
       //컨트롤 버튼 표시
        $("#dsl_back_btn").addClass("show");
        $("#dsl_next_btn").addClass("show");
        $("#dsl_index").addClass("show");
        $("#dsl_index span").html(1);
        //li 태그를 감싸는 ul의 width
        var imgList_width = imgList_element.clientWidth;
        
        //li태그당 width = 화면에 보여지는 width
        //translate 에 넣을 값 
        var imgList_itemW = imgList_width/dimg_list_columns; 
        
        post_list.push({
            post_no : post_no,
            dimg_list_element : imgList_element,
            dimg_list_columns : dimg_list_columns,
            dimg_list_width: imgList_width,
            dimg_list_itemW : imgList_itemW,
            img_index : 0,
            sl_index : 1
            
        });
        
    } 
};

function sliderControl(ele , pn){
    
    //post_no로 arry index 값 찾기.
    function findIndex(e){
           if(e.post_no == pn){
               return true;
           }
    };
    //arry의 data 가져오기.
    var post_list_index =  post_list.findIndex(findIndex);
    var imgList= post_list[post_list_index].dimg_list_element;
    var columns = post_list[post_list_index].dimg_list_columns;
    var itemW = post_list[post_list_index].dimg_list_itemW;
    var index = post_list[post_list_index].img_index ;
    var sl_index = post_list[post_list_index].sl_index;
    //버튼 id를 조건으로 컨트롤 하기.
    if(ele.id == "dsl_back_btn"){
        if (index === 0) {return;} 
            post_list[post_list_index].img_index = index-1;
            index =post_list[post_list_index].img_index;
            imgList.style.transform = "translate3d(-"+(itemW * index)+"px, 0, 0)";
            $("#dsl_index span").html(sl_index-1);
            post_list[post_list_index].sl_index = sl_index-1;
    }
    if(ele.id == "dsl_next_btn"){
        if (index === (columns-1)){ return;}
            post_list[post_list_index].img_index = index+1;
            index =post_list[post_list_index].img_index;
            imgList.style.transform = "translate3d(-"+(itemW * index)+"px, 0, 0)";
            $("#dsl_index span").html(sl_index+1);
            post_list[post_list_index].sl_index = sl_index+1;

    }
};


$(function(){
   $(".mover").on("mouseover focus", function(){
        $(".sl_index.show").finish();
        $(".sl_index.show").animate({opacity: 1}, 500);
    });
    $(".mover").on("mouseleave", function(){
        $(".sl_index.show").finish();
        $(".sl_index.show").animate({opacity: 0}, 300);
    });
    
});
function postLike(lck, pno){
        
        var likeCount_element= document.getElementById("dlike_count");
        var likeCount = Number(likeCount_element.getAttribute("data-like-count")); 
        if(lck == 'insert'){
             if(likeCount == 0){ $('#dlike_count').addClass("show"); }
             $('#dlike_count').text("좋아요 "+(likeCount+1)+" 개");
             $('#dlike_count').attr("data-like-count", (likeCount+1));
            
             $('#dlikes').attr("onclick", "postLike('delete', "+pno+")");
             $('#dlikes.likes>i').removeClass("bi-suit-heart");
             $('#dlikes.likes>i').addClass("bi-suit-heart-fill");
             var like_post_no = {
                post_no : pno
             };
             $.ajax({
                type: "POST",
                url: "/photobook/post/like_insert",
                data: like_post_no,
                success: function(data){
                    $('#dlikes').attr("data-like-no", data.getLikeNo );
                },
                error: function(xhr, status){
                    console.log(xhr+ " : "+status);
                }
             });
            
        }else if(lck == 'delete'){
             var likeNo = $('#dlikes').attr("data-like-no");
             var post_like_no = {
                like_no : likeNo
             };
             if(likeCount == 1){  $('#dlike_count').removeClass("show"); }
                $('#dlike_count').text("좋아요 "+(likeCount-1)+" 개");
                $('#dlike_count').attr("data-like-count", (likeCount-1));
                
                $('#dlikes').attr("onclick", "postLike('insert', "+pno+")");
                $('#dlikes.likes>i').removeClass("bi-suit-heart-fill");
                $('#dlikes.likes>i').addClass("bi-suit-heart");
                
             $.ajax({
                type: "POST",
                url: "/photobook/post/like_delete",
                data: post_like_no,
                success: function(data){
                },
                error: function(xhr, status){
                    console.log(xhr+ " : "+status);
                }
             });
            
        }
    };

function submitReply(postNo){
  var content=$("#form"+postNo+"_content").val();
  var formData = $("#form"+postNo+"").serialize();
  if(content == "" || content == null ){
    alert("내용을 입력해주세요"); 
    return false;
  }
  $.ajax({
    cache:false,
    url:  "/photobook/post/add_reply",
    type: "POST",
    data: formData,
    dataType: "text",
    success: function(data){
       $("#form"+postNo+"_content").val("");
       $("#p_reply_div").load("/photobook/post/detail_reply?post_no="+postNo);
    },
   error: function (xhr, status) {
        console.log(xhr + " : " + status);
   }
  });
};
function deleteReply(postNo, replyNo){
    var delData = {
        postNo : postNo,
        replyNo : replyNo
    }
     $.ajax({
        cache:false,
        url:  "/photobook/post/delete_reply?replyNo="+replyNo,
        type: "GET",
        data: delData,
        dataType: "text",
        success: function(data){
           $("#p_reply_div").load("/photobook/post/detail_reply?post_no="+postNo);
        },
       error: function (xhr, status) {
            console.log(xhr + " : " + status);
       }
  });
}
function modifyReply(postNo, replyNo, content){
    var tag = "<input id='modifyContent"+replyNo+"' type='text' value='"+content+"' class='modify_reply_input col' />";
    $("#content"+replyNo+"").html(tag);
    $("#modifyBtn"+replyNo+"").attr("onclick", "modifyReplySend(this)");
    $("#modifyBtn"+replyNo+"").attr("data-postNo", postNo);
    $("#modifyBtn"+replyNo+"").attr("data-replyNo", replyNo);
    $("#modifyBtn"+replyNo+"").attr("data-content", "#modifyContent"+replyNo+"");
    $("#modifyBtn"+replyNo+"").text("등록");
    $("#modifyBtn"+replyNo+"").css({"display" : "block"});
    $("#modifyBtn"+replyNo+" ~ span").css({"display" : "block"});
}
function modifyReplySend(e){
    var postNo = Number(e.getAttribute("data-postNo"));
    var replyNo = Number(e.getAttribute("data-replyNo"));
    var contentId = e.getAttribute("data-content");
    var content = $(contentId).val();
    var ModifyData = {
        postNo : postNo,
        replyNo : replyNo,
        replyContent : content
    }
    $.ajax({
        cache:false,
        url:  "/photobook/post/modify_reply",
        type: "GET",
        data: ModifyData,
        dataType: "text",
        success: function(data){
           $("#content"+replyNo+"").text(content);
           $("#modifyBtn"+replyNo+"").attr("onclick", "modifyReply("+postNo+","+replyNo+",'"+content+")'");
           $("#modifyBtn"+replyNo+"").text("수정");
           $("#p_reply_div").load("/photobook/post/detail_reply?post_no="+postNo);
        },
       error: function (xhr, status) {
            console.log(xhr + " : " + status);
       }
   });
}

var myModal = new bootstrap.Modal(document.getElementById('dPostMoreModal'))
$(document).ready(function(){
    $(".dpostMoreModal").on('click', function(e) {
        var targetEle = e.target;
        var activeUser = targetEle.getAttribute("data-active-user");
        var postingUser = targetEle.getAttribute("data-posting-user");
        var postNo= targetEle.getAttribute("data-post-no");
        if(activeUser != postingUser){
            $("#dPostModify").css({"display":"none"});
            $("#dPostDelete").css({"display":"none"});
            var linkDtlStr = "/photobook/post/detail?pNum="+postNo+"";
            $("#postDetail").attr("href",linkDtlStr);
        }else{
            $("#dPostModify").css({"display":"block"});
            $("#dPostDelete").css({"display":"block"});
            var linkMdfStr = "/photobook/post/modify?pNum="+postNo+"";
            $("#dPostModify").attr("href",linkMdfStr);
            var linkDelStr = "/photobook/post/delete?pNum="+postNo+"";
            $("#dPostDelete").attr("href",linkDelStr);
        }
        
    })
    $("#dPostDelete").on('click', function(){
       if(confirm("정말 삭제하시겠습니까?")){return true;}
       return false; 
    });
});