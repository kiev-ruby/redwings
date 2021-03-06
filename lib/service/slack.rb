module Service
  module Slack
    def self.sync
      slack_users = self.users

      slack_users.map do |slack_user|
        user = User.find_or_initialize_by(email: slack_user['email'])

        academy_project = Project.find_by(name: 'Academy')

        if user.new_record?
          user = User.create! slack_user.merge(password: 'redwings', password_confirmation: 'redwings', started_at: Time.now)
          user.projects << academy_project
        else
          user.attributes = slack_user
          user.finished_at = Time.now if user.deleted? && user.finished_at.nil?
          user.save!
        end
      end
    end

    private

    def self.users
      data = SlackApi::User.all

      members = data['members'].select {|u| u['profile']['email'].present? }

      users = members.map do |member|
        user = {}
        user['username'] =   member['name']
        user['first_name'] = member['profile']['first_name']
        user['last_name']  = member['profile']['last_name']
        user['image_48'] =   member['profile']['image_48']
        user['email'] =      member['profile']['email']
        user['deleted'] =    member['deleted']
        user['github'] =     member['profile']['title']
        user['mobile'] =     member['profile']['phone']
        user['skype'] =      member['profile']['skype']
        user['image_192'] =  member['profile']['image_192']
        user
      end

      users
    end
  end
end

