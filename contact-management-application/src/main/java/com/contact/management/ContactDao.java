package com.contact.management;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContactDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/contact_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "7975773990Mysql"; // Replace with your MySQL password
    private Connection jdbcConnection;

    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    // Insert a contact into the database
    public boolean insertContact(Contact contact) throws SQLException {
        String sql = "INSERT INTO contacts (firstName, lastName, address, email, phoneNumber) VALUES (?, ?, ?, ?, ?)";
        connect();

        try (PreparedStatement statement = jdbcConnection.prepareStatement(sql)) {
            statement.setString(1, contact.getFirstName());
            statement.setString(2, contact.getLastName());
            statement.setString(3, contact.getAddress());
            statement.setString(4, contact.getEmail());
            statement.setString(5, contact.getPhoneNumber());

            return statement.executeUpdate() > 0;
        } finally {
            disconnect();
        }
    }

    // Retrieve the most recently inserted contact
    public Contact getLatestContact() throws SQLException {
        String sql = "SELECT * FROM contacts ORDER BY id DESC LIMIT 1";
        connect();

        Contact contact = null;
        try (Statement statement = jdbcConnection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String firstName = resultSet.getString("firstName");
                String lastName = resultSet.getString("lastName");
                String address = resultSet.getString("address");
                String email = resultSet.getString("email");
                String phoneNumber = resultSet.getString("phoneNumber");

                contact = new Contact(id, firstName, lastName, address, email, phoneNumber);
            }
        } finally {
            disconnect();
        }

        return contact;
    }

    // List all contacts
    public List<Contact> listAllContacts() throws SQLException {
        List<Contact> listContact = new ArrayList<>();
        String sql = "SELECT * FROM contacts";
        connect();

        try (Statement statement = jdbcConnection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String firstName = resultSet.getString("firstName");
                String lastName = resultSet.getString("lastName");
                String address = resultSet.getString("address");
                String email = resultSet.getString("email");
                String phoneNumber = resultSet.getString("phoneNumber");

                Contact contact = new Contact(id, firstName, lastName, address, email, phoneNumber);
                listContact.add(contact);
            }
        } finally {
            disconnect();
        }

        return listContact;
    }

    // Update an existing contact
    public boolean updateContact(Contact contact) throws SQLException {
        String sql = "UPDATE contacts SET firstName = ?, lastName = ?, address = ?, email = ?, phoneNumber = ? WHERE id = ?";
        connect();

        try (PreparedStatement statement = jdbcConnection.prepareStatement(sql)) {
            statement.setString(1, contact.getFirstName());
            statement.setString(2, contact.getLastName());
            statement.setString(3, contact.getAddress());
            statement.setString(4, contact.getEmail());
            statement.setString(5, contact.getPhoneNumber());
            statement.setInt(6, contact.getId());

            return statement.executeUpdate() > 0;
        } finally {
            disconnect();
        }
    }

    // Delete a contact by ID
    public boolean deleteContact(int id) throws SQLException {
        String sql = "DELETE FROM contacts WHERE id = ?";
        connect();

        try (PreparedStatement statement = jdbcConnection.prepareStatement(sql)) {
            statement.setInt(1, id);

            return statement.executeUpdate() > 0;
        } finally {
            disconnect();
        }
    }

    // Retrieve a contact by ID
    public Contact getContact(int id) throws SQLException {
        Contact contact = null;
        String sql = "SELECT * FROM contacts WHERE id = ?";
        connect();

        try (PreparedStatement statement = jdbcConnection.prepareStatement(sql)) {
            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String firstName = resultSet.getString("firstName");
                    String lastName = resultSet.getString("lastName");
                    String address = resultSet.getString("address");
                    String email = resultSet.getString("email");
                    String phoneNumber = resultSet.getString("phoneNumber");

                    contact = new Contact(id, firstName, lastName, address, email, phoneNumber);
                }
            }
        } finally {
            disconnect();
        }

        return contact;
    }
}
