CREATE TABLE `history` (
	`itemid`                 bigint unsigned                           NOT NULL,
	`clock`                  integer         DEFAULT '0'               NOT NULL,
	`value`                  DOUBLE PRECISION DEFAULT '0.0000'          NOT NULL,
	`ns`                     integer         DEFAULT '0'               NOT NULL
) ENGINE=InnoDB;
CREATE INDEX `history_1` ON `history` (`itemid`,`clock`);
CREATE TABLE `history_uint` (
	`itemid`                 bigint unsigned                           NOT NULL,
	`clock`                  integer         DEFAULT '0'               NOT NULL,
	`value`                  bigint unsigned DEFAULT '0'               NOT NULL,
	`ns`                     integer         DEFAULT '0'               NOT NULL
) ENGINE=InnoDB;
CREATE INDEX `history_uint_1` ON `history_uint` (`itemid`,`clock`);
CREATE TABLE `history_str` (
	`itemid`                 bigint unsigned                           NOT NULL,
	`clock`                  integer         DEFAULT '0'               NOT NULL,
	`value`                  varchar(255)    DEFAULT ''                NOT NULL,
	`ns`                     integer         DEFAULT '0'               NOT NULL
) ENGINE=InnoDB;
CREATE INDEX `history_str_1` ON `history_str` (`itemid`,`clock`);
CREATE TABLE `history_log` (
	`itemid`                 bigint unsigned                           NOT NULL,
	`clock`                  integer         DEFAULT '0'               NOT NULL,
	`timestamp`              integer         DEFAULT '0'               NOT NULL,
	`source`                 varchar(64)     DEFAULT ''                NOT NULL,
	`severity`               integer         DEFAULT '0'               NOT NULL,
	`value`                  text                                      NOT NULL,
	`logeventid`             integer         DEFAULT '0'               NOT NULL,
	`ns`                     integer         DEFAULT '0'               NOT NULL
) ENGINE=InnoDB;
CREATE INDEX `history_log_1` ON `history_log` (`itemid`,`clock`);
CREATE TABLE `history_text` (
	`itemid`                 bigint unsigned                           NOT NULL,
	`clock`                  integer         DEFAULT '0'               NOT NULL,
	`value`                  text                                      NOT NULL,
	`ns`                     integer         DEFAULT '0'               NOT NULL
) ENGINE=InnoDB;
CREATE INDEX `history_text_1` ON `history_text` (`itemid`,`clock`);
