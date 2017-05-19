document.addEventListener("DOMContentLoaded", function(event) { 

  var app3   = new Vue({
    el: '#app3',
    data: {
      profiles: [],
      BMI: 0,
      AvgCalories: 0,
      genderNum: 0,
      genderNum2: 0,
      genderNum3: 0,
      genderNum4: 0,
      activityLevelNum: 0
    },
    mounted: function() {

      $.get('api/v1/profiles', function(response) {
        this.profiles = response;
        this.BMI = Math.round((this.profiles[0].weight / (this.profiles[0].height * this.profiles[0].height)) * 703);

        if (this.profiles[0].gender === 'Male') {
          this.genderNum = 66.47;
          this.genderNum2 = 13.75;
          this.genderNum3 = 5;
          this.genderNum4 = 6.75;
        } else {
          this.genderNum = 665.09;
          this.genderNum2 = 9.56;
          this.genderNum3 = 1.84;
          this.genderNum4 = 4.67;
        }
        
        if (this.profiles[0].activity_level === 'No exercise') {
          this.activityLevelNum = 1.2;
        } else if (this.profiles[0].activity_level === '1-3 times week') {
          this.activityLevelNum = 1.375;
        } else if (this.profiles[0].activity_level === '3-5 times week') {
          this.activityLevelNum = 1.55;
        } else if (this.profiles[0].activity_level === '6-7 times week') {
          this.activityLevelNum = 1.725;
        }

        this.AvgCalories = Math.round((this.genderNum + (this.genderNum2 * (this.profiles[0].weight / 2.2)) + (this.genderNum3 * (this.profiles[0].height * 2.54)) - (this.genderNum4 * this.profiles[0].age)) * this.activityLevelNum);

      }.bind(this));

    }

  });
});