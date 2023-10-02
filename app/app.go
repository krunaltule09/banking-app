package app

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/krunaltule09/banking/domain"
	"github.com/krunaltule09/banking/service"
)

func Start() {

	// mux := http.NewServeMux()
	mux := mux.NewRouter()
	// define routes with associated functions

	ch := CustomerHandler{service: service.NewCustomerService(domain.NewCustomerRepositoryDB())}

	mux.HandleFunc("/customers", ch.getAllCustomers).Methods(http.MethodGet)

	// start the server
	log.Fatal(http.ListenAndServe("localhost:8000", mux))
}
