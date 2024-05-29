const activeWindow = require("./index"); // Assuming 'active-window' is the name of your modified package

// Callback function to handle the response
function handleActiveWindow(window) {
  console.log("Active Window:", window);
}

// Call the getActiveWindow function
setInterval(() => {
  activeWindow.getActiveWindow(handleActiveWindow);
}, 10 * 1000);
