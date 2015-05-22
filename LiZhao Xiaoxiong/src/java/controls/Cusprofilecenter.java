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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;
import models.Agentprofiles;
import models.Customer;

/**
 *
 * @author Victor
 */
public class Cusprofilecenter extends HttpServlet {

    @PersistenceUnit(unitName="222PU")
    private EntityManagerFactory emf;
    @Resource
    private UserTransaction utx;

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
        String cuIDs = request.getParameter("CusID");
        
        int cuID = Integer.parseInt(cuIDs);
        EntityManager em = emf.createEntityManager();
        
        Customer cus = em.find(Customer.class, cuID);
        
        PrintWriter out = response.getWriter(); 
        
        out.println("<input name='thiscusid' type='text' value='" + cuIDs +"' readonly >");
        
        out.println("<label for='ba'>basic information</label>");
        out.println("<table id='ba' class = 'form-control'>");
        out.println("<tr><th>Title</th><th>Name</th><th>Gender</th><th>DOB</th>");
        out.println("<tr><td>" + cus.getTitle() +"</td><td>" + cus.getFirstName() + " " + cus.getLastName() +"</td><td>" + cus.getGender() +"</td><td>" + cus.getDob() +"</td></tr>");
        out.println("</table>");
        
        out.println("<label for='contact'>peersonal contact information</label>");
        out.println("<table id='contact' class = 'form-control'>");
        out.println("<tr><th>Phone</th><th>Email</th><th>street_address</th><th>city</th><th>state</th><th>country</th></tr>");
        out.println("<tr><td>" + cus.getPhone() +"</td><td>" + cus.getEmail() + " " + cus.getStreetAddress() +"</td><td>" + cus.getCity() +"</td><td>" + cus.getState() +"</td><td>" + cus.getCountry() +"</td></tr>");
        
        out.println("<label for='other'>other information</label>");
        out.println("<table id='other' class = 'form-control'>");
        out.println("<tr><th>passport_holder</th><th>flight_status</th><th>travel_agent</th>");
        out.println("<tr><td>" + cus.getPassportHolder() +"</td><td>" + cus.getFlightStatus() + " " + cus.getTravelAgent()  +"</td></tr>");
        em.close();
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
        try {
            String cusids = request.getParameter("thiscusid");
            
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
            
            dob = df.parse(dobs);
            
             String disphone = request.getParameter("dis");
                String phonenum = request.getParameter("phnum");
                String phone = disphone + "-" + phonenum;
                
                String email = request.getParameter("email");
                String street = request.getParameter("sadd");
                String state = request.getParameter("state");
                String city = request.getParameter("city");
                String country = request.getParameter("cou");
                String passport[] = request.getParameterValues("passport[]");
                boolean pholder = false;
                if(passport == null ||passport[0] != "")
                    pholder = false;
                else
                    pholder = true;
                
                String flightstatus = request.getParameter("flsta");
                String travel = request.getParameter("travel");
                
                EntityManager em = emf.createEntityManager();
        
                Customer cus = em.find(Customer.class, Integer.parseInt("cusids"));
                
                utx.begin();
                if(title != "")
                    cus.setTitle(title);
                if(lastname != "")
                    cus.setTitle(lastname);
                if(firstname != "")
                    cus.setFirstName(firstname);
                if(gender != "")
                    cus.setGender(gender);
                if(dob != null)
                    cus.setDob(dob);
                if(phone != "")
                    cus.setPhone(phone);
                if(email != "")
                    cus.setEmail(email);
                if(street != "")
                    cus.setStreetAddress(street);
                if(state != "")
                    cus.setState(state);
                if(city != "")
                    cus.setCity(city);
                if(country != "")
                    cus.setCountry(country);
                if(pholder != false)
                    cus.setPassportHolder(pholder);
                if(flightstatus != "")
                    cus.setFlightStatus(flightstatus);
                if(travel != ""){
                    List<Agentprofiles> aps = em.createNamedQuery("Agentprofiles.findByTravelAgent", Agentprofiles.class).setParameter(1, travel).getResultList();
                    cus.setTravelAgent(aps.get(0));
                    em.persist(cus);
                    utx.commit();
                    em.close();
                }
                
        } catch (ParseException ex) {
            ex.printStackTrace();
        } catch (NotSupportedException ex) {
            ex.printStackTrace();
        } catch (SystemException ex) {
            ex.printStackTrace();
        } catch (RollbackException ex) {
            ex.printStackTrace();
        } catch (HeuristicMixedException ex) {
            ex.printStackTrace();
        } catch (HeuristicRollbackException ex) {
            ex.printStackTrace();
        } catch (SecurityException ex) {
            ex.printStackTrace();
        } catch (IllegalStateException ex) {
            ex.printStackTrace();
        }
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
