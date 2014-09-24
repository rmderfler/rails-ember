Blogger.AboutController = Ember.Controller.extend({
  isPictureShowing: false,
  actions: {
      showRealName: function() {
      alert("His real name is Bob");
    },
      showPicture: function() {
      this.set('isPictureShowing', true);
    },
      hidePicture: function() {
      this.set('isPictureShowing', false);
    }
  }
})

