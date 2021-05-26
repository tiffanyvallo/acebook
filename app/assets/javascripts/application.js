// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .
document.addEventListener("DOMContentLoaded", () => {

  // target switch
  // if switch clicked change color-mode to dark
  // add css for light and dark color-mode


  let toggleSwitch = document.querySelector(".toggle-mode")
  let myLocalStorage = window.localStorage
  let userSwitch = toggleSwitch.unchecked
  let userColorMode = myLocalStorage.getItem("class")
  
  document.documentElement.setAttribute("class",userColorMode)

  if (userColorMode === "dark"){
    toggleSwitch.checked = true 
  } 

  toggleSwitch.addEventListener("change", () => {
    if (toggleSwitch.checked === true){
      document.documentElement.setAttribute("class", "dark" )
      myLocalStorage.setItem("class", "dark")
      
    } else {
      document.documentElement.setAttribute("class", "light" )
      myLocalStorage.setItem("class", "light")
    }
  })
})
  
function hideDarkMode() {
  document.documentElement.removeAttribute("class")
 
}