package edu.drickert;

import java.io.*;
import java.util.*;
import edu.drickert.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserTable {
	static Connection conn;
	public static void addRecord(User user) throws IOException {
			int rowCount=0;
			try {
				
			conn=ConnectionProvider.getCon();
			Statement statement = conn.createStatement();
			String query = "INSERT into users (firstname, lastname, email, password)"
					+ "VALUES";
			query += "('" + user.getFirstName() + "', "
					+ "'" + user.getLastName() + "', "
					+ "'" + user.getEmail() + "', "
					+ "'" + user.getPassword() + "')";
			rowCount = statement.executeUpdate(query);
			conn.close();
			}catch(Exception ex){
				System.out.println(ex);
			}
			System.out.println(rowCount);

	}
		
	public User getUser(String emailAddress) throws IOException {
		

		try {
			
		conn=ConnectionProvider.getCon();
		
		String query = "select * From users where users.email =?";
		PreparedStatement statement = conn.prepareStatement(query);	
			statement.setString(1, emailAddress);
		
			ResultSet result = statement.executeQuery();
			String test = result.getString(3);
			if (result.first()) {
				User u = new User(result.getString(1), result.getString(2),result.getString(3), result.getString(4));
				
				return u;
				
			}
			conn.close();
		}catch(Exception ex){
			System.out.println(ex);
		}
			
		return null;
	}

	public ArrayList<User> getUsers() throws IOException {
		ArrayList<User> users = new ArrayList<User>();
		
		try {
			
		conn=ConnectionProvider.getCon();
		Statement statement = conn.createStatement();	
			ResultSet result = statement.executeQuery("select * From users");
			
			while (result.next()) {
				User u = new User(result.getString(1), result.getString(2), result.getString(3), result.getString(4));

				users.add(u);

			}
			return users;
		}catch(Exception ex){
			System.out.println(ex);
		}

			
		return null;
	}
}