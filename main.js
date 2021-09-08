let url = "./back"
var categorys = []
var items = []
var questions = []

/** Category */

function setCategory(e) {
    e.preventDefault();
    let data = new FormData(document.forms[0])
    if (!data.get("name")) {
        return false
    }
    data.append("handle", "set")
    data.append("table", "category")
    request(data, function (result) {
        if (!result.Status) {
            window.location.reload()
        } else {
            alert(result.Message)
        }
    })
    return false
}

function getCategory() {
    let data = new FormData()
    data.append("handle", "get")
    data.append("table", "category")
    request(data, function (result) {
        if (!!result.Status) {
            console.log(result.Data)
            return
        }
        categorys = result.Data
        let doc = document.getElementById("tbody")
        for (let i = 0; i < result.Data.length; i++) {
            let element = result.Data[i]
            let a = `<tr><td><a href="#form" onclick="eidtCurrent(${i}, 'categorys')">${element.name}</a></td><td>${element.info}</td><td><a href="./item.html?id=${element.id}">语法</a></td><tr>`
            doc.innerHTML += a
        }
    })
}

/** Item */

function setItem(e) {
    e.preventDefault();
    let data = new FormData(document.forms[0])
    if (!data.get("name")) {
        return false
    }
    data.append("handle", "set")
    data.append("table", "item")
    data.append("cid", query("id"))
    request(data, function (result) {
        if (!result.Status) {
            window.location.reload()
        } else {
            alert(result.Message)
        }
    })
    return false
}

function getItem() {
    let data = new FormData()
    data.append("handle", "get")
    data.append("table", "item")
    request(data, function (result) {
        if (!!result.Status) {
            console.log(result.Data)
            return
        }
        items = result.Data
        let doc = document.getElementById("tbody")
        for (let i = 0; i < result.Data.length; i++) {
            let element = result.Data[i]
            let a = `<tr><td><a href="#form" onclick="eidtCurrent(${i}, 'items')">${element.name}</a></td><td>${element.info}</td><td>${element.image}</td><td><a href="./question.html?id=${element.id}">实例</a></td></tr>`
            doc.innerHTML += a
        }
    })
}

/** Question */

function setQuestion(e) {
    e.preventDefault();
    let data = new FormData(document.forms[0])
    if (!data.get("content")) {
        return false
    }
    data.append("handle", "set")
    data.append("table", "question")
    data.append("iid", query("id"))
    request(data, function (result) {
        if (!result.Status) {
            window.location.reload()
        } else {
            alert(result.Message)
        }
    })
    return false
}

function getQuestion() {
    let data = new FormData()
    data.append("handle", "get")
    data.append("table", "question")
    request(data, function (result) {
        if (!!result.Status) {
            console.log(result.Data)
            return
        }
        questions = result.Data
        let doc = document.getElementById("tbody")
        for (let i = 0; i < result.Data.length; i++) {
            let element = result.Data[i]
            let a = `<tr><td><a href="#form" onclick="eidtCurrent(${i}, 'questions')">${element.content}</a></td><td>${element.option}</td><td>${element.answer}</td><tr>`
            doc.innerHTML += a
        }
    })
}

/** 公共 */

function eidtCurrent(i, name) {
    if (window[name].length <= i) {
        return
    }
    let data = document.forms[0]
    let item = window[name][i]
    Object.keys(item).forEach(key => {
        if (!data[key]) {
            return
        }
        data[key].value = item[key]
    })
}

function request(data, back) {
    fetch(url, {
        method: "POST",
        body: data,
    }).then(
        (response) => {
            if (response.ok) {
                return response.json()
            } else {
                throw Error("response is not json")
            }
        })
        .then((result) => {
            back(result)
        }).catch((error) => {
            console.log(error)
        });
}

function query(key) {
    let q = new URLSearchParams(window.location.search)
    return q.get(key)
}