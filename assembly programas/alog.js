var primo = 47
var resto = 10
var quoci = 10
for(var i = 2;i<quoci;i++){
quoci = primo/ i
resto = primo%i
if(resto == 0){
System.out("Não é primo ")
i = i + primo
}

}
System.out("É primo ")

