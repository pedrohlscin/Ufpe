package jdbc;

import java.sql.Connection;
import java.sql.SQLException;

public class Main {
	public static void main(String[] args) {
		Connection con;
		ConnectionDatabase driverCon = new ConnectionDatabase();
		con = driverCon.setConnection();
		
		if (con != null) {
            System.out.println("You made it, take control your database now!");
        } else {
            System.out.println("Failed to make connection!");
        }
		
		Pessoa pessoa = new Pessoa();
		try {
			pessoa.insert("Craudio", "123.234.352-12", "11/11/1998", 'M');
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
