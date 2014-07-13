$ ->
  #
  # setTime - меняет время каждую секунду
  #
  #
  setTime = ->
    curDate = new Date          # получить время
    
    # часы, минуты
    hours   = curDate.getHours()
    minutes = curDate.getMinutes()
    seconds = curDate.getSeconds()

    # добавление 0
    hours   = "0#{hours}"   if hours < 10
    minutes = "0#{minutes}" if minutes < 10
    seconds = "0#{seconds}" if seconds < 10
    timeStr = "#{hours}:#{minutes}:#{seconds}"

    # новое значение
    $(".time").text timeStr        

  setTime()
  # вызываем setTime каждую секунду
  setInterval setTime, 1000

  $(".do-checkin").on "click", (e) ->
    alert "checkin"
