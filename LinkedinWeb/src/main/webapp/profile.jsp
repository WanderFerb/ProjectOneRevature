<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile Page</title>
    <script src="https://kit.fontawesome.com/14c2a823c8.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/feed.css" />
    <script src="./js/profile.js" defer></script>
  </head>
  <body onload="viewProfile()">
    <nav>
      <div class="nav-left">
        <a href="./feed.html">
          <img src="images/logo.png" class="logo" />
        </a>
      </div>
      <div class="search-box" >
        <img src="images/search.png" />

        <input type="text" placeholder="Search" id="searchBox"/>
      </div>
      <div class="nav-right">
        <!-- online no need -->
        <div class="nav-user-icon">
          <!-- <a href="profile.html"> -->
          <img src="images/profile-pic.png" alt="photo" id="profilePage" /><%= session.getAttribute("userid")%>
          <!-- </a> -->
        </div>
      </div>
    </nav>
  <%@page import="com.FacebookWeb.entity.FacebookUser" %>
<%
	FacebookUser fu=(FacebookUser)request.getAttribute("fbuser");
	session.setAttribute("pf",fu);
%>
    <!-- Profile Page -->
    <div class="profile-container">
      <div class="profile-details">
        <div class="pd-left">
          <div class="pd-row">
            <img id="profilePhoto" src="images/profile-pic.png" alt="Profile" class="pd-img" />
            <div>
              <h3 id="profileName"><%= fu.getName() %></h3>
            </div>
          </div>
        </div>
        <div class="pd-right">
          <button id="friend">addFriend</button>
          <a href="update.jsp" id="update"><button>Update Profile</button> </a>
          <a href="DeleteProfile" id="delete"><button>Delete Profile</button> </a>
          
        </div>
      </div>
    
      <div class="profile-info">
        <div class="info-col">
          <div class="profile-intro">
            <h3 >City:</h3>
            <p id="profileCity"><%= fu.getCity() %></p>
            <h3>Age:</h3>
            <p id="profileAge"><%= fu.getAge() %></p>
            <h3>Gender:</h3>
            <p id="profileGender"><%= fu.getGender() %></p>
          </div>
        </div>
        
        <div class="post-col">
          <div class="post-container">
            <div class="user-profile">
              <img src="images/profile-pic.png" alt="" />
              <div>
                <p>Yash Mane</p>
                <p>June 24 2021</p>
              </div>
            </div>

            <p class="post-text">heloo guyz how are you and whats up</p>
            <img src="images/feed-image-1.png" alt="" class="post-img" />

            <div class="post-row">
              <div class="activity-icons">
                <div><img src="images/like-blue.png" alt="" />20</div>
                <div><img src="images/comments.png" alt="" />4</div>
                <div><img src="images/share.png" alt="" />5</div>
              </div>
              <div class="post-profile-icon"></div>
            </div>
          </div>

          <div class="post-container">
            <div class="user-profile">
              <img src="images/profile-pic.png" alt="" />
              <div>
                <p>Yash Mane</p>
                <p>June 24 2021</p>
              </div>
            </div>

            <p class="post-text">heloo guyz how are you and whats up</p>
            <img src="images/feed-image-2.png" alt="" class="post-img" />

            <div class="post-row">
              <div class="activity-icons">
                <!-- <div><img src="images/like-blue.png" alt="" />20</div> -->
                <div><img src="images/like.png" alt="" />20</div>
                <div><img src="images/comments.png" alt="" />4</div>
                <div><img src="images/share.png" alt="" />5</div>
              </div>
              <div class="post-profile-icon"></div>
            </div>
          </div>
          <button class="load-more-btn">load more</button>
        </div>
      </div>
    </div>
    <script>
    const friendBtn=document.getElementById("friend");
    
    function setFriend(){
    	
    	let sem=sessionStorage.getItem("searchEmail");
    	let methodType="";
    	if(friendBtn.innerHTML==="addFriend"){
    		methodType="addFriend";
    		friendBtn.innerHTML="removeFriend";
    	}else{
    		methodType="removeFrined";
    		friendBtn.innerHTML="addFriend";
    	}
    	fetch("AddFriend?method="+methodType+"&searchProfile=" + sem);
    	console.log(methodType);
    	/* location.href = "./profile.html"; */
    }
    
    
    friendBtn.addEventListener("click",setFriend);
    </script>
  </body>
</html>
