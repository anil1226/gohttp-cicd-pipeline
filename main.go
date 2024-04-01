package main

import (
	"fmt"
	"net/http"
)

func main() {
	router := http.NewServeMux()

	router.HandleFunc("GET /todos", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "get all todos")
	})

	http.ListenAndServe(":8080", router)
}
