- view: users
  sql_table_name: main_production.users
  fields:

  - dimension: user_id
    primary_key: true
    type: number
    sql: ${TABLE}.user_id

  - dimension: identity
    sql: ${TABLE}."identity"
    

  - dimension_group: joindate
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.joindate

  - measure: count
    hidden: true
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - user_id
    - identity
    - sessions.count
    - joindate_date