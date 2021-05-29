const sliderToBanner = () => {
// window.addEventListener('load',(e) => {
    let wrapper = document.getElementById('wrapper');

    if (wrapper) {
      let topLayer = wrapper.querySelector('.top');
      let handle = wrapper.querySelector('.handle');
      let delta = 0;
  
      wrapper.addEventListener('mousemove', function(e){
      delta = (e.clientX - window.innerWidth / 2) * 0.5;
    
      handle.style.left = e.clientX + delta + 'px';
  
      topLayer.style.width= e.clientX + delta + 'px';
    });
  // });
  };
}

export { sliderToBanner };
