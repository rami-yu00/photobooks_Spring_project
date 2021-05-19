//글로벌 필드
const nextBtn = document.querySelector('.nextBtn');
const nextBtn2 = document.querySelector('.nextBtn2');
var element = document.getElementById('carouselSlide');
var h = element.clientHeight;
var w = element.clientWidth;
var itemW = w/3;
// end

//=====================[form 애니메이션]========================//
$(document).ready(function(){
    $('#goHomeBtn').on("click", function(){
        $(".loding_overlay_2").addClass("show_lodding");
        $(".loding_wrap").addClass("show_lodding");
        setTimeout(function(){ 
             location.href='/photobook/index';
        },2010);
    });//end

    //화면 크기 변경될때 마다 사이즈가 저장됨
    $(window).resize(function() {
        element = document.getElementById('carouselSlide');
        h = element.clientHeight;
        w = element.clientWidth;
        itemW = w/3;
    });
    $('.nextBtn').on('click',nextForm1);
    $('.nextBtn2').on('click',nextForm2); 
    
    //=====================[프로필 사진 Ajax]========================//    
    $('#uplodeBtn').on("click", function(e){
       var userId =  $("#userId").val();
       var userNo = $("#userNo").val();
       var formData = new FormData();
       var inputFile = $("input[name='uplode_file']");
       var files = inputFile[0].files;
       if(files == null){
            alert("사진을 선택해 주세요!");
            return false; 
       }
       //add filedate to formdata
       formData.append("UserId", userId);
       formData.append("UserNo", userNo);
       for(var i= 0; i<files.length; i++){
            formData.append("uploadFile", files[i]);
       }
       $.ajax({
            url: '/photobook/profile/uplodeImg',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            data: formData,
            type: 'POST',
            success: function(result){
                $('.uplodeBtn_inside').html('<i class="fas fa-check"></i>');
            },
            beforeSend: function(){
                $(".loding_overlay_2").addClass("show_lodding");
                $(".loding_wrap").addClass("show_lodding");
            },
            complete: function(){
                setTimeout(function(){ 
                 $(".loding_overlay_2").removeClass("show_lodding");
                 $(".loding_wrap").removeClass("show_lodding");
                },2010);
            },
            error: function (xhr, status) { 
            console.log(xhr+':'+status);
            } 
       });
       setTimeout("nextForm1()", 2000); 
    });
    //=====================[프로필 이름및소개 Ajax]========================//
    $('#uplodeBtn2').click(function(e){ 
        
        const userId = $('#userId').val();
        const userNo = $('#userNo').val();
        const userName =$('#userName').val();
        const userIntro = $('#userIntro').val();
        
        if(userName == null || userName == "" ){
            alert("이름을 입력해 주세요");
            $('#userName').focuse();
            return false; 
        }
        if(userIntro == null || userIntro == "" ){
            alert("소개를 입력해 주세요");
            $('#userIntro').focuse();
            return false;
        }
        if(userName != null  || userName != "" && userIntro != null || userIntro !=""){
             const upfile = {
                user_id: userId,
                user_no: userNo,
                user_name: userName,
                user_intro: userIntro
            };
            $.ajax({
                type: "POST",
                url: "/photobook/profile/NameAndIntro",
                 headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST" },
                dataType: "text",
                data: JSON.stringify(upfile),
                success: function(result){
                    $('.uplodeBtn_inside2').html('<i class="fas fa-check"></i>'); 
                },
                beforeSend: function(){
                    $(".loding_overlay_2").addClass("show_lodding");
                    $(".loding_wrap").addClass("show_lodding");
                },
                complete: function(){
                    setTimeout(function(){ 
                     $(".loding_overlay_2").removeClass("show_lodding");
                     $(".loding_wrap").removeClass("show_lodding");
                    },2010);
                },
                error: function (xhr, status) { 
                    console.log(xhr+':'+status);
                } 
            });
            setTimeout("nextForm2()", 2000);
            
        }//if end  
    });
    
 });
 
function nextForm1(){
    carouselSlide.style.transition = "transform 0.4s ease-in-out";
    carouselSlide.style.transform = 'translateX(' +(-itemW * 1)+ 'px)';
    $('.pf_msg_1').animate({opacity: 0 }, 300).animate({top:'-100%'}, 900);
    $('.pf_msgWrap_1').animate({'line-height':0}, 500).animate({'padding-top':0}, 200).animate({top:0}, 900);
    $('.pf_msg_2').animate({'padding-bottom':'1rem'}, 400).animate({opacity: 1 }, 330);
}//end
function nextForm2(){
    carouselSlide.style.transition = "transform 0.4s ease-in-out";
    carouselSlide.style.transform = 'translateX(' +(-itemW * 2)+ 'px)';
    $('.success_icon').css({height: "9.5rem"}).animate({top:'10px'}, 800).animate({top:'-20px'}, 400).animate({top:'5px'}, 900);
    $('.success_icon i').animate({"font-size":"4rem"}, 700).animate({"font-size":"3.5rem"}, 300).animate({"font-size":"5rem"}, 900);
}//end

//=====================[preview Image]========================//
$("#uplodeFile").on('change', function(){ previewImage(this); });

function previewImage(f){
    if(f.files && f.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#View_area').html("<img class='w-100 h-100' src="+ e.target.result +">");
        }
        reader.readAsDataURL(f.files[0]);
    }
}//end







     
   


