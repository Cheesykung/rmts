const path = [[null, null, null, 1, 2, 6, null], [null, null, 1, 2, 3, null, null], [null, null, 1, 6, 4, null, null], 
[null, null, 2, 3, 5, null, null], [null, null, 6, 4, 5, null, null], [null, 3, 4, 5, null, null, null]]
const end = 1
let start = 5
let prev = 0
let result = []
let arr = []

function createArray(value, code) {
    if (code == 0) {
        arr.push(value)
    } 
    if (code == 1) {
        arr.push(value)
        saveArray(arr)
        arr = []
    }
}

function saveArray(array) {
    result.push(array)
}

while (true) {
    let now = []
    path.forEach(element => {
        if (start == element[3]) {
            now.push(element[2])
            now.push(element[3])
            now.push(element[4])
        }
    })

    console.log(now);

    if (now.length <= 0) {
        console.log("404");
        break
    }

    if (now[1] == end) {
        createArray(now[1], 1)
        break
    }

    if (now[0] != null && now[0] != prev) {
        console.log("back");
        createArray(now[1], 0)
        start = now[0]
        prev = now[1]
    }else if (now[2] != null && now[2] != prev) {
        console.log("next");
        createArray(now[1], 0)
        start = now[2]
        prev = now[1]
    }else {
        console.log("404");
        break
    }
}

console.log(result);