/* ============================================================
   FICHIER : js/script.js  (le JavaScript du site)

   Ce fichier est appele en bas de CHAQUE page HTML avec :
       <script src="js/script.js"></script>

   Il rend le site vivant. Il fait 5 choses :
     1. Afficher la date du jour dans le pied de page
     2. Afficher le message de bienvenue (accueil et menu)
     3. Bouton "Afficher / Masquer les prix"  (page menu)
     4. Faire defiler le carrousel des produits  (page menu)
     5. Verifier le formulaire de contact        (page contact)

   IMPORTANT a comprendre :
   Le JavaScript agit sur le HTML grace aux "id".
   Exemple : document.getElementById("current-date")
   va chercher dans le HTML l'element qui a  id="current-date".
   Si cet element n'existe pas sur la page, la valeur est "null".
   C'est pourquoi on ecrit souvent  if (element) { ... }  :
   ca veut dire "seulement si l'element existe sur cette page".
   ============================================================ */

/* On attend que toute la page soit chargee avant d'agir.
   Sinon les elements HTML n'existent pas encore. */
document.addEventListener("DOMContentLoaded", function () {

    /* --------------------------------------------------------
       1. DATE DU JOUR DANS LE PIED DE PAGE
       Presente sur toutes les pages (ids current-year et current-date).
       -------------------------------------------------------- */
    var maintenant = new Date();

    var anneeElement = document.getElementById("current-year");
    if (anneeElement) {
        anneeElement.textContent = maintenant.getFullYear();
    }

    var dateElement = document.getElementById("current-date");
    if (dateElement) {
        // Options pour ecrire la date en francais : "mardi 1 juillet 2026"
        var options = { weekday: "long", day: "numeric", month: "long", year: "numeric" };
        var dateEnTexte = maintenant.toLocaleDateString("fr-FR", options);
        // Mettre la premiere lettre en majuscule
        dateElement.textContent = dateEnTexte.charAt(0).toUpperCase() + dateEnTexte.slice(1);
    }

    /* --------------------------------------------------------
       2. MESSAGE DE BIENVENUE
       - Page accueil : id "dynamic-welcome-banner" (reste affiche)
       - Page menu    : id "menu-welcome" (disparait apres 5 secondes)
       -------------------------------------------------------- */
    var bienvenueAccueil = document.getElementById("dynamic-welcome-banner");
    if (bienvenueAccueil) {
        // On ecrit dans le <span> du milieu pour ne pas effacer les tasses (SVG)
        var texteAccueil = bienvenueAccueil.querySelector(".banner-text");
        texteAccueil.textContent = "Bienvenue sur le site de la Cafétéria Coffee Loft UCAO !";
        // Au bout de 5 secondes, on ajoute la classe "hide" (fait disparaitre en douceur)
        setTimeout(function () {
            bienvenueAccueil.classList.add("hide");
            // Puis on retire completement le bandeau (apres la disparition de 0,6 s)
            setTimeout(function () {
                bienvenueAccueil.remove();
            }, 600);
        }, 5000);
    }

    var bienvenueMenu = document.getElementById("menu-welcome");
    if (bienvenueMenu) {
        bienvenueMenu.textContent = "Bienvenue ! Voici notre menu du jour, bon appétit.";

        // Au bout de 5 secondes, on ajoute la classe "hide" (fait disparaitre en douceur)
        setTimeout(function () {
            bienvenueMenu.classList.add("hide");
            // Puis on retire completement le bandeau (apres la disparition de 0,6 s)
            setTimeout(function () {
                bienvenueMenu.remove();
            }, 600);
        }, 5000);
    }

    /* --------------------------------------------------------
       3. AFFICHER / MASQUER LES PRIX (page menu)
       -------------------------------------------------------- */
    var boutonPrix = document.getElementById("toggle-prices-btn");
    if (boutonPrix) {
        var prix = document.querySelectorAll(".price"); // toutes les etiquettes de prix
        var prixVisibles = true;

        boutonPrix.addEventListener("click", function () {
            prixVisibles = !prixVisibles; // on inverse : vrai -> faux -> vrai...

            // On parcourt chaque prix pour l'afficher ou le cacher
            for (var i = 0; i < prix.length; i++) {
                prix[i].style.display = prixVisibles ? "inline-block" : "none";
            }

            boutonPrix.textContent = prixVisibles ? "Masquer les prix" : "Afficher les prix";
        });
    }

    /* --------------------------------------------------------
       4. CARROUSEL DES PRODUITS (page menu)
       Il peut y avoir plusieurs carrousels (plats, boissons),
       donc on les traite tous avec une boucle.
       -------------------------------------------------------- */
    var carrousels = document.querySelectorAll(".carousel");
    for (var c = 0; c < carrousels.length; c++) {
        // On donne cette fonction a chaque carrousel pour brancher ses fleches
        activerCarrousel(carrousels[c]);
    }

    // Cette fonction branche les fleches gauche/droite d'UN carrousel.
    // On l'ecrit une seule fois et on la reutilise (principe DRY).
    function activerCarrousel(carrousel) {
        var piste = carrousel.querySelector(".carousel-track"); // la bande qui defile
        var boutonGauche = carrousel.querySelector(".prev");
        var boutonDroite = carrousel.querySelector(".next");
        var carte = carrousel.querySelector(".menu-card");

        // De combien on defile a chaque clic : largeur d'une carte + l'espace (25px)
        var pas = carte ? carte.offsetWidth + 25 : 300;

        boutonGauche.addEventListener("click", function () {
            piste.scrollBy({ left: -pas, behavior: "smooth" });
        });
        boutonDroite.addEventListener("click", function () {
            piste.scrollBy({ left: pas, behavior: "smooth" });
        });
    }

    /* --------------------------------------------------------
       5. VALIDATION DU FORMULAIRE (page contact)
       On verifie 2 choses avant d'envoyer :
         a) tous les champs sont remplis
         b) l'email contient le caractere @
       -------------------------------------------------------- */
    var formulaire = document.getElementById("cafet-contact-form");
    var zoneMessage = document.getElementById("form-message");

    if (formulaire) {
        formulaire.addEventListener("submit", function (event) {
            event.preventDefault(); // empeche la page de se recharger

            // .trim() enleve les espaces avant/apres
            var nom = document.getElementById("nom").value.trim();
            var prenom = document.getElementById("prenom").value.trim();
            var email = document.getElementById("email").value.trim();
            var message = document.getElementById("message").value.trim();

            // a) Un champ est vide ?
            if (nom === "" || prenom === "" || email === "" || message === "") {
                zoneMessage.textContent = "Veuillez remplir tous les champs.";
                zoneMessage.className = "message erreur";
                return; // on arrete ici
            }

            // b) L'email contient-il un @ ?  (indexOf renvoie -1 si absent)
            if (email.indexOf("@") === -1) {
                zoneMessage.textContent = "L'adresse e-mail doit contenir le caractère @.";
                zoneMessage.className = "message erreur";
                return;
            }

            // Tout est bon : message de confirmation
            zoneMessage.textContent = "Votre message a bien été envoyé. Merci !";
            zoneMessage.className = "message succes";
            formulaire.reset(); // on vide le formulaire
        });
    }

});
