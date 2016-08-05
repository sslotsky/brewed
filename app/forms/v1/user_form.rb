class V1::UserForm < Form
  def initialize(params)
    @user = params.has_key?(:id) && User.find_by(id: params[:id]) || User.new
    super(params)
  end

  attribute :username, String
  attribute :email, String
  attribute :password, String
 
  def errors
    @user.errors
  end

  def valid?
    build
    @user.valid?
  end

  def build
    @user.username = self.username
    @user.email = self.email
    @user.password = self.password
  end

  def save!
    build
    @user.save!
    @user
  end
end