import Typed from "typed.js"

const loadDynamicBannerText = () => {
  const bannerTypedText = document.querySelector("#banner-typed-text");

  if (bannerTypedText) {
    new Typed('#banner-typed-text', {
      strings: ["What are you Craving?", "Poutine ?", "Hot Dog ?", "Fried Rice", "Sushi ?", "Ramen ?", "Pizza ?", "Sandwich ?", "Pasta ? ", "Burger ?", "Curry ?", "Poke Bowl?"],
      typeSpeed: 100,
      loop: true,
      attr: "placeholder"
    });
  }
}

const initializeMainVideo = () => {
  const mainVideo = document.querySelector("#mainVideo");

  if (mainVideo) {
    setVideoSizeBasesOnWindowSize(mainVideo)

    window.addEventListener("resize", () => {
        setVideoSizeBasesOnWindowSize(mainVideo)
    })
  }
}

const setVideoSizeBasesOnWindowSize = (video) => {
    if (window.innerWidth / window.innerHeight > 1.7777777777777777) {
        video.style.position = "fixed";
        video.style.right = 0;
        video.style.bottom = 0;
        video.style.maxWidth = "100%";
        video.style.minHeight = "100%";
        video.style.zIndex = -2;

        video.style.minWidth = "initial";
        video.style.maxHeight = "initial";
    } else {
        video.style.position = "fixed";
        video.style.right = 0;
        video.style.bottom = 0;
        video.style.minWidth = "100%";
        video.style.maxHeight = "100%";
        video.style.zIndex = -2;

        video.style.maxWidth = "initial";
        video.style.minHeight = "initial";
    }
}

export { loadDynamicBannerText, initializeMainVideo };
