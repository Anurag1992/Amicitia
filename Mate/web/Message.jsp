<%-- 
    Document   : Message
    Created on : Jul 3, 2013, 11:27:52 AM
    Author     : 007
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send</title>
         <style>
            
body
{
    background: url(2.jpg) no-repeat center center fixed; 
    background-size: cover;
}
#navigation {
position: relative;
bottom: 0;
width: 30%;

color: #ffffff;
height: 35px;
left : 35%;
text-align: center;
padding-top: 15px;
/* Adds shadow to the bottom of the bar */
-webkit-box-shadow: 0px 0px 8px 0px #000000;
-moz-box-shadow: 0px 0px 8px 0px #000000;
box-shadow: 0px 0px 8px 0px #000000;
/* Adds the transparent background */
background-color: rgba(1, 1, 1, 0.8);
color: rgba(1, 1, 1, 0.8);
}
#navigation a {
font-size: 14px;
padding-left: 15px;
padding-right: 15px;
color: white;
text-decoration: none;
}

#navigation a:hover {
color: grey;
}   
ul{
list-style: none;    
 bottom:0;
 margin:0;

}

li{
float:left;    
 padding-left:10px;   
 padding-right:10px;   
}
iframe{
    
    width:60%;
    height:100%;
    border:0px;
    margin-left:20%;
}
h1
{   color: silver;
    font-family: fantasy;
    margin-left:25%;
     text-shadow: 1 1.5px rgba(255,255,255,0.7);
}

        </style>
        <style>
        .form1 {
    
    width: 340px;
    
    padding: 15px;
    position: relative;
    
    background: black;
    border-radius: 4px;
    color: gray;
    font-weight: 900;
   
}    
#form
{   color:gold;
    font-family: fantasy;
    left : 11.5%;
    position :relative;
    
    
}

#result {
    
    width: 340px;
    margin: 90px auto 30px;
    padding: 15px;
    position: relative;
   opacity:.65; 
    background: black;
    border-radius: 4px;
    color: white;
    text-shadow: 3px;
    font-weight: 900;
    
}    
button {
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
 
button:hover {
    background: #C7FE0A
}                     
            
#msg{
    
    border-radius: 5px;
    width: 350px;
    height: 75px;
    background-color: black;
    opacity: 50;
    color:red;
     box-shadow: 
        inset 0 1px 0 rgba(255,255,255,0.5), 
        0 2px 2px rgba(0,0,0,0.3), 
        0 0 4px 1px rgba(0,0,0,0.2); 
}         
            
            
        </style>
    </head>
    <body>
          <div id="form">
           <form action="./Message"  id ="val"  >
               
               <input type ="hidden" id="hidden" name="hidden">
              <h1>  Message:</h1></td> <td><h1><input type="text" id="msg" name="msg" required/></h1> </td>
           </form>
           </div>
        
        
        <%  HttpSession ss = request.getSession(false);
             
             
            if(ss.getAttribute("ID")==null)
            {
                String site = "Login.jsp?error=false";

               response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
               response.setHeader("Location", site); 
            
                
            }
            try{
            String table =""+ss.getAttribute("ID");
            int count =0;
             Class.forName("oracle.jdbc.OracleDriver");
            String url="jdbc:oracle:thin:@localhost:1521:XE";
            
            Connection con=DriverManager.getConnection(url,"mate","mate");
            String sql="SELECT * FROM "+table;
            PreparedStatement pst = con.prepareStatement(sql);
            
                     ResultSet res=pst.executeQuery();
                      while(res.next())
             { %>
           
             
             
             <div id="result">   
             <table>     
                 <tr><td>E-mail:</td><td><% out.println(res.getString("FriendMail")); %></td></tr>
                 <tr><td>Name:</td><td><% out.println(res.getString("FriendFirstName")+" "+res.getString("FriendLastName")); %></td></tr>
                 <tr><td> 
                     
         
                     
                     </td></tr>
                  <tr><td><button <% out.print("id="+count);%> <% out.print("value="+res.getString("FriendMail"));%> onclick="call(this)">Send!</button></td></tr>
              </table></div>
           <%   }con.close();
            }catch (SQLException e ) {
        out.println(e);
    } finally {
         }
           %>
           
       
           <script>
               function call(obj)
               {
                  var val = obj;
                  
                  var hid = document.getElementById("hidden");
                  hid.value = val.value; 
                  document.getElementById("val").submit();
               }
           </script>   
              <div id="navigation"> 
        
            <ul>
                   <li><a href="profile.jsp" ><img src="home.png"></a></li>
                   <li><a href="Search.jsp" ><img src="search.png"></a></li>
                   <li><a href="Inbox.jsp" ><b><img src="folder.png"></a></li>
                 <li><a href="Logout.jsp" ><img src="quit.png"></b></a></li>
                
                
            </ul>
            
            
        </div>   
        
    </body>
</html>
