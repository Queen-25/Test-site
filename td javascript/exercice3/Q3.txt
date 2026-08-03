alert("Bienvenue !");


function calculPGCD()
{
    let a = parseInt(document.getElementById("n1").value);
    let b = parseInt(document.getElementById("n2").value);

    while(b != 0)
    {
        let r = a % b;
        a = b;
        b = r;
    }

    document.getElementById("resultat").innerHTML =
        "PGCD = " + a;
}