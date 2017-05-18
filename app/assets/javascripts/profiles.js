document.addEventListener("DOMContentLoaded", function(event) { 

  var app3   = new Vue({
    el: '#app3',
    data: {
      profiles: []
    },
    mounted: function() {

      $.get('api/v1/profiles', function(response) {
        console.log(response);
        this.profiles = response;
      }.bind(this));

    }

  });
});