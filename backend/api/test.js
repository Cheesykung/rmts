const path = [[null,null,null,1,2,3,null], [null,null,1,2,3,4,null], [null,2,1,3,4,null,null], [null,2,3,4,null,null,null]]

function search(begin, destination) {
    let result = []
    let quese = []
    path.forEach((element) => {
        if (element[3] == begin) {
            let arr = [element[3]]
            quese.push(arr)
        }
    })

    while (quese.length > 0) {
        let now = quese[0]
        if (now[now.length - 1] == destination) {
            let arr = [...now]
            result.push(arr)
        } else {
            path.forEach(element => {
                if (element[3] == now[now.length - 1]) {
                    let next = (element[4] != null) ? element[4] : undefined
                    let back = (element[2] != null) ? element[2] : undefined
                    let double_next = (element[5] != null) ? element[5] : undefined
                    let double_back = (element[1] != null) ? element[1] : undefined
                    let triple_next = (element[6] != null) ? element[6] : undefined
                    let triple_back = (element[0] != null) ? element[0] : undefined

                    // console.log(next, back, double_next, double_back, triple_next, triple_back);
                    if (next != undefined && now.find((value) => value == next) != next) {
                        let x = [...now]
                        x.push(next)
                        quese.push(x)
                    }

                    if (back != undefined && now.find((value) => value == back) != back) {
                        let x = [...now]
                        x.push(back)
                        quese.push(x)
                    }

                    if (double_next != undefined && now.find((value) => value ==  double_next) != double_next) {
                        let x = [...now]
                        x.push(double_next)
                        quese.push(x)
                    }

                    if (double_back != undefined && now.find((value) => value ==  double_back) != double_back) {
                        let x = [...now]
                        x.push(double_back)
                        quese.push(x)
                    }

                    if (triple_next != undefined && now.find((value) => value ==  triple_next) != triple_next) {
                        let x = [...now]
                        x.push(triple_next)
                        quese.push(x)
                    }

                    if (triple_back != undefined && now.find((value) => value ==  triple_back) != triple_back) {
                        let x = [...now]
                        x.push(triple_back)
                        quese.push(x)
                    }
                }
            })
            console.log(quese);
        }
        quese.shift()
    }
    return result
}

let x = search(1, 2)
console.log(x);