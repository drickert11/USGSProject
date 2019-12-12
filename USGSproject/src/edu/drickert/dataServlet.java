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

@WebServlet(name = "dataServlet", urlPatterns = { "/data" })
public class dataServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String url = "/home.jsp";
		dataInfo di = new dataInfo();
		DataTable dt = new DataTable();

		// this completes nonform related actions, usually page navigation, or complete
		// non-input actions like logging out.

		if (!action.isEmpty() || action != null) {
			if (action.equals("data")) {

				String startYear = request.getParameter("yearStart");
				String endYear = request.getParameter("yearEnd");

				if (startYear == null || startYear.isEmpty()) {
					startYear = "0";
				}
				if (endYear == null || startYear.isEmpty()) {
					endYear = "3000";
				}
				int syear = Integer.parseInt(startYear);
				int eyear = Integer.parseInt(endYear);

				session.setAttribute("startY", syear);
				session.setAttribute("endY", eyear);

				String filter = request.getParameter("selectFilter");
				if (filter != null && !filter.isEmpty() && filter.equals("resource")) {
					session.setAttribute("check1", "");
					session.setAttribute("check2", "");
					session.setAttribute("filter", "Resource");
				} else {
					session.setAttribute("check1", "un");
					session.setAttribute("check2", "checked");
					session.setAttribute("filter", "MineType");
				}

				ArrayList<String> precodeDT = dt.getPrecisionCode();
				String precode = request.getParameter("precodes");
				if (precode != null && !precode.isEmpty() && precodeDT.contains(precode)) {
					session.setAttribute("precode", precode);
					for (int i = 1; i < 5; i++) {
						String hold = Integer.toString(i);
						session.setAttribute(hold, "");
					}

					session.setAttribute(precode, "selected");
					session.setAttribute("filterOption", precode);
				} else {
					session.setAttribute("precode", "0");
					session.setAttribute("filterOption", "none");
				}

				url = "/dataIn.jsp";
				ArrayList<dataInfo> dataSet = dt.getData();
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
		dataInfo di = new dataInfo();
		DataTable dt = new DataTable();

		// this completes nonform related actions, usually page navigation, or complete
		// non-input actions like logging out.

		if (!action.isEmpty() || action != null) {
			if (action.equals("year")) {

				String startYear = request.getParameter("yearStart");
				String endYear = request.getParameter("yearEnd");

				if (startYear == null || startYear.isEmpty()) {
					startYear = "0";
				}
				if (endYear == null || startYear.isEmpty()) {
					endYear = "3000";
				}
				int syear = Integer.parseInt(startYear);
				int eyear = Integer.parseInt(endYear);

				session.setAttribute("startY", syear);
				session.setAttribute("endY", eyear);

				String filter = request.getParameter("selectFilter");
				if (filter != null && !filter.isEmpty() && filter.equals("resource")) {
					session.setAttribute("check1", "");
					session.setAttribute("check2", "");
					session.setAttribute("filter", "Resource");
				} else {
					session.setAttribute("check1", "un");
					session.setAttribute("check2", "checked");
					session.setAttribute("filter", "MineType");
				}

				ArrayList<String> precodeDT = dt.getPrecisionCode();
				String precode = request.getParameter("precodes");
				if (precode != null && !precode.isEmpty() && precodeDT.contains(precode)) {
					session.setAttribute("precode", precode);
					for (int i = 1; i < 5; i++) {
						String hold = Integer.toString(i);
						session.setAttribute(hold, "");
					}

					session.setAttribute(precode, "selected");
					session.setAttribute("filterOption", precode);
				} else {
					session.setAttribute("precode", "0");
					session.setAttribute("filterOption", "none");
				}

				url = "/dataIn.jsp";
				ArrayList<dataInfo> dataSet = dt.getData();
				session.setAttribute("dataSet", dataSet);

			}
		}

		getServletContext().getRequestDispatcher(url).forward(request, response);

	}

}