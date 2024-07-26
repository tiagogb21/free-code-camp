let hashSymbol = "#";
let spaceSymbol = " ";

function repeatHash(n) {
    for (let i = 3; i <= n; i+=2) {
        let result = '';
        let spaceSymbolConstruct = spaceSymbol.repeat((n-(i-2))/2)
        result += spaceSymbolConstruct + hashSymbol.repeat(i-2) + spaceSymbolConstruct;
        console.log(result);
    }
}

repeatHash(12);
