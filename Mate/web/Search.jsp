<%-- 
    Document   : Search
    Created on : Jul 5, 2013, 6:42:26 AM
    Author     : 007
--%>

<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession ss = request.getSession(false);
             
             
            if(ss.getAttribute("ID")==null)
            {
                String site = "Login.jsp?error=false";

               response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
               response.setHeader("Location", site); 
            
                
            }
    %>
<!DOCTYPE html>
<html>
    <head>
        <style>
    .form1 {
    
    width: 340px;
    margin: 90px auto 30px;
    padding: 15px;
    position: relative;
    opacity:.75;
    background: black;
    border-radius: 4px;
    color: gray;
    font-weight: 900;
    box-shadow:
        0 2px 2px rgba(0,0,0,0.2),        
        0 1px 5px rgba(0,0,0,0.2),        
        0 0 0 12px rgba(255,255,255,0.4); 
}    

#result {
    
    width: 340px;
    margin: 90px auto 30px;
    padding: 15px;
    position: relative;
    opacity: .65;
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
        </style>
           <style>
            
body
{
    background: url(2.jpg) no-repeat center center fixed; 
    background-size: cover;
}
#navigation {
position: fixed;
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

h1
{   color: white;
    margin-left:25%;
     text-shadow: 1 3px rgba(255,255,255,0.7);
}

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
         <script>
               function call(obj)
               {
                  var val = obj;
                  
               var hid = document.getElementById("hidden");
                  hid.value = val.value; 
                  document.getElementById("val").submit();
               }
           </script>   
                
    </head>
    <body>
        <form action="" method="post" class="form1">
          <table>
              
                <tr><td>Search Field:</td><td><input type="search" name ="search" id="search"></td></tr>
               <tr><td> Field Type:</td><td> <select name="searchtype">
                    <option selected value="email">E-mail</option>
                    <option value="FNAME">First Name</option>
                </select></td></tr>
              <tr><td>  <button type="submit">Search!</button></td></tr>
            
                </table>
            
                </form>
                
        <%
           
            try{
                int count = 0;
             Class.forName("oracle.jdbc.OracleDriver");
            String url="jdbc:oracle:thin:@localhost:1521:XE";
            String email = ""+ss.getAttribute("em");
            Connection con=DriverManager.getConnection(url,"mate","mate");
            String type=request.getParameter("searchtype");
            String sql="select * from main where "+type+"=?";
            PreparedStatement pst=con.prepareStatement(sql);
            pst.setString(1,request.getParameter("search"));
            ResultSet res=pst.executeQuery();
         
             while(res.next())
             { if(!email.equals(res.getString("email")))
                 {
                        %>
             <div id="result">   
             <table>     
                 <tr><td>E-mail:</td><td><% out.println(res.getString("email")); %></td></tr>
                 <tr><td>Name:</td><td><% out.println(res.getString("FNAME")+" "+res.getString("LNAME")); %></td></tr>
                 <tr><td>Gender</td><td><% out.println(res.getString("Gender")); %></td></tr>
                 <%++count;%>
                 <tr><td><button <% out.print("id="+count);%> <% out.print("value="+res.getString("userid")); %> onclick="call(this)">Add!</button></td></tr>
              </table></div>
           <%   }
             }con.close();
            }catch (SQLException e ) {
        out.println(e);
    } finally {
         }
           
            
           
           
           
           
           %>
            
          
           <form action="./Search"  id ="val">
               
               <input type ="hidden" id="hidden" name="hidden">
           </form>
          <div id="navigation"> 
        
            <ul>
                 <li><a href="profile.jsp" ><img src="home.png"></a></li>
                <li><a href="Message.jsp" ><img src="email.png"></a></li>
                <li><a href="Inbox.jsp" ><img src="folder.png"></a></li>
                 <li><a href="Logout.jsp" ><img src="quit.png"></b></a></li>
                
                
            </ul>
            
            
        </div>   
    </body>
</html>
