dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "root"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
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