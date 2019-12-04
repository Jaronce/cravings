export const clickBugerButton = () => {
  const popup = document.querySelector(".dropup-content")
  const button = document.querySelector(".dropbtn")
  button.addEventListener("click", ()=> {

    if (popup.style.display == "none" || popup.style.display == "" ){
      // if your click
      popup.style.display = "block";
      button.style.color = "FD5C3A";
    } else {
      popup.style.display = "none";
      button.style.color = "#868686";
    }
  })
}





