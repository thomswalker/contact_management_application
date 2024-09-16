<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact List</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            color: #333;
            font-size: 36px;
            margin-bottom: 20px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        /* Table Styles */
        table {
            width: 90%;
            max-width: 1200px;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        thead {
            background-color: #4CAF50;
            color: white;
        }

        thead th {
            padding: 15px;
            text-align: left;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        tbody td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #f1f1f1;
        }

        td a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 16px;
            border: 1px solid #4CAF50;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        td a:hover {
            background-color: #4CAF50;
            color: white;
        }

        /* Button */
        a.new-contact-btn {
            display: inline-block;
            margin-top: 20px;
            background-color: #4CAF50;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        a.new-contact-btn:hover {
            background-color: #45a049;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            table, tbody, thead, tr, td, th {
                display: block;
                width: 100%;
            }

            table {
                margin-bottom: 20px;
            }

            tbody tr {
                display: flex;
                flex-direction: column;
                margin-bottom: 10px;
            }

            thead {
                display: none;
            }

            tbody td {
                padding-left: 50%;
                text-align: right;
                position: relative;
            }

            tbody td::before {
                content: attr(data-label);
                position: absolute;
                left: 0;
                padding-left: 15px;
                font-weight: bold;
                text-transform: uppercase;
            }

            h2 {
                font-size: 28px;
            }

            a.new-contact-btn {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <h2>Contact List</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="contact" items="${listContact}">
                <tr>
                    <td data-label="ID">${contact.id}</td>
                    <td data-label="First Name">${contact.firstName}</td>
                    <td data-label="Last Name">${contact.lastName}</td>
                    <td data-label="Address">${contact.address}</td>
                    <td data-label="Email">${contact.email}</td>
                    <td data-label="Phone Number">${contact.phoneNumber}</td>
                    <td data-label="Actions">
                        <a href="contact?action=edit&id=${contact.id}">Edit</a> |
                        <a href="contact?action=delete&id=${contact.id}" onclick="return confirm('Are you sure?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="contact?action=new" class="new-contact-btn">Add New Contact</a>
</body>
</html>
