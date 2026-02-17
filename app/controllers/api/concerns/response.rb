module Api
  module Concerns
    module Response
      include ::Api::Concerns::Order
      include ::Api::Concerns::Pagination

      def render_serialized_json(resource, status: :ok)
        return head :no_content if resource.blank?

        ordered_resource = order(resource)
        paginated, meta = paginate(ordered_resource)

        klass = resource.respond_to?(:each) ? resource.first.class : resource.class
        serializer = "#{klass}Serializer".constantize

        render json: serializer.new(paginated, meta: meta).serializable_hash, status: status
      end

      def render_json_errors(errors, status = 400)
        render plain: { errors: Array.wrap(errors) }.to_json,
               content_type: "application/json", status: status
      end
    end
  end
end
