CREATE TABLE Doctor (
    id int  NOT NULL,
    first_name text  NOT NULL,
    last_name text  NOT NULL,
    degree text  NOT NULL,
    schedule text  NOT NULL,
    office_num int  NOT NULL,
    type_doc text  NOT NULL,
    Doctor_patient_visits_id int  NOT NULL,
    CONSTRAINT Doctor_pk PRIMARY KEY (id)
) COMMENT 'all doctors that work in the medical center';

-- Table: Doctor_patient_visits
CREATE TABLE Doctor_patient_visits (
    id int  NOT NULL,
    doc_id int  NOT NULL,
    patient_id int  NOT NULL,
    CONSTRAINT Doctor_patient_visits_pk PRIMARY KEY (id)
) COMMENT 'Fake Medical Center Doctors';

-- Table: Medical_records
CREATE TABLE Medical_records (
    id int  NOT NULL,
    past_injuries text  NOT NULL,
    illnesses text  NOT NULL,
    alergies text  NOT NULL,
    current_medication text  NOT NULL,
    last_visit date  NOT NULL,
    consultations int  NOT NULL,
    clinical_findings text  NOT NULL,
    test_results int  NOT NULL,
    Patients_id int  NOT NULL,
    CONSTRAINT Medical_records_pk PRIMARY KEY (id)
) COMMENT 'all patient former/current information';

-- Table: Patients
CREATE TABLE Patients (
    id int  NOT NULL,
    first_name text  NOT NULL,
    last_name text  NOT NULL,
    medical_record_id int  NOT NULL,
    Doctor_patient_visits_id int  NOT NULL,
    CONSTRAINT Patients_pk PRIMARY KEY (id)
) COMMENT 'all patients that go to fake medical center';

-- foreign keys
-- Reference: Doctor_Doctor_patient_visits (table: Doctor)
ALTER TABLE Doctor ADD CONSTRAINT Doctor_Doctor_patient_visits FOREIGN KEY Doctor_Doctor_patient_visits (Doctor_patient_visits_id)
    REFERENCES Doctor_patient_visits (id);

-- Reference: Medical_records_Patients (table: Medical_records)
ALTER TABLE Medical_records ADD CONSTRAINT Medical_records_Patients FOREIGN KEY Medical_records_Patients (Patients_id)
    REFERENCES Patients (id);

-- Reference: Patients_Doctor_patient_visits (table: Patients)
ALTER TABLE Patients ADD CONSTRAINT Patients_Doctor_patient_visits FOREIGN KEY Patients_Doctor_patient_visits (Doctor_patient_visits_id)
    REFERENCES Doctor_patient_visits (id);
