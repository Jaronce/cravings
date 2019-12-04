const couponAnimation = () => {
    const redeemButton = document.querySelector("#redeem");
    const overlay = document.querySelector("#popup1");
    const couponPopup = document.querySelector(".coupon-popup");
    const closeBtn = document.querySelector(".close");

    if (redeemButton) {
        redeemButton.addEventListener("click", () => {
            overlay.classList.add("overlay-visible");
            couponPopup.style.display = "none";
        });

        closeBtn.addEventListener("click", () => {
            overlay.classList.remove("overlay-visible");
        })
    }
}

export { couponAnimation };