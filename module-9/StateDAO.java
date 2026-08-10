package database;

import beans.StateRecord;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/*
 * Name: Natasha Foreman
 * Course: CSD 430 - Server Side Development
 * Date: 8/9/26
 * Assignment: Modules 5, 6, 7,8 and 9 Project
 * Purpose: Reads, creates, deletes and updates state records in the CSD430 database.
 */
public class StateDAO {

    private static final String TABLE_NAME = "natashastatesdata";

    public List<Integer> getAllStateIds() throws SQLException {

        List<Integer> stateIds = new ArrayList<>();

        String sql = "SELECT state_id FROM " + TABLE_NAME
                + " ORDER BY state_id";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {
                stateIds.add(resultSet.getInt("state_id"));
            }
        }

        return stateIds;
    }

    /*
     * Retrieves one state record using its primary key.
     */
    public StateRecord getStateById(int stateId) throws SQLException {

        String sql = "SELECT state_id, state_name, city_location, "
                + "travel_category, visit_type, reason_enjoyed "
                + "FROM " + TABLE_NAME
                + " WHERE state_id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setInt(1, stateId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {
                    return createStateRecord(resultSet);
                }
            }
        }

        return null;
    }

    /*
     * Inserts a new state record.
     */
    public int insertState(StateRecord stateRecord) throws SQLException {

        String sql = "INSERT INTO " + TABLE_NAME
                + " (state_name, city_location, travel_category, "
                + "visit_type, reason_enjoyed) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(
                    sql,
                    Statement.RETURN_GENERATED_KEYS)
        ) {

            statement.setString(1, stateRecord.getStateName());
            statement.setString(2, stateRecord.getCityLocation());
            statement.setString(3, stateRecord.getTravelCategory());
            statement.setString(4, stateRecord.getVisitType());
            statement.setString(5, stateRecord.getReasonEnjoyed());

            statement.executeUpdate();

            try (ResultSet generatedKeys =
                    statement.getGeneratedKeys()) {

                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
        }

        return 0;
    }

    /*
     * Retrieves all state records from the database.
     */
    public List<StateRecord> getAllStates() throws SQLException {

        List<StateRecord> stateRecords = new ArrayList<>();

        String sql = "SELECT state_id, state_name, city_location, "
                + "travel_category, visit_type, reason_enjoyed "
                + "FROM " + TABLE_NAME
                + " ORDER BY state_id";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {
                stateRecords.add(createStateRecord(resultSet));
            }
        }

        return stateRecords;
    }

    /*
     * Updates an existing state record.
     */
    public boolean updateState(StateRecord stateRecord)
            throws SQLException {

        String sql = "UPDATE " + TABLE_NAME
                + " SET state_name = ?, "
                + "city_location = ?, "
                + "travel_category = ?, "
                + "visit_type = ?, "
                + "reason_enjoyed = ? "
                + "WHERE state_id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setString(1, stateRecord.getStateName());
            statement.setString(2, stateRecord.getCityLocation());
            statement.setString(3, stateRecord.getTravelCategory());
            statement.setString(4, stateRecord.getVisitType());
            statement.setString(5, stateRecord.getReasonEnjoyed());
            statement.setInt(6, stateRecord.getStateId());

            return statement.executeUpdate() > 0;
        }
    }
   
     /*
     * Deletes one state record using its primary key.
     */
public boolean deleteState(int stateId) throws SQLException {

    String sql = "DELETE FROM " + TABLE_NAME
            + " WHERE state_id = ?";

    try (
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement =
                connection.prepareStatement(sql)
    ) {

        statement.setInt(1, stateId);

        return statement.executeUpdate() > 0;
    }
}

    /*
     * Converts one database row into a StateRecord JavaBean.
     */
    private StateRecord createStateRecord(ResultSet resultSet)
            throws SQLException {

        return new StateRecord(
                resultSet.getInt("state_id"),
                resultSet.getString("state_name"),
                resultSet.getString("city_location"),
                resultSet.getString("travel_category"),
                resultSet.getString("visit_type"),
                resultSet.getString("reason_enjoyed"));
    }
}