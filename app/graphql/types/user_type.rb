class Types::UserType < Types::BaseObject
  description "A User"

  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :street, String, null: true
  field :number, String, null: true
  field :postcode, String, null: true
  field :country, String, null: true

  field :created_at, String, null: false

  def created_at
    object.created_at.iso8601 # easily parsed by Javascript
  end

  field :address, String, null: true

  def address
    ([:street, :number, :postcode, :country].map do |a|
      object.send(a)&.strip
    end.compact - ['']).join(', ')
  end

  field :posts, [Types::PostType], null: true, description: "A user's posts"

end