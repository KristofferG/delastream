class CheckMatch

  def initialize()
  end

  def check_match(current_user, users)
    @current_user = current_user
    @users = users
    @matches = Set.new

    @current_user.have_list.packages.each do |cp|
      @users.each do | user |
        if user != current_user
          if !user.have_list.nil?
            user.have_list.packages.each do |up|
              if cp == up
                @matches.add(user)
              end
            end
          end
        end
      end
    end
    return @matches
  end
end
