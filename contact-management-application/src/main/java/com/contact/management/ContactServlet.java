package com.contact.management;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContactDao contactDao;

    @Override
    public void init() {
        contactDao = new ContactDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null) {
                listContact(request, response); // Default to listing contacts
            } else {
                switch (action) {
                    case "new":
                        showNewForm(request, response);
                        break;
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteContact(request, response);
                        break;
                    case "update":
                        updateContact(request, response);
                        break;
                    default:
                        listContact(request, response);
                        break;
                }
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null) {
                response.sendRedirect("contact");
            } else {
                switch (action) {
                    case "insert":
                        insertContact(request, response);
                        break;
                    default:
                        response.sendRedirect("contact");
                        break;
                }
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listContact(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Contact> listContact = contactDao.listAllContacts();
        request.setAttribute("listContact", listContact);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/contact-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/addContact.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Contact existingContact = contactDao.getContact(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/updateContact.jsp");
        request.setAttribute("contact", existingContact);
        dispatcher.forward(request, response);
    }

    private void insertContact(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");

        Contact newContact = new Contact();
        newContact.setFirstName(firstName);
        newContact.setLastName(lastName);
        newContact.setAddress(address);
        newContact.setEmail(email);
        newContact.setPhoneNumber(phoneNumber);

        boolean isInserted = contactDao.insertContact(newContact);

        if (isInserted) {
            Contact latestContact = contactDao.getLatestContact(); // Implement this in ContactDao
            request.setAttribute("contact", latestContact);
            request.setAttribute("message", "Contact saved successfully!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/success.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    private void updateContact(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");

        Contact contact = new Contact();
        contact.setId(id);
        contact.setFirstName(firstName);
        contact.setLastName(lastName);
        contact.setAddress(address);
        contact.setEmail(email);
        contact.setPhoneNumber(phoneNumber);

        boolean isUpdated = contactDao.updateContact(contact);

        if (isUpdated) {
            request.setAttribute("contact", contact);
            request.setAttribute("message", "Contact updated successfully!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/success.jsp");
            try {
				dispatcher.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        } else {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    private void deleteContact(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        contactDao.deleteContact(id);
        response.sendRedirect("contact");
    }
}
