ActiveAdmin.register Lesson do
  menu label: 'Предметы'
  permit_params :name, :basic

  index do
    selectable_column
    column :name
    column 'Обязательный', :basic
    column 'Вариант' do |lesson|
      link_to 'Добавить вариант', new_admin_variant_path(lesson: lesson)
    end
    actions
  end

  show do
    attributes_table do
      row :name, label: 'Название'
      row :basic, label: 'Базовый'
      row :questions, label: 'Варианты' do |lesson|
        lesson.variants.each do |variant|
          links = ''.html_safe
          links = link_to "Вариант №#{variant.id}", admin_variant_path(variant)
          links += ' | '
          links += link_to 'Редактировать', edit_admin_variant_path(variant)
          links += ' | '
          links += link_to 'Удалить', admin_variant_path(variant), method: :delete
          div links
        end
        nil
      end
    end
  end

  filter :basic, label: 'Обязательный'
  filter :name, label: 'Название'
end
