CREATE TABLE "acccunts" (
  "id" bigserial PRIMARY KEY,
  "owner" varchar NOT NULL,
  "balance" bigint NOT NULL,
  "currency" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT 'now()'
);

CREATE TABLE "entries" (
  "id" bigserial PRIMARY KEY,
  "acccunt_id" bigint NOT NULL,
  "amount" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT 'now()'
);

CREATE TABLE "transfers" (
  "id" bigserial PRIMARY KEY,
  "from_acccunt_id" bigint NOT NULL,
  "to_acccunt_id" bigint NOT NULL,
  "amount" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT 'now()'
);

CREATE INDEX ON "acccunts" ("owner");

CREATE INDEX ON "entries" ("acccunt_id");

CREATE INDEX ON "transfers" ("from_acccunt_id");

CREATE INDEX ON "transfers" ("to_acccunt_id");

CREATE INDEX ON "transfers" ("from_acccunt_id", "to_acccunt_id");

COMMENT ON COLUMN "entries"."amount" IS 'can be negative or pasitive';

COMMENT ON COLUMN "transfers"."amount" IS 'must be positive';

ALTER TABLE "entries" ADD FOREIGN KEY ("acccunt_id") REFERENCES "acccunts" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "transfers" ADD FOREIGN KEY ("from_acccunt_id") REFERENCES "acccunts" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "transfers" ADD FOREIGN KEY ("to_acccunt_id") REFERENCES "acccunts" ("id") DEFERRABLE INITIALLY IMMEDIATE;
