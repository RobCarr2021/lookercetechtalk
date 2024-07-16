view: pylookml {
  sql_table_name: `tz-looker-core-argolis.ce_tech_talk.pylookml` ;;

  dimension: field {
    type: string
    sql: ${TABLE}.field ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }
  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
  measure: count {
    type: count
  }
}
