package internal

import (
	"fmt"
	"github.com/spf13/viper"
	"html"
	"io"
	"log"
	"net/http"
)

func Start() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {

		data := "n/a"
		req, err := http.Get(fmt.Sprintf("%s", viper.GetString("backend")))
		if err != nil {
			log.Println(err)
		} else {
			defer req.Body.Close()
			body, err2 := io.ReadAll(req.Body)
			if err2 != nil {
				log.Println(err2)
			} else {

				data = string(body[:])

			}

		}

		fmt.Fprintf(w, "%q\ncolor: %s\ndata: %q\n",
			html.EscapeString(r.URL.Path),
			viper.GetString("color"),
			html.EscapeString(data))
	})

	http.HandleFunc("/data", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "%s", viper.GetString("data"))

	})

	log.Println("listening")
	log.Fatal(http.ListenAndServe(":8081", nil))

}
