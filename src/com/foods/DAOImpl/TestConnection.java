package com.foods.DAOImpl;

import java.sql.Connection;
import com.foods.util.DBConnection;

public class TestConnection {
	public static void main(String[] args) {
		try {
			Connection con = DBConnection.getConnection();
			System.out.println("Connected successfully!");
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

