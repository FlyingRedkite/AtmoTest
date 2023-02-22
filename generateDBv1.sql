create table main.Actions
(
    action_id   integer not null
        constraint action_id
            primary key,
    description TEXT
);

create table main."Air Quality Consequences"
(
    airq_consequence_id integer not null
        constraint "Air Quality Consequences_pk"
            primary key,
    name                text    not null,
    description         text    not null,
    reference_value     integer not null,
    target_value        integer not null,
    immersion_value     integer not null
);

create table main.Domains
(
    domain_id   integer not null
        constraint domain_id
            primary key,
    name        TEXT    not null,
    land_type   TEXT    not null,
    inhabitants integer not null,
    river       bool    not null,
    sea         bool    not null,
    mountain    bool    not null,
    island      bool    not null
);

create table main.Emissions
(
    emission_id     integer not null
        constraint Emissions_pk
            primary key,
    name            TEXT    not null,
    description     text    not null,
    reference_value integer not null,
    immersion_value integer not null,
    target_value    integer not null,
    category        text
);

create table main.Sectors
(
    sector_id integer not null
        constraint sector_id
            primary key,
    name      TEXT    not null
);

create table main.emissions_airq_consequences
(
    airq_consequence_id integer not null
        constraint "emissions_airq_consequences_Air Quality Consequences_airq_consequence_id_fk"
            references main."Air Quality Consequences",
    emission_id         integer not null
        constraint emissions_airq_consequences_Emissions_emission_id_fk
            references main.Emissions
);

create table main.sector_domains
(
    sector_id integer not null
        constraint domain_sector
            references main.Sectors,
    domain_id integer not null
        constraint sector_domain
            references main.Domains
);

create table main.sector_emission
(
    sector_id   integer not null
        constraint sector_emission_Sectors_sector_id_fk
            references main.Sectors,
    emission_id integer not null
        constraint sector_emission_Emissions_emission_id_fk
            references main.Emissions
);

create table main.sqlite_master
(
    type     TEXT,
    name     TEXT,
    tbl_name TEXT,
    rootpage INT,
    sql      TEXT
);


