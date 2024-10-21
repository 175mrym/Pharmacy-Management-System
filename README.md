# Pharmacy-Management-System
Business Case for Pharmacy Management System

This project develops a pharmacy management system with ten entities: Supplier, Prescription, Patient, Insurance, Invoice, Pharmacist, Branch, and sub-entities Medicine and Devices. It focuses on creating a normalized database structure to ensure data consistency and minimize redundancy.
Entity Relationships
Supplier & Item: One supplier supplies multiple items.
Medicine & Prescription: Many-to-many relationship between medicines and prescriptions.
Prescription & Patient: One patient has multiple prescriptions.
Patient & Insurance: One-to-one link between patient and insurance.
Prescription & Invoice: One-to-one relationship.
Invoice & Pharmacist: One pharmacist generates multiple invoices.
Pharmacist & Branch: Many-to-many relationship.
Pharmacist (Self-Relationship): Pharmacists can manage other pharmacists.
Data Normalization
Applies 1NF, 2NF, and 3NF techniques to reduce data redundancy and ensure data integrity.
Goals
The project aims to build a robust database for efficient pharmacy operations, integrating supplier, patient, prescription, and billing data while maintaining accuracy and reducing inconsistencies.
