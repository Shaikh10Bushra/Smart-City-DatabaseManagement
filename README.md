# **🏙️ Smart City Infrastructure & Traffic Management System**

A robust Relational Database Management System (RDBMS) designed to manage urban data. This project demonstrates the ability to design complex schemas that track real-time traffic density, coordinate emergency vehicle routing, and manage citizen-reported infrastructure issues.

## **🚀 Key Database Features**

* Relational Schema: Implemented Primary and Foreign Key constraints to ensure data integrity across four core tables.
* Traffic Monitoring: A dedicated Traffic_Sensors table tracking density levels (Low to Critical) with automatic timestamps.
* Emergency Dispatch: An Emergency_Vehicles system with priority-based routing logic.
* Citizen Feedback Loop: A Citizen_Reports table to track the lifecycle of infrastructure repairs (Potholes, Streetlights, etc.).

## **🛠️ Advanced SQL Concepts Used**
* Data Abstraction (Views): Created the Active_Emergencies view to provide a real-time dashboard for high-priority emergency tasks.
* Stored Procedures: Developed UpdateReportStatus to automate the workflow of citizen complaints.
* Complex Joins: Used INNER JOINs to link Traffic_Sensors with Maintenance_Logs for technical audit trails.
* Aggregation: Utilized GROUP BY and COUNT functions for analytical reporting on city infrastructure health.

## **📁 Project Structure**

* Dump20260319.sql: The complete self-contained database export including Schema, Data, Views, and Procedures.

## **🔧 How to Setup**

* Open MySQL Workbench.
* Go to Server > Data Import.
* Select Import from Self-Contained File and choose Dump20260319.sql.
* Select SmartCity_Management as the Target Schema.
* Click Start Import.

## **👨‍💻 Developer**

Bushra Shaikh - Electronics and Computer Engineering Student [LinkedIn Profile Link]
