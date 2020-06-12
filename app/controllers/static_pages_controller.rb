class StaticPagesController < ApplicationController

  $status = 0 
  def home
    Time.zone = Timezone.first.city
    @standard = Time.zone.now

    @timezones = Timezone.all

    @timezones.each do |timezone|
      if timezone.offset < 0
        offset = timezone.offset * -1;
        @time = offset.hours.ago;
      else
        @time = timezone.offset.hours.from_now;
      end

      if @time.day<@standard.day
        day = "yesterday"
      elsif @time.day == @standard.day
        day = "today"
      else 
        day = "tomorrow"
      end


      if @time.hour>=9 && @time.hour<=17
        mode = "Business time"
      elsif @time.hour>=18 && @time.hour<=19
        mode = "Business overtime"
      elsif @time.hour==8
        mode = "Person time"
      elsif @time.hour>=20 && @time.hour<=22
        mode = "Person time"
      else
        mode = "Sleeping time"
      end
      
      if $status == 1
        if @time.hour>=12
          pmtime= @time.hour
          pmtime = pmtime -12
          hour = pmtime.to_s
          min = @time.min.to_s
          time = hour+":"+min+" PM"
        else
          hour = @time.hour.to_s
          min = @time.min.to_s
          time = hour+":"+min+" AM"
        end
      else
        hour = @time.hour.to_s
        min = @time.min.to_s
        time = hour+":"+min
      end
      
      timezone.update_attributes(time:time, day:day, mode:mode)
    end
  end

  def changeState
    if $status == 1
      $status = 0
    else
      $status = 1
    end
    redirect_to root_url
  end
end
