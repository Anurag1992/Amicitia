<%-- 
    Document   : profile
    Created on : Jul 1, 2013, 11:06:52 PM
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
            
body
{
    background: url(2.jpg) no-repeat center center fixed; 
    background-size: cover;
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

#profile
{
    color: whitesmoke;
    opacity:75%;
    width :20%;
    right :40%;
    
    font-family: fantasy;
}
#About
{
    color: whitesmoke;
    opacity:75%;
    width :20%;
    right :40%;
    margin-left: 50%;
    font-family: fantasy;
}
#navigation a:hover {
color: yellow;
}   
ul{
list-style: none;    
 bottom:0;
 margin:0;

}
#friends{
     
    position :relative;
}
#navigation ul li {
 float:left;    
 padding-left:10px;   
 padding-right:10px;
 border-color: white;
 border:20px;

 
}
#status
{
    font-size: 30px;
    
}
h1
{   color: white;
    margin-left:25%;
     
}
h2
{   color: gold;
   
     
}
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        
            <%
            try 
                {
            Class.forName("oracle.jdbc.OracleDriver");
            String url="jdbc:oracle:thin:@localhost:1521:XE";
            
            Connection con=DriverManager.getConnection(url,"mate","mate");
            String sql="select * from main where email=?";
            String sql1 ="select * from profile where email=?";
            PreparedStatement pst=con.prepareStatement(sql);
            PreparedStatement pst1=con.prepareStatement(sql1);
            pst.setString(1,""+ss.getAttribute("em"));
            pst1.setString(1,""+ss.getAttribute("em"));
            ResultSet res=pst.executeQuery();
            ResultSet res1=pst1.executeQuery();
            if(res.next())
            {  %>
               
               <div id="profile">
                <table>     
                    <tr><td>E-mail :</td><td><% out.println(res.getString("email")); %></td></tr>
                 <tr><td>Name :</td><td><% out.println(res.getString("FNAME")+" "+res.getString("LNAME")); %></td></tr>
                 <div id="status"><tr><td>Status :</td><td><h2><% out.println(res.getString("status")); %></h2></td></tr>
                </div>  </div>
                 <%
            
            }
            if(res1.next())
            {
              %>  <div id="profile">
                <table>     
                 
                 <tr><td>School : </td><td><% out.println(res1.getString("school") );%> </td></tr>
                 <tr><td>College : </td><td><% out.println(res1.getString("college")); %></td></tr>
                 <tr><td>Interest : </td>  <td><% out.println(res1.getString("interest")); %></td></tr>
                </h2>  </div>
            <%            }
               }catch (SQLException e ) {
        out.println(e);
    } finally {
         }   %>
         <%  
            try{
            String table =""+ss.getAttribute("ID");
            int count =0;
             Class.forName("oracle.jdbc.OracleDriver");
            String url="jdbc:oracle:thin:@localhost:1521:XE";
            
            Connection con=DriverManager.getConnection(url,"mate","mate");
            String sql="SELECT * FROM "+table;
            PreparedStatement pst = con.prepareStatement(sql);
            
                     ResultSet res=pst.executeQuery(); %>
                    
                      <table id ="friends">  
                    <td><tr> <h1> FRIENDS</h1> </td></tr>
                     <%
                      while(res.next())
             { %>
              
            
          
                 <td><tr>
                 <h3>
                 <% out.println(res.getString("FriendFirstName")+" "+res.getString("FriendLastName")); %></td></tr>
             </h3></table>
                     
      <%   }con.close();
            }catch (SQLException e ) {
        out.println(e);
    } finally {
         }
           
            
            
            %>
            <form action="status">
                <input type ="text" placeholder="What are you feeling" name ="status">
                <button type ="submit"> Submit!</button>
                
            </form>
                
         <div id="result">
        <div id="navigation"> 
        
            <ul>
                <li><a href="Inbox.jsp" ><b><img src="folder.png"></a></li>
                <li><a href="Message.jsp" ><img src="email.png"></a></li>
                <li><a href="Search.jsp" ><img src="search.png"></a></li>
                <li><a href="Logout.jsp" ><img src="quit.png"></b></a></li>
                
                
            </ul>
            
            
        </div>
    </body>
</html>
