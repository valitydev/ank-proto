include "base.thrift"

namespace java dev.vality.questionary
namespace erlang questionary

/* Номер карты. */
typedef string CardNumber

/* Основной ОКВЭД */
typedef string OKVED

typedef string URL

/* СНИЛС */
typedef string SNILS

/* Контактная информация */
struct ContactInfo {
    1: optional string phone_number
    2: optional string email
}

union IdentityDocument {
    1: RussianDomesticPassport russian_domestic_password
}

struct RussianDomesticPassport {
    1: optional string series_number
    /* Наименование выдавшего паспорт органа */
    2: optional string issuer
    /* Код подразделения выдавшего паспорт органа */
    3: optional string issuer_code
    /* Дата выдачи паспорта */
    4: optional base.Timestamp issued_at
}

struct RussianPrivateEntity {
    /* ФИО */
    1: optional string fio
    /* Дата рождения */
    2: optional base.Timestamp birth_date
    /* Место рождения */
    3: optional string birth_place
    /* Гражданство */
    4: optional string citizenship
    /* Адрес места жительства */
    5: optional string residence_address
    /* Фактический адрес */
    6: optional string actual_address
    /* Контактная информация */
    7: optional ContactInfo contact_info
}

/* Сведения о принадлежности физического лица к некоторым категориям граждан */
struct IndividualPersonCategories {
    /* Является иностранным публичным должностным лицом */
    1: optional bool foreign_public_person
    /* Является родственником инностранного публичного должностного лица */
    2: optional bool foreign_relative_person
    /* Действует от имени иностранного лица */
    3: optional bool behalf_of_foreign
    /* Является должностным лицом публичной международной организации; лицом замещающим государственные должности */
    4: optional bool worldwide_org_public_person
    /* Имеется представитель клиента */
    5: optional bool has_representative
    /* Бенефициарным владельцем клиента является сам клиент */
    6: optional bool beneficial_owner
}

/* Сведения о миграционной карте */
struct MigrationCardInfo {
    1: optional CardNumber card_number
    /* Дата начала срока пребывания */
    2: optional base.Timestamp beginning_date
    /* Дата окончания срока пребывания */
    3: optional base.Timestamp expiration_date
}

/* Сведения о документе подтверждающем право пребывания в РФ */
struct ResidenceApprove {
    /* Наименования документа */
    1: optional string name
    2: optional string series
    3: optional string number
    /* Дата начала срока действия права пребывания (проживания) */
    4: optional base.Timestamp beginning_date
    /* Дата окончания срока действия права пребывания (проживания) */
    5: optional base.Timestamp expiration_date
}

union RegistrationInfo {
    1: IndividualRegistrationInfo individual_registration_info
    2: LegalRegistrationInfo legal_registration_info
}

/* Сведения о регистрации в качестве индивидуального предпринимателя */
struct IndividualRegistrationInfo {
    /* ОГРНИП */
    1: optional string ogrnip
    /* Дата регистрации */
    2: optional base.Timestamp registration_date
    /* Место государственной регистрации */
    3: optional string registration_place
}

/* Сведения о регистрации юридического лица */
struct LegalRegistrationInfo {
    /* ОГРН */
    1: optional string ogrn
    /* Дата государственной регистрации */
    2: optional base.Timestamp registration_date
    /* Место государственной регистрации */
    3: optional string registration_place
    /* Адрес регистрации юридического лица */
    4: optional string registration_address
    /* Фактический адрес */
    5: optional string actual_address
}

/* Сведения о лицензии на право осуществления деятельности */
struct LicenseInfo {
    1: optional string officialNum
    2: optional string issuerName
    3: optional base.Timestamp issue_date
    4: optional base.Timestamp effective_date
    5: optional base.Timestamp expiration_date
    /* Описание вида лицензируемой деятельности */
    6: optional string licensed_activity
}

struct ShopDetails {
    1: optional string name
    2: optional string description
}

union ShopLocation {
    1: URL url
}

struct ShopInfo {
    1: optional ShopLocation location
    2: optional ShopDetails details
}

/* Наличие в штате главного бухгалтера */
struct WithChiefAccountant {}

/* Бух. учет ведет руководитель организации */
struct HeadAccounting {}

/* Бух. учет ведет сторонняя организация */
struct AccountingOrganization {
    1: optional string inn
}

/* Бух. учет ведет индивидуальный специалист */
struct IndividualAccountant {}

