import consumer from "./consumer"

if(location.pathname.match(/\/products\/\d/)){

  consumer.subscriptions.create({
    channel: "CommentChannel",
    product_id: location.pathname.match(/\d+/)[0]
  }, {
    
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = `
        <div class="comment">
          <div class= customer-info>
            <p class="customer-name">${data.customer.nickname}: </p>
            <div class="chatting">
              <div class="customer-comment">
                <p>${data.comment.comment}</p>
              </div>
            </div>
          </div>
        </div>`
      const comments = document.getElementById("comments")
      comments.insertAdjacentHTML('beforeend', html)
      const commentForm = document.getElementById("comment-form")
      commentForm.reset();
    }
  });
}
