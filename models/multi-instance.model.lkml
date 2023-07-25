# Define the database connection to be used for this model.
connection: "data_governance_demo"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: multipleinstance_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}


persist_with: multipleinstance_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Multipleinstance"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

#explore: iam_roles {
  #join: iam_roles__user_accounts {
    #view_label: "Iam Roles: User Accounts"
    #sql: LEFT JOIN UNNEST(${iam_roles.user_accounts}) as iam_roles__user_accounts ;;
    #relationship: one_to_many
  #}

  #join: iam_roles__service_accounts {
    #view_label: "Iam Roles: Service Accounts"
    #sql: LEFT JOIN UNNEST(${iam_roles.service_accounts}) as iam_roles__service_accounts ;;
    #relationship: one_to_many
  #}
#}



explore: employee {}

#explore: iam_data {}

#explore: audit_log_raw {}
