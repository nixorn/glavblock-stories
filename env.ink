VAR CIVIL = 0 // работяги
VAR LIKVIDATORS = 0 // ликвидаторы
VAR SCIENCISTS = 0 // ученые
VAR STALKERS = 0 // мусорщики/марадеры
VAR SPACE = 0 // сколько есть помещения, закрытого гермами
VAR PARTY_FAVOR = 0 // насколько хорошо к тебе относится партия
VAR NII_FAVOR = 0 // насколько хорошо к тебе относятся ученые
VAR SAMOSBOR_PROB = 0.05 // Вероятность прихода самосбора
VAR SAMOSBOR_POWER = 1 // Сколько гемороя может доставить очередной самосбор
VAR CONCENTRAT = 1000 // запасы пищевого концентрата


== function init_env ==
    init_shared_env
    
    
    
== function init_shared_env ==
    ~return 1
    
    
== function military_env ==
    ~return 1

== function science_env ==
    ~return 1

== function proletary_env ==
    ~return 1