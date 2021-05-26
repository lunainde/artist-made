
const changeToMockupPicture = () => {

  const mockupPictures = document.querySelectorAll('.card-mockup')
  const changingPicture = document.getElementById('main-art-picture')
  const makeMockupVisible = document.getElementById('art-card-overlay')
  const adjustMockupByShape= document.getElementById('art-card-picture-shape')
  const activeClass = document.getElementsByClassName('active')

  const removeActiveClass = () => {
    mockupPictures.forEach(element => {
      element.classList.remove("active")
    });

}


  mockupPictures.forEach(picture => {



    picture.addEventListener('click', (e) => {

      changingPicture.style.backgroundImage = picture.style.backgroundImage;

      removeActiveClass();
      e.currentTarget.classList.add("active");

      if (picture.className === 'card-mockup main active') {
        makeMockupVisible.style.visibility = 'hidden';

      }
      else if (picture.className === 'card-mockup square active')
        { adjustMockupByShape.className = 'card-trip-user-square';
        makeMockupVisible.style.visibility = 'visible';


        }
      else if (picture.className === 'card-mockup portrait active')
        { adjustMockupByShape.className = 'card-trip-user';
        makeMockupVisible.style.visibility = 'visible';

        }
      else if (picture.className === 'card-mockup circle active')
        { adjustMockupByShape.className = 'card-trip-user-circle';
        makeMockupVisible.style.visibility = 'visible';

      }
    });
  })
}

export { changeToMockupPicture };
