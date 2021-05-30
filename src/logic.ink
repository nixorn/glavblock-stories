=== entry_divert ===
  {RANDOM(1, 4):
  - 1: -> start_as_military
  - 2: -> start_as_sciencist
  - 3: -> start_as_labor
  - 4: -> start_as_outlaw
  }

=== start_as_military ===
  Ты ответил "-Есть!".
  Ну а что ты еще мог ответить? Ничего.
  Партии нужен блокпост в этом Чернобогом забытом секторе.
  {start_as_military_env()}
  * Значит, здесь будет блокпост! -> next_event

=== function start_as_military_env ===
  ~PARTY_FAVOR = 10
  ~MILITARY = 50
  ~LABOR = 50

=== start_as_sciencist ===
  ...исследовать уникальные местные виды слизи и плесени! Нигде в Гигастроении таких нет! Нигде, понимаете?
  \- Профессор, но ведь каждый самосбор оставляет уникальные образцы...
  \- Так, молодой человек, мне решительно надоело с Вами препинаться. Вы идете туда. В качестве руководителя экспедиции. <>
  Разговор - окончен. Где дверь - знаете. Идите, собирайте манатки.

  Два дня на лифте, прорыв с боем через заброшенный блок с последствиями самосбора, еще день на лифте - и вот вы на месте.<>
  Бюррократия, отчеты, и работа с людьми - вот твое будущее. Разве не об этом ты мечтал?
  {start_as_sciencist_env()}
  * Нутис, приступим... -> next_event

=== function start_as_sciencist_env ===
  ~PARTY_FAVOR = 10
  ~MILITARY = 20
  ~LABOR = 40
  ~SCIENCISTS = 40
  ~SCI_LEVEL = 10

=== start_as_labor ===
  "...Прошу направить меня на освоение новых территорий в <>
  качестве руководителя Партийного строительства...."
  Ты представил как этот жирный урод накладывает резолюцию. <>
  Улыбался, поди. Ну что же, все честно, партийную подковерную борьбу ты проиграл. <>
  Главблоком в ебенях - лучше чем в шахте лифта с пулей в черепе. <>
  Теперь будешь строить коммунизм с пачкой некомпетентных оборванцев - на земле, а он <>
  будет плевать тебе на плеш с высоты своего теплого кресла.
  {start_as_labor_env()}
  * Ладно, еще повоюем... -> next_event

=== function start_as_labor_env ===
  ~PARTY_FAVOR = 10
  ~MILITARY = 20
  ~LABOR = 70
  ~SCIENCISTS = 10

=== start_as_outlaw ===
  \- Да на мне весь твой блок держится! До меня порядка - не было!
  \- Забирай свою шелупонь и проваливай. Тебе тут жизни не будет.
  \- Значит как прибыль с говняка делить - так это я братан, а как жопу мою прикрыть так... Вот она значит какая, благодарность Партии, да?
  \- Партия благодарна не бывает, она только требует. А моя благодарность тебе в том, что свалить даю. Живым. Сюда придет большой ликвидаторский корпус, сам знаешь что с тобой и твоюми людьми будет в первую же смену.
  \- Заливай, заливай... Ну ладно, "братан", сочтемся. Пойду я пожалуй.
  \- Скатертью дорога.

  Вся ватага снялась за два часа и ушла в глубину Гигахруща. <>
  Партийные точно будут не рады, когда вы замаячите в коридорах в следующий раз.
  {start_as_outlaw_env()}
  * Партийных на грабли! -> next_event

=== function start_as_outlaw_env ===
  ~PARTY_FAVOR = -10
  ~MILITARY = 10
  ~LABOR = 10
  ~SCIENCISTS = 10
  ~OUTLAWS=70
  ~SERVICEABILITY=0.7

=== люди_закончились ===
  Скоро в этом блоке перегорит последняя лампочка - а заменить будет некому.
  Возможно, этот блок больше никогда не увидит живых людей.
  -> END

=== function выдать_концентрат ===
  ~ CONCENTRAT -= CIVIL
  ~ CONCENTRAT -= LABOR
  ~ CONCENTRAT -= MILITARY
  ~ CONCENTRAT -= SCIENCISTS
  ~ CONCENTRAT -= OUTLAWS
  { CONCENTRAT < 0:
    ~ CONCENTRAT = 0
    ~ HUNGER++
  - else:
    ~ HUNGER = 0
  }

=== function голод ===
  {
    - HUNGER <= 0:
      ~ HUNGER  = HUNGER // TODO: найти способ получше не делать ничего
    - HUNGER <= 10:
      ~ PEOPLE_MOOD -= 1
    - HUNGER <= 20:
      ~ PEOPLE_MOOD -= 2
      ~ civil_died += RANDOM(0,1)
      ~ CIVIL -= civil_died
      labor_died += RANDOM(0,1)
      ~ LABOR -= labor_died
      ~ military_died += RANDOM(0,1)
      ~ MILITARY -= military_died
      ~ sciencists_died += RANDOM(0,1)
      ~ SCIENCISTS -= sciencists_died
      ~ outlaws_died += RANDOM(0,1)
      ~ OUTLAWS -= outlaws_died
  }

=== next_turn ===
  ~ TURN += 1
  В блоке началась новая смена.
  {- civil_died > 0 && CIVIL >= civil_died: "Погибло {civil_died} безработных."}
  ~civil_died = 0
  {- labor_died > 0: "Погибло {labor_died} рабочих."}
  ~labor_died = 0
  {- military_died > 0: "Погибло {military_died} рабочих."}
  ~military_died = 0
  {- sciencists_died > 0: "Погибло {sciencists_died} ученых."}
  ~sciencists_died = 0
  {- outlaws_died > 0: "Погибло {outlaws_died} безработных."}
  ~outlaws_died = 0

  ~выдать_концентрат()
  ~голод()
  -> next_event

=== next_event ===
  Счетчик событий {ACTIONS}
  { - CIVIL <= 0 && LABOR <= 0 && MILITARY <= 0 && SCIENCISTS <= 0 && OUTLAWS <= 0:
      -> люди_закончились
  }
  ~ ACTIONS += 1
  {
    - ACTIONS > 4:
      ~ ACTIONS = 0
      -> next_turn
  }
  + Проверить производство -> next_event
  + Прогуляться по блоку -> next_event

