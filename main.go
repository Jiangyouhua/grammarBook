package main

import (
	"fmt"
	"log"
	"net/http"
	"net/url"
	"strings"
)

func main() {
	http.Handle("/", http.FileServer(http.Dir("./")))
	http.HandleFunc("/back", back)
	if err := http.ListenAndServe(":80", nil); err != nil {
		log.Fatal(err)
	}
}

func back(w http.ResponseWriter, r *http.Request) {
	url, err := _parse(r)
	if err != nil {
		ResultOut(5, err, w)
		return
	}
	data := make(map[string]string)
	handle := ""
	table := ""
	for k, v := range url {
		if k == "handle" {
			handle = v[0]
			continue
		}
		if k == "table" {
			table = v[0]
			continue
		}
		data[k] = strings.Join(v, ",")
	}
	if len(handle) == 0 {
		ResultOut(1, "No handle", w)
		return
	}

	if len(table) == 0 {
		ResultOut(2, "No table", w)
		return
	}

	pool, err := NewPool()
	if err != nil {
		ResultOut(3, err, w)
		return
	}
	switch handle {
	case "get":
		pool.FetchAll(table).Out(w)
	case "set":
		pool.InsertOrUpdate(table, data).Out(w)
	default:
		ResultOut(4, fmt.Sprintf("No handle name %s", handle), w)
	}
}

func _parse(r *http.Request) (url.Values, error) {
	err := r.ParseForm()
	if err != nil {
		return nil, err
	}
	if len(r.Form.Get("handle")) > 0 {
		return r.Form, nil
	}

	err = r.ParseMultipartForm(0)
	if err != nil {
		return nil, err
	}
	return r.PostForm, nil
}