union WithoutChiefAccountant {
    1: optional HeadAccounting head_accounting
    2: optional AccountingOrganization accounting_organization
    3: optional IndividualAccountant individual_accountant
}

union AccountantInfo {
    1: optional WithChiefAccountant with_chief_accountant
    2: optional WithoutChiefAccountant without_chief_accountant
}

/**
*  Сведения о целях установления и предполагаемом характере отношения с НКО,
*  сведения о целях финансово-хозяйственной деятельности индвидидуального предпринимателя,
*  деловая репутация
*/
struct AdditionalInfo {
    /* Штатная численность */
    1: optional i32 staff_count
    2: optional AccountantInfo accountant_info
    /* Цели установления деловых отношения с НКО */
    3: optional string NKO_relation_target
    /* Предполагаемый характер деловых отношений с НКО */
    4: optional string relationship_with_NKO
    5: optional MonthOperationCount month_operation_count
    6: optional MonthOperationSum month_operation_sum
    7: optional list<FinancialPosition> financial_position
    8: optional list<BusinessInfo> business_info
    /* Основные контагенты */
    9: optional string main_counterparties
    10: optional RelationIndividualEntity relation_individual_entity
    /* Действует ли к выгоде третьх лиц */
    11: optional bool benefit_third_parties
    12: optional BusinessReputation business_reputation
    13: optional BankAccount bank_account
    /* Наличие выгодопреобретателя */
    14: optional bool has_beneficiary
    /* Наличие решений о ликвидации или о любой процедуре, применяемой в деле о банкротстве */
    15: optional bool has_liquidation_process
}

/**
*  Представлены сведения (документа) о финансовом положении
*/
union FinancialPosition {
    1: AnnualFinancialStatements annual_financial_statements
    2: AnnualTaxReturnWithMark annual_tax_return_with_mark
    3: QuarterlyTaxReturnWithMark quarterly_tax_return_with_mark
    4: AnnualTaxReturnWithoutMark annual_tax_return_without_mark
    5: QuarterlyTaxReturnWithoutMark quarterly_tax_return_without_mark
    6: AnnualTaxReturnWithoutMarkPaper annual_tax_return_without_mark_paper
    7: StatementOfDuty statement_of_duty
    8: LetterOfGuarantee letter_of_guarantee
}

/* Копия годовой бухгалтерской отчетности */
struct AnnualFinancialStatements {}

/* Копия годовой налоговой декларации с отметками налогового органа об их принятии */
struct AnnualTaxReturnWithMark {}

/* Копия квартальной налоговой декларации с отметками налогового органа об их принятии */
struct QuarterlyTaxReturnWithMark {}

/**
* Копия годовой налоговой декларации без отметки налогового органа об их принятии
* с приложением копии квитанции об отправке заказного письма с описью вложения (при направлении по почте)
*/
struct AnnualTaxReturnWithoutMark {}

/**
* Копия квартальной налоговой декларации без отметки налогового органа об их принятии
* с приложением копии квитанции об отправке заказного письма с описью вложения (при направлении по почте)
*/
struct QuarterlyTaxReturnWithoutMark {}

/**
* Копия годовой налоговой декларации без отметки налогового органа об их принятии
* с приложением копии подтверждения отправки на бумажных носителях
*/
struct AnnualTaxReturnWithoutMarkPaper {}

/**
* Копия квартальной налоговой декларации без отметки налогового органа об их принятии
* с приложением копии подтвержденяия отправки на бумажных носителях
*/
struct QuarterlyTaxReturnWithoutMarkPaper {}

/**
* Cправка об исполнении налогоплательщиком обязанности по уплате налогов, сборов, пеней, штрафов, выданная налоговых органом
*/
struct StatementOfDuty {}

/* Гарантийное письмо о предоставлении документов */
struct LetterOfGuarantee {}

/* Сведения о предпренимательской деятельности */
union BusinessInfo {
    1: WholesaleTradeBusiness wholesale_trade_business
    2: RetailTradeBusiness retail_trade_business
    3: ProductionBusiness production_business
    4: BuildingBusiness building_business
    5: TransportBusiness transport_business
    6: SecuritiesTradingBusiness securities_trading_business
    7: MediationInPropertyBusiness mediation_in_property_business
    8: AnotherBusiness another_business
}

/* Оптовая торговля */
struct WholesaleTradeBusiness {}

/* Розничная торговля */
struct RetailTradeBusiness {}

/* Производство */
struct ProductionBusiness {}

/* Строительство */
struct BuildingBusiness {}

/* Осуществление перевозок */
struct TransportBusiness {}

/* Торговля ценными бумагами */
struct SecuritiesTradingBusiness {}

/* Посредническая деятельность в торговле недвижимостью */
struct MediationInPropertyBusiness {}

/* Торговля драгметаллами и драгоценными камнями */
struct PreciousMetalsAndStonesTrade {}

/* Торговля оружием и боевыми припасами */
struct WeaponsTrade {}

/* Другие виды  */
struct AnotherBusiness { 1: required string description }

/* Информация об иностранном налоговом резиденстве */
union ResidencyInfo {
    1: IndividualResidencyInfo individual_residency_info
    2: LegalResidencyInfo legal_residency_info
}

struct IndividualResidencyInfo {
    // Является ли налогоплательщиком / налоговым резидентом США
    1: optional bool usa_tax_resident
    // Является ли налогоплательщиком / налоговым иного иностранного государства
    2: optional bool except_usa_tax_resident
}

struct LegalResidencyInfo {
     // Является ли налоговым резидентом США или иного иностранного государства
     1: optional bool tax_resident
     // Является ли Бенефициарный владалей резидентом иностранного государства
     2: optional bool owner_resident
     // Является ли организация Финансовым Инсистутом в соответсвии с FATCA и 173-ФЗ
     3: optional bool fatca
}

/* Данные документа, подтверждающего полномичия */
struct AuthorityConfirmingDocument {
    1: optional string type
    2: optional string number
    3: optional base.Timestamp date
}

/* Сведения о единоличном исполнительном органе юридического лица */
struct LegalOwnerInfo {
    1: optional RussianPrivateEntity russian_private_entity
    2: optional string inn
    3: optional IdentityDocument identity_document
    4: optional MigrationCardInfo migration_card_info
    5: optional ResidenceApprove residence_approve
    6: optional bool pdl_category
    7: optional AuthorityConfirmingDocument authority_confirming_document
    8: optional SNILS snils
    /* Степень родства по отношению к ПДЛ*/
    9: optional string pdl_relation_degree
    // Срок полномочий
    10: optional string term_of_office
    11: optional string head_position
}

/* Бенефициарный владелец */
struct BeneficialOwner {
    1: optional i8 ownership_percentage
    2: optional RussianPrivateEntity russian_private_entity
    3: optional string inn
    4: optional IdentityDocument identity_document
    5: optional MigrationCardInfo migration_card_info
    6: optional ResidenceApprove residence_approve
    7: optional bool pdl_category
    8: optional SNILS snils
    /* Степень родства по отношению к ПДЛ*/
    9: optional string pdl_relation_degree
    10: optional ResidencyInfo residency_info
}

/* Деятельность осуществляемая организацией */
struct Activity {
    1: optional OKVED code
    2: optional string description
}

struct IndividualPerson {
    1: optional string fio
    2: optional string inn
}

/* Руководитель */
struct Head {
    1: optional IndividualPerson individual_person
    2: optional string position
}

struct RussianLegalEntityFounder {
    1: optional string inn
    2: optional string ogrn
    /* Полное наименование юридического лица */
    3: optional string fullName
}

struct InternationalLegalEntityFounder {
    1: optional string country
    /* Полное наименование юридического лица */
    2: optional string fullName
}

union Founder {
    1: IndividualPerson individual_person_founder
    2: RussianLegalEntityFounder russian_legal_entity_founder
    3: InternationalLegalEntityFounder international_legal_entity_founder
}

/* Сведения об учредителях */
struct FoundersInfo {
    1: optional list<Founder> founders
    2: optional list<Head> heads
    3: optional Head legal_owner
}

union BankAccount {
    1: RussianBankAccount        russian_bank_account
    2: InternationalBankAccount  international_bank_account
}

/* Банковский счёт. */
struct RussianBankAccount {
    1: optional string account
    2: optional string bank_name
    3: optional string bank_post_account
    4: optional string bank_bik
}

struct InternationalBankAccount {
    1: optional string                   number
    2: optional InternationalBankDetails bank
    3: optional InternationalBankAccount correspondent_account
    // International Bank Account Number (ISO 13616)
    4: optional string                   iban
    // we have `InternationalLegalEntity.legal_name` for that purpose
    5: optional string                   account_holder
}

