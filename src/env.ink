// Люди и отношения с ними
VAR CIVIL = 0 // люди без профессии
VAR LABOR = 0 // работяги
VAR MILITARY = 0 // ликвидаторы
VAR SCIENCISTS = 0 // ученые
VAR OUTLAWS = 0 // шелупонь

VAR MILITARY_FAVOR = 0 // насколько хорошо к тебе относятся ликвидвторы
VAR NII_FAVOR = 0 // насколько хорошо к тебе относятся ученые
VAR LABOR_FAVOR = 0 // насколько хорошо к тебе относятся рабочие
VAR OUTLAWS_FAVOR = 0 // насколько хорошо к тебе относятся преступники

VAR PARTY_FAVOR = 0 // насколько хорошо к тебе относится партия

// Характеристики колонии
VAR SPACE = 100 // безопасное помещение
VAR TECH_POWER = 0.0 // Сколько производственных мощностей имеется у блока
VAR SCI_LEVEL = 0.0 // Какой технологический уровень блока
VAR SERVICEABILITY = 1.0 // исправность систем. оборудования и экипировки.
// 1.0 и более - полный порядок

// Счетчики
VAR TURN = 0.0 // Сколько смен прошло
VAR SAMOSBOR_POWER = 1 // Сколько гемороя может доставить очередной самосбор
VAR SAMOSBOR_COUNTER = 0 // Сколько самосборов пережил блок
VAR CONCENTRAT = 1000 // запасы пищевого концентрата

// https://vk.com/samosbor_original?w=wall-166237605_32568
// TODO: генерируемые названия не соответствуют сюжетному назначению блока
=== function gen_block_name ===
  ~ return "{~БЖ|БП|БВ|БМ|БС}-{RANDOM(0, 9999)}"

