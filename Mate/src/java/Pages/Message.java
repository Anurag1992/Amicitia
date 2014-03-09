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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 007
 */
public class Message extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String msg = request.getParameter("msg");
          String to = request.getParameter("hidden");
          HttpSession ss = request.getSession(false);
             out.println(ss);
             
            if(ss.getAttribute("ID")==null)
            {
                String site = "Login.jsp?error=false";

               response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
               response.setHeader("Location", site); 
            
                
            }
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            String url="jdbc:oracle:thin:@localhost:1521:XE";
            
            Connection con=DriverManager.getConnection(url,"mate","mate");
             String ssql="select email from main where userid=?";
           
             PreparedStatement ppst=con.prepareStatement(ssql);   
             ppst.setString(1,""+ss.getAttribute("ID") );
             ResultSet res=ppst.executeQuery();
              if(res.next()){
             out.print(res.getString("email"));
             String sql="INSERT INTO messages VALUES (?,?,?,?)";
            PreparedStatement pst=con.prepareStatement(sql); 
            pst.setString(1, msg);
            pst.setString(2, to);
            pst.setString(3, res.getString("email"));
            pst.setString(4, "unread");
            pst.executeUpdate();
                 String site = "Message.jsp";

               response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
               response.setHeader("Location", site); 
            
              }con.close();
        } catch (SQLException | ClassNotFoundException ex) {
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
