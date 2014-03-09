<%-- 
    Document   : Inbox
    Created on : Jul 5, 2013, 2:18:28 PM
    Author     : 007
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
button {
    display: inline-block;
    margin: 10px;
    padding: 8px 15px;
    background: aqua;
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
{   color: whitesmoke;
    opacity:75%;
    width :20%;
    border-radius: 3px;
    
    font-family: fantasy;
     
     margin-left: 40%;
     left:0;
     margin-right: 40%;
     font-size: 40px;  
    
     text-shadow: 1 3px rgba(255,255,255,0.7);
}
h3
{    color: whitesmoke;
    opacity:75%;
    width :20%;
    right :40%;
    
    font-family: fantasy;
     text-shadow: 1 3px rgba(255,255,255,0.7);
}


        </style>       
 <style>
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
    
</style>
        <title>Inbox</title>
    </head>
    <body>
                <h1>
                    INBOX
                </h1> 
         <%  
             HttpSession ss = request.getSession(false);
             
             
            if(ss.getAttribute("ID")==null)
            {
                String site = "Login.jsp?error=false";

               response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
               response.setHeader("Location", site); 
            
                
            }
            try{
            String table =""+ss.getAttribute("ID");
            String emailid=""+ss.getAttribute("em");
           
            int count =0;
            Class.forName("oracle.jdbc.OracleDriver");
            String url="jdbc:oracle:thin:@localhost:1521:XE";
            
            Connection con=DriverManager.getConnection(url,"mate","mate");
            String sql="SELECT * FROM messages";
            PreparedStatement pst = con.prepareStatement(sql);
                       
                     ResultSet res=pst.executeQuery();
                   
                     %>
                     
                     <%
            while(res.next())
    { if(res.getString("receiver").equals(emailid)){
        if(res.getString("status").equals("unread")){  count++;%>
              <div id="result">  
             <table>     
                 
                 <tr><td>From:</td><td><% out.println(res.getString("SENDER")); %></td></tr>
                 <tr><td>Message:</td><td><% out.println(res.getString("Message")); %></td></tr>
                 
                     
                
                 <tr><td><button name ="Submit" value ="<% out.print(res.getString("Message"));%>" onclick="call(this)">Mark as read</button>
             </table>
               </div>          
           <%}}}
            if(count==0)
                out.println("<h3>NO NEW UNREAD MESSAGES</h3>");
      con.close();      }catch (SQLException e ) {
        out.println(e);
    } finally {
         }
           %>
                     
            <div id="navigation"> 
        
            <ul>
                
                <li><a href="profile.jsp" ><img src="home.png"></a></li>
                <li><a href="Message.jsp" ><img src="email.png"></a></li>
                <li><a href="Search.jsp" ><img src="search.png"></a></li>
                <li><a href="Logout.jsp" ><img src="quit.png"></b></a></li>
                
                
            </ul>
                
            
        </div>  
                    <script>
               function call(obj)
               {
                  var val = obj;
                  
               var hid = document.getElementById("hidden");
                  hid.value = val.value; 
                  document.getElementById("val").submit();
               }
           </script>   
             <form action="./IB"  id ="val">
               
               <input type ="hidden" id="hidden" name="hidden">
           </form>
    </body>
</html>
