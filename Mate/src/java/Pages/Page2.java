/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Pages;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.UUID;

/**
 *
 * @author 007
 */
public class Page2 extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         
          String uid = request.getParameter("email");
          String pid = request.getParameter("password");
          String bid = request.getParameter("birthday");
          String fid = request.getParameter("fname");
          String lid = request.getParameter("lname");
          String gid = request.getParameter("gender");
          String sid   = request.getParameter("school");
          String cid = request.getParameter("college");
          String inid = request.getParameter("interests");
          String id = fid+pid;
        
        try {
           Class.forName("oracle.jdbc.OracleDriver");
            String url="jdbc:oracle:thin:@localhost:1521:XE";
            
            Connection con=DriverManager.getConnection(url,"mate","mate");
            String sql="INSERT INTO main VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement pst=con.prepareStatement(sql);
            
            pst.setString(1,uid);
            pst.setString(2,fid);
            pst.setString(3,lid);
            pst.setString(4,pid);
            pst.setString(5,gid);
            pst.setString(6,bid);
            pst.setString(7,id);
            pst.setString(8,"");
            int rs=pst.executeUpdate();
            if(rs==1)
            {
                   String sql1 ="INSERT INTO profile VALUES (?,?,?,?)";
                   PreparedStatement pst1=con.prepareStatement(sql1);
            
                   pst1.setString(1,uid);
                   pst1.setString(2,sid);
                   pst1.setString(3,cid);
                   pst1.setString(4,inid);
                   pst1.executeUpdate();
            
            String site   = "Login.jsp";
            String create = "CREATE TABLE "+id+"( FriendFirstName VARCHAR2(40), FriendMail VARCHAR2(40), FriendLastName VARCHAR2(40), FRIENDSTATUS VARCHAR(200))" ;
                   
              PreparedStatement ps=con.prepareStatement(create);              
               
                       ps.execute();
                

               response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
               response.setHeader("Location", site);
                
                
                
               
            }else
            {
               String site = "index.jsp?value=false";

               response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
               response.setHeader("Location", site); 
            }
            con.close();

            
            
            
        } catch (ClassNotFoundException | SQLException ex) {
            out.println(ex);
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
