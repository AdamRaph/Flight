/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controls;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Victor
 */
public class CreateperRecord extends HttpServlet {


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String lastname = request.getParameter("lname");
        String firstname = request.getParameter("fname");
        String genders[] = request.getParameterValues("gender[]");
        
        String gender;
        if(genders[0] != ""){
            gender = genders[0];
        }
        else{
            gender = genders[1];
        }
        
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("day");
        String dobs = year + "-" + month + "-" + day;
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date dob = null;
        try {
           dob = df.parse(dobs);
        } catch (ParseException ex) {
            Logger.getLogger(CreateperRecord.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String disphone = request.getParameter("dis");
        String phonenum = request.getParameter("phnum");
        String email = request.getParameter("email");
        String street = request.getParameter("sadd");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String country = request.getParameter("cou");
        String passport[] = request.getParameterValues("passport[]");
        int freqflier = 0;
        boolean pholder;
        if(passport[0] == "")
            pholder = true;
        else
            pholder = false;
        
        String cretype = request.getParameter("cretype");
        String crenum = request.getParameter("ccn");
        
        HttpSession hs=request.getSession(true);  
        String user = (String)hs.getAttribute("username");
        
        
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
