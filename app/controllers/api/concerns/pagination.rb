module Api
  module Concerns
    module Pagination
      def paginate(resource)
        return resource unless resource.respond_to?(:page)

        page = params.fetch(:page, 1).to_i
        per_page = params.fetch(:per_page, 10).to_i

        paginated = resource.page(page).per(per_page)
        meta = paginated_meta(paginated, per_page)

        [ paginated, meta ]
      end

      private

      def paginated_meta(paginated, per_page)
        {
          total: paginated.total_count,
          page: paginated.current_page,
          per_page: per_page,
          total_pages: paginated.total_pages
        }
      end
    end
  end
end
