module Types
  class UserType < Types::BaseObject
    field :id, Integer, null: false
    field :email, String, null: false
    field :full_name, String, null: false
    field :items, Types::ItemType, null: false

    def full_name
      [object.first_name, object.last_name].compact.join(' ')
    end

    def items
      object.items
    end
  end
end
