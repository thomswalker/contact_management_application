<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Saved Successfully</title>
    <style>
        /* Global Styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            text-align: center;
            color: #4CAF50;
            font-size: 28px;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Table Styling */
        table {
            width: 60%;
            max-width: 700px;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            text-align: left;
            font-size: 16px;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        td {
            background-color: #f9f9f9;
        }

        tr:last-child td {
            border-bottom: none;
        }

        /* Link Styling */
        a {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 24px;
            text-align: center;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #45a049;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            table, th, td {
                width: 100%;
            }

            h2 {
                font-size: 24px;
            }

            a {
                font-size: 14px;
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>

    <h2>${message}</h2>

    <table>
        <tr>
            <th>First Name</th>
            <td>${contact.firstName}</td>
        </tr>
        <tr>
            <th>Last Name</th>
            <td>${contact.lastName}</td>
        </tr>
        <tr>
            <th>Address</th>
            <td>${contact.address}</td>
        </tr>
        <tr>
            <th>Email</th>
            <td>${contact.email}</td>
        </tr>
        <tr>
            <th>Phone Number</th>
            <td>${contact.phoneNumber}</td>
        </tr>
    </table>

    <a href="contact?action=list">Go back to contact list</a>

</body>
</html>
