package edu.drickert;

import java.io.*;
import java.util.*;
import edu.drickert.dataInfo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataTable {
	static Connection conn;

	public ArrayList<String> getPrecisionCode() throws IOException {
		ArrayList<String> resources = new ArrayList<String>();

		try {

			conn = ConnectionProvider.getCon();
			Statement statement = conn.createStatement();
			ResultSet result = statement.executeQuery("select DISTINCT precisioncode From tabledata");

			while (result.next()) {
				resources.add(result.getString(1));

			}
			return resources;
		} catch (Exception ex) {
			System.out.println(ex);
		}

		return null;
	}

	public ArrayList<String> getMinerals() throws IOException {
		ArrayList<String> resources = new ArrayList<String>();

		try {

			conn = ConnectionProvider.getCon();
			Statement statement = conn.createStatement();
			ResultSet result = statement.executeQuery("select DISTINCT resource From tabledata");

			while (result.next()) {
				resources.add(result.getString(1));

			}
			return resources;
		} catch (Exception ex) {
			System.out.println(ex);
		}

		return null;
	}

	public ArrayList<String> getMineType() throws IOException {
		ArrayList<String> resources = new ArrayList<String>();

		try {

			conn = ConnectionProvider.getCon();
			Statement statement = conn.createStatement();
			ResultSet result = statement.executeQuery("select DISTINCT minetype From tabledata");

			while (result.next()) {
				resources.add(result.getString(1));

			}
			return resources;
		} catch (Exception ex) {
			System.out.println(ex);
		}

		return null;
	}

	public ArrayList<dataInfo> getData() throws IOException {
		ArrayList<dataInfo> data = new ArrayList<dataInfo>();

		try {

			conn = ConnectionProvider.getCon();
			Statement statement = conn.createStatement();
			ResultSet result = statement.executeQuery("select * From tabledata");

			while (result.next()) {
				dataInfo di = new dataInfo(result.getString(1), result.getString(2), result.getString(3),
						result.getString(5), result.getString(6), result.getString(15), result.getString(16),
						result.getString(17), result.getString(18), result.getString(19), result.getString(20),
						result.getString(21), result.getString(34));

				data.add(di);

			}
			return data;
		} catch (Exception ex) {
			System.out.println(ex);
		}

		return null;
	}
}