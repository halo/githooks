module Githooks
  module CommitMsg
    class GithubIssue

      def call
        die if only_github_issue?
      end

      def die
        puts 'Aborting commit due to empty commit message.'
        abort
      end

      def only_github_issue?
        message.match(/\s*#\d+\s*/)
      end

      def message
        File.read(path)
      end

      def path
        ARGV[0]
      end

    end
  end
end
