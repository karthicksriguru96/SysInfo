﻿Function Get-Layout {
    param ([String] $Code)

    if ($Code -ne ''){

        Switch ($Code){
            '0000041c' {'Albanian'}
            '00000401' {'Arabic (101)'}
            '00010401' {'Arabic (102)'}
            '00020401' {'Arabic (102) AZERTY'}
            '0000042b' {'Armenian Eastern'}
            '0002042b' {'Armenian Phonetic'}
            '0003042b' {'Armenian Typewriter'}
            '0001042b' {'Armenian Western'}
            '0000044d' {'Assamese - Inscript'}
            '0001042c' {'Azerbaijani (Standard)'}
            '0000082c' {'Azerbaijani Cyrillic'}
            '0000042c' {'Azerbaijani Latin'}
            '0000046d' {'Bashkir'}
            '00000423' {'Belarusian'}
            '0001080c' {'Belgian (Comma)'}
            '00000813' {'Belgian (Period)'}
	        '0000080c' {'Belgian French'}
	        '00000445' {'Bangla (Bangladesh)'}
	        '00020445' {'Bangla (India)'}
	        '00010445' {'Bangla (India - Legacy)'}
	        '0000201a' {'Bosnian (Cyrillic)'}
	        '000b0c00' {'Buginese'}
	        '0030402' {'Bulgarian'}
	        '00010402' {'Bulgarian (Latin)'}
	        '00020402' {'Bulgarian (phonetic layout)'}
	        '00040402' {'Bulgarian (phonetic traditional)'}
	        '00000402' {'Bulgarian (Typewriter)'}
	        '00001009' {'Canadian French'}
	        '00000c0c' {'Canadian French (Legacy)'}
	        '00011009' {'Canadian Multilingual Standard'}
            '0000085f' {'Central Atlas Tamazight'}
            '00000429' {'Central Kurdish'}
            '0000045c' {'Cherokee Nation'}
            '0001045c' {'Cherokee Nation Phonetic'}
            '00000804' {'Chinese (Simplified) - US Keyboard'}
            '00000404' {'Chinese (Traditional) - US Keyboard'}
            '00000c04' {'Chinese (Traditional, Hong Kong S.A.R.)'}
            '00001404' {'Chinese (Traditional Macao S.A.R.) US Keyboard'}
            '00001004' {'Chinese (Simplified, Singapore) - US keyboard'}
            '0000041a' {'Croatian'}
            '00000405' {'Czech'}
            '00010405' {'Czech (QWERTY)'}
            '00020405' {'Czech Programmers'}
            '00000406' {'Danish'}
            '00000439' {'Devanagari-INSCRIPT'}
            '00000465' {'Divehi Phonetic'}
            '00010465' {'Divehi Typewriter'}
            '00000413' {'Dutch'}
            '00000C51' {'Dzongkha'}
            '00000425' {'Estonian'}
            '00000438' {'Faeroese'}
            '0000040b' {'Finnish'}
            '0001083b' {'Finnish with Sami'}
            '0000040c' {'French'}
            '00120c00' {'Futhark'}
            '00000437' {'Georgian'}
            '00020437' {'Georgian (Ergonomic)'}
            '00010437' {'Georgian (QWERTY)'}
            '00030437' {'Georgian Ministry of Education and Science Schools'}
            '00040437' {'Georgian (Old Alphabets)'}
            '00000407' {'German'}
            '00010407' {'German (IBM)'}
            '000c0c00' {'Gothic'}
            '00000408' {'Greek'}
            '00010408' {'Greek (220)'}
            '00030408' {'Greek (220) Latin'}
            '00020408' {'Greek (319)'}
            '00040408' {'Greek (319) Latin'}
            '00050408' {'Greek Latin'}
            '00060408' {'Greek Polytonic'}
            '0000046f' {'Greenlandic'}
            '00000474' {'Guarani'}
            '00000447' {'Gujarati'}
            '00000468' {'Hausa'}
            '0000040d' {'Hebrew'}
            '00010439' {'Hindi Traditional'}
            '0000040e' {'Hungarian'}
            '0001040e' {'Hungarian 101-key'}
            '0000040f' {'Icelandic'}
            '00000470' {'Igbo'}
            '000004009' {'India'}
            '0000085d' {'Inuktitut - Latin'}
            '0001045d' {'Inuktitut - Naqittaut'}
            '00001809' {'Irish'}
            '00000410' {'Italian'}
            '00010410' {'Italian (142)'}
            '00000411' {'Japanese'}
            '00110c00' {'Javanese'}
            '0000044b' {'Kannada'}
            '0000043f' {'Kazakh'}
            '00000453' {'Khmer'}
            '00010453' {'Khmer (NIDA)'}
            '00000412' {'Korean'}
            '00000440' {'Kyrgyz Cyrillic'}
            '00000454' {'Lao'}
            '0000080a' {'Latin American'}
            '00020426' {'Latvian (Standard)'}
            '00010426' {'Latvian (Legacy)'}
            '00070c00' {'Lisu (Basic)'}
            '00080c00' {'Lisu (Standard)'}
            '00010427' {'Lithuanian'}
            '00000427' {'Lithuanian IBM'}
            '00020427' {'Lithuanian Standard'}
            '0000046e' {'Luxembourgish'}
            '0000042f' {'Macedonia (FYROM)'}
            '0001042f' {'Macedonia (FYROM) - Standard'}
            '0000044c' {'Malayalam'}
            '0000043a' {'Maltese 47-Key'}
            '0001043a' {'Maltese 48-key'}
            '00000481' {'Maori'}
            '0000044e' {'Marathi'}
            '00000850' {'Mongolian (Mongolian Script - Legacy)'}
            '00020850' {'Mongolian (Mongolian Script - Standard)'}
            '00000450' {'Mongolian Cyrillic'}
            '00010c00' {'Myanmar'}
            '00090c00' {'N ko'}
            '00000461' {'Nepali'}
            '00020c00' {'New Tai Lue'}
	        '00000414' {'Norwegian'}
	        '0000043b' {'Norwegian with Sami'}
	        '00000448' {'Odia'}
	        '000d0c00' {'Ol Chiki'}
	        '000f0c00' {'Old Italic'}
	        '000e0c00' {'Osmanya'}
	        '00000463' {'Pashto (Afghanistan)'}
	        '0x00000429' {'Persian'}
	        '00050429' {'Persian (Standard)'}
	        '000a0c00' {'Phags-pa'}
	        '00010415' {'Polish (214)'}
	        '00000415' {'Polish (Programmers)'}
	        '00000816' {'Portuguese'}
	        '00000416' {'Portuguese (Brazilian ABNT)'}
	        '00010416' {'Portuguese (Brazilian ABNT2)'}
	        '00000446' {'Punjabi'}
	        '00000418' {'Romanian (Legacy)'}
	        '00020418' {'Romanian (Programmers)'}
	        '00010418' {'Romanian (Standard)'}
            '00000419' {'Russian'}
            '00020419' {'Russian - Mnemonic'}
            '00010419' {'Russian (Typewriter)'}
            '00000485' {'Sakha'}
            '0002083b' {'Sami Extended Finland-Sweden'}
            '0001043b' {'Sami Extended Norway'}
            '00011809' {'Scottish Gaelic'}
            '00000c1a' {'Serbian (Cyrillic)'}
            '0000081a' {'Serbian (Latin)'}
            '0000046c' {'Sesotho sa Leboa'}
            '00000432' {'Setswana'}
            '0000045b' {'Sinhala'}
            '0001045b' {'Sinhala - wij 9'}
            '0000041b' {'Slovak'}
            '0001041b' {'Slovak (QWERTY)'}
            '00000424' {'Slovenian'}
            '00100c00' {'Sora'}
            '0001042e' {'Sorbian Extended'}
            '0002042e' {'Sorbian Standard'}
            '0000042e' {'Sorbian Standard (Legacy)'}
            '0000040a' {'Spanish'}
            '0001040a' {'Spanish Variation'}
            '0000041d' {'Swedish'}
            '0000083b' {'Swedish with Sami'}
            '0000100c' {'Swiss French'}
            '00000807' {'Swiss German'}
            '0000045a' {'Syriac'}
            '0001045a' {'Syriac Phonetic'}
            '00030c00' {'Tai Le'}
            '00000428' {'Tajik'}
            '00000449' {'Tamil'}
            '00010444' {'Tatar'}
            '00000444' {'Tatar (Legacy)'}
            '0000044a' {'Telugu'}
            '0000041e' {'Thai Kedmanee'}
            '0002041e' {'Thai Kedmanee (non-ShiftLock)'}
            '0001041e' {'Thai Pattachote'}
            '0003041e' {'Thai Pattachote (non-ShiftLock)'}
            '00010451' {'Tibetan (PRC - Standard)'}
            '00000451' {'Tibetan (PRC - Legacy)'}
            '00050c00' {'Tifinagh (Basic)'}
            '00060c00' {'Tifinagh (Full)'}
            '0001041f' {'Turkish F'}
            '0000041f' {'Turkish Q'}
            '00000442' {'Turkmen'}
            '0x00010408' {'Uyghur'}
            '00000480' {'Uyghur (Legacy)'}
            '00000422' {'Ukrainian'}
            '00020422' {'Ukrainian (Enhanced)'}
            '00000809' {'United Kingdom'}
            '00000452' {'United Kingdom Extended'}
            '00010409' {'United States - Dvorak'}
            '00020409' {'United States - International'}
            '00030409' {'United States - Dvorak for left hand'}
            '00040409' {'United States - Dvorak for right hand'}
            '00000409' {'United States - English'}
            '00000420' {'Urdu'}
            '00010480' {'Uyghur'}
            '00000843' {'Uzbek Cyrillic'}
            '0000042a' {'Vietnamese'}
            '00000488' {'Wolof'}
            '0x00000485' {'Yakut'}
            '0000046a' {'Yoruba'}
            Deafult {'Invalid Code'}
        }
    }

    Return
}