require_relative 'app'

def main
  app = App.new
  app.print_welcome_message
  app.start
end

main
