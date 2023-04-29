ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :title, :body, :user_id, :image
   
   index do
    column :id
    column :title
    column :created_at
    column :updated_at
  end
  
  sidebar "Статистика", only: [:index] do
    ul do
      li "Количество постов: #{Post.count}"
      li "Последний пост создан #{time_ago_in_words(Post.last.created_at)} назад"
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
