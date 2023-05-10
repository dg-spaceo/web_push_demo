// serviceworker.js
// The serviceworker context can respond to 'push' events and trigger
// notifications on the registration property
self.addEventListener("push", (event) => {
  var msg = JSON.parse(event.data.text())
  let title = (msg.title) || "Yay a message";
  let body = (msg.body) || "We have received a push message";
  let tag = "push-simple-demo-notification-tag";
  let icon = '/assets/my-logo-120x120.png';

  event.waitUntil(
    self.registration.showNotification(title, { body, icon, tag })
  )
});