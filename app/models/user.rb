class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
  validates :email, uniqueness: true
  has_many :comments
  # has_attached_file :avatar,
  #                 :styles => { :medium => "150x150>", :thumb => "44x44#>" },
  #                 :storage => :s3,
  #                 :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
  #                 :path => "avatars/:id/:style/avatar.:extension",
  #                 :default_url => "https://s3.amazonaws.com/<<BUCKET>>/defaults/default_avatar.png"
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  # def s3_credentials
  #   { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
  # end

end
