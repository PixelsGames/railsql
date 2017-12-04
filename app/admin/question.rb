ActiveAdmin.register Question do
  menu label: 'Вопросы'

  permit_params :body, :basic,
                :lesson_id, choices_attributes: %i[id body correct]

  index do
    selectable_column
    column :body
    column :lesson
    column 'Варианты' do |question|
      letter = 'a'
      question.choices.each do |answer|
        class_name = answer.correct? ? 'question-choice__correct' : ''
        div "#{letter}. #{answer.body}", class: class_name
        letter.next!
      end
      nil
    end
    actions
  end

  filter :lesson, label: 'Урок'
  filter :body,   label: 'Текст вопроса'

  show do
    attributes_table do
      row :lesson
      row :body
      row :choices do |question|
        letter = 'a'
        question.choices.each do |answer|
          class_name = answer.correct? ? 'question-choice__correct' : ''
          div "#{letter}. #{answer.body}", class: class_name
          letter.next!
        end
        nil
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :body
      f.input :lesson, include_blank: false
    end

    f.has_many :choices do |choice|
      choice.inputs 'Вариант' do
        choice.input :body, label: 'Текст ответа'
        choice.input :correct, label: 'Правильный'
      end
    end

    f.actions
  end
end
