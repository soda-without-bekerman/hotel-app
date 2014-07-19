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
    timeStr = "#{hours}:#{minutes}"

    # новое значение
    $(".time").text timeStr        

  setTime()
  # вызываем setTime каждую секунду
  setInterval setTime, 1000


  $(".do-checkin").on "click", (e) ->

    navigator.geolocation.getCurrentPosition printPosition, errorFn, opts


# обработка координат
printPosition = (pos) ->
  console.log JSON.stringify pos, null, 2

# обработка ошибки
errorFn = (error) ->
  switch error.code
    when 1
      console.error "PERMISSION_DENIED"
    when 2
      console.error "POSITION_UNAVAILABLE"
    when 3
      console.error "TIMEOUT"

# опции
opts =
  enableHighAccuracy: yes     # включить высокую точность
  timeout: 5000               # миллисекунд
  maximumAge: 0               # время кеширования



# Прекратить отслеживание через 60 сек
setTimeout ( ->
  navigator.geolocation.clearWatch positionTimer 
  ), 60000

coords:
    accuracy: 25000            # погрешность (м)
    altitude: null             # высота (м)
    altitudeAccuracy: null     # погрешность высоты (м)
    heading: null              # отклонение от направления на север (град)
    latitude: 58.74023         # широта
    longitude: 41.391284       # долгота
    speed: null                # скорость перемещения (м/сек)
  timestamp: 137352000000      # время измерения