<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SignUp</title>
    <link rel="stylesheet" href="./css/index.css" />
  </head>
  <%@page import="com.FacebookWeb.entity.FacebookUser" %>
  <%
  FacebookUser fu=(FacebookUser)session.getAttribute("pf");
  %>
  <body>
    <main class="page">
      <div class="right-col update-center">
        <div class="center">
          
         <!--  <form action="Update" method="post"  enctype="multipart/form-data"> -->
         
        <form method="post" id="myForm"> 
            
            <p>Name:</p>
            <input type="text" name="name" value=<%=fu.getName() %>/>
            
			<p>Profile Photo :</p>
            <input type="file" name="profilePic" accept="image/*"/> 

            <p>Password:</p>
            <input type="password" name="password" />

            <p>Gender:</p>
            <input type="radio" name="gender" value="male" />
            <span>Male</span>
            <input type="radio" name="gender" value="female" />
            <span>Female</span>
            <p>Age:</p>
            <input type="text" name="age" pattern="[0-9]{2}" title="Number Only"/>
            <p>city:</p>
            <input type="text" name="city" value=<%= fu.getCity() %> />
            <div class="button">
              <button type="submit">Submit</button>
              <button type="reset">Reset</button>
            </div>
             <h3 id="updateMessage"></h3>
          </form>
        </div>
       
      </div>
    </main>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
    $("#myForm").on('submit',function (event){
        event.preventDefault();
        let f=new FormData(this);
        
        $.ajax(
        		{
        			url:"Update",
        			data:f,
        			type:'POST',
        			success:function(data,textStatus,jqXHR){
        				location.href = "./profile.html"; 
        				 /* $("#updateMessage").html("Profile Updated"); */
        			},
        			error:function(j1XHR,textStatus,errorThrown){
        			console.log("error");
        			$("#updateMessage").html("some error occured");
        			},
        			processData:false,
        			contentType:false
        		})
        
        })
       
     
    	
    </script>    
  </body>
</html>
