# contact_management_application


# Contact Management Application

## Description
This is a simple **Contact Management Application** that allows users to manage contact details. The application supports CRUD (Create, Read, Update, Delete) operations on contact records, and includes basic data validation to ensure proper data entry.

### Features:
- Collect and manage the following information for each contact:
  - First Name
  - Last Name
  - Address
  - Email ID
  - Phone Number
- Perform **CRUD operations** on contact records:
  - **Create**: Add a new contact.
  - **Read**: View a list of all contacts or view a single contact's details.
  - **Update**: Edit the details of an existing contact.
  - **Delete**: Remove a contact from the list.
- **Data Validation** to ensure proper format and avoid duplicates:
  - Valid email addresses
  - Prevent duplicate contacts
- **Persistent Storage**: Uses a database to store contact information, ensuring data persists even after restarting the application.
  
The application can be implemented as a web app, mobile app, or desktop app based on the chosen technology stack.

---

## Table of Contents
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup and Installation](#setup-and-installation)
- [How to Use](#how-to-use)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

---

## Technologies Used
- **Backend**: [Java](https://www.oracle.com/java/) with Servlets/JSP and JDBC
- **Frontend**: HTML, CSS, JavaScript
- **Database**: MySQL (or any other preferred database)
- **Server**: Apache Tomcat (or any other preferred server)

---

## Setup and Installation

### Prerequisites
- Java (JDK 8 or higher)
- Apache Tomcat 10 (or a compatible web server)
- MySQL (or any other database)

### Steps to Run the Application
1. **Clone the Repository**:
    ```bash
    git clone https://github.com/your-username/contact-management-app.git
    ```

2. **Setup Database**:
    - Create a MySQL database:
      ```sql
      CREATE DATABASE contact_db;
      ```
    - Run the SQL scripts from the `/sql` folder to create necessary tables.

3. **Configure the Application**:
   - Open `src/main/resources/db.properties` and update your database credentials.

4. **Deploy on Tomcat**:
   - Build the project and deploy the WAR file on your Apache Tomcat server.

5. **Run the Application**:
   - Open your browser and go to `http://localhost:8080/contact-management-app`.

---

## How to Use

1. **Home Page**:
   - The home page will display a list of all contacts with options to view, edit, or delete them.
  
2. **Add Contact**:
   - Click on the "Add Contact" button to add a new contact.
  
3. **Edit Contact**:
   - Click on the "Edit" button next to a contact to modify their details.
  
4. **Delete Contact**:
   - Click on the "Delete" button to remove a contact from the list.

---

## Project Structure
```
contact-management-app/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── com/contactapp/
│   │   │   │   ├── dao/  # Database operations
│   │   │   │   ├── model/  # Contact model class
│   │   │   │   ├── servlet/  # Servlets for handling requests
│   │   ├── resources/
│   │   │   ├── db.properties  # Database configuration
│   ├── webapp/
│   │   ├── WEB-INF/
│   │   ├── JSP files/  # JSP files for UI
│   ├── sql/
│   │   ├── create_tables.sql  # SQL scripts to set up database
├── README.md
```

---

## Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

---

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

