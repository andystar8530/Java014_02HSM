package _00_init.util;

public class DBService {
	public  static final String host = "127.0.0.1";
	public  static final String DB_MYSQL = "MYSQL";
	public  static final String DB_SQLSERVER = "SQLSERVER";

	public  static final String DB_TYPE = DB_MYSQL;

	private static final String DBURL_SQLServer = "jdbc:sqlserver://" + host + ":1433;databaseName=JSPDB";
	public  static final String USERID_SQLServer = "sa";
	public  static final String PSWD_SQLServer = "sa123456";

	public  static final String nameMs = "java:comp/env/jdbc/BookDataMsSQL";
	public  static final String nameMy = "java:comp/env/jdbc/BookDataMySQL";
	
	public  static String JNDI_DB_NAME = nameMs;
	
	static {
		if (JNDI_DB_NAME.equals(DB_MYSQL)) {
			JNDI_DB_NAME = nameMy;
		} else if (JNDI_DB_NAME.equals(DB_SQLSERVER)) {
			JNDI_DB_NAME = nameMs;
		}
	}
	
	private static final String DBURL_MySQL = "jdbc:mysql://" + host
			+ "/jspdb?useUnicode=yes&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Taipei";
	public static final String USERID_MySQL = "root";
	public static final String PSWD_MySQL = "Do!ng123";

	private static final String DROP_Member_MySQL = "DROP Table IF EXISTS `Member` ";
	private static final String DROP_Member_SQLServer = 
			"IF OBJECT_ID('dbo.Member', 'U') IS NOT NULL "
			+ " DROP TABLE dbo.Member; ";

	private static final String DROP_Book_MySQL = "DROP Table IF EXISTS Book ";
	private static final String DROP_Book_SQLServer = 
			"IF OBJECT_ID('dbo.Book', 'U') IS NOT NULL "
			+ " DROP TABLE dbo.Book; ";

	private static final String DROP_BookCompany_MySQL = "DROP TABLE IF EXISTS BookCompany";
	private static final String DROP_BookCompany_SQLServer = 
			"IF OBJECT_ID('dbo.BookCompany', 'U') IS NOT NULL "
			+ " DROP TABLE dbo.BookCompany; ";

	private static final String DROP_Orders_MySQL = "DROP Table IF EXISTS Orders ";
	private static final String DROP_Orders_SQLServer = 
			"IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL "
			+ " DROP TABLE dbo.Orders; ";

	private static final String DROP_OrderItems_MySQL = "DROP TABLE IF EXISTS OrderItems";
	private static final String DROP_OrderItems_SQLServer = 
			"IF OBJECT_ID('dbo.OrderItems', 'U') IS NOT NULL "
			+ " DROP TABLE dbo.OrderItems; ";
	
	private static final String CREATE_OrderItems_MySQL = "Create TABLE OrderItems " 
			+ "(seqno            int NOT NULL AUTO_INCREMENT Primary Key , "
			+ " orderNo          int, " 
			+ " bookId           int, " 
			+ " Description      varchar(255), "
			+ " amount           int, " 
			+ " unitPrice        DECIMAL(18,1), " 
			+ " Discount         Decimal(8,3) "
			+ " ) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci ";

	private static final String CREATE_OrderItems_SQLServer = "Create TABLE OrderItems "
			+ "(seqno            int NOT NULL IDENTITY Primary Key , " 
			+ " orderNo          int, "
			+ " bookId           int, " 
			+ " Description      varchar(255), " 
			+ " amount           int, "
			+ " unitPrice        DECIMAL(18,1), " 
			+ " Discount         MONEY " 
			+ " ) ";

	private static final String CREATE_Orders_MySQL = "Create Table Orders "
			+ "(orderNo  int NOT NULL AUTO_INCREMENT Primary Key , " 
			+ " memberId          varchar(255), "
			+ " totalAmount       Decimal(11,1), " 
			+ " shippingAddress   varchar(255), "
			+ " BNO               varchar(255), " 
			+ " invoiceTitle      varchar(255), " 
			+ " orderDate         DateTime, "
			+ " ShippingDate      DateTime, " 
			+ " CancelTag         Char(1) "
			+ " ) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci ";

