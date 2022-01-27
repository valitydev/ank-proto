namespace java dev.vality.file.storage.base
namespace erlang file_storage_base

/**
 * Отметка во времени согласно RFC 3339.
 *
 * Строка должна содержать дату и время в UTC в следующем формате:
 * `2016-03-22T06:12:27Z`.
 */
typedef string Timestamp

/** Идентификатор объекта */
typedef string ID

enum Residence {
    ABH =   0  /*Abkhazia*/
    AUS =   1  /*Australia*/
    AUT =   2  /*Austria*/
    AZE =   3  /*Azerbaijan*/
    ALB =   4  /*Albania*/
    DZA =   5  /*Algeria*/
    ASM =   6  /*American Samoa*/
    AIA =   7  /*Anguilla*/
    AGO =   8  /*Angola*/
    AND =   9  /*Andorra*/
    ATA =  10  /*Antarctica*/
    ATG =  11  /*Antigua and Barbuda*/
    ARG =  12  /*Argentina*/
    ARM =  13  /*Armenia*/
    ABW =  14  /*Aruba*/
    AFG =  15  /*Afghanistan*/
    BHS =  16  /*Bahamas*/
    BGD =  17  /*Bangladesh*/
    BRB =  18  /*Barbados*/
    BHR =  19  /*Bahrain*/
    BLR =  20  /*Belarus*/
    BLZ =  21  /*Belize*/
    BEL =  22  /*Belgium*/
    BEN =  23  /*Benin*/
    BMU =  24  /*Bermuda*/
    BGR =  25  /*Bulgaria*/
    BOL =  26  /*Bolivia, plurinational state of*/
    BES =  27  /*Bonaire, Sint Eustatius and Saba*/
    BIH =  28  /*Bosnia and Herzegovina*/
    BWA =  29  /*Botswana*/
    BRA =  30  /*Brazil*/
    IOT =  31  /*British Indian Ocean Territory*/
    BRN =  32  /*Brunei Darussalam*/
    BFA =  33  /*Burkina Faso*/
    BDI =  34  /*Burundi*/
    BTN =  35  /*Bhutan*/
    VUT =  36  /*Vanuatu*/
    HUN =  37  /*Hungary*/
    VEN =  38  /*Venezuela*/
    VGB =  39  /*Virgin Islands, British*/
    VIR =  40  /*Virgin Islands, U.S.*/
    VNM =  41  /*Vietnam*/
    GAB =  42  /*Gabon*/
    HTI =  43  /*Haiti*/
    GUY =  44  /*Guyana*/
    GMB =  45  /*Gambia*/
    GHA =  46  /*Ghana*/
    GLP =  47  /*Guadeloupe*/
    GTM =  48  /*Guatemala*/
    GIN =  49  /*Guinea*/
    GNB =  50  /*Guinea-Bissau*/
    DEU =  51  /*Germany*/
    GGY =  52  /*Guernsey*/
    GIB =  53  /*Gibraltar*/
    HND =  54  /*Honduras*/
    HKG =  55  /*Hong Kong*/
    GRD =  56  /*Grenada*/
    GRL =  57  /*Greenland*/
    GRC =  58  /*Greece*/
    GEO =  59  /*Georgia*/
    GUM =  60  /*Guam*/
    DNK =  61  /*Denmark*/
    JEY =  62  /*Jersey*/
    DJI =  63  /*Djibouti*/
    DMA =  64  /*Dominica*/
    DOM =  65  /*Dominican Republic*/
    EGY =  66  /*Egypt*/
    ZMB =  67  /*Zambia*/
    ESH =  68  /*Western Sahara*/
    ZWE =  69  /*Zimbabwe*/
    ISR =  70  /*Israel*/
    IND =  71  /*India*/
    IDN =  72  /*Indonesia*/
    JOR =  73  /*Jordan*/
    IRQ =  74  /*Iraq*/
    IRN =  75  /*Iran, Islamic Republic of*/
    IRL =  76  /*Ireland*/
    ISL =  77  /*Iceland*/
    ESP =  78  /*Spain*/
    ITA =  79  /*Italy*/
    YEM =  80  /*Yemen*/
    CPV =  81  /*Cape Verde*/
    KAZ =  82  /*Kazakhstan*/
    KHM =  83  /*Cambodia*/
    CMR =  84  /*Cameroon*/
    CAN =  85  /*Canada*/
    QAT =  86  /*Qatar*/
    KEN =  87  /*Kenya*/
    CYP =  88  /*Cyprus*/
    KGZ =  89  /*Kyrgyzstan*/
    KIR =  90  /*Kiribati*/
    CHN =  91  /*China*/
    CCK =  92  /*Cocos (Keeling) Islands*/
    COL =  93  /*Colombia*/
    COM =  94  /*Comoros*/
    COG =  95  /*Congo*/
    COD =  96  /*Congo, Democratic Republic of the*/
    PRK =  97  /*Korea, Democratic People's republic of*/
    KOR =  98  /*Korea, Republic of*/
    CRI =  99  /*Costa Rica*/
    CIV = 100  /*Cote d'Ivoire*/
    CUB = 101  /*Cuba*/
    KWT = 102  /*Kuwait*/
    CUW = 103  /*Curaçao*/
    LAO = 104  /*Lao People's Democratic Republic*/
    LVA = 105  /*Latvia*/
    LSO = 106  /*Lesotho*/
    LBN = 107  /*Lebanon*/
    LBY = 108  /*Libyan Arab Jamahiriya*/
    LBR = 109  /*Liberia*/
    LIE = 110  /*Liechtenstein*/
    LTU = 111  /*Lithuania*/
    LUX = 112  /*Luxembourg*/
    MUS = 113  /*Mauritius*/
    MRT = 114  /*Mauritania*/
    MDG = 115  /*Madagascar*/
    MYT = 116  /*Mayotte*/
    MAC = 117  /*Macao*/
    MWI = 118  /*Malawi*/
    MYS = 119  /*Malaysia*/
    MLI = 120  /*Mali*/
    UMI = 121  /*United States Minor Outlying Islands*/
    MDV = 122  /*Maldives*/
    MLT = 123  /*Malta*/
    MAR = 124  /*Morocco*/
    MTQ = 125  /*Martinique*/
    MHL = 126  /*Marshall Islands*/
    MEX = 127  /*Mexico*/
    FSM = 128  /*Micronesia, Federated States of*/
    MOZ = 129  /*Mozambique*/
    MDA = 130  /*Moldova*/
    MCO = 131  /*Monaco*/
    MNG = 132  /*Mongolia*/
    MSR = 133  /*Montserrat*/
    MMR = 134  /*Burma*/
    NAM = 135  /*Namibia*/
    NRU = 136  /*Nauru*/
    NPL = 137  /*Nepal*/
    NER = 138  /*Niger*/
    NGA = 139  /*Nigeria*/
    NLD = 140  /*Netherlands*/
    NIC = 141  /*Nicaragua*/
    NIU = 142  /*Niue*/
    NZL = 143  /*New Zealand*/
    NCL = 144  /*New Caledonia*/
    NOR = 145  /*Norway*/
    ARE = 146  /*United Arab Emirates*/
    OMN = 147  /*Oman*/
    BVT = 148  /*Bouvet Island*/
    IMN = 149  /*Isle of Man*/
    NFK = 150  /*Norfolk Island*/
    CXR = 151  /*Christmas Island*/
    HMD = 152  /*Heard Island and McDonald Islands*/
    CYM = 153  /*Cayman Islands*/
    COK = 154  /*Cook Islands*/
    TCA = 155  /*Turks and Caicos Islands*/
    PAK = 156  /*Pakistan*/
    PLW = 157  /*Palau*/
    PSE = 158  /*Palestinian Territory, Occupied*/
    PAN = 159  /*Panama*/
    VAT = 160  /*Holy See (Vatican City State)*/
    PNG = 161  /*Papua New Guinea*/
    PRY = 162  /*Paraguay*/
    PER = 163  /*Peru*/
    PCN = 164  /*Pitcairn*/
    POL = 165  /*Poland*/
    PRT = 166  /*Portugal*/
    PRI = 167  /*Puerto Rico*/
    MKD = 168  /*Macedonia, The Former Yugoslav Republic Of*/
    REU = 169  /*Reunion*/
    RUS = 170  /*Russian Federation*/
    RWA = 171  /*Rwanda*/
    ROU = 172  /*Romania*/
    WSM = 173  /*Samoa*/
    SMR = 174  /*San Marino*/
    STP = 175  /*Sao Tome and Principe*/
    SAU = 176  /*Saudi Arabia*/
    SWZ = 177  /*Swaziland*/
    SHN = 178  /*Saint Helena, Ascension And Tristan Da Cunha*/
    MNP = 179  /*Northern Mariana Islands*/
    BLM = 180  /*Saint Barthélemy*/
    MAF = 181  /*Saint Martin (French Part)*/
    SEN = 182  /*Senegal*/
    VCT = 183  /*Saint Vincent and the Grenadines*/
    KNA = 184  /*Saint Kitts and Nevis*/
    LCA = 185  /*Saint Lucia*/
    SPM = 186  /*Saint Pierre and Miquelon*/
    SRB = 187  /*Serbia*/
    SYC = 188  /*Seychelles*/
    SGP = 189  /*Singapore*/
    SXM = 190  /*Sint Maarten*/
    SYR = 191  /*Syrian Arab Republic*/
    SVK = 192  /*Slovakia*/
    SVN = 193  /*Slovenia*/
    GBR = 194  /*United Kingdom*/
    USA = 195  /*United States*/
    SLB = 196  /*Solomon Islands*/
    SOM = 197  /*Somalia*/
    SDN = 198  /*Sudan*/
    SUR = 199  /*Suriname*/
    SLE = 200  /*Sierra Leone*/
    TJK = 201  /*Tajikistan*/
    THA = 202  /*Thailand*/
    TWN = 203  /*Taiwan, Province of China*/
    TZA = 204  /*Tanzania, United Republic Of*/
    TLS = 205  /*Timor-Leste*/
    TGO = 206  /*Togo*/
    TKL = 207  /*Tokelau*/
    TON = 208  /*Tonga*/
    TTO = 209  /*Trinidad and Tobago*/
    TUV = 210  /*Tuvalu*/
    TUN = 211  /*Tunisia*/
    TKM = 212  /*Turkmenistan*/
    TUR = 213  /*Turkey*/
    UGA = 214  /*Uganda*/
    UZB = 215  /*Uzbekistan*/
    UKR = 216  /*Ukraine*/
    WLF = 217  /*Wallis and Futuna*/
    URY = 218  /*Uruguay*/
    FRO = 219  /*Faroe Islands*/
    FJI = 220  /*Fiji*/
    PHL = 221  /*Philippines*/
    FIN = 222  /*Finland*/
    FLK = 223  /*Falkland Islands (Malvinas)*/
    FRA = 224  /*France*/
    GUF = 225  /*French Guiana*/
    PYF = 226  /*French Polynesia*/
    ATF = 227  /*French Southern Territories*/
    HRV = 228  /*Croatia*/
    CAF = 229  /*Central African Republic*/
    TCD = 230  /*Chad*/
    MNE = 231  /*Montenegro*/
    CZE = 232  /*Czech Republic*/
    CHL = 233  /*Chile*/
    CHE = 234  /*Switzerland*/
    SWE = 235  /*Sweden*/
    SJM = 236  /*Svalbard and Jan Mayen*/
    LKA = 237  /*Sri Lanka*/
    ECU = 238  /*Ecuador*/
    GNQ = 239  /*Equatorial Guinea*/
    ALA = 240  /*Aland Islands*/
    SLV = 241  /*El Salvador*/
    ERI = 242  /*Eritrea*/
    EST = 243  /*Estonia*/
    ETH = 244  /*Ethiopia*/
    ZAF = 245  /*South Africa*/
    SGS = 246  /*South Georgia and the South Sandwich Islands*/
    OST = 247  /*South Ossetia*/
    SSD = 248  /*South Sudan*/
    JAM = 249  /*Jamaica*/
    JPN = 250  /*Japan*/
}
