let hashSymbol = "#";
let spaceSymbol = " ";

function repeatHash(n) {
    for (let i = 3; i <= n; i+=2) {
        let result = '';
        result += spaceSymbol.repeat((n-(i-2))/2) + hashSymbol.repeat(i-2) + spaceSymbol.repeat((n-(i-2))/2);
        console.log(result);
    }
}

repeatHash(12);
