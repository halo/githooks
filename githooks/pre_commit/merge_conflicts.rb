module Githooks
  module PreCommit
    class MergeConflicts

      def call
        die if conflicts?
      end

      def die
        puts
        puts 'Detected merge conflicts.'
        puts
        puts modified_files_with_conflicts
        puts
        abort
      end

      private

      def modified_files
        `git diff --cached --diff-filter=M --name-only`.tr("\n", ' ')
      end

      def modified_files_with_conflicts
        files = modified_files
        files.empty? ? '' : `egrep -ls "^<<<<<<< |^>>>>>>> |^=======$" #{files}`
      end

      def conflicts?
        modified_files_with_conflicts != ''
      end

    end
  end
end
