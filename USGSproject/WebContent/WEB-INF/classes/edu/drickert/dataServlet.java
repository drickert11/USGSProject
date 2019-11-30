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

import edu.drickert.dataInfo;
import edu.drickert.DataTable;


@WebServlet(name = "dataServlet", urlPatterns = {"/data"})
public class dataServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		HttpSession session = request.getSession(); 
        String action = request.getParameter("action"); 
        String url = "/home.jsp"; 
        dataInfo di = new dataInfo();
        DataTable dt= new DataTable();
        
        //this completes nonform related actions, usually page navigation, or complete non-input actions like logging out.
       
        if (!action.isEmpty() || action != null) {
        	if(action.equals("data")) {
                url = "/dataIn.jsp";
                ArrayList<dataInfo> dataSet=dt.getData();
                session.setAttribute("dataSet", dataSet);
                
    			}
        	}
        
        	getServletContext().getRequestDispatcher(url).forward(request, response);
        
        }
	

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        String url = "/home.jsp";
        getServletContext().getRequestDispatcher(url).forward(request, response);
        
		//for now this does nothing.
		
		
	}
}