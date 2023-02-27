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

create table parameter_type
(
    parameter_type_id integer not null,
    name              text    not null,
    description       text    not null,
    unit              text    not null,
    constraint parameter_type_pk
        primary key (parameter_type_id)
);

create table parameters
(
    parameter_id      integer not null,
    reference_value   real    not null,
    target_value      real    not null,
    immersion_value   real    not null,
    domain_id         integer not null,
    parameter_type_id integer not null,
    constraint parameter_pk
        primary key (parameter_id),
    constraint parameters_domains_domain_id_fk
        foreign key (domain_id) references domains,
    constraint parameters_parameter_type_parameter_type_id_fk
        foreign key (parameter_type_id) references parameter_type
);

create table player_type
(
    player_type_id integer not null,
    name           text    not null,
    constraint "player type_pk"
        primary key (player_type_id)
);

create table sectors
(
    sector_id integer not null,
    name      text    not null,
    constraint sectors_pk
        primary key (sector_id)
);

create table actions
(
    action_id    integer,
    description  text    not null,
    parameter_id integer not null,
    delta        real,
    player_type  integer not null,
    weight       real default 0.5,
    sector_id    integer not null,
    constraint actions_pk
        primary key (action_id),
    constraint actions_parameters_parameter_id_fk
        foreign key (parameter_id) references parameters,
    constraint "actions_player type_player_type_id_fk"
        foreign key (player_type) references player_type,
    constraint actions_sectors_sector_id_fk
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