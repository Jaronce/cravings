export const clickBugerButton = () => {
  const popup = document.querySelector(".dropup-content")
  const button = document.querySelector(".dropbtn")
  button.addEventListener("click", ()=> {
    console.log("test");
    if (popup.style.display == "none" || popup.style.display == "" ){
      popup.style.display = "block";

    } else {
      popup.style.display = "none";
    }
  })
}



