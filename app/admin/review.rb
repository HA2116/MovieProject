ActiveAdmin.register Review do

  permit_params :content, :movie_id, :user_id

  menu priority: 4

  form do |f|
    f.inputs do
      f.input :movie
      f.input :user_id, as: :select, collection: User.all.map{ |user| [user.email, user.id] }
      f.input :content
    end
    f.actions
  end

  index do
    id_column
    column :movie, sortable: :movie_id
    column :user, sortable: :user_id
    column :content
    column :report_count
    actions
  end

  show do |review|
    attributes_table do
      row :movie
      row :user
      row :content
      row :report_count
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

end
