alert("Bienvenue !");


let images = [
    "c:\\Users\\ZBook Firefly 14 G8\\OneDrive\\Images\\yamadakun 🖤.jpg",
    "c:\\Users\\ZBook Firefly 14 G8\\OneDrive\\Images\\photo chat.png",
    "c:\\Users\\ZBook Firefly 14 G8\\OneDrive\\Images\\yor eyes.jpg",
    "c:\\Users\\ZBook Firefly 14 G8\\OneDrive\\Images\\🤎💛.jpg",
];

let indice = 0;

function suivant()
{
    indice++;

    if(indice >= images.length)
    {
        indice = 0;
    }

    document.getElementById("photo").src =
    images[indice];
}

function precedent()
{
    indice--;

    if(indice < 0)
    {
        indice = images.length - 1;
    }

    document.getElementById("photo").src =
    images[indice];
}