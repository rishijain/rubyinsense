class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  field :statement, type: String

  belongs_to :user
  has_many :answers
  has_many :comments

  validates :statement, :presence => true
  
  def question_posted?(current_user)
    user == current_user
  end
end
