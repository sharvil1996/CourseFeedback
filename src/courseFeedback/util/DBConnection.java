
package courseFeedback.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	static Connection connection = null;

	public static Connection getConnection() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://65.19.141.67:3306/sharvil_daiictcoursefeedback","sharvil_wp614","urvilsh@H1628");
			//connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/daiictcoursefeedback", "root", "");
			if (connection != null) {
			} else {

			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public static void main(String[] args) {
		System.out.println(getConnection());
	}

}
