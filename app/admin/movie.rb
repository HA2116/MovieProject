ActiveAdmin.register Movie do

  permit_params :title, :genre, :trailer, :release_date, :description, :featured, :approved, images_attributes: [:id, :image, :_destroy]

  menu priority: 3

  form html: { enctype: 'multipart/form-data' } do |f|
    f.inputs do
      f.input :title
      f.input :trailer
      f.input :release_date
      f.input :featured
      f.input :approved
      f.input :genre, as: :select, collection: Movie::GENRES.map {|genre| [genre.titleize, genre]}, include_blank: false
      f.input :description
      f.has_many :images, allow_destroy: true do |image|
        image.input :image, hint: image_tag(image.object.image.url(:thumb))
      end
    end
    f.actions
  end

  index do
    id_column
    column :title, sortable: :title
    column :genre
    column :featured
    column :approved
    actions
  end

  show do
    attributes_table do
      row :title
      row :genre
      row :description
      row :release_date
      row :trailer
      row :featured
      row :approved
      row :description
      if movie.images.present?
        row :posters do
          div do
            movie.images.each do |poster|
              div do
                image_tag(poster.image.url(:thumb))
              end
            end
          end
        end
      end
    end
  end

end
