class Profile < ApplicationRecord
  belongs_to :user 

  def bmi 
    heights = height * height

    ((weight.to_f / heights.to_f) * 703).round 
  end

  def AvgCalories
    genderNum = 0
    genderNum2 = 0
    genderNum3 = 0
    genderNum4 = 0
    activityLevelNum = 0
    calories = 0

    if geneder == 'Male' 
      genderNum = 66.47;
      genderNum2 = 13.75;
      genderNum3 = 5;
      genderNum4 = 6.75;
    else 
      genderNum = 665.09;
      genderNum2 = 9.56;
      genderNum3 = 1.84;
      genderNum4 = 4.67;
    end

    if activity_level == 'No exercise' 
      activityLevelNum = 1.2
    elsif activity_level == '1-3 times week' 
      activityLevelNum = 1.375
    elsif activity_level == '3-5 times week' 
      activityLevelNum = 1.55
    elsif activity_level == '6-7 times week' 
      activityLevelNum = 1.725
    end
    
    calories = ((genderNum + (genderNum2 * (weight / 2.2)) + (genderNum3 * (height * 2.54)) - (genderNum4 * age)) * activityLevelNum).round

    return calories
  end

end
