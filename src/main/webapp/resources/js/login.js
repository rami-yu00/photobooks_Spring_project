$(document).ready(function(){
    $(document).ready(function() {
        $("#userPwd").keydown(function(key) {
            if (key.keyCode == 13) {
                loginAjex();
            }
        });
    });
    $('#LOGIN').on("click",loginAjex);
});

function changeEidFeedBack(){
    $("#userEid").removeClass("is-invalid");
    $("#eidFeedback").removeClass("invalid-feedback");
    $("#eidFeedback").html("");
}//end
function changePwdFeedBack(){
    $("#userPwd").removeClass("is-invalid");
    $("#pwdFeedback").removeClass("invalid-feedback");
    $("#pwdFeedback").html("");
}//end

function loginAjex(){
   var userEid =  $("#userEid").val();
   var userPwd = $("#userPwd").val();
   var loding_overlay = $(".loding_overlay");
   var loding_wrap = $("loding_wrap");
   var dto = {
    user_eid: userEid,
    user_pwd: userPwd
   }
   if(userEid == null || userEid == "" && userPwd == null || userPwd == "" ){
        $("#userEid").addClass("is-invalid");
        $("#eidFeedback").addClass("invalid-feedback");
        $("#eidFeedback").html("이메일 또는 아이디를 입력해 주세요.");
        $("#userPwd").addClass("is-invalid");
        $("#pwdFeedback").addClass("invalid-feedback");
        $("#pwdFeedback").html("비밀번호를 입력해 주세요.");
        $("#userEid").focus();
        return false;
    }else if(userEid == null || userEid == "" ){
        $("#userEid").addClass("is-invalid");
        $("#eidFeedback").addClass("invalid-feedback");
        $("#eidFeedback").html("이메일 또는 아이디를 입력해 주세요.");
        $("#userEid").focus();
        return false;
   }else if(userPwd == null || userPwd == "" ){
        $("#userPwd").addClass("is-invalid");
        $("#pwdFeedback").addClass("invalid-feedback");
        $("#pwdFeedback").html("비밀번호를 입력해 주세요.");
        $("#userPwd").focus();
        return false;
   }
   console.log('userEid: '+userEid+', user Pwd : '+userPwd);
   var formData =$("#Init").serialize();
   $.ajax({
        cache:false,
        type: "POST",
        url: "/photobook/loginCheck",
        dataType: "text",
        data: formData,
        success: function(result){
            if(result === "loginSuccess"){
                self.location = "/photobook/";
            }else if(result === "differentPassword"){
                setTimeout(function(){ 
                    $("#userPwd").addClass("is-invalid");
                    $("#pwdFeedback").addClass("invalid-feedback");
                    $("#pwdFeedback").html("비밀번호 확인 후 다시 입력해 주세요");
                    $("#userPwd").focus();
                },2500);                         
                return false;
            }else{
                setTimeout(function(){
                    $("#userEid").addClass("is-invalid");
                    $("#eidFeedback").addClass("invalid-feedback");
                    $("#eidFeedback").html("없는 계정입니다. 확인 후 다시 로그인 해주세요");
                    $("#userPwd").addClass("is-invalid");
                    $("#pwdFeedback").addClass("invalid-feedback");
                    $("#pwdFeedback").html("");
                    $("#userPwd").val("");
                    $("#userEid").focus();
                },2500);    
                return false;
            }
        },
        beforeSend: function(){
           $(".loding_overlay").addClass("show_lodding");
           $(".loding_wrap").addClass("show_lodding");
        },
        complete: function(){
           setTimeout(function(){ 
             $(".loding_overlay").removeClass("show_lodding");
             $(".loding_wrap").removeClass("show_lodding");
            },2450);
        },
        error: function(error){
            console.log("error: "+error);
            
        }
   })
}