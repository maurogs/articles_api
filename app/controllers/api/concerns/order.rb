module Api
  module Concerns
    module Order
      def order(resource)
        return resource unless params[:sort]
        return resource unless resource.respond_to?(:reorder)

        resource.reorder("#{params[:sort]} #{params[:order]}")
      end
    end
  end
end
