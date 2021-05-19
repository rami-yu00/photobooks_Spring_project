/** join.jsp */
var flagEmail = false;
var flagId = false;
var flagPwd = false;
var flagPwd2 = false;

//add-class
//input: is-invalid(실패), is-valid(성공) 
//label : invalid-feedback(실패), valid-feedback(성공)  

//유효성 검사 - 이메일
function emailCheck(input) {
  var reEmail =/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
  if(!reEmail.test(input)){
    flagEmail = false;
    $("#userEmail").addClass("is-invalid");
    $("#emailFeedback").addClass("invalid-feedback");
    $("#emailFeedback").html("이메일 형식이 올바르지 않습니다.");
    return false;
  }else{
    const user_email = $("#userEmail").val();
    $.ajax({
        type: "POST",
        url: "/photobook/emailCheck",
        headers: {
            "Content-Type": "application/json",
            "X-HTTP-Method-Override": "POST"
        },
        data: user_email,
        datatype: "json",
        success: function(data){
            if(data.confirm === "OK"){
                
                    $("#userEmail").removeClass("is-invalid");
                    $("#emailFeedback").removeClass("invalid-feedback");
                    $("#userEmail").addClass("is-valid");
                    $("#emailFeedback").addClass("valid-feedback");
                    $("#emailFeedback").html("사용가능한 이메일 입니다.");
                
                flagEmail = true;
            }else{
                
                    $("#userEmail").removeClass("is-valid");
                    $("#emailFeedback").removeClass("valid-feedback");
                    $("#userEmail").addClass("is-invalid");
                    $("#emailFeedback").addClass("invalid-feedback");
                    $("#emailFeedback").html("이미 사용중인 이메일입니다.");
                               
                flagEmail = false;
                return false;
            }
        },        
        error: function(error){
            console.log("error: "+error);
        }
    });
  }
  joinBtnDisablend();
}//유효성 검사 - 이메일 end


//유효성 검사 - 사용자이름(id) 
function idCheck(input) {
  var reName =/^[a-z0-9-_.]{4,20}$/;
  if(!reName.test(input)){
    flagId = false;
    $("#userId").addClass("is-invalid");
    $("#idFeedback").addClass("invalid-feedback");
    $("#idFeedback").html("사용자이름(영소문자/숫자/특수문자[-_.]/4~20자)");
    return false;
  }else{
    const user_id = $("#userId").val();
    $.ajax({
        type: "POST",
        url: "/photobook/idCheck",
        headers: {
            "Content-Type": "application/json",
            "X-HTTP-Method-Override": "POST"
        },
        data: user_id,
        datatype: "json",
        success: function(data){
            if(data.confirm === "OK"){
                
                    $("#userId").removeClass("is-invalid");
                    $("#idFeedback").removeClass("invalid-feedback");
                    $("#userId").addClass("is-valid");
                    $("#idFeedback").addClass("valid-feedback");
                    $("#idFeedback").html("사용가능한 사용자이름(아이디) 입니다.");
                                 
                flagId = true;
            }else{
                
                    $("#userId").removeClass("is-valid");
                    $("#idFeedback").removeClass("valid-feedback");
                    $("#userId").addClass("is-invalid");
                    $("#idFeedback").addClass("invalid-feedback");
                    $("#idFeedback").html("이미 사용중인 사용자이름(아이디) 입니다.");
                                 
                flagId = false;
                return false;
            }
        },
        error: function(error){
            console.log("error: "+error);
        }
    });
  }
  joinBtnDisablend();
}//유효성 검사 - 사용자이름(id) end


//유효성 검사 - 비밀번호(pwd)
function pwdCheck(input) {
  var rePwd =/^[A-Za-z0-9`~!@#$%^&*|\\\'\";:\/?_\-]{4,20}$/;
  if(!rePwd.test(input)){
    flagPwd = false;
    $("#userPwd").addClass("is-invalid");
    $("#pwdFeedback").addClass("invalid-feedback");
    $("#pwdFeedback").html("비밀번호(영문대소문자/숫자/특수문자/4~20자)");
    
    return false;
  }else{
    flagPwd = true;
    $("#userPwd").removeClass("is-invalid");
    $("#pwdFeedback").removeClass("invalid-feedback");
    $("#userPwd").addClass("is-valid");
    $("#pwdFeedback").addClass("valid-feedback");
    $("#pwdFeedback").html("사용가능한 비밀번호 입니다.");
  }
  const userPwd2 = $("#userPwd2").val();
  if(userPwd2 != null && userPwd2 != undefined && userPwd2 != "" && input === userPwd2){
        flagPwd2 = true;
        $("#userPwd2").removeClass("is-invalid");
        $("#pwd2Feedback").removeClass("invalid-feedback");
        $("#userPwd2").addClass("is-valid");
        $("#pwd2Feedback").addClass("valid-feedback");
        $("#pwd2Feedback").html("");
        $("#pwdFeedback").html("");
        
      
    }else if(userPwd2 != null && userPwd2 != undefined && userPwd2 != ""){
        pwd2Check(userPwd2);
    }
    joinBtnDisablend();
}//유효성 검사 - 비밀번호(pwd) END

//유효성 검사 - 비밀번호 확인(pwd2)
function pwd2Check(input) {
  const user_pwd = $("#userPwd").val();
  if(user_pwd != input ){
    flagPwd2 = false;
    $("#userPwd2").addClass("is-invalid");
    $("#pwd2Feedback").addClass("invalid-feedback");
    $("#pwd2Feedback").html("비밀번호가 일치하지 않습니다");
    return false;
  }else{
    flagPwd2 = true;
    $("#userPwd2").removeClass("is-invalid");
    $("#pwd2Feedback").removeClass("invalid-feedback");
    $("#userPwd2").addClass("is-valid");
    $("#pwd2Feedback").addClass("valid-feedback");
    $("#pwd2Feedback").html("");
    $("#pwdFeedback").html("");
  }
  joinBtnDisablend();
}//유효성 검사 - 비밀번호 확인(pwd2) END

$(document).ready(function(){
    joinBtnDisablend();
    
});


function joinBtnDisablend(){
    if(flagEmail && flagId && flagPwd && flagPwd2){
        $("#JOIN").removeAttr("disabled");
        console.log("JOIN : disabled 비활성화"); 
    }else if($("#JOIN").is(":disabled")){
       
        console.log("JOIN : disabled 활성화");
        
    }else{
         $("#JOIN").attr("disabled");
         console.log("JOIN : disabled 활성화");
    }
}
//회원가입
$('#JOIN').click(function(e){ 
   
   if(flagEmail && flagId && flagPwd && flagPwd2 ){
    
    //register data
    const email = $('#userEmail').val();
    const id =  $('#userId').val();
    const pwd = $('#userPwd').val();
    
    //json
    const user = {
        user_email: email,
        user_id: id,
        user_pwd: pwd
    };
    
    //ajax
    $.ajax({
        type: "POST",
        url: "/photobook/register",
        headers: {
            "Content-Type": "application/json",
            "X-HTTP-Method-Override": "POST"
        },
        dataType: "text",
        data: JSON.stringify(user),
        success: function(result){
            if(result === "joinSuccess"){
                setTimeout(function(){
                var user_id = id;
                self.location = "/photobook/profile/"+user_id;
                },300); 
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
        }
      })
  }else{
    alert('입력정보를 다시 확인하세요');
  }
});
