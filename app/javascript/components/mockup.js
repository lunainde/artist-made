
const changeToMockupPicture = () => {

  const mockupPictures = document.querySelectorAll('.card-mockup')
  const changingPicture = document.getElementById('main-art-picture')
  const makeMockupVisible = document.getElementById('art-card-overlay')
  const adjustMockupByShape= document.getElementById('art-card-picture-shape')

  mockupPictures.forEach(picture => {



    picture.addEventListener('click', (e) => {

      changingPicture.style.backgroundImage = picture.style.backgroundImage;


      // console.log(e.currentTarget)
      // e.currentTarget.style.filter = 'opacity(1)';

      picture.classList.remove("active");

      if (picture.className === 'card-mockup main') {
        makeMockupVisible.style.visibility = 'hidden';

      }
      else if (picture.className === 'card-mockup square')
        { adjustMockupByShape.className = 'card-trip-user-square';
        makeMockupVisible.style.visibility = 'visible';
        picture.classList.add("active");

        }
      else if (picture.className === 'card-mockup portrait')
        { adjustMockupByShape.className = 'card-trip-user';
        makeMockupVisible.style.visibility = 'visible';
        picture.classList.add("active");
        }
      else if (picture.className === 'card-mockup circle')
        { adjustMockupByShape.className = 'card-trip-user-circle';
        makeMockupVisible.style.visibility = 'visible';
        picture.classList.add("active");
      }
      console.log(picture.classList);
      // picture.classList.remove("active");
      // console.log(picture.classList);
    });
  })
}


//   mockupPictures.addEventListener("click", (e) => {
//     mockupPictures.classList.remove("active");
//     e.currentTarget.classList.add("active");
//     console.log(e.currentTarget);
//   })
// }
export { changeToMockupPicture };
