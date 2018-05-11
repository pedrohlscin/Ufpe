package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Pessoa {
	
	String table_name = "Pessoa";
	Connection con;

	public String[] consultar(String CPF) throws SQLException {
		ConnectionDatabase connectionBD = new ConnectionDatabase();
		this.con = connectionBD.setConnection();
		
		
		
		this.con.commit();
		this.con.close();
		return null;
	}
	
    public void update(String name, String cpf, String date, char sexo) throws SQLException {
    	ConnectionDatabase connectionBD = new ConnectionDatabase();
		this.con = connectionBD.setConnection();
		
		
		
		this.con.commit();
		this.con.close();
    }

    public void insert(String name, String cpf, String date, char sexo) throws SQLException {
    	ConnectionDatabase connectionBD = new ConnectionDatabase();
		this.con = connectionBD.setConnection();

		final String INSERIR = "INSERT INTO Pessoa (CPF, Nome, Data_Nascimento, Sexo) VALUES (?, ?, ?, ?)";
		PreparedStatement preparedStatement = this.con.prepareStatement(INSERIR);
		preparedStatement.setString(2, name);
		preparedStatement.setString(1, cpf);
		preparedStatement.setString(3, date);
		preparedStatement.setString(4, String.valueOf(sexo));
		preparedStatement.executeUpdate();
		
		this.con.commit();
		this.con.close();
    }
}