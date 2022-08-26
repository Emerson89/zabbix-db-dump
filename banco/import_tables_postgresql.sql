       \copy history_old TO '/tmp/history.csv' DELIMITER ',' CSV
       CREATE TEMP TABLE temp_history (
           itemid                   bigint                                    NOT NULL,
           clock                    integer         DEFAULT '0'               NOT NULL,
           value                    DOUBLE PRECISION DEFAULT '0.0000'          NOT NULL,
           ns                       integer         DEFAULT '0'               NOT NULL
       );
       \copy temp_history FROM '/tmp/history.csv' DELIMITER ',' CSV
       INSERT INTO history SELECT * FROM temp_history ON CONFLICT (itemid,clock,ns) DO NOTHING;

       \copy history_uint_old TO '/tmp/history_uint.csv' DELIMITER ',' CSV
       CREATE TEMP TABLE temp_history_uint (
           itemid                   bigint                                    NOT NULL,
           clock                    integer         DEFAULT '0'               NOT NULL,
           value                    numeric(20)     DEFAULT '0'               NOT NULL,
           ns                       integer         DEFAULT '0'               NOT NULL
       );
       \copy temp_history_uint FROM '/tmp/history_uint.csv' DELIMITER ',' CSV
       INSERT INTO history_uint SELECT * FROM temp_history_uint ON CONFLICT (itemid,clock,ns) DO NOTHING;

       \copy history_str_old TO '/tmp/history_str.csv' DELIMITER ',' CSV
       CREATE TEMP TABLE temp_history_str (
           itemid                   bigint                                    NOT NULL,
           clock                    integer         DEFAULT '0'               NOT NULL,
           value                    varchar(255)    DEFAULT ''                NOT NULL,
           ns                       integer         DEFAULT '0'               NOT NULL
       );
       \copy temp_history_str FROM '/tmp/history_str.csv' DELIMITER ',' CSV
       INSERT INTO history_str (itemid,clock,value,ns) SELECT * FROM temp_history_str ON CONFLICT (itemid,clock,ns) DO NOTHING;

       \copy history_log_old TO '/tmp/history_log.csv' DELIMITER ',' CSV
       CREATE TEMP TABLE temp_history_log (
           itemid                   bigint                                    NOT NULL,
           clock                    integer         DEFAULT '0'               NOT NULL,
           timestamp                integer         DEFAULT '0'               NOT NULL,
           source                   varchar(64)     DEFAULT ''                NOT NULL,
           severity                 integer         DEFAULT '0'               NOT NULL,
           value                    text            DEFAULT ''                NOT NULL,
           logeventid               integer         DEFAULT '0'               NOT NULL,
           ns                       integer         DEFAULT '0'               NOT NULL
       );
       \copy temp_history_log FROM '/tmp/history_log.csv' DELIMITER ',' CSV
       INSERT INTO history_log SELECT * FROM temp_history_log ON CONFLICT (itemid,clock,ns) DO NOTHING;

       \copy history_text_old TO '/tmp/history_text.csv' DELIMITER ',' CSV
       CREATE TEMP TABLE temp_history_text (
           itemid                   bigint                                    NOT NULL,
           clock                    integer         DEFAULT '0'               NOT NULL,
           value                    text            DEFAULT ''                NOT NULL,
           ns                       integer         DEFAULT '0'               NOT NULL
       );
       \copy temp_history_text FROM '/tmp/history_text.csv' DELIMITER ',' CSV
       INSERT INTO history_text SELECT * FROM temp_history_text ON CONFLICT (itemid,clock,ns) DO NOTHING;