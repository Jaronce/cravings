import Typed from "typed.js"

const loadDynamicBannerText = () => {
    new Typed('#banner-typed-text', {
        strings: ["What are you Craving?", "Poutine ?", "Hot Dog ?", "Fried Rice", "Sushi ?", "Ramen ?", "Pizza ?", "Sandwich ?", "Pasta ? ", "Burger ?", "Curry ?", "Poke Bowl?"],
        typeSpeed: 100,
        loop: true,
        attr: "placeholder"
    });
}

export { loadDynamicBannerText };