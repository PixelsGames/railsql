ActiveAdmin.register Variant do
  menu label: 'Варианты'

  menu false

  permit_params :lesson_id, :questions, question_ids: []

  index do
    selectable_column
    column :lesson
    actions
  end

  filter :lesson, label: 'Урок'
  filter :body,   label: 'Текст вопроса'

  controller do
    def new
      @variant = Variant.new(lesson: Lesson.find(params[:lesson].to_i))
    end
  end

  show do
    attributes_table do
      row :lesson
      row 'Вопросы' do |variant|
        variant.questions.size
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :lesson_id, as: :hidden, value: params[:lesson]
      f.input :questions, label: 'Выберите 25 вопросов для теста',
              html: { class: 'kotak' },
              as: :select,
              multiple: true,
              collection: Question.where(lesson_id: resource.lesson_id).all.map{ |x| [ x.body, x.id] },
              input_html: { class: 'multiple-select' }
    end
    f.actions
  end
end
