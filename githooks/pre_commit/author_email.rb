module Githooks
  module PreCommit
    class AuthorEmail

      def call
        die unless email_configured?
      end

      def die
        puts
        puts 'Please configure a git email.'
        puts
        abort
      end

      def email_configured?
        `git config --get-all user.email`.chomp != ''
      end

    end
  end
end
