export const addNumber = () => {
  const followButton = document.querySelector(".follow-button");
  let followerNumber = document.querySelector(".follower-number");
  if (followButton) {
    followButton.addEventListener("click", ()=> {
      followerNumber.innerHTML = parseInt(followerNumber.innerHTML) + 1
      followerNumber.innerHTML = String(followerNumber.innerHTML) // string "701" >> 700
      followButton.classList.add('active');
    })
  }
}


