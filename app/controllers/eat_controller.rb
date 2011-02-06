class EatController < ApplicationController

  #http://blog.redistogo.com/2010/07/26/resque-with-redis-to-go/
  
  def food
    Resque.enqueue(Eat, params[:food])
    render :text => "Put #{params[:food]} in fridge to eat later."
  end

end