	private static final String CREATE_Orders_SQLServer = "Create Table Orders "
			+ "(orderNo  int NOT NULL IDENTITY Primary Key , " 
			+ " memberId          varchar(255), "
			+ " totalAmount       Decimal(11,1), " 
			+ " shippingAddress   varchar(255), "
			+ " BNO               varchar(255), " 
			+ " invoiceTitle      varchar(255), " 
			+ " orderDate         DateTime, "
			+ " ShippingDate      DateTime, " 
			+ " CancelTag         Char(1) " 
			+ " )";

	private static final String CREATE_BookCompany_MySQL =
			  " CREATE TABLE BookCompany "
			+ "(id  int NOT NULL AUTO_INCREMENT , " 
			+ " name		    varchar(255), " 
			+ " address    		varchar(255), "
			+ " url  			varchar(255), " 
			+ " PRIMARY KEY (id) "
			+ " ) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci  ";

	private static final String CREATE_BookCompany_SQLServer = "CREATE TABLE BookCompany "
			+ "(id  int NOT NULL IDENTITY Primary Key , " 
			+ " name		    varchar(255), "
			+ " address    		varchar(255), " 
			+ " url  			varchar(255) " 
			+ " ) ";

	private static final String CREATE_Book_MySQL = " CREATE TABLE Book " 
			+ " (bookId int NOT NULL AUTO_INCREMENT, "
			+ " title				varchar(255), " 
			+ " author    			varchar(255), "
			+ " listPrice			DECIMAL(10,1), " 
			+ " discount			DECIMAL(7,3), "
			+ " coverImage   		LongBlob, " 
			+ " fileName			varchar(255), "
			+ " bookNo 				varchar(255), " 
			+ " stock 				int, " 
			+ " category			varchar(255), "
			+ " companyId			int, "
			+ " PRIMARY KEY 		(bookId)  " 
			+ " )  ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci  ";

	private static final String CREATE_Book_SQLServer = "CREATE TABLE Book " 
			+ "(bookId int NOT NULL IDENTITY, "
			+ " title				varchar(255), " 
			+ " author    			varchar(255), " 
			+ " listPrice			Money, "
			+ " discount			Money, " 
			+ " coverImage   		Image," 
			+ " fileName			varchar(255), "
			+ " bookNo 				varchar(255), " 
			+ " stock 				int, " 
			+ " category			varchar(255), "
			+ " companyId			int, "
			+ " PRIMARY KEY 		(bookId)  " 
			+ " )";

	private static final String CREATE_Member_MySQL = " CREATE TABLE `Member` " 
			+ "(seqNo int NOT NULL Auto_Increment, "
			+ " memberId			varchar(255), " 
			+ " name    			varchar(255), "
			+ " password			varchar(255), " 
			+ " address 			varchar(255), "
			+ " email 				varchar(255), " 
			+ " tel  				varchar(255), "
			+ " userType			varchar(255), " 
			+ " registerTime    	DateTime, "
			+ " totalAmt     		DECIMAL(10, 1), " 
			+ " memberImage  		LongBlob, "
			+ " fileName     		varchar(255), " 
			+ " comment      		LongText, "
			+ " unpaid_amount    	DECIMAL(8, 1), " 
			+ " PRIMARY KEY 		(seqNo) "
			+ " ) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci";

	private static final String CREATE_Member_SQLServer = " CREATE TABLE `Member` " 
			+ "(seqNo int NOT NULL IDENTITY, "
			+ " memberID			varchar(255), " 
			+ " name    			varchar(255), "
			+ " password			varchar(255), " 
			+ " address 			varchar(255), "
			+ " email 				varchar(255), " 
			+ " tel  				varchar(255), "
			+ " userType			varchar(255), " 
			+ " registerTime    	DateTime, "
			+ " totalAmt     		MONEY, " 
			+ " memberImage  		IMAGE, "
			+ " fileName     		varchar(255), " 
			+ " comment      	    Text, " 
			+ " unpaid_amount     MONEY, "
			+ " PRIMARY KEY 		(seqNo) " 
			+ " )";

	public static String getDropBook() {
		String drop = null;
		if (DB_TYPE.equalsIgnoreCase(DB_MYSQL)) {
			drop = DROP_Book_MySQL;
		} else if (DB_TYPE.equalsIgnoreCase(DB_SQLSERVER)) {
			drop = DROP_Book_SQLServer;
		}
		return drop;
	}

