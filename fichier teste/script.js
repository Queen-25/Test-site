const indicator = document.querySelector('.indicator');
const items = document.querySelectorAll('.menu ul li');

function moveIndicator(item) {

    indicator.style.width = item.offsetWidth + "px";

    indicator.style.left = item.offsetLeft + "px";
}

items.forEach((item) => {

    item.addEventListener('mouseenter', () => {
        moveIndicator(item);
    });

});

// retour sur la page active
document.querySelector('.menu').addEventListener('mouseleave', () => {

    const activeItem = document.querySelector('.menu ul li.active');

    if (activeItem) {
        moveIndicator(activeItem);
    }
});

// position initiale
const activeItem = document.querySelector('.menu ul li.active');

if (activeItem) {
    moveIndicator(activeItem);
}