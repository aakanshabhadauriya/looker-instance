# The name of this view in Looker is "Audit Log Raw"
view: audit_log_raw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `tarun_dev.audit_log_raw`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Insert ID" in Explore.

  dimension: insert_id {
    type: string
    sql: ${TABLE}.insertId ;;
  }

  dimension: log_name {
    type: string
    sql: ${TABLE}.logName ;;
  }

  dimension: proto_payload {
    type: string
    sql: ${TABLE}.protoPayload ;;
  }

  dimension: receive_timestamp {
    type: string
    sql: ${TABLE}.receiveTimestamp ;;
  }

  dimension: resource {
    type: string
    sql: ${TABLE}.resource ;;
  }

  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}.timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: [log_name]
  }
}
