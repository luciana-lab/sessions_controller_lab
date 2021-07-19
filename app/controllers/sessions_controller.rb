class SessionsController < ApplicationController
    def new
    end

    # redirects to the login page if :name is nil
    # redirects to login page if :name is empty
    # sets session[:name] if :name was given
    # redirects to "/" if logged in
    def create
        # look up a user in the database, 
        # verify their login credentials, 
        # and then store the authenticated user's id in the session.
        session[:name] = params[:name]
        if session[:name].nil? || session[:name].blank?
            redirect_to login_path
        else
            redirect_to '/'
        end
    end

    # clear the user out of the session.
    def destroy
        session.delete :name
    end
end