$(document).ready(function(){
    
});

function unfollow(passive_userNo,active_userNo){
  var unfollow_data ={
    passive_userNo: passive_userNo,
    active_userNo: active_userNo
  }
  var getUserId = $("#followBtn").attr("data-user-id");
  console.log(getUserId);
  $.ajax({
    type: "GET",
    url: "/photobook/user/delete_follow",
    data: unfollow_data,
    success: function(data){
        loadSideBar(getUserId);
        
    },
    error: function(xhr, status){
        console.log(xhr +" : "+ status);
    }
  });
  
}


function follow(passive_userNo,active_userNo){
  var follow_data ={
      passive_userNo: passive_userNo,
      active_userNo: active_userNo
  }
  var getUserId = $("#followBtn").attr("data-user-id");
  $.ajax({
    type: "GET",
    url: "/photobook/user/add_follow",
    data: follow_data,
    success: function(data){
        loadSideBar(getUserId);
        
    },
    error: function(xhr, status){
        console.log(xhr +" : "+ status);
    }
  });
  
  
}

function loadSideBar(uId){
    $("#top_sidebar").load("/photobook/home/top_sidebar");
    $("#user_page_top").load("/photobook/user/user_page_top?userId="+uId+"");
};