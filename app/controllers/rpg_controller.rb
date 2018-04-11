class RpgController < ApplicationController

  def index
    if session[:gold].nil?
      session[:gold] = 0
    end
    if session[:activities].nil?
      session[:activities] = []
    end
  end

  def farm
    gold = rand(10..20)
    gold_activities(gold, "farm")
    redirect_to '/'
  end

  def cave
    gold = rand(5..10)
    gold_activities(gold, "cave")
    redirect_to '/'
  end

  def house
    gold = rand(2..5)
    gold_activities(gold, "house")
    redirect_to '/'
  end

  def casino
    gold = rand(-50..50)
    gold = -1 * session[:gold] if gold + session[:gold] < 0
    gold_activities(gold, "casino")
    redirect_to '/'
  end
  
  def gold_activities(gold, building)
    session[:gold] += gold
    str_activity = "Earned #{gold} golds from the #{building}  #{Time.current.ctime}"
    str_activity = "Entered a casino and lost #{gold} ...Ouch  #{Time.current.ctime}" if gold <0
    session[:activities] += [{class: if gold <= 0 then "red" else "green" end, activity: str_activity}]
  end
end


