# Define the database connection to be used for this model.
connection: "data_governance_demo"

# include all the views
include: "/views/**/*.view"
explore: audit_log_raw {}

explore: iam_data {}
