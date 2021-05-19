function postDel(pn){
    if(confirm("정말 삭제하시겠습니까?")){
        return location.href='/photobook/post/delete?pNum='+pn;
        }
    return false;
}
function modifyPost(pn){
   var formData =$("#postModifyForm").serialize();
   var caption = $("textarea[name='post_caption']").val();
   if(caption == null || caption == ""){
      alert("내용을 작성해 주세요");
      $("#post_caption").focus();
      return false;
   }else{
    
      $.ajax({
        type: "POST",
        url: "/photobook/post/modify_upload",
        data: formData,
        dataType: "text",
        success: function(data){
            if(data == "OK"){
                alert("게시물 수정이 완료 되었습니다.");
                location.href="/photobook/post/detail?pNum="+pn;
            }
        },
        error: function(xhr, status){
            console.log(xhr+" : "+status);
        }
        
      }); 
   
   
   }
   
};