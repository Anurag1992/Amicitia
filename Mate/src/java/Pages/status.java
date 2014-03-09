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
import javax.servlet.http.HttpSession;

/**
 *
 * @author 007
 */
public class status extends HttpServlet {

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
        String status = request.getParameter("status");
        HttpSession ss = request.getSession(false);
             
             
            if(ss.getAttribute("ID")==null)
            {
                String site = "Login.jsp?error=false";

               response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
               response.setHeader("Location", site); 
            
                
            }
        String mail = ""+ss.getAttribute("em");
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            String url="jdbc:oracle:thin:@localhost:1521:XE";
            
            Connection con=DriverManager.getConnection(url,"mate","mate");
            String sql="UPDATE  main set status = ? where email = ?";
            PreparedStatement pst=con.prepareStatement(sql);
            
            if(status.equals("")) {
            
                status = "Feeling Nothing.";
            }
            pst.setString(1,status);
            pst.setString(2,mail);
            
            int rs=pst.executeUpdate();
            con.close();
            response.sendRedirect("profile.jsp");
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
