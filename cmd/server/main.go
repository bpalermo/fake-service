package main

import (
	"fmt"
	log "github.com/sirupsen/logrus"
	"net/http"
	"os"
)

const (
	portEnvKey  = "PORT"
	defaultPort = "8080"
)

func init() {
	// Log as JSON instead of the default ASCII formatter.
	log.SetFormatter(&log.JSONFormatter{})

	// Output to stdout instead of the default stderr
	// Can be any io.Writer, see below for File example
	log.SetOutput(os.Stdout)

	// Only log the info severity or above.
	log.SetLevel(log.InfoLevel)
}

func catchAll(w http.ResponseWriter, _ *http.Request) {
	_, err := fmt.Fprintf(w, "Hello World!")
	if err != nil {
		log.WithError(err).Warn("Could not process the request")
		return
	}
}

func handleRequests(port string) {
	http.HandleFunc("/", catchAll)
	log.WithError(http.ListenAndServe(":"+port, nil)).Fatal("Could not start server")
}

func main() {
	port, ok := os.LookupEnv(portEnvKey)
	if !ok {
		port = defaultPort
	}

	handleRequests(port)
}
