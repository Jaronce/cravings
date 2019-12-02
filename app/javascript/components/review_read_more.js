export const readMore = () => {
  const buttons = document.querySelectorAll(".myBtn");
  buttons.forEach( (button) => {
    // button.parentElement.getElementsByClassName("dots")[0].style.display = "block";
    // button.parentElement.getElementsByClassName("dots")[0].style.display = "none";
    button.addEventListener("click", ()=> {
      openMorePage(button);
    })
  })
}

const openMorePage = (button) => {
  const dots = button.parentElement.getElementsByClassName("dots")[0];
  const moreText = button.parentElement.getElementsByClassName("more")[0];
  const btnText = button;

  if (dots.style.display === "none") {
    dots.style.display = "inline";
    btnText.innerHTML = "Read more";
    moreText.style.display = "none";
  } else {
    dots.style.display = "none";
    btnText.innerHTML = "Read less";
    moreText.style.display = "inline";
  }
};



