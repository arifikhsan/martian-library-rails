# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    argument :email, String, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def check_authentication!
      return if context[:current_user]

      raise GraphQL::ExecutionError,
            'You need to authenticate to perform this action'
    end

    def resolve(email:)
      user = User.find_by!(email: email)
      return {} unless user

      token = Base64.encode64(user.email)
      {
        token: token,
        user: user
      }
    end
  end
end
