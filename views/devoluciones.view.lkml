# The name of this view in Looker is "Devoluciones"
view: devoluciones {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_academy.Devoluciones` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Devuelto" in Explore.

  dimension: devuelto {
    label: "Devolvido"
    type: string
    sql: ${TABLE}.Devuelto ;;
  }

  dimension: id_pedido {
    type: string
    hidden: yes
    sql: ${TABLE}.ID_pedido ;;
  }

  dimension: region {
    label: "Região"
    type: string
    sql: ${TABLE}.Region ;;
  }
  measure: count {
    hidden: yes
    type: count
  }
}
