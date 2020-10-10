// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
import dragula from "dragula";

// This is the code for swiping the trade image up/down
document.addEventListener('turbolinks:load', () => {
  const fileinput = document.querySelector('input[type=file]')
  if (fileinput) {
    fileinput.addEventListener("change", previewFiles)
  }

  const container = [document.querySelector('#drag-bigger'), document.querySelector('#drag-better'), document.querySelector('#drag-middle')];
  const drake = dragula(container, {
    moves: function (el, source, handle, sibling) {
      return source.id === "drag-middle";
    },
    direction: 'vertical'
    // removeOnSpill: false,
  });

  drake.on("drop", (el, target, sibling) => {
    if (target.id === "drag-bigger") {
      formBigger.submit()
    } else if (target.id === "drag-better") {
      formBetter.submit()
    }
  });


  // This if-statement checks if we're on the trade page or not
  if (document.URL.includes("trades/new")) {
    // Code for opening the item selection menu
    const itemMenuButton = document.getElementById("list-items-button");
    itemMenuButton.addEventListener('click', (event) => {
      document.getElementById("trade-items-list").classList.add("trade-items-list-open");
    });

    // Code for closing the item selection menu
    const itemMenuExitButton = document.getElementById("trade-items-list-exit-btn");
    itemMenuExitButton.addEventListener('click', (event) => {
      document.getElementById("trade-items-list").classList.remove("trade-items-list-open");
    });
  }

});

function previewFiles() {
  var preview = document.querySelector('#preview');
  var files = document.querySelector('input[type=file]').files;
  function readAndPreview(file) {
    // Make sure `file.name` matches our extensions criteria
    if (/\.(jpe?g|png|gif)$/i.test(file.name)) {
      var reader = new FileReader();
      reader.addEventListener("load", function () {
        var image = new Image();
        image.height = 100;
        image.title = file.name;
        image.src = this.result;
        preview.appendChild(image);
      }, false);
      reader.readAsDataURL(file);
    }
  }
  if (files) {
    [].forEach.call(files, readAndPreview);
  }
}

const materialIcon = () => {
  var imageIcon = document.querySelector("file required");
  if (imageIcon) {
    imageIcon.innerHTML = `<span class="material-icons">perm_media</span>`;
    console.log(imageIcon);
  };
}
materialIcon();
