class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessor :do_password_validation

  has_and_belongs_to_many :projects

  validates :username,   presence: true, length: { maximum: 50 }, format: { with: /[a-z]*\.[a-z]*/ }
  validates :first_name, presence: true, length: { maximum: 50 }, format: { with: /[a-zA-Z]/ }
  validates :last_name,  presence: true, length: { maximum: 50 }, format: { with: /[a-zA-Z]/ }
  validates :email,      presence: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 6 }, if: :do_password_validation
  validates :password_confirmation, presence: true, if: :do_password_validation
  validates :about,      length: { minimum: 500, maximum: 1000 }

  scope :active, -> { where deleted: false }
  scope :disabled, -> { where deleted: true }
  scope :by_project, -> (name) { joins(:projects).merge(Project.by_name name) }

  before_validation :user_correction
  before_save :send_goodbye_letter, if: :goodbye_reason_changed?

  def self.owner
    User.find_by(username: 'oleg.gorbunov')
  end

  def academy_user?
    projects.where(name: "Academy").exists?
  end

  def academy
    @academy ||= Service::Academy.new(self)
  end

  def send_goodbye_letter
    UserMailer.goodbye_reason(self).deliver_later
  end

  private

  def user_correction
    self.username   = (/[a-z]*\.[a-z]*/ =~ self.username) ? self.username : "#{self.username}.#{self.username}"
    self.first_name = 'Noname' if self.first_name.blank?
    self.last_name  = 'Noname' if self.last_name.blank?
  end
end
