export const clickRestoCard = () => {
  document.querySelectorAll(".dish-card").forEach((card) => {
    console.log(card)
    card.addEventListener("click", (event) => {
      window.location.href = "http://" + window.location.host + event.currentTarget.getAttribute('data-path');
    })
  })
}



