# Геолокация.

Сервисы геолокации используются для определения положения устройства на земле с помощью спутниковой системы навигации.

## Две основные системы спутниковой навигации: GPS и ГЛОНАСС.

- GPS (Global Positioning System) - система министерства обороны США (1974 г.), имеет открытый и закрытый API. Закрытый API имеет большую точность и применяется в военных целях. 

Для точного определения положения устройство должно поймать сигнал не менее чем от 3 спутников.


- ГЛОНАСС (Глобальная навигационная спутниковая система) - система министерства обороны СССР/России (1982 г.)

Для точного определения положения устройство должно поймать сигнал не менее чем от 4 спутников.


# Использование в web-приложениях

  web-приложения используют навигацию GPS.



  Получение положения устройства
  
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

    navigator.geolocation.getCurrentPosition printPosition, errorFn, opts
    
  Переодическое отслеживание положения устройства

    positionTimer = navigator.geolocation.watchPosition printPosition, errorFn, opts
    
    # Прекратить отслеживание через 60 сек
    setTimeout ( ->
      navigator.geolocation.clearWatch positionTimer 
        ), 60000

  
  
    
## Объект position
    
      coords:
        accuracy: 25000            # погрешность (м)
        altitude: null             # высота (м)
        altitudeAccuracy: null     # погрешность высоты (м)
        heading: null              # отклонение от направления на север (град)
        latitude: 58.74023         # широта
        longitude: 41.391284       # долгота
        speed: null                # скорость перемещения (м/сек)
      timestamp: 137352000000      # время измерения
      
      
 Свойства `coords.latitude`, `coords.longitude` и `coords.accuracy` всегда присутствуют, остальные могут отсутствовать. 
