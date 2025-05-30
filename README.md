# Event Portal

Event Portal is a robust Java-based web application designed to facilitate seamless event management and participation tracking for educational institutions. The system supports secure user registration and authentication, role-based access control, event catalog management, and participation monitoring.

---

## Key Features

- **User Registration and Authentication**  
  Secure student registration with form validation and BCrypt-hashed passwords to ensure data confidentiality. Login sessions are managed with proper session controls.

- **Role-Based Access Control**  
  Differentiated access for **Admin** and **Student** roles. Admins have comprehensive control over users and events, while students can browse events and register their participation.

- **Event Management**  
  Admins can create, update, and delete events. Students view available events with details such as description and participation fees.

- **Participation Tracking**  
  Ensures students cannot register multiple times for the same event through backend validations and database constraints.

- **Database Integrity**  
  Designed with relational constraints using MySQL, supporting data consistency via foreign key references between users, events, and participation records.

---

## Technology Stack

- **Backend:** Jakarta Servlet API (Servlets and JSP)  
- **Database:** MySQL with InnoDB engine  
- **Security:** BCrypt for password hashing  
- **Server:** Apache Tomcat 11  
- **Development:** Java 17+ (recommended), NetBeans IDE

---

## Getting Started

### Prerequisites

- Java Development Kit (JDK 17 or newer)
- Apache Tomcat 11 server
- MySQL Server 8.x or newer
- IDE like NetBeans or IntelliJ IDEA (optional but recommended)

### Installation and Setup

1. **Clone the repository** (note the branch is `master`):  
   ```bash
   git clone -b master https://github.com/yourusername/event-portal.git
