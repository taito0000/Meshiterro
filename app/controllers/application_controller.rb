class ApplicationController < ActionController::Base
    before_action :authenticate_user!,expect: [:top]
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resource)
        post_images_path
    end
    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
    
end

Refile.secret_key = '5ca928fdd87fa83883107f0aa7d0a460f91f7e48007a777ebcf728a9478da3bf1b93500f3efcda7d2240487b5f991e5d67ef1e55e8dc446ec1ccb2435235714e'