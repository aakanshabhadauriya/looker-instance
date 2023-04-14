# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: iam_roles {


  join: iam_roles__user_accounts {
    view_label: "Iam Roles: User Accounts"
    sql: LEFT JOIN UNNEST(${iam_roles.user_accounts}) as iam_roles__user_accounts ;;
    relationship: one_to_many
  }

  join: iam_roles__service_accounts {
    view_label: "Iam Roles: Service Accounts"
    sql: LEFT JOIN UNNEST(${iam_roles.service_accounts}) as iam_roles__service_accounts ;;
    relationship: one_to_many
  }
}

# The name of this view in Looker is "Iam Roles"
view: iam_roles {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `ml-console-dev.tarun_dev.iam_roles`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Roles" in Explore.

  dimension: roles {
    type: string
    sql: ${TABLE}.roles ;;
  }
  measure: unique_roles {
    type: count_distinct
    sql: ${roles} ;;
  }

  dimension: service_accounts {
     hidden: yes
    sql: ${TABLE}.service_accounts ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}.timestamp ;;
  }

  dimension: user_accounts {
     hidden: yes
    sql: ${TABLE}.user_accounts ;;
  }

  measure: count {
    type: count
    drill_fields: [roles]
  }
  # measure: distinct_count {
  #   type: count_distinct
  #   sql: ${roles} ;;
  # }
}

# The name of this view in Looker is "Iam Roles User Accounts"
view: iam_roles__user_accounts {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Iam Roles User Accounts" in Explore.

  dimension: iam_roles__user_accounts {
    type: string
    sql: iam_roles__user_accounts ;;
  }
  measure: distinct_user_accounts {
    type: count_distinct
    sql: ${iam_roles__user_accounts} ;;
  }
}

# The name of this view in Looker is "Iam Roles Service Accounts"
view: iam_roles__service_accounts {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Iam Roles Service Accounts" in Explore.

  dimension: iam_roles__service_accounts {
    type: string
    sql: iam_roles__service_accounts ;;
  }
  measure: distinct_service_accounts {
    type: count_distinct
    sql: ${iam_roles__service_accounts} ;;
  }


}
