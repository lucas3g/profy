import 'package:profy/app/core/data/clients/database/helpers/client_tables.dart';

class ClientDataBaseSaveParams {
  final ClientTables table;
  final dynamic data;

  ClientDataBaseSaveParams({
    required this.table,
    required this.data,
  });
}

class ClientDataBaseUpdateParams {
  final ClientTables table;
  final dynamic data;

  ClientDataBaseUpdateParams({
    required this.table,
    required this.data,
  });
}

class ClientDataBaseGetDataByFieldParams {
  final ClientTables table;
  final String field;
  final dynamic value;
  final String orderBy;

  ClientDataBaseGetDataByFieldParams({
    required this.table,
    required this.field,
    required this.value,
    required this.orderBy,
  });
}

class ClientDataBaseGetDataByFiltersParams {
  final ClientTables table;
  final Set<ClientDataBaseFilters> filters;
  final String orderBy;

  ClientDataBaseGetDataByFiltersParams({
    required this.table,
    required this.filters,
    required this.orderBy,
  });
}

class ClientDataBaseFilters {
  final String field;
  final dynamic value;

  ClientDataBaseFilters({
    required this.field,
    required this.value,
  });
}

class ClientDataBaseGetDataWithForeignTablesParams {
  final ClientTables table;
  final ClientTables foreignTable;
  final String orderBy;

  ClientDataBaseGetDataWithForeignTablesParams({
    required this.table,
    required this.foreignTable,
    required this.orderBy,
  });
}
