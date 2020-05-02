module Githooks
  module PreCommit
    class AuthorName
      def call
        die unless username_configured?
      end

      def die
        puts
        puts 'Please configure a git username.'
        puts
        abort
      end

      def username_configured?
        `git config --get-all user.name`.chomp != ''
      end
    end
  end
end