	public static String getCreateBookCompany() {
		String create = null;
		if (DB_TYPE.equalsIgnoreCase(DB_MYSQL)) {
			create = CREATE_BookCompany_MySQL;
		} else if (DB_TYPE.equalsIgnoreCase(DB_SQLSERVER)) {
			create = CREATE_BookCompany_SQLServer;
		}
		return create;
	}
	
	public static String getDropBookCompany() {
		String drop = null;
		if (DB_TYPE.equalsIgnoreCase(DB_MYSQL)) {
			drop = DROP_BookCompany_MySQL;
		} else if (DB_TYPE.equalsIgnoreCase(DB_SQLSERVER)) {
			drop = DROP_BookCompany_SQLServer;
		}
		return drop;
	}

	public static String getCreateBook() {
		String create = null;
		if (DB_TYPE.equalsIgnoreCase(DB_MYSQL)) {
			create = CREATE_Book_MySQL;
		} else if (DB_TYPE.equalsIgnoreCase(DB_SQLSERVER)) {
			create = CREATE_Book_SQLServer;
		}
		return create;
	}

	public static String getDropMember() {
		String drop = null;
		if (DB_TYPE.equalsIgnoreCase(DB_MYSQL)) {
			drop = DROP_Member_MySQL;
		} else if (DB_TYPE.equalsIgnoreCase(DB_SQLSERVER)) {
			drop = DROP_Member_SQLServer;
		}
		return drop;
	}

	public static String getCreateMember() {
		String create = null;
		if (DB_TYPE.equalsIgnoreCase(DB_MYSQL)) {
			create = CREATE_Member_MySQL;
		} else if (DB_TYPE.equalsIgnoreCase(DB_SQLSERVER)) {
			create = CREATE_Member_SQLServer;
		}
		return create;
	}
	
	
	public static String getDropOrders() {
		String drop = null;
		if (DB_TYPE.equalsIgnoreCase(DB_MYSQL)) {
			drop = DROP_Orders_MySQL;
		} else if (DB_TYPE.equalsIgnoreCase(DB_SQLSERVER)) {
			drop = DROP_Orders_SQLServer;
		}
		return drop;
	}

	public static String getCreateOrders() {
		String create = null;
		if (DB_TYPE.equalsIgnoreCase(DB_MYSQL)) {
			create = CREATE_Orders_MySQL;
		} else if (DB_TYPE.equalsIgnoreCase(DB_SQLSERVER)) {
			create = CREATE_Orders_SQLServer;
		}
		return create;
	}
	
	public static String getDropOrderItems() {
		String drop = null;
		if (DB_TYPE.equalsIgnoreCase(DB_MYSQL)) {
			drop = DROP_OrderItems_MySQL;
		} else if (DB_TYPE.equalsIgnoreCase(DB_SQLSERVER)) {
			drop = DROP_OrderItems_SQLServer;
		}
		return drop;
	}

	public static String getCreateOrderItems() {
		String create = null;
		if (DB_TYPE.equalsIgnoreCase(DB_MYSQL)) {
			create = CREATE_OrderItems_MySQL;
		} else if (DB_TYPE.equalsIgnoreCase(DB_SQLSERVER)) {
			create = CREATE_OrderItems_SQLServer;
		}
		return create;
	}
	
	
	

	public static String getDbUrl() {
		String url = null;
		if (DB_TYPE.equalsIgnoreCase(DB_MYSQL)) {
			url = DBURL_MySQL;
		} else if (DB_TYPE.equalsIgnoreCase(DB_SQLSERVER)) {
			url = DBURL_SQLServer;
		}
		return url;
	}

	public static String getUser() {
		String user = null;
		if (DB_TYPE.equalsIgnoreCase(DB_MYSQL)) {
			user = USERID_MySQL;
		} else if (DB_TYPE.equalsIgnoreCase(DB_SQLSERVER)) {
			user = USERID_SQLServer;
		}
		return user;
	}

	public static String getPassword() {
		String pswd = null;
		if (DB_TYPE.equalsIgnoreCase(DB_MYSQL)) {
			pswd = PSWD_MySQL;
		} else if (DB_TYPE.equalsIgnoreCase(DB_SQLSERVER)) {
			pswd = PSWD_SQLServer;
		}
		return pswd;
	}

}
