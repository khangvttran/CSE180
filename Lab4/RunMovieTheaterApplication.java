import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the MovieTheaterApplication class
 * in a similar manner to the sample RunFilmsApplication.java program.
*/


public class RunMovieTheaterApplication
{
    public static void main(String[] args) {
    	
    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver"); 
    	    // Make the connection.
            // You will need to fill in your real username (twice) and password for your
            // Postgres account in the arguments of the getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cse180-db.lt.ucsc.edu/khvitran",
                                                     "khvitran",
                                                     "thecowgoesmoo4.0");
            
            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the MovieTheaterApplication class.
             * The sample code in RunFilmsApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */
			
			 MovieTheaterApplication app = new MovieTheaterApplication(connection);

			// -----------------------------------------------------------------------------------------
			// Testing getShowingsCount
			// Output when thePriceCode = 'B': 
				/* 
				Connected to the database!
				Output of getShowingsCount when code = 'B' 
				8
				*/

			String code = "'B'";
			System.out.println("Output of getShowingsCount when code = " + code);
			int showingCount = app.getShowingsCount(code);
			System.out.println(showingCount);

			// -----------------------------------------------------------------------------------------
			// Testing updateMovieName
			// Output when theMovieID = 101 and newMovieName = 'Avatar 1':
				/*
				Output of updateMovieName when theMovieID = 101 and newMovieName = 'Avatar 1'
				1
				*/

			int id1 = 101;
			String newName1 = "'Avatar 1'";

			System.out.println("Output of updateMovieName when theMovieID = " + id1 + 
							   " and newMovieName = " + newName1);
			int nameCount1 = app.updateMovieName(id1, newName1);
			System.out.println(nameCount1);

			// Output when theMovieID = 888 and newMovieName = 'Star Wars: A New Hope':
			/*
			 * Output of updateMovieName when theMovieID = 888 and newMovieName = 'Star Wars: A New Hope'
			 * 0
			 */

			int id2 = 888;
			String newName2 = "'Star Wars: A New Hope'";

			System.out.println("Output of updateMovieName when theMovieID = " + id2 + " and newMovieName = " + newName2);
			int nameCount2 = app.updateMovieName(id2, newName2);
			System.out.println(nameCount2);

			// -----------------------------------------------------------------------------------------
			// Testing updateMovieName
			

            /*******************
            * Your code ends here */
            
    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
