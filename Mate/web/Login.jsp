<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<%@page session="false"  %>
<html>
    <head>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
       
        <script src="modernizr.custom.js" type="text/javascript"></script> 
        <link rel="stylesheet" href="default.css" type="text/css" media="screen" title="lightbox"/>
        <link rel="stylesheet" href="component.css" type="text/css" media="screen" title="lightbox"/>
        
        <style>
   .form1 {
    /* Size and position */
    width: 340px;
    margin-left: 40%;
     margin-top: 15%;
    padding: 15px;
    position: absolute;
    
    background: white;
    border-radius: 4px;
    color: gray;
    font-weight: 900;
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
    /* Font styles */
    text-decoration: none;
    text-shadow: 0 1px rgba(255,255,255,0.7);
}
 
.modern:hover {
    background: #C7FE0A
}                 
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
    background: url(3.jpg) no-repeat center center fixed; 
   
    background-size: cover;
} 

 ul li
{
    border-radius:7px;
    
    
}      
#menudiv
{
    bottom:0;
}
h3{
    
    margin-left:45%;
    color:red;
    
}

        </style>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
        <nav  id="menu" class="nav">  
    <ul>
        <li>
            <a  href="index.jsp" title="">
                <span  class="icon"> <i aria-hidden="true"  class="icon-home"></i></span><span>Home</span>
            </a>
        </li>
        
        
        
    </ul>
</nav>
       
        <% String err = request.getParameter("error");
          if(err!=null){
          out.println("<h3>"+err+"</h3>");}                           
        %>
       
        
        <form method="post" action="./1" id ="login" class="form1">
            <table>
                <tr><td>Email</td><td><input  name ="username" type ="email" autofocus="autofocus" placeholder="Enter your email id"/>
               </td></tr> <br/><tr><td>Password </td><td><input  name="password" type="password"placeholder="Enter your password"/></td>
           </tr>
            </table> 
            <button type="submit" class ="modern">SUBMIT</button>
        </form>
       
    </body>

</html>
