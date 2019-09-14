module Mutations
  class UpdateItemMutation < Mutations::BaseMutation
    argument :attributes, Types::ItemAttributes, required: true
     
    argument :id, Integer, required: true

    field :item, Types::ItemType, null: true
    field :errors, [String], null: false

    def resolve(
      id:, title:, description: nil, image_url: nil)
      check_authentication!
      item = Item.find(id)

      if item.update(attributes)
        { item: item }
      else
        { errors: item.errors }
      end
    end
  end
end
