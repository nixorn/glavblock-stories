INCLUDE env.ink
INCLUDE logic.ink

-> entry_divert

== испившие_старт ==
Начало смены не задалось. Кто-то испоганил непонятными каракулями несколько герм на этаже.
*   - Мне плевать
    -> игнор_символов_на_гермах

*   - Ну так узнайте в чем дело!
    -> ликвидаторы_пошли_разнюхивать

== игнор_символов_на_гермах ==
    Ликвидатор медленно развернулся и вышел.
    -> END

== ликвидаторы_пошли_разнюхивать ==
    \- Вас понял!
    Майор взял под козырек, развернулся и вышел из кабинета.
    * [через некоторое время]
      -> допрос_культиста_начало

== допрос_культиста_начало ==
    \- Ля, кого поймал.
    Голос майора звучал из приемной. Майор был в раже. "Сука, сейчас мебель портить будет": - подумал ты. Дверь с грохотом распахнулась, в кабинет с пинка влетел мужичок лет сорока, впечатлся лбом в торец стола и рухнул мешком на пол. Майор вальяжно зашел следом. В приемной мелькали стеклами от противогазов еще два ликвидатора. Конвой.
    \- Вот кто гермы малевал.
    Ликвидатор подошел к бедняге и начал методично его пинать.
    \- Проснись - выродок сектантский - и блять пой.
    Мужик очнулся, застонал и начал медленно отползать в угол.
    * [Вопросительно посмотреть на ликвидатора]
      -> допрос_культиста_рассказ_майора
    * [- Вы не по форме зашли, майор. Перестаньте бить ... подозреваемого? ... у меня в кабинете.]
      -> допрос_культиста_осадить_вояку


== допрос_культиста_рассказ_майора ==
  \- Это вот этот слизень гермы разукрасил. Делаю обход, в коридор заворачиваю, а там он, кистью по герме возякает.
  Мужик зыркал изподлобья то на тебя то на майора. Вытирая разбитую губу рукавом.
  * Подойти к мужику и присесть перед ним: - Ты кто? Зовут как? Зачем на дверях рисуешь?
    -> допрос_культиста_хороший_полицейский
  * Ликвидировать. Вместе с семьей.
    -> допрос_культиста_жесткая_реакция

== допрос_культиста_осадить_вояку ==
   Майор осекся, его стойка стала более уставной. Взгляд, впрочем, остался охуевшим.
   \- Товарщ Глвблок! Нарушитель был задержан с поличным! Наносил на гермодвери оккультные символы. На первичном допросе верещал что он не культист. Все культисты так обычно говорят...
   * [Подойти к мужику и присесть перед ним: - Ты кто? Зачем на дверях рисуешь?]
     -> допрос_культиста_хороший_полицейский
   * [Ликвидировать. Вместе с семьей.]
     -> допрос_культиста_жесткая_реакция

== допрос_культиста_жесткая_реакция ==
   Майор коротко кивнул и пошел в сторону мужика. Мужик понял, что все. Сейчас конец ему. Потом конец его семье. Майор поднял его за засаленную куртку и потащил к выходу. Неожиданно дядька рванулся в твоем направлении, оставив куртку в руках ликвидатора. Два шага успел сделать, не больше. Майор привычным движением подсек его, повалил, выхватил пистолет и произвел выстрел. Ты вскочил из за стола.
   /- Ну, прощения, просить не буду. Сами понимаете, протокол...
   /- Понимаю - сказал ты после небольшой паузы.
   Два конвойных утащили труп. Командир вышел за ними. Ты устало опустился в кресло.
   /- Людочка, уберись тут пожалуйста. -  Из приемной послышалась возня секретарши.
   Впереди была еще куча бумажной работы.
   -> END

 == допрос_культиста_хороший_полицейский ==
   Микита Беломоров я. Сборщик монтажник. Цеховой. Не культист я, трщ главбок, я культистов давил, давлю, и давить буду. Если отсюдова выйду конечно. А гермы я слизью как раз культистам мазал, чтобы самосбор их забрал. Они же уроды пришли с последней волной. Батареи сверлют, воду из них пьют, и гимны свою поют, спать не дают...
   * [Это же самоуправство. Чего ты не донес, а сам полез разбираться?]
     -> рассказ_микиты


== рассказ_микиты ==
   Так я это, завсегда сам привык. Всем известно - если стучишь, тебя же первого и ликвидируют. Этот - кивая на майора - еще неплохой - он меня сюда притащил, иной бы и ликвидировал на месте сразу. Вы же того, говорите что я колдовство какое рисовал на гермодверях то, а я ж непристойности рисовал. Ну рисую то я плохо конечно, да и слизью не порисуешь, но уж болт то мог бы узнать...
   * [-Понятно. Оборачиваясь к майору - У себя его подержите пока.]
     Конвойные зашли и утащили мужлана
     -> END