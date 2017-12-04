ActiveAdmin.register User do
  menu label: 'Пользователи'
  permit_params :email, :password, :phone, :name, :surname,
                :password_confirmation, :city_id, :school_id


  index do
    selectable_column
    id_column
    column :email
    column :created_at
    column :city
    column :school
    actions
  end

  show do
    attributes_table do
      row :name
      row :surname
      row :role
      row :phone
      row :email
      row :created_at
      row :current_sign_in_at
      row :last_sign_in_at
      row :city
      row :school
      row 'Законченные тесты' do |user|
        user.test_results.count
      end
      row 'Максимальный бал (из 125)' do |user|
        AnswerStatistics.all_scores(user).max
      end
      row 'Минимальный бал (из 125)' do |user|
        AnswerStatistics.all_scores(user).min
      end
    end
  end

  filter :email
  filter :city
  filter :school

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :surname
      f.input :password
      f.input :password_confirmation
      f.input :city
      f.input :school
    end
    f.actions
  end

end
