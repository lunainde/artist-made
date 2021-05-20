
const changeToMockupPicture = () => {

  const mockupPictures = document.querySelectorAll('.card-mockup')
  const changingPicture = document.getElementById('main-art-picture')
  const makeMockupVisible = document.getElementById('art-card-overlay')
  const adjustMockupByShape= document.getElementById('art-card-picture-shape')

  mockupPictures.forEach(picture => {
    picture.addEventListener('click', () => {
      changingPicture.style.backgroundImage = picture.style.backgroundImage;

      if (picture.className === 'card-mockup main') {
        makeMockupVisible.style.visibility = 'hidden'; }
      else if (picture.className === 'card-mockup square')
        { adjustMockupByShape.className = 'card-trip-user-square';
        makeMockupVisible.style.visibility = 'visible';
        }
      else if (picture.className === 'card-mockup portrait')
        { adjustMockupByShape.className = 'card-trip-user';
        makeMockupVisible.style.visibility = 'visible';
        }
      else if (picture.className === 'card-mockup circle')
        { adjustMockupByShape.className = 'card-trip-user-circle';
        makeMockupVisible.style.visibility = 'visible';
      }


    });
  })
}

export { changeToMockupPicture };
