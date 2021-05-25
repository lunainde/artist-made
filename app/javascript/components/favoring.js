
const setFavorit = () => {
  const heartElements = document.querySelectorAll(".btn-fav");
  const authToken = document.querySelectorAll("[name='csrf-token']");
//   console.log(authToken[0].content);
  heartElements.forEach((heartElement) => { 
    heartElement.addEventListener('click', (event) => {
        event.preventDefault();
        fetch('/favorites', {
        method: 'post',
        headers: {'Content-Type' : 'application/json', 'X-CSRF-Token' : authToken[0].content},
        body: JSON.stringify( { art_id: heartElement.dataset.artid } )
        }).then(() => {
            // console.log(heartElement.dataset);
            if (heartElement.innerHTML.trim() ===  "<i class=\"far fa-heart\"></i>") {
              // heartElement.style.color="white";
              heartElement.innerHTML = "<i class=\"fas fa-heart\"></i>";
              console.log("test")
            } else {
              // heartElement.style.color="red";
              console.log(heartElement.innerHTML)
              heartElement.innerHTML = "<i class=\"far fa-heart\"></i>";
              
              // console.log("test")
            }
             
            });
    });
  });  
};

export { setFavorit };
