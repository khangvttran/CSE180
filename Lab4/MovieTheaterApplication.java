import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the MovieTheater database interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */

public class MovieTheaterApplication {

    private Connection connection;

    /*
     * Constructor
     */
    public MovieTheaterApplication(Connection connection) {
        this.connection = connection;
    }

    public Connection getConnection()
    {
        return connection;
    }

    /**
     * getShowingsCount has a string argument called thePriceCode, and returns the number of
     * Showings whose priceCode equals thePriceCode.
     * A value of thePriceCode that’s not ‘A’, B’ or ‘C’ is an error.
     */

    public Integer getShowingsCount(String thePriceCode) throws SQLException
    {
        Integer result = 0;
        // your code here

        // Query to find the number of Showings where priceCode == thePriceCode
        String showingsQuery = ""


        // end of your code
        return result;
    }


    /**
     * updateMovieName method has two arguments, an integer argument theMovieID, and a string
     * argument, newMovieName.  For the tuple in the Movies table (if any) whose movieID equals
     * theMovieID, updateMovieName should update its name to be newMovieName.  (Note that there
     * might not be any tuples whose movieID matches theMovieID.)  updateMovieName should return
     * the number of tuples that were updated, which will always be 0 or 1.
     */

    public int updateMovieName(int theMovieID, String newMovieName)
    {
        // your code here; return 0 appears for now to allow this skeleton to compile.
        return 0;



        // end of your code
    }


    /**
     * reduceSomeTicketPrices has an integer parameter, maxTicketCount.  It invokes a stored
     * function reduceSomeTicketPricesFunction that you will need to implement and store in the
     * database according to the description in Section 5.  reduceSomeTicketPricesFunction should
     * have the same parameter, maxTicketCount.  A value of maxTicketCount that’s not positive is
     * an error.
     *
     * The Tickets table has a ticketPrice attribute, which gives the price (in dollars and cents)
     * of each ticket.  reduceSomeTicketPricesFunction will reduce the ticketPrice for some (but
     * not necessarily all) tickets; Section 5 explains which tickets should have their
     * ticketPrice reduced, and also tells you how much they should be reduced.  The
     * reduceSomeTicketPrices method should return the same integer result that the
     * reduceSomeTicketPricesFunction stored function returns.
     *
     * The reduceSomeTicketPrices method must only invoke the stored function
     * reduceSomeTicketPricesFunction, which does all of the assignment work; do not implement
     * the reduceSomeTicketPrices method using a bunch of SQL statements through JDBC.
     */

    public int reduceSomeTicketPrices (int maxTicketCount)
    {
        // There's nothing special about the name storedFunctionResult
        int storedFunctionResult = 0;

        // your code here


        // end of your code
        return storedFunctionResult;

    }

};
