ActiveAdmin.register Actor do

  permit_params :name, :bio, :gender

  menu priority: 5

  form do |f|
    f.inputs do
      f.input :name
      f.input :bio
      f.input :gender, as: :select, collection: ['male', 'female'].map {|gender| [gender.titleize, gender]}, include_blank: false
    end
    f.actions
  end

end
