create table domains
(
    domain_id   integer not null,
    name        text    not null,
    land_type   text    not null,
    inhabitants integer not null,
    river       bool    not null,
    island      bool    not null,
    sea         bool    not null,
    mountain    bool    not null,
    constraint domains_pk
        primary key (domain_id)
);

create table impact
(
    impact_id       integer not null,
    name            text    not null,
    description     text    not null,
    reference_value integer not null,
    immersion_value integer not null,
    unit            text    not null,
    target_value    integer,
    constraint impact_pk
        primary key (impact_id)
);

create table actions
(
    action_id   integer,
    description text not null,
    impact_id   integer,
    delta       real,
    constraint actions_pk
        primary key (action_id),
    constraint actions_impact_impact_id_fk
        foreign key (impact_id) references impact
);

create table parameters
(
    parameter_id    integer not null,
    name            integer not null,
    description     integer not null,
    reference_value integer not null,
    target_value    integer not null,
    immersion_value integer not null,
    domain_id       integer not null,
    constraint parameter_pk
        primary key (parameter_id),
    constraint parameters_domains_domain_id_fk
        foreign key (domain_id) references domains
);

create table parameter_impact
(
    parameter_id integer not null,
    impact_id    integer not null,
    constraint parameter_impact_impact_impact_id_fk
        foreign key (impact_id) references impact,
    constraint parameter_impact_parameters_parameter_id_fk
        foreign key (parameter_id) references parameters
);

create table sectors
(
    sector_id    integer not null,
    weight       real    not null,
    name         text    not null,
    parameter_id integer,
    constraint sectors_pk
        primary key (sector_id),
    constraint sectors_parameters_parameter_id_fk
        foreign key (parameter_id) references parameters
);

create table action_sector_link
(
    sector_id integer not null,
    action_id integer not null,
    constraint action_sector_link_actions_action_id_fk
        foreign key (action_id) references actions,
    constraint action_sector_link_sectors_sector_id_fk
        foreign key (sector_id) references sectors
);

create table sources
(
    source_id integer not null,
    string    text,
    constraint sources_pk
        primary key (source_id)
);

create table sources_domain
(
    source_id integer not null,
    domain_id integer not null,
    constraint sources_domain_domains_domain_id_fk
        foreign key (domain_id) references domains,
    constraint sources_domain_sources_source_id_fk
        foreign key (source_id) references sources
);

create table sqlite_master
(
    type     TEXT,
    name     TEXT,
    tbl_name TEXT,
    rootpage INT,
    sql      TEXT
);

