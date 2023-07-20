# The name of this view in Looker is "Employee"
view: employee {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `ml-console-dev.multi_instance_demo.Employee` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Dept ID" in Explore.

  dimension: dept_id {
    type: string
    sql: ${TABLE}.dept_id ;;
  }

  dimension: emp_id {
    type: string
    sql: ${TABLE}.emp_id ;;
  }

  dimension: emp_name {
    type: string
    sql: ${TABLE}.emp_name ;;
  }

  dimension: manager_id {
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: salary {
    type: string
    sql: ${TABLE}.salary ;;
  }
  measure: count {
    type: count
    drill_fields: [emp_name]
  }
}
