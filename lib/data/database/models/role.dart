enum Role {
  superAdmin,
  admin,
  driver,
  vendor,
  dispatcher,
  supplier,
}

//1,	SuperAdmin
//2,	Admin
//4,	Driver
//5,	fournisseur
//3,	Dispatcher
//7,	fournisse
Role stringToRole(String map) {
  switch (map) {
    case 'SuperAdmin':
      return Role.superAdmin;
    case 'Admin':
      return Role.admin;
    case 'Driver':
      return Role.driver;
    case 'fournisseur':
      return Role.vendor;
    case 'Dispatcher':
      return Role.dispatcher;
    case 'fournisse':
      return Role.supplier;
    default:
      return Role.driver;
  }
}

Role idToRole(int id) {
  switch (id) {
    case 1:
      return Role.superAdmin;
    case 2:
      return Role.admin;
    case 3:
      return Role.dispatcher;
    case 4:
      return Role.driver;
    case 5:
      return Role.vendor;
    case 7:
      return Role.supplier;
    default:
      return Role.driver;
  }
}

int roleToId(Role role) {
  switch (role) {
    case Role.superAdmin:
      return 1;
    case Role.admin:
      return 2;
    case Role.dispatcher:
      return 3;
    case Role.driver:
      return 4;
    case Role.vendor:
      return 5;
    case Role.supplier:
      return 7;
  }
}
