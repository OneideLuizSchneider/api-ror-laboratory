class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birtdate
  
  belongs_to :kind
  has_many :phones
  has_one :address
  
  
  def attributes(*arqs)
    h = super(*arqs)
    h[:birtdate] = I18n.l(object.birtdate) unless object.birtdate.blank?
    h
  end
end
