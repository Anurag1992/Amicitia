<%-- 
    Document   : index
    Created on : Jun 29, 2013, 12:42:57 PM
    Author     : 007
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    
        <script src="jquery-2.0.3.js" type="text/javascript"></script>
       
        <script src="modernizr.custom.js" type="text/javascript"></script> 
        <link rel="stylesheet" href="default.css" type="text/css" media="screen" title="lightbox"/>
        <link rel="stylesheet" href="component.css" type="text/css" media="screen" title="lightbox"/>
        
      
      
    </head>
    <style>
@font-face {
	font-family: 'icomoon';
	src:url('fonts/icomoon.eot');
	src:url('fonts/icomoon.eot?#iefix') format('embedded-opentype'),
		url('fonts/icomoon.woff') format('woff'),
		url('fonts/icomoon.ttf') format('truetype'),
		url('fonts/icomoon.svg#icomoon') format('svg');
	font-weight: normal;
	font-style: normal;
}

/* Use the following CSS code if you want to use data attributes for inserting your icons */
[data-icon]:before {
	font-family: 'icomoon';
	content: attr(data-icon);
	speak: none;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	line-height: 1;
	-webkit-font-smoothing: antialiased;
}


.icon-home, .icon-key, .icon-checkmark {
	font-family: 'icomoon';
	speak: none;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	line-height: 1;
	-webkit-font-smoothing: antialiased;
}
.icon-home:before {
	content: "\e000";
}
.icon-key:before {
	content: "\e001";
}
.icon-checkmark:before {
	content: "\e002";
}
body
{
    background: url(1.jpg) no-repeat center center fixed; 
   
    background-size: cover;
}
#logos{
  bottom:0;
  width: 100%;
 position: absolute;
 border-radius:5px;
	
	background:black;
        box-shadow:0 10px 20px #000;
         opacity:.55;
}
#form{
    
    margin-left: 65%;
    margin-top: 2.5%;
   
    position: absolute;
    
}    


.form1 {
    
    width: 340px;
    
   
    padding: 15px;
    position: relative;
 
    
    background: #fffaf6;
    border-radius: 4px;
    color: #7e7975;
    
    box-shadow:
        0 2px 2px rgba(0,0,0,0.2),        
        0 1px 5px rgba(0,0,0,0.2),        
        0 0 0 12px rgba(255,255,255,0.4); 
}
 .modern {
    display: inline-block;
    margin: 10px;
    padding: 8px 15px;
    background: #B8ED01;
    border: 1px solid rgba(0,0,0,0.15);
    border-radius: 4px;
    transition: all 0.3s ease-out;
    box-shadow: 
        inset 0 1px 0 rgba(255,255,255,0.5), 
        0 2px 2px rgba(0,0,0,0.3), 
        0 0 4px 1px rgba(0,0,0,0.2); 
    
    text-decoration: none;
    text-shadow: 0 1px rgba(255,255,255,0.7);
}
 
.modern:hover {
    background: #C7FE0A
} 
#menudiv{
    
    
    
}
h2
{
    color:black;
    margin-left:25%;
    text-shadow: 0 2px rgba(255,255,255,0.7);
    
    
}
h1
{   color: white;
    margin-left:40%;
     text-shadow: 1 3px rgba(255,255,255,0.7);
}




    </style>





   
    
    <body>
        
       
        <div id="menudiv">      
<nav  id="menu" class="nav">  
    <ul>
       
        <li>      
            <a href="Login.jsp"><span class="icon"> <i aria-hidden="true" class="icon-key"></i></span><span>Login</span></a>   
        </li> 
        
        
    </ul>
</nav>
        </div>
   
        <div id="form">      
        <form method="post" action="./2" id ="signup" class="form1">
            <table>
                <tr><h2>Sign up, its free!</h2></tr>
                  <tr><td></br></td></tr>
                  
                  <tr><td>Email</td><td><input name="email"  type ="email" autofocus="autofocus"/></td></tr> 
                 
                  <tr><td>Password </td><td><input name="password"  type="password"/></td></tr>
                  
                  <tr><td>Birthday </td><td><input name="birthday"  type="date"/></td></tr>
                 
                  <tr><td>First Name </td><td><input name="fname"  type="text"/></td></tr>
                 
                  <tr><td>Last Name </td><td><input name="lname"  type="text"/></td></tr>
                  
                  <tr><td>Gender </td><td><input name="gender"  type="text"/></td></tr>
                  
                  <tr><td>School </td><td><input name="school"  type="text"/></td></tr>
                  
                  <tr><td>College </td><td><input name="college"  type="text"/></td></tr>
                  
                  <tr><td>Interests </td><td><input name="interests"  type="text"/></td></tr>
                  
                  
            </table> 
            </br>
            <button type="submit" class ="modern">SUBMIT</button>
        </form>
        </div>
    

      
 
<div id="logos">
    <h1>AMICITIA</h1>
</div>
        

    </body>
</html>
