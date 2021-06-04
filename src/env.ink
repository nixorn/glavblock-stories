// Люди и отношения с ними
VAR PEOPLE = 0 // Всё население
VAR CIVIL = 0 // люди без профессии. дети, старики, лазарет, новички вот это все
VAR LABOR = 0 // работяги
VAR MILITARY = 0 // ликвидаторы
VAR SCIENCISTS = 0 // ученые
VAR OUTLAWS = 0 // бродяги


VAR PEOPLE_MOOD = 10 // насколько довольно население. Негативные значения обозначают насколько все плохо.
VAR HUNGER = 0 // Степень голода в блоке

VAR PARTY_FAVOR = 0 // насколько хорошо к тебе относится партия

// Характеристики колонии
VAR TECH_POWER = 0 // Сколько производственных мощностей имеется у блока
VAR SCI_LEVEL = 0.0 // Сколько исследований произведено в блоке
VAR SERVICEABILITY = 1.0 // исправность систем и оборудования.
// 1.0 и более - полный порядок
VAR EQUIPMENT_UNITS = 100 // Снаряжение. Если единиц снаряжения меньше чем людей - будут влетать штрафы.

// Счетчики
VAR TURN = 0 // Сколько смен прошло
VAR SAMOSBOR_MAX_POWER = 1.0 // Сколько гемороя может доставить очередной самосбор
VAR SAMOSBOR_PROB = 10 // Процент вероятности возникновения самосбора
VAR SAMOSBOR_COUNTER = 0 // Сколько самосборов пережил блок
VAR CONCENTRAT = 1000 // запасы пищевого концентрата

VAR ACTIONS = 0 // Механика ходов. Главблок может условно сделать ACTIONS_PER_TURN действия в одну смену.
VAR ACTIONS_PER_TURN = 4

// https://vk.com/samosbor_original?w=wall-166237605_32568
// TODO: генерируемые названия не соответствуют сюжетному назначению блока
=== function gen_block_name ===
  ~ return "{~БЖ|БП|БВ|БМ|БС}-{RANDOM(0, 9999)}"


// Временные переменные
VAR civil_died = 0
VAR labor_died = 0
VAR military_died = 0
VAR sciencists_died = 0
VAR outlaws_died = 0
VAR eqip_penalty = 0
VAR service_penalty = 0
VAR samosbor_damage = 0
