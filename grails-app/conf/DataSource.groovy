dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "root"
    password = ""
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://localhost/inventory?useOldAliasMetadataBehavior=true"
        }
    }
    test {
        dataSource {
            dbCreate = "none"
            url = "jdbc:mysql://localhost/inventory?useOldAliasMetadataBehavior=true"
        }
    }
    production {
        dataSource {
            dbCreate = "none"
            url = "jdbc:mysql://localhost/inventory?useOldAliasMetadataBehavior=true"
        }
    }
}