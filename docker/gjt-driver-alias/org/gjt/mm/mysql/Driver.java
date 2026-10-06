package org.gjt.mm.mysql;

import java.sql.SQLException;

/**
 * The pre-2003 MySQL driver class name, which the JEvolution report apps are configured with
 * (Connection/objectPool.xml). Delegates to the current MySQL Connector/J driver.
 */
public class Driver extends com.mysql.cj.jdbc.Driver {

	static {
		try {
			java.sql.DriverManager.registerDriver(new Driver());
		} catch (SQLException ex) {
			throw new IllegalStateException(ex);
		}
	}

	public Driver() throws SQLException {
		super();
	}
}