struct InternationalBankDetails {
    // Business Identifier Code (ISO 9362)
    1: optional string         bic
    2: optional base.Residence country
    3: optional string         name
    4: optional string         address
    // ABA Routing Transit Number
    5: optional string         aba_rtn
}

/* В отношении индивидуального предпринимателя */
enum RelationIndividualEntity {
    /* Ведется производство по делу о несостоятельности */
    insolvency_proceedings
    /* Вступило в силу решение судебных органов о признании ее нестостоятельности */
    bankrupt_judicial_decision
    /* Проводится процедура ликвидации */
    liquidation_process
}

/* Планируемое кол-во операций в месяц */
enum MonthOperationCount {
    lt_ten // До 10
    btw_ten_to_fifty // Между 10-50
    gt_fifty // Свыше 50
}

/* Планируемая сумма операция в месяц */
enum MonthOperationSum {
    lt_five_hundred_thousand // До 500 000
    btw_five_hundred_thousand_to_one_million // Между 500 000 - 1 000 000
    gt_one_million // Свыше 1 000 000
}

/* Деловая репутация */
enum BusinessReputation {
    provide_reviews // Есть возможность предоставить отзыв
    no_reviews // Нет возможности предоставить отзыв
}

/* Договор аренды */
struct LeaseContract {}

/* Договор субаренды */
struct SubleaseContract {}

/* Свидетельство о праве собственности */
struct CertificateOfOwnership {}

/* Иное */
struct OtherPropertyInfoDocumentType {
    1: optional string name
}

/* Тип документа, подтверждающий право нахождения по фактическому адресу */
union PropertyInfoDocumentType {
    1: LeaseContract lease_contract
    2: SubleaseContract sublease_contract
    3: CertificateOfOwnership certificate_of_ownership
    4: OtherPropertyInfoDocumentType other_property_info_document_type
}

/* Анкета юридического лица, резидент РФ */
struct RussianLegalEntity {
    /* Наименование, фирменное наименование на русском языке */
    1: optional string name
    /* Наименование, фирменное наименование на иностранном языке */
    2: optional string foreign_name
    /* Организационно-правовая форма */
    3: optional string legal_form
    4: optional string inn
    5: optional RegistrationInfo registration_info
    /* Наличие дополнительных площадей */
    6: optional string additional_space
    /* код в соответствии с ОКАТО */
    8: optional string okato_code
    /* код в соответствии с ОКПО */
    9: optional string okpo_code
    10: optional string postal_address
    11: optional FoundersInfo founders_info
    12: optional LicenseInfo license_info
    13: optional Activity principal_activity
    14: optional LegalOwnerInfo legal_owner_info
    15: optional list<BeneficialOwner> beneficial_owners
    16: optional AdditionalInfo additional_info
    17: optional ResidencyInfo residency_info
    18: optional PropertyInfoDocumentType property_info_document_type
    19: optional bool has_beneficial_owners
}

struct InternationalLegalEntity {
    /* Наименование */
    1: optional string legal_name
    /* Торговое наименование (если применимо) */
    2: optional string trading_name
    /* Адрес места регистрации */
    3: optional string registered_address
    /* Адрес места нахождения (если отличается от регистрации)*/
    4: optional string actual_address
    /* Регистрационный номер */
    5: optional string registered_number
}

/* Анкета индивидуального предпринимателя, резидент РФ */
struct RussianIndividualEntity {
    1: optional RussianPrivateEntity russian_private_entity
    2: optional string inn
    3: optional IdentityDocument identity_document
    6: optional MigrationCardInfo migration_card_info
    7: optional ResidenceApprove residence_approve
    8: optional RegistrationInfo registration_info
    9: optional LicenseInfo license_info
    10: optional IndividualPersonCategories individual_person_categories
    11: optional Activity principal_activity
    12: optional AdditionalInfo additional_info
    13: optional ResidencyInfo residency_info
    14: optional SNILS snils
    15: optional PropertyInfoDocumentType property_info_document_type
    16: optional list<BeneficialOwner> beneficial_owners
    17: optional bool has_beneficial_owners
    18: optional bool pdl_category
    19: optional string pdl_relation_degree
    20: optional string name
}

union IndividualEntity {
    1: RussianIndividualEntity russian_individual_entity
}

union LegalEntity {
    1: RussianLegalEntity       russian_legal_entity
    2: InternationalLegalEntity international_legal_entity
}

union Contractor {
    1: IndividualEntity individual_entity
    2: LegalEntity legal_entity
}
