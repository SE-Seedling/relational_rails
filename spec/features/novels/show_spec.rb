require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'I visit novel id page' do
    it 'then shows only that novel attributes' do

      tlotr = Novel.create!(title: 'The Lord of the Rings', author: 'J. R. R. Tolkien', number_of_chapters: 60)

      visit "/novels/#{tlotr.id}"

      expect(page).to have_content(tlotr.title)
      expect(page).to have_content(tlotr.author)
      expect(page).to have_content(tlotr.number_of_chapters)
    end

    it "then has link to delete novel" do
      tlotr = Novel.create!(title: 'The Lord of the Rings', author: 'J. R. R. Tolkien', number_of_chapters: 60)

      visit "/novels/#{tlotr.id}"

      click_link 'Delete Novel'

      expect(current_path).to eq("/novels")
      expect(page).to_not have_content(tlotr.title)
    end
  end
end