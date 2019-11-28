import Typed from "typed.js"

const loadDynamicBannerText = () => {
    new Typed('#banner-typed-text', {
        strings: ["What are you Craving?", "Sushi ?", "Ramen ?", "Pizza ?", "Bibimbap ?", "ahhhhhhhh! "],
        typeSpeed: 100,
        loop: true
    });
}

export { loadDynamicBannerText };