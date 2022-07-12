# frozen_string_literal: true

# name: discourse-posts-members-only
# about: Show posts only to logged in users
# version: 0.0.2
# authors: Jay Pfaffman <ay@literatecomputing.com>
# url: https://github.com/literatecomputing/disourse-posts-members-only
# required_version: 2.7.0

enabled_site_setting :posts_members_only_enabled

after_initialize do
  class ::TopicsController
    module MyTopicShow
      def show
        ensure_logged_in
        super
      end
    end
    prepend MyTopicShow
  end

  class ::SearchController
    module MyTopicShow
      def show
        ensure_logged_in
        super
      end
    end
    prepend MyTopicShow
  end

end
