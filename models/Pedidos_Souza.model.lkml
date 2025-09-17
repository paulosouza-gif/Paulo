# Define the database connection to be used for this model.
connection: "looker-challenge"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: Pedidos_Souza_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: Pedidos_Souza_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Pedidos Souza"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: pedidos {
  view_label: "Pedidos"

  join: cliente {
    view_label: "Cliente"
    sql_on: ${pedidos.id_cliente}=${cliente.id_cliente} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: devoluciones {
    view_label: "Devoluções"
    sql_on: ${devoluciones.id_pedido}=${pedidos.id_pedido} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: producto {
    view_label: "Produtos"
    sql_on: ${producto.id_producto}=${pedidos.id_producto} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: mercado {
    view_label: "Mercado"
    sql_on: ${mercado.id_mercado}=${pedidos.id_mercado} ;;
    relationship: many_to_one
    type:left_outer
  }

  join: vendedores {
    view_label: "Vendedores"
    sql_on: ${vendedores.region} = ${mercado.region} ;;
    relationship: many_to_one
    type: left_outer
  }
}
