<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${contact == null ? "Add" : "Edit"} Contact</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        /* Header styling */
        h2 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        /* Form container styling */
        form {
            width: 90%;
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Label and input styling */
        label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
            color: #333;
        }

        input[type="text"], 
        input[type="email"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 5px 0 15px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            display: block;
            width: 100%;
            padding: 15px;
            margin-top: 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            form {
                padding: 15px;
            }

            input[type="text"], 
            input[type="email"] {
                font-size: 14px;
            }

            button {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <h2>${contact == null ? "Add New" : "Edit"} Contact</h2>
    <form action="contact" method="post">
        <input type="hidden" name="id" value="${contact.id}"/>
        <label for="firstName">First Name:</label>
        <input type="text" name="firstName" id="firstName" value="${contact.firstName}" required>
        <label for="lastName">Last Name:</label>
        <input type="text" name="lastName" id="lastName" value="${contact.lastName}" required>
        <label for="address">Address:</label>
        <input type="text" name="address" id="address" value="${contact.address}" required>
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" value="${contact.email}" required>
        <label for="phoneNumber">Phone Number:</label>
        <input type="text" name="phoneNumber" id="phoneNumber" value="${contact.phoneNumber}" required>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
