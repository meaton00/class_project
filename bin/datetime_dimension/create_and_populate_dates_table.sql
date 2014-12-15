DROP TABLE "DATES";

CREATE TABLE "DATES"
(
  "DateKey" serial NOT NULL, -- Unique key to DATES table
  "Date" date NOT NULL, -- Date in format yyyy/mm/dd
  "Date_DOW" character(3) NOT NULL, -- Day of week
  "Date_Month" character(3) NOT NULL, -- Month in mmm
  "Date_DS_Indicator" character varying(4) NOT NULL, -- Daylight savings indicator - EST, EDT, EST1, EDT1
  "Date_Quarter" character(2) NOT NULL, -- Quarter (Q1, Q2, Q3 or Q4)
  "Date_Holiday" boolean NOT NULL, -- Holiday = True
  "Date_FedGovStatus" character varying(20) NOT NULL, -- Status of Fed Gov:  Open, Closed, 2HrDelay, Shutdown, OpenLibLeave
  "Date_Sunrise" time without time zone, -- Sunrise time (UTC)
  "Date_Sunset" time without time zone, -- Sunset Time (UTC)
  CONSTRAINT "DATES_pkey" PRIMARY KEY ("DateKey")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "DATES"
  OWNER TO postgres;
COMMENT ON TABLE "DATES"
  IS 'Date dimension table for Oct 2013 to Sep 2014';
COMMENT ON COLUMN "DATES"."DateKey" IS 'Unique key to DATES table';
COMMENT ON COLUMN "DATES"."Date" IS 'Date in format yyyy/mm/dd';
COMMENT ON COLUMN "DATES"."Date_DOW" IS 'Day of week';
COMMENT ON COLUMN "DATES"."Date_Month" IS 'Month in mmm';
COMMENT ON COLUMN "DATES"."Date_DS_Indicator" IS 'Daylight savings indicator - EST, EDT, EST1, EDT1';
COMMENT ON COLUMN "DATES"."Date_Quarter" IS 'Quarter (Q1, Q2, Q3 or Q4)';
COMMENT ON COLUMN "DATES"."Date_Holiday" IS 'Holiday = True';
COMMENT ON COLUMN "DATES"."Date_FedGovStatus" IS 'Status of Fed Gov:  Open, Closed, 2HrDelay, Shutdown, OpenLibLeave';
COMMENT ON COLUMN "DATES"."Date_Sunrise" IS 'Sunrise time (UTC)';
COMMENT ON COLUMN "DATES"."Date_Sunset" IS 'Sunset Time (UTC)';


copy "DATES" from  'C:\Users\mernie\Desktop\ClassProjectData\create-dates.csv' with CSV header;