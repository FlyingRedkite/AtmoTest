create table main.actions
(
    action_id   integer
        constraint actions_pk
            primary key,
    description integer
);

create table main.climate_impact
(
    c_impact_id     integer not null
        constraint climate_impact_pk
            primary key,
    name            text    not null,
    description     text    not null,
    reference_value integer not null,
    immersion_value integer not null,
    unit            text    not null,
    target_value    integer
);

create table main.domains
(
    domain_id   integer not null,
    name        text    not null,
    land_type   text    not null,
    inhabitants integer not null,
    river       bool    not null,
    island      bool    not null,
    sea         bool    not null,
    mountain    bool    not null
);

create table main.parameters
(
    param_id    integer not null
        constraint parameters_pk
            primary key,
    name        text    not null,
    description text
);

create table main.concentrations
(
    concentration_id integer not null
        constraint concentrations_pk
            primary key,
    name             text    not null,
    reference_value  integer not null,
    immersion_value  integer not null,
    target_value     integer,
    param_id         integer not null
        constraint concentrations_parameters_param_id_fk
            references main.parameters
);

create table main.emissions
(
    emission_id     integer not null
        constraint emissions_pk
            primary key,
    domain_id       integer not null
        constraint emissions_domains_domain_id_fk
            references main.domains (domain_id),
    name            integer not null,
    description     integer not null,
    reference_value integer not null,
    target_value    integer not null,
    immersion_value integer not null,
    param_id        integer not null
        constraint emissions_parameters_param_id_fk
            references main.parameters
);

create table main.emissions_impact
(
    emission_id integer not null
        constraint emissions_impact_emissions_emission_id_fk
            references main.emissions,
    c_impact_id integer not null
        constraint emissions_impact_climate_impact_c_impact_id_fk
            references main.climate_impact
);

create table main.pollution_impact
(
    p_impact_id      integer not null,
    name             text    not null,
    description      text    not null,
    concentration_id integer not null
        constraint pollution_impact_concentrations_coen_fk
            references main.concentrations
);

create table main.sectors
(
    sector_id   integer not null
        constraint sectors_pk
            primary key,
    emission_id integer not null
        constraint sectors_emissions_emission_id_fk
            references main.emissions,
    weight      real    not null,
    name        text    not null
);

create table main.actions_sectors
(
    action_id integer not null
        constraint actions_sectors_actions_action_id_fk
            references main.actions,
    sector_id integer not null
        constraint actions_sectors_sectors_sector_id_fk
            references main.sectors
);

create table main.sqlite_master
(
    type     TEXT,
    name     TEXT,
    tbl_name TEXT,
    rootpage INT,
    sql      TEXT
);

