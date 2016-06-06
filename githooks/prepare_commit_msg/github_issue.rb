module Githooks
  module PrepareCommitMsg
    class GithubIssue

      def call
        return unless normal_commit?
        return unless feature_branch
        return if already_referenced?
        add_github_reference
      end

      private

      # ARGV[1] will be 'merge' or 'squash' on merges and squashes
      # or: 'my message' in case of commit -m "my message"
      def normal_commit?
        !ARGV[1] || ARGV[1] == 'message'
      end

      def branch_name
        `git rev-parse --abbrev-ref HEAD`.chomp
      end

      def feature_branch
        branch_name.match(/(\d+)-.*/i)
      end

      def issue_id
        return unless feature_branch
        feature_branch.captures.first
      end

      def message_suffix
        " ##{issue_id}"
      end

      def current_message
        File.read path
      end

      def already_referenced?
        current_message.include? message_suffix
      end

      def amended_message
        message_suffix + current_message
      end

      def add_github_reference
        new_content = amended_message
        File.open(path, 'w') { |f| f.write(new_content) }
      end

      def path
        ARGV[0]
      end

    end
  end
end
