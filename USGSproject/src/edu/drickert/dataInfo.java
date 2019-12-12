package edu.drickert;

import java.io.Serializable;

public class dataInfo implements Serializable {
	private String year;// 1
	private String resource;// 2
	private String country;// 3
	private String continent;// 5
	private String standMeasure;// 6
	private String Location;// 15
	private String mineType;// 16
	private String admin1;// 17
	private String admin2;// 18
	private String Latitude;// 19
	private String Logitude;// 20
	private String precisionCode;// 21
	private String annualAmount;// 34

	public dataInfo() {
	}

	public dataInfo(String year, String resource, String country, String continent, String standMeasure,
			String location, String mineType, String admin1, String admin2, String latitude, String logitude,
			String precisionCode, String annualAmount) {
		super();
		this.year = year;
		this.resource = resource;
		this.country = country;
		this.continent = continent;
		this.standMeasure = standMeasure;
		Location = location;
		this.mineType = mineType;
		this.admin1 = admin1;
		this.admin2 = admin2;
		Latitude = latitude;
		Logitude = logitude;
		this.precisionCode = precisionCode;
		this.annualAmount = annualAmount;
	}

	public String[] getRow() {
		String[] arr = { year, resource, country, continent, standMeasure, Location, mineType, admin1, admin2, Latitude,
				Logitude, precisionCode, annualAmount };
		return arr;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getResource() {
		return resource;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getContinent() {
		return continent;
	}

	public void setContinent(String continent) {
		this.continent = continent;
	}

	public String getStandMeasure() {
		return standMeasure;
	}

	public void setStandMeasure(String standMeasure) {
		this.standMeasure = standMeasure;
	}

	public String getLocation() {
		return Location;
	}

	public void setLocation(String location) {
		Location = location;
	}

	public String getMineType() {
		return mineType;
	}

	public void setMineType(String mineType) {
		this.mineType = mineType;
	}

	public String getAdmin1() {
		return admin1;
	}

	public void setAdmin1(String admin1) {
		this.admin1 = admin1;
	}

	public String getAdmin2() {
		return admin2;
	}

	public void setAdmin2(String admin2) {
		this.admin2 = admin2;
	}

	public String getLatitude() {
		return Latitude;
	}

	public void setLatitude(String latitude) {
		Latitude = latitude;
	}

	public String getLogitude() {
		return Logitude;
	}

	public void setLogitude(String logitude) {
		Logitude = logitude;
	}

	public String getPrecisionCode() {
		return precisionCode;
	}

	public void setPrecisionCode(String precisionCode) {
		this.precisionCode = precisionCode;
	}

	public String getAnnualAmount() {
		return annualAmount;
	}

	public void setAnnualAmount(String annualAmount) {
		this.annualAmount = annualAmount;
	}
}