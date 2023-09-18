if @artwork.persisted?
  json.inserted_item render(partial: "artworks/artwork", formats: :html, locals: {artworks: @artworks})
  json.form render(partial: "artworks/form", formats: :html, locals: {artwork: Artwork.new})
else
  json.form render(partial: "artworks/form", formats: :html, locals: {artwork: @artwork})
end
