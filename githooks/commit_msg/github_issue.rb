module Githooks
  module CommitMsg
    class GithubIssue
      def call
        die if only_issue_number?
      end

      def die
        puts 'Aborting commit due to empty commit message.'
        abort
      end

      def only_issue_number?
        !message.match(/[a-zA-Z]/)
      end

      def message
        File.read(path).split("\n").first.to_s
      end

      def path
        ARGV[0]
      end
    end
  end
end
