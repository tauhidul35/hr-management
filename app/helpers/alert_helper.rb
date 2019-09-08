module AlertHelper
  def display_error_of(object)
    return '' unless object.errors.present?

    <<-HTML
    <div class="alert alert-error" data-turbolinks="false">
      <ul>
        #{object.errors.full_messages.join { |message| "<li>#{message}</li>" }}
      </ul>
    </div>
    HTML
  end
end
