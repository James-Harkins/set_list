require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'displays the song title' do
    artist = Artist.create(name: 'Frank Zappa')
    song = artist.songs.create!(title: "Dinah-moe Hum", length: 648, play_count: 24563457)
    song_2 = artist.songs.create!(title: "Joe's Garage", length: 608, play_count: 24562340)
    visit "/songs/#{song.id}"
    expect(page).to have_content(song.title)
    expect(page).not_to have_content(song_2.title)
  end

  it 'displays the name of the artist for the song' do
    artist = Artist.create(name: 'Frank Zappa')
    song = artist.songs.create!(title: "Dinah-moe Hum", length: 648, play_count: 24563457)
    song_2 = artist.songs.create!(title: "Joe's Garage", length: 608, play_count: 24562340)
    visit "/songs/#{song.id}"
    save_and_open_page
    expect(page).to have_content(artist.name)
  end
end
