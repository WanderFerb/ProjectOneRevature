<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>feed Page</title>
    <link rel="stylesheet" href="./css/feed.css" />
    <script src="./js/profile.js" defer></script>
  </head>
  <body  onload="feedData()">
    <nav>
      <div class="nav-left">
        <a href="./feed.html">
          
        </a>
      </div>
      <div class="search-box" >
        <img src="images/search.png" />

        <input type="text" placeholder="Search" id="searchBox"/>
      </div>
      <div class="nav-right">
        <!-- online no need -->
        <div class="nav-user-icon">
           <a href="Profiledata"> 
          <img src="images/profile-pic.png" alt="photo" id="profilePage" /><%= session.getAttribute("userid")%>
           </a> 
        </div>
      </div>
    </nav>

    <div class="container">
      <!--left-sidebar -->
      <div class="left-sidebar">
        <div class="imp-links">
             <a href="#"><img src="images/friends.png" alt="" />Friends</a>
        </div>
      </div>

      <!--main -->

      <div class="main-content">
        <div class="write-post-container">
          <div class="user-profile">
            <img id="profilePhoto" src="images/profile-pic.png" alt="photo" />
            <div>
              <p><%= session.getAttribute("userid")%></p>
            </div>
          </div>
          
          <div class="post-input-container">
            <form method="post" id="myPost">
              <textarea
                name="postMessage"
                id="postMessage"
                rows="3"
                placeholder="what's in  your mind"
              ></textarea>
              <div class="add-post-links">
                <label for="postPic">
                  <img src="images/photo.png" alt="" />
                  <p>Photo</p>
                </label>
                <input
                  type="file"
                  name="postPics"
                  accept="image/*"
                  id="postPic"
                /> <input type="submit" value="post" />
              </div>
             
            </form>
          </div>
        </div>

        <div class="post-container">
          <div class="user-profile">
            <img src="images/profile-pic.png" alt="" />
            <div>
              <p>Abhinav Dhiman</p>
              <p>January 20 2022</p>
            </div>
          </div>

          <p class="post-text">Hey guys, It's my Birthday!</p>
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
              <p>Vaibhav Dhiman</p>
              <p>August 07 2021</p>
            </div>
          </div>

          <p class="post-text">Just made my first edm, check it out</p>
          <video src="/images/Snapchat-1403045056.mp4" width="100%" alt="anuj video" controls />

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

      <!--right-sidebar -->

      <div class="right-sidebar">
      
      </div>
    </div>
      <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>
    <script>
      $("#myPost").on("submit", function (event) {
        event.preventDefault();
        let f = new FormData(this);

        $.ajax({
          url: "CreatePost",
          data: f,
          type: "POST",
          success: function (data, textStatus, jqXHR) {
            // location.href = "./profile.html";
            /* $("#updateMessage").html("Profile Updated"); */
          },
          error: function (j1XHR, textStatus, errorThrown) {
            console.log("error");
          /*   $("#updateMessage").html("some error occured"); */
          },
          processData: false,
          contentType: false,
        });
      });
    </script>
  </body>
</html>
