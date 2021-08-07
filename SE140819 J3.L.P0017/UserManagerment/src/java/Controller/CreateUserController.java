/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
import DTO.UserDTO;
import Ulities.makeEncryptPassword;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
@WebServlet(name = "CreateUserController", urlPatterns = {"/CreateUserController"})
public class CreateUserController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "home.jsp";

        String name = request.getParameter("txtUserName");
        String email = request.getParameter("txtEmail");
        String phone = request.getParameter("txtPhone");
        String photo = request.getParameter("txtPhoto");
        String role = request.getParameter("txtRole");
        String rank = request.getParameter("txtRank");      
        String password = request.getParameter("txtPassword");
        int roleID = 1;
        try {
            UserDAO dao = new UserDAO();// khởi tạo userDao
            String encrypt_password = makeEncryptPassword.encrypt(password);// tọa sting pass word thoe kiểu mã hóa 256
            HttpSession session = request.getSession(false);
            if (session != null) {// nếu sesion != null

                if (encrypt_password.length() > 0) {//nếu pass word mã hóa thành công thì sẽ gfi vòa phần dao với ssion
                    if ("User".equals(role)) {
                        roleID = 2;
                    }
                    int rs = dao.createUser(name, encrypt_password, email, phone, photo, Integer.parseInt(rank), roleID);
                    if (rs > 0) {
                        List<UserDTO> list = dao.getListAccount();
                        session.setAttribute("ListAccount", list);
                    }
                }
            }
        } catch (NoSuchAlgorithmException ex) {
            log("CreateController + NoSuchAlgorithmException: " + ex.getMessage());
        } catch (SQLException ex) {
            log("CreateController + SQLException: " + ex.getMessage());
        } catch (NamingException ex) {
            log("CreateController + ClassNotFoundException: " + ex.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

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
        processRequest(request, response);
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
