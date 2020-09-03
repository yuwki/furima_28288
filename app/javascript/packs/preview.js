if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const imageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
       
      const imageElement = document.createElement('div');
      imageElement.setAttribute('id', "image-element")
      let imageElementNum = document.querySelectorAll('#image-element').length

      
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('class', 'item-image');

      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `message_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'item[images][]')
      inputHTML.setAttribute('type', 'file')

      imageElement.appendChild(blobImage);
      imageElement.appendChild(inputHTML)
      imageList.appendChild(imageElement);

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    };

    document.getElementById('item-image').addEventListener('change', (e) => {

      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}
