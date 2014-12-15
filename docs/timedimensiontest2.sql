CREATE TABLE "Sources"
(
  "Source_ID" serial NOT NULL, -- unique key vaue
  "Source_CollectedBy" character(20)[], -- Person who collected the source data
  "Source_Name" character(255)[] NOT NULL, -- Name of source - descriptive
  "Source_Date" date, -- date source collected
  "Source_Description" character varying(500)[], -- Long description, file name
  "Source_ReasonOrUse" character(255)[] -- why is this data used, how is it needed?
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "Sources"
  OWNER TO postgres;
COMMENT ON TABLE "Sources"
  IS 'Logs sources used in class project Godzilla';
COMMENT ON COLUMN "Sources"."Source_ID" IS 'unique key vaue';
COMMENT ON COLUMN "Sources"."Source_CollectedBy" IS 'Person who collected the source data';
COMMENT ON COLUMN "Sources"."Source_Name" IS 'Name of source - descriptive';
COMMENT ON COLUMN "Sources"."Source_Date" IS 'date source collected';
COMMENT ON COLUMN "Sources"."Source_Description" IS 'Long description, file name';
COMMENT ON COLUMN "Sources"."Source_ReasonOrUse" IS 'why is this data used, how is it needed?';

