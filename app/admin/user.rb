ActiveAdmin.register User do

  permit_params :id, :first_name, :last_name, :email, :encrypted_password, :password, image_attributes: [:id, :image, :_destroy]

  menu priority: 2

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.object.build_image unless f.object.image
      f.inputs 'Profile Picture', for: [:image, f.object.image] do |profile_picture|
        profile_picture.input :image, as: :file, hint: profile_picture.template.image_tag(profile_picture.object.image.url(:thumb))
      end
    end
    f.actions
  end

  index do
    id_column
    column :first_name
    column :last_name
    column :email, sortable: :email
    actions
  end

  show do |user|
    attributes_table do
      row :id
      row :first_name
      row :last_name
      row :email
      row :encrypted_password
      row :created_at
      row :updated_at
      row 'Profile Picture' do |picture|
        div do
          image_tag(picture.image.image.url(:thumb)) if picture.image.present?
        end
      end
    end
    active_admin_comments
  end

end
