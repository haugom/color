package internal

import (
	"github.com/spf13/viper"
	"log"
)

func init() {
	viper.SetConfigName("config")
	viper.SetConfigType("yaml")
	viper.AddConfigPath("/app")
	viper.AddConfigPath("$HOME/.color")
	viper.AddConfigPath(".")
	viper.SetDefault("color", "gray")
	viper.SetDefault("backend", "http://127.0.0.1:8081/data")
	viper.SetDefault("data", "none")
	viper.AutomaticEnv()
	err := viper.ReadInConfig()
	if err != nil {
		log.Println("did not load config file. using default")

	}
}
