ActiveAdmin.register Order do
  menu label: 'Заявки'
  config.sort_order = 'processed_asc'

  actions :all, :except => [:edit, :new]

  permit_params :processed

  index do
    selectable_column
    column :guest_name
    column :email
    column :message
    column :created_at
    column :processed
    column 'Обработать' do |order|
      link_to 'Обработать', hello_admin_order_path(order), method: :post
    end
    actions
  end

  member_action :hello, method: :post do
    resource.processed = true
    text = resource.save ? 'Обновлено' : 'Не удалось обновить'
    redirect_to admin_orders_path, notice: text
  end

  form do |f|
    f.inputs do
      f.input :processed
    end

    f.actions
  end
end
