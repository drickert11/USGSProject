package edu.drickert;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.drickert.User;
import edu.drickert.UserTable;


@WebServlet(name = "loginServlet", urlPatterns = {"/login"})
public class loginServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		HttpSession session = request.getSession(); //user's current session, lasts till the user closes browser
        String action = request.getParameter("action"); //arguments passed by the jsp page to tell the servlet what to do/where to go
        String url = "/index.jsp"; //where the post method sends the user next
        
        //complete nonform related actions, usually page navigation, or complete non-input actions like logging out.
        if (!action.isEmpty() || action != null) {
        	if(action.equals("logout")) {
        		session.removeAttribute("user");
                session.invalidate();
                url = "/login?action=index";
        	}
        	getServletContext().getRequestDispatcher(url).forward(request, response);
        
        }
	}
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        String url = "/index.jsp";
		UserTable ut = new UserTable();
		ArrayList<User> userList =ut.getUsers();
		
		if (!action.isEmpty() || action != null) {
            if (action.equals("login")) {
                String email = request.getParameter("email").trim();
                String password = request.getParameter("password").trim();

                if (email.isEmpty() || email == null || password.isEmpty() || password == null) {
                    url = "/index.jsp";
                    request.setAttribute("error", "You cannot leave fields blank!");
                } else {
                    if (userList != null) {
                    	User user = null;
                    			//using this till fix
                    			for(int i=0; i<userList.size(); i++) {
                    				if(userList.get(i).getEmail().equals(email)){
                    					user = userList.get(i);
                    				}
                    				
                    				
                    			}
                        	
                        
                        
                        
                            if (user!=null && user.getPassword().equals(password)) {
                                //first, last, email , pass
                                session.setAttribute("user", user);
                                url ="/home.jsp";    
                            }else {
                            	url = "/index.jsp";
                                request.setAttribute("error", "Email or Password is incorrect");
                            }
                        
                    }else {
                    	url = "/index.jsp";
                        request.setAttribute("error", "Login Failed");
                    }
                }
            } else if (action.equals("signup")) {
                url = "/index.jsp";
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                if (firstName.trim().isEmpty() || firstName == null
                        || lastName.trim().isEmpty() || lastName == null
                        || email.trim().isEmpty() || email == null || password.trim().isEmpty() || password == null) {

                    request.setAttribute("error", "You cannot leave fields blank!");

                } else {
                    if (email.contains("@") && password.length() >= 8) {
                        url = "/index.jsp";
                        User user = new User(firstName, lastName, email, password);
                        
                        request.setAttribute("error", "Registration Successful, please login with your newly created account!");
    					ut.addRecord(user);
                    } else if (!email.contains("@")) {
                        request.setAttribute("error", "Invalid email address.");
                    } else if (password.length() <= 8) {
                        request.setAttribute("error", "Password must be more than 8 characters.");
                    }
                }
                
            
            }
            getServletContext()
                    .getRequestDispatcher(url)
                    .forward(request, response);
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
		


