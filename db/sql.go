package db

import (
	"fmt"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func NewSQLConn(DBDriver, DBUser, DBPassword, DBPort, DBHost, DBName string) (*Database, error) {
	var database *Database
	switch DBDriver {
	case "postgres":
		URI := fmt.Sprintf("host=%s port=%s user=%s dbname=%s sslmode=disable password=%s",
			DBHost, DBPort, DBUser, DBName, DBPassword)

		db, err := gorm.Open(postgres.Open(URI), &gorm.Config{})
		if err != nil {
			return nil, fmt.Errorf("cannot connect to %s database", DBDriver)
		} else {
			database = &Database{DB: db}
		}
	case "mysql":
		return nil, fmt.Errorf("%s database support is coming soon", DBDriver)

	default:
		return nil, fmt.Errorf("%s database is not supported", DBDriver)
	}
	return database, nil

}
