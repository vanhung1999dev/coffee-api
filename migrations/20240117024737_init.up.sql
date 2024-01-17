-- Add up migration script here
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS coffees (
    "id" uuid PRIMARY KEY NOT NULL,
    "name" varchar NOT NULL,
    "roast" varchar NOT NULL,
    "region" varchar NOT NULL,
    "price" INT NOT NULL,
    "grind_unit" INT NOT NULL,
    "created_at" TIMESTAMP WITH TIME ZONE,
    "updated_at" TIMESTAMP WITH TIME ZONE
);