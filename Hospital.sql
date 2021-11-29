CREATE TABLE "Doctors" (
    "DoctorID" int   NOT NULL,
    "Name" string   NOT NULL,
    "Speciality" string   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "DoctorID"
     )
);

CREATE TABLE "Visits" (
    "id" int   NOT NULL,
    "doctor_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "date" date   NOT NULL,
    CONSTRAINT "pk_Visits" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Patients" (
    "PatientID" int   NOT NULL,
    "Name" string   NOT NULL,
    "Insurance" boolean   NOT NULL,
    "Birthday" date   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "PatientID"
     )
);

CREATE TABLE "Diagnoses" (
    "DiagnosisID" int   NOT NULL,
    "visitID" int   NOT NULL,
    "diseaseID" int   NOT NULL,
    "notes" string   NOT NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "DiagnosisID"
     )
);

CREATE TABLE "Diseases" (
    "id" int   NOT NULL,
    "name" string   NOT NULL,
    "description" string   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctors" ("DoctorID");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patients" ("PatientID");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_visitID" FOREIGN KEY("visitID")
REFERENCES "Visits" ("id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_diseaseID" FOREIGN KEY("diseaseID")
REFERENCES "Diseases" ("id");

