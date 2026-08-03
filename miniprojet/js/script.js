
document.addEventListener("DOMContentLoaded", function () {
    
    /* ==========================================================================
       1. TEXTE DE BIENVENUE DYNAMIQUE (Généré par JS dans le bandeau rouge)
       ========================================================================== */
    const welcomeBanner = document.getElementById("dynamic-welcome-banner");
    if (welcomeBanner) {
        welcomeBanner.textContent = "☕ Bienvenue sur le site de COFFEE LOFT UCAO -- Votre cafétéria universitaire ! ☕";
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
    const form = document.getElementById("cafet-contact-form");
const formMessage = document.getElementById("form-message");

form.addEventListener("submit", function(event) {

    event.preventDefault();

    const nom = document.getElementById("nom").value.trim();
    const prenom = document.getElementById("prenom").value.trim();
    const email = document.getElementById("email").value.trim();
    const message = document.getElementById("message").value.trim();

    if (!nom || !prenom || !email || !message) {

        formMessage.innerHTML =
            "⚠️ Veuillez remplir tous les champs obligatoires.";
        formMessage.className = "message erreur";

        return;
    }

    formMessage.innerHTML =
        "✅ Votre message a été envoyé avec succès !";
    formMessage.className = "message succes";

    form.reset();
});
});