<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Contact</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        /* Main header styling */
        h1 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        /* Form container styling */
        form {
            width: 80%;
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Label styling */
        label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
            color: #333;
        }

        /* Input styling */
        input[type="text"], 
        input[type="email"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 5px 0 15px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* Submit button styling */
        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
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

            input[type="submit"] {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <h1>Update Contact</h1>
    <form action="contact?action=insert" method="post">
        <label for="first_name">First Name:</label>
        <input type="text" name="firstName" required><br>

        <label for="last_name">Last Name:</label>
        <input type="text" name="lastName" required><br>

        <label for="address">Address:</label>
        <input type="text" name="address"><br>

        <label for="email">Email:</label>
        <input type="email" name="email" required><br>

        <label for="phone_number">Phone Number:</label>
        <input type="text" name="phoneNumber" required><br>

        <input type="submit" value="Save">
    </form>
</body>
</html>
