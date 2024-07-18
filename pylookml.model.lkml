connection: "sample_bigquery_connection"

 explore: flat { 
   
   }


 explore: _eav_flattener { 
  from: pylookml
  hidden: yes 
   }


view: pylookml {
  sql_table_name: `tz-looker-core-argolis.ce_tech_talk.pylookml` ;;
  
  
  dimension: field {   type: string
    sql: ${TABLE}.field ;; }
  dimension: user_id {   type: number
    sql: ${TABLE}.user_id ;; }
  dimension: value {   type: string
    sql: ${TABLE}.value ;; }
  
  measure: age {   type: max
    sql: CASE WHEN ${field} = 'age' THEN ${value} ELSE NULL END ;; }
  measure: eye_color {   type: max
    sql: CASE WHEN ${field} = 'eye_color' THEN ${value} ELSE NULL END ;; }
  measure: height {   type: max
    sql: CASE WHEN ${field} = 'height' THEN ${value} ELSE NULL END ;; }
  measure: name {   type: max
    sql: CASE WHEN ${field} = 'name' THEN ${value} ELSE NULL END ;; }
  }


view: flat {
  derived_table: { explore_source: _eav_flattener { 
    column: user_id {     field: _eav_flattener.user_id }
    column: eye_color {     field: _eav_flattener.eye_color }
    column: age {     field: _eav_flattener.age }
    column: height {     field: _eav_flattener.height }
    column: name {     field: _eav_flattener.name } } }
  
  
  dimension: age { 
    label: "age"
    type: string
    sql: ${TABLE}.age ;; }
  dimension: eye_color { 
    label: "eye_color"
    type: string
    sql: ${TABLE}.eye_color ;; }
  dimension: height { 
    label: "height"
    type: string
    sql: ${TABLE}.height ;; }
  dimension: name { 
    label: "name"
    type: string
    sql: ${TABLE}.name ;; }
  
  
  }
