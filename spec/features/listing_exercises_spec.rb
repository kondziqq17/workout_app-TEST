require "rails_helper"

RSpec.feature "Listing Exercises" do
	before do
		@john = User.create(email: "john@example.com", password: "password")
		login_as(@john)

		@e1 = @john.exercises.create(duration_in_min: 20, workout: "Body building routine", workout_date: "2015-08-09")
		@e2 = @john.exercises.create(duration_in_min: 20, workout: "Cardio", workout_date: "2015-08-10")
	end

	scenario "Shows user's workout for last 7 days" do
		visit "/"

		click_link "My Lounge"
		expect(page).to have_content(@e1.duration_in_min)
		expect(page).to have_content(@e1.workout)
		expect(page).to have_content(@e1.workout_date)
		expect(page).to have_content(@e2.duration_in_min)
		expect(page).to have_content(@e2.workout)
		expect(page).to have_content(@e2.workout_date)
	end
end