/* ============================================================
   FICHIER : js/script.js  (le cerveau du site)
   Ce fichier est appelé en bas de CHAQUE page HTML (index, menu, apropos, contact)
   par la balise <script src="js/script.js"></script>.
   Il agit sur les pages grâce aux "id" écrits dans le HTML
   (ex: id="menu-welcome", id="toggle-prices-btn", id="current-date"...).

   Astuce pour comprendre : à chaque fois qu'on voit
   document.getElementById("xxx"), on va chercher dans le HTML
   l'élément qui porte id="xxx" pour le modifier.
   ============================================================ */

/* "DOMContentLoaded" = on attend que toute la page HTML soit chargée
   AVANT de lancer le code (sinon les éléments n'existent pas encore). */
document.addEventListener("DOMContentLoaded", function () {
    
    /* ==========================================================================
       1. TEXTE DE BIENVENUE DYNAMIQUE (Généré par JS dans le bandeau rouge)
       ========================================================================== */
    const welcomeBanner = document.getElementById("dynamic-welcome-banner");
    if (welcomeBanner) {
        welcomeBanner.textContent = "☕ Bienvenue sur le site de COFFEE LOFT UCAO -- Votre cafétéria universitaire ! ☕";
        
        setTimeout(function () {
               welcomeBanner.classList.add("hide");
               // ...puis on retire complètement le bandeau du DOM (fin du fondu : 0,6 s)
               setTimeout(function () {
                   welcomeBanner.remove();
               }, 600);
           }, 5000);
    }

    /* ==========================================================================
       2. RECONNAISSANCE AUTOMATIQUE DE LA DATE ET DE L'ANNÉE
       ========================================================================== */
    const dateElement = document.getElementById("current-date");
    const yearElement = document.getElementById("current-year");

    if (dateElement || yearElement) {
        const aujourdHui = new Date();

        if (yearElement) {
            yearElement.textContent = aujourdHui.getFullYear();
        }
        const optionsFormat = { weekday: 'long', day: 'numeric', month: 'long', year: 'numeric' };
        let dateFormatee = aujourdHui.toLocaleDateString('fr-FR', optionsFormat);

        // Formate la première lettre en majuscule (ex: Lundi 29 Juin 2026)
        dateFormatee = dateFormatee.charAt(0).toUpperCase() + dateFormatee.slice(1);

        if (dateElement) {
            dateElement.textContent = dateFormatee;
        }
    }

    /* ==========================================================================
       3. AFFICHER / MASQUER LES PRIX (Pour menu.html)
       ========================================================================== */
    const togglePricesBtn = document.getElementById("toggle-prices-btn");
    const prices = document.querySelectorAll(".price");

    if (togglePricesBtn) {
        let visible = true;
        togglePricesBtn.addEventListener("click", function () {
            visible = !visible;
            prices.forEach(p => p.style.display = visible ? "inline-block" : "none");
            togglePricesBtn.textContent = visible ? "Masquer les prix" : "Afficher les prix";
        });
    }

    /* ==========================================================================
       4. MESSAGE DE BIENVENUE TEMPORAIRE (Pour menu.html)
       On écrit le texte, puis au bout de 4 secondes on ajoute la classe "hide"
       qui le fait disparaître en douceur (voir .menu-welcome-temp.hide dans le CSS).
       ========================================================================== */
    const menuWelcome = document.getElementById("menu-welcome");
    if (menuWelcome) {
        // La main "wave" est animée par le CSS (.wave)
        menuWelcome.innerHTML = '<span class="wave">👋</span> Bienvenue ! Voici notre menu du jour, bon appétit';

        // Après 5 s : on lance le fondu...
        setTimeout(function () {
            menuWelcome.classList.add("hide");
            // ...puis on retire complètement le bandeau du DOM (fin du fondu : 0,6 s)
            setTimeout(function () {
                menuWelcome.remove();
            }, 600);
        }, 5000);
    }

    /* ==========================================================================
       5. CARROUSELS (Pour menu.html)
       Pour chaque carrousel, les flèches font défiler la piste d'une carte.
       ========================================================================== */
    const carousels = document.querySelectorAll(".carousel");
    carousels.forEach(function (carousel) {
        const track = carousel.querySelector(".carousel-track");
        const prevBtn = carousel.querySelector(".prev");
        const nextBtn = carousel.querySelector(".next");
        const card = track.querySelector(".menu-card");

        // Largeur d'une carte + l'espace entre les cartes (gap de 25px)
        const step = card ? card.offsetWidth + 25 : 300;

        prevBtn.addEventListener("click", function () {
            track.scrollBy({ left: -step, behavior: "smooth" });
        });
        nextBtn.addEventListener("click", function () {
            track.scrollBy({ left: step, behavior: "smooth" });
        });
    });

    /* ==========================================================================
       6. VALIDATION DU FORMULAIRE (Pour contact.html uniquement)
       ========================================================================== 
    const form = document.getElementById("cafet-contact-form");
    const formMessage = document.getElementById("form-message");

    // On n'attache l'événement que si le formulaire existe sur la page
    if (form) {
        form.addEventListener("submit", function (event) {
            event.preventDefault();

            const nom = document.getElementById("nom").value.trim();
            const prenom = document.getElementById("prenom").value.trim();
            const email = document.getElementById("email").value.trim();
            const message = document.getElementById("message").value.trim();

            if (!nom || !prenom || !email || !message) {
                formMessage.innerHTML = "⚠️ Veuillez remplir tous les champs obligatoires.";
                formMessage.className = "message erreur";
                return;
            }

            formMessage.innerHTML = "✅ Votre message a été envoyé avec succès !";
            formMessage.className = "message succes";
            form.reset();
        });
    }*/
});