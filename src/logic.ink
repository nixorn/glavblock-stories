== entry_divert ==
  {RANDOM(1, 4):
  - 1: -> start_as_military
  - 2: -> start_as_sciencist
  - 3: -> start_as_labor
  - 4: -> start_as_outlaw
  }

== start_as_military ==
    Вы начинаете как глава блокпоста.
    {start_as_military_env()}
    -> next_event

== function start_as_military_env() ==
  ~MILITARY_FAVOR = 10
  ~PARTY_FAVOR = 10
  ~MILITARY = 50
  ~LABOR = 50

== start_as_sciencist ==
    Вы начинаете как руководитель научной экспедиции.
    {start_as_sciencist_env()}
    -> next_event

== function start_as_sciencist_env() ==
    ~NII_FAVOR = 10
    ~PARTY_FAVOR = 10
    ~MILITARY = 20
    ~LABOR = 40
    ~SCIENCISTS = 40
    ~SCI_LEVEL = 10

== start_as_labor ==
    Вы начинаете как начальник новой партийной стройки.
    {start_as_labor_env()}
    -> next_event

== function start_as_labor_env() ==
    ~LABOR_FAVOR = 10
    ~PARTY_FAVOR = 10
    ~MILITARY = 20
    ~LABOR = 70
    ~SCIENCISTS = 10

== start_as_outlaw ==
    Вы начинаете как главарь маргиналов.
    {start_as_outlaw_env()}
    -> next_event

== function start_as_outlaw_env() ==
    ~OUTLAWS_FAVOR = 20
    ~PARTY_FAVOR = -10
    ~MILITARY = 10
    ~LABOR = 10
    ~SCIENCISTS = 10
    ~OUTLAWS=70

== next_event ==
  + Конец
    # RESTART
    -> END
