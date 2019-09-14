module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :items, [Types::ItemType], null: false, description: 'Returns a list of items in the martian library'

    def items
      Item.all
    end
      
    field :users,
      [Types::UserType],
      null: false,
      description: "Returns a list of users in the martian library"

    def users
      User.all
    end

    field :me, Types::UserType, null: true, description: "Returns a user"

    def me
      context[:current_user]
    end

    field :apa, String, description: "apa aja"
  end
end
