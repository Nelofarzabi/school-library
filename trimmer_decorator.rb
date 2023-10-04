require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    super.length > 10 ? "#{super[0, 10]}..." : super
  end
end
