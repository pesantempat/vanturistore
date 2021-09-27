class CustomerPolicy
    attr_reader :current_user, :model
  
    def initialize(current_user, model)
      @current_user = current_user
      @user = model
    end
  
    def index?
      @current_user.admin? or @current_user.mitra?
    end

    def show?
        @current_user.admin? or @current_user.mitra?
      end
    
      def edit?
        @current_user.admin? or @current_user.mitra?
      end

    def update?
        @current_user.admin? or @current_user.mitra?
    end
    
    def destroy?
        @current_user.admin? or @current_user.mitra?
    end
  end
  