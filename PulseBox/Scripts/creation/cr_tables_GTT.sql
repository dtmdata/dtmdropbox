/* For use in stored procedures, e.g. sp_pulse_depts */

DROP TABLE gtt_ID_LIST;
CREATE GLOBAL TEMPORARY TABLE gtt_ID_LIST (
  ID_LIST  NUMBER
) ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE gtt_ID_LIST IS 'GTT/Global Temp Table to store IDs from comma-separated ID list passed IN to st.proc';

/* this is non-GTT version, same name.
DROP TABLE gtt_ID_LIST;
CREATE  TABLE gtt_ID_LIST (
  ID_LIST  NUMBER
);
COMMENT ON TABLE gtt_ID_LIST IS 'GTT/Global Temp Table to temp-store IDs from comma-separated ID list passed IN to st.proc';
*/