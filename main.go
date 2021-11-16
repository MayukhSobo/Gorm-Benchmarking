package main

import (
	"fmt"
	_ "github.com/joho/godotenv/autoload"
	"gorm-benchmark/db"
)

func main() {
	database, err := db.NewDatabase()
	if err != nil {
		panic(err.Error())
	}
	var numRows int64
	database.DB.Table("city").Count(&numRows)
	fmt.Printf("Total number of rows %d\n", numRows)
}
