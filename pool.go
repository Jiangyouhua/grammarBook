package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"net/http"
	"strings"

	_ "github.com/go-sql-driver/mysql"
)

type Pool struct {
	db *sql.DB
}

type Result struct {
	Status int
	Data   interface{}
}

func ResultOut(status int, data interface{}, w http.ResponseWriter) {
	(&Result{status, data}).Out(w)
}

func (r *Result) Out(w http.ResponseWriter) {
	w.Header().Set("content-type", "text/json")
	bytes, err := json.Marshal(r)
	if err != nil {
		w.Write([]byte(`{Status: 10, Data: "Out json.Marshal is error"}`))
		return
	}
	w.Write(bytes)
}

func NewPool() (*Pool, error) {
	db, err := sql.Open("mysql", "root:jiangyouhua@tcp(127.0.0.1:3306)/grammer")
	if err != nil {
		return nil, err
	}
	return &Pool{db}, nil
}

func (p *Pool) FetchAll(table string) *Result {
	order := ""
	if table == "category" || table == "items" {
		order = " ORDER BY sequence DESC"
	}
	query := fmt.Sprintf("SELECT * FROM `%s`%s", table, order)
	println("FetchAll: ", query)
	rows, err := p.db.Query(query)
	if err != nil {
		return &Result{11, err}
	}
	defer rows.Close()

	columns, err := rows.Columns()
	if err != nil {
		return &Result{12, err}
	}

	var data []interface{} // 返回的数据集
	re := make([]sql.RawBytes, len(columns))
	args := make([]interface{}, len(columns))
	for index := range columns {
		args[index] = &re[index]
	}

	for rows.Next() {
		m := make(map[string]interface{})
		if err := rows.Scan(args...); err != nil {
			return &Result{13, err}
		}
		for i, v := range columns {
			m[v] = string(re[i])
		}
		data = append(data, m)
	}
	return &Result{0, data}
}

func (p *Pool) InsertOrUpdate(table string, data map[string]string) *Result {
	columns, values, updates := formatMap(data)
	if len(columns) == 0 {
		return &Result{14, "InsertOrUpdate, data is empty"}
	}
	query := fmt.Sprintf("INSERT INTO `%s` (%s) VALUES (%s) ON DUPLICATE KEY UPDATE %s", table, strings.Join(columns, ","), strings.Join(values, ","), strings.Join(updates, ","))
	println("InsertOrUpdate: ", query)
	result, err := p.db.Exec(query)
	if err != nil {
		return &Result{15, err}
	}
	i, err := result.LastInsertId()
	if err != nil {
		return &Result{16, err}
	}
	j, err := result.RowsAffected()
	if err != nil {
		return &Result{17, err}
	}
	return &Result{0, map[string]int64{"LastInsertId": i, "RowsAffected": j}}
}

func formatMap(data map[string]string) (columns, values, updates []string) {
	for key, value := range data {
		columns = append(columns, fmt.Sprintf("`%s`", key))
		values = append(values, fmt.Sprintf("'%s'", value))
		updates = append(updates, fmt.Sprintf("`%s`=VALUES(`%s`)", key, key))
	}
	return
}
