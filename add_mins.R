# new vars

# ALL NEEDS TIDYING UP AND RERUNNING BECAUSE NUMBERS ARE OFF
library(tidyverse)

fpl_all$team18 <- fpl_all$team
fpl_all$team19 <- fpl_all$team
fpl_all <- fpl_all %>%
  select(-team)
fpl_all$mins <- 90

raw_2018 <- read_csv(here::here("data", "fpl_2018.csv"))
raw_2019 <- read_csv(here::here("data", "fpl_2019.csv"))

small <- fpl_all %>%
  select(gw, player, mins) %>%
  arrange(player)

small <- arrange(small, player)


## ARSENAL - needs tidying --------------
ramsey <- raw_2018 %>%
  filter(name == "Aaron_Ramsey_14")
ramsey_min <- ramsey$minutes

ainsley <- raw_2018 %>%
  filter(name == "Ainsley_Maitland-Niles_20")
ainsley2 <- raw_2019 %>%
  filter(name == "Ainsley_Maitland-Niles_4")

ainsley_min <- c(ainsley$minutes, ainsley2$minutes)

(two_min <- c(ramsey_min, ainsley_min))

iwobi <- raw_2018 %>%
  filter(name == "Alex_Iwobi_15")
iwobi2 <- raw_2019 %>%
  filter(name == "Alex_Iwobi_17")

iwobi_min <- c(iwobi$minutes, iwobi2$minutes)

lacazette <- raw_2018 %>%
  filter(name == "Alexandre_Lacazette_22")
lacazette2 <- raw_2019 %>%
  filter(name == "Alexandre_Lacazette_12")

laca_min <- c(lacazette$minutes, lacazette2$minutes)

leno <- raw_2018 %>%
  filter(name == "Bernd_Leno_2")

leno2 <- raw_2019 %>%
  filter(name == "Bernd_Leno_14")

leno_min <- c(leno$minutes, leno2$minutes)

saka <- raw_2018 %>%
  filter(name == "Bukayo_Saka_563")

saka_min <- saka$minutes

jenko <- raw_2018 %>%
  filter(name == "Carl_Jenkinson_581")
jenko2 <- raw_2019 %>%
  filter(name == "Carl_Jenkinson_9")

jenko_min <- c(jenko$minutes, jenko2$minutes)

welbeck <- raw_2018 %>%
  filter(name == "Danny_Welbeck_21")
welbeck2 <- raw_2019 %>%
  filter(name == "Danny_Welbeck_512")

welbeck_min <- c(welbeck$minutes, welbeck2$minutes)


suarez <- raw_2018 %>%
  filter(name == "Denis_SuÔøΩrez_586")

suarez_min <- suarez$minutes


eddie <- raw_2018 %>%
  filter(name == "Edward_Nketiah_552")

eddie2 <- raw_2019 %>%
  filter(name == "Edward_Nketiah_13")


eddie_min <- c(eddie$minutes, eddie2$minutes)

rowe <- raw_2018 %>%
  filter(name == "Emile_Smith-Rowe_545")
rowe_min <- rowe$minutes


mart <- raw_2018 %>%
  filter(name == "Emiliano_MartÔøΩnez_542")
mart2 <- raw_2019 %>%
  filter(name == "Emiliano_Mart√≠nez_427")
mart_min <- c(mart$minutes, mart2$minutes)

xhaka <- raw_2018 %>%
  filter(name == "Granit_Xhaka_17")
xhaka2 <- raw_2019 %>%
  filter(name == "Granit_Xhaka_18")
xhaka_min <- c(xhaka$minutes, xhaka2$minutes)

hector <- raw_2018 %>%
  filter(name == "HÔøΩctor_BellerÔøΩn_4")
hector2 <- raw_2019 %>%
  filter(name == "H√©ctor_Beller√≠n_2")
hector_min <- c(hector$minutes, hector2$minutes)

mkhi <- raw_2018 %>%
  filter(name == "Henrikh_Mkhitaryan_18")
mkhi2 <- raw_2019 %>%
  filter(name == "Henrikh_Mkhitaryan_16")
mkhi_min <- c(mkhi$minutes, mkhi2$minutes)

willock <- raw_2018 %>%
  filter(name == "Joseph_Willock_566")
willock2 <- raw_2019 %>%
  filter(name == "Joseph_Willock_490")
willock_min <- c(willock$minutes, willock2$minutes)

mavro <- raw_2018 %>%
  filter(name == "Konstantinos_Mavropanos_10")
mavro2 <- raw_2019 %>%
  filter(name == "Konstantinos_Mavropanos_8")
mavro_min <- c(mavro$minutes, mavro2$minutes)

kosc <- raw_2018 %>%
  filter(name == "Laurent_Koscielny_3")
kosc2 <- raw_2019 %>%
  filter(name == "Laurent_Koscielny_7")
kosc_min <- c(kosc$minutes, kosc2$minutes)

torreira <- raw_2018 %>%
  filter(name == "Lucas_Torreira_450")
torreira2 <- raw_2019 %>%
  filter(name == "Lucas_Torreira_19")
torreira_min <- c(torreira$minutes, torreira2$minutes)

guen <- raw_2018 %>%
  filter(name == "Matteo_Guendouzi_451")
guen2 <- raw_2019 %>%
  filter(name == "Matteo_Guendouzi_21")
guen_min <- c(guen$minutes, guen2$minutes)

ozil <- raw_2018 %>%
  filter(name == "Mesut_ÔøΩzil_13")
ozil2 <- raw_2019 %>%
  filter(name == "Mesut_√ñzil_15")
ozil_min <- c(ozil$minutes, ozil2$minutes)

elneny <- raw_2018 %>%
  filter(name == "Mohamed_Elneny_16")
elneny2 <- raw_2019 %>%
  filter(name == "Mohamed_Elneny_20")
elneny_min <- c(elneny$minutes, elneny2$minutes)

nacho <- raw_2018 %>%
  filter(name == "Nacho_Monreal_5")
nacho2 <- raw_2019 %>%
  filter(name == "Nacho_Monreal_6")
nacho_min <- c(nacho$minutes, nacho2$minutes)

cech <- raw_2018 %>%
  filter(name == "Petr_Cech_1")
cech_min <- cech$minutes

auba <- raw_2018 %>%
  filter(name == "Pierre-Emerick_Aubameyang_23")
auba2 <- raw_2019 %>%
  filter(name == "Pierre-Emerick_Aubameyang_11")
auba_min <- c(auba$minutes, auba2$minutes)

nelson <- raw_2018 %>%
  filter(name == "Reiss_Nelson_19")
nelson2 <- raw_2019 %>%
  filter(name == "Reiss_Nelson_489")
nelson_min <- c(nelson$minutes, nelson2$minutes)

holding <- raw_2018 %>%
  filter(name == "Rob_Holding_6")
holding2 <- raw_2019 %>%
  filter(name == "Rob_Holding_10")
holding_min <- c(holding$minutes, holding2$minutes)

kola <- raw_2018 %>%
  filter(name == "Sead_Kolasinac_8")
kola2 <- raw_2019 %>%
  filter(name == "Sead_Kolasinac_3")
kola_min <- c(kola$minutes, kola2$minutes)

mustafi <- raw_2018 %>%
  filter(name == "Shkodran_Mustafi_7")
mustafi2 <- raw_2019 %>%
  filter(name == "Shkodran_Mustafi_1")
mustafi_min <- c(mustafi$minutes, mustafi2$minutes)


sokratis <- raw_2018 %>%
  filter(name == "Sokratis_Papastathopoulos_12")
sokratis2 <- raw_2019 %>%
  filter(name == "Sokratis_Papastathopoulos_5")
sokratis_min <- c(sokratis$minutes, sokratis2$minutes)

licht <- raw_2018 %>%
  filter(name == "Stephan_Lichtsteiner_11")
licht_min <- licht$minutes

medley <- raw_2018 %>%
  filter(name == "Zech_Medley_546")
medley_min <- medley$minutes  

ars_min <- c(ramsey_min,
             ainsley_min,
             iwobi_min,
             laca_min,
             leno_min,
             saka_min,
             jenko_min,
             welbeck_min,
             suarez_min,
             eddie_min,
             rowe_min,
             mart_min,
             xhaka_min,
             hector_min,
             mkhi_min,
             willock_min,
             mavro_min,
             kosc_min,
             torreira_min,
             guen_min,
             ozil_min,
             elneny_min,
             nacho_min,
             cech_min,
             auba_min,
             nelson_min,
             holding_min,
             kola_min,
             mustafi_min,
             sokratis_min,
             licht_min,
             medley_min)

arsenal <- small %>%
  slice(1:548) %>%
  mutate(mins = ars_min)


## BOURNEMOUTH - needs tyding ---------------------
min_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  bourn_min <- c(bourn_min, mins)
  
}


adsmith <- raw_2018 %>%
  filter(name == "Adam_Smith_29")
adsmith2 <- raw_2019 %>%
  filter(name == "Adam_Smith_63")
adsmith_min <- c(adsmith$minutes, adsmith2$minutes)

surman <- raw_2018 %>%
  filter(name == "Andrew_Surman_35")
surman2 <- raw_2019 %>%
  filter(name == "Andrew_Surman_80")
surman_min <- c(surman$minutes, surman2$minutes)

boruc <- raw_2018 %>%
  filter(name == "Artur_Boruc_25")
boruc2 <- raw_2019 %>%
  filter(name == "Artur_Boruc_73")
boruc_min <- c(boruc$minutes, boruc2$minutes)

begovic <- raw_2018 %>%
  filter(name == "Asmir_Begovic_24")
begovic2 <- raw_2019 %>% 
  filter(name == "Asmir_Begovic_72")
begovic_min <- c(begovic$minutes, begovic2$minutes)

cwilson <- raw_2018 %>%
  filter(name == "Callum_Wilson_43")
cwilson2 <- raw_2019 %>%
  filter(name == "Callum_Wilson_67")
cwilson_min <- c(cwilson$minutes, cwilson2$minutes)

daniels <- raw_2018 %>%
  filter(name =="Charlie_Daniels_28")
daniels2 <- raw_2019 %>%
  filter(name == "Charlie_Daniels_60")
daniels_min <- c(daniels$minutes, daniels2$minutes)

mepham <- raw_2018 %>%
  filter(name == "Chris_Mepham_580")
mepham2 <- raw_2019 %>%
  filter(name == "Chris_Mepham_61")
mepham_min <- c(mepham$minutes, mepham2$minutes)

gosling <- raw_2018 %>%
  filter(name == "Dan_Gosling_37")
gosling2 <- raw_2019 %>%
  filter(name == "Dan_Gosling_81")
gosling_min <- c(gosling$minutes, gosling2$minutes)

brooks <- raw_2018 %>%
  filter(name == "David_Brooks_42")
brooks2 <- raw_2019 %>%
  filter(name == "David_Brooks_76")
brooks_min <- c(brooks$minutes, brooks2$minutes)

bourn_min <- c(adsmith_min,
               surman_min,
               boruc_min,
               begovic_min,
               cwilson_min,
               daniels_min,
               mepham_min,
               gosling_min,
               brooks_min)

bourn_min <- min_add("Diego_Rico_473", "Diego_Rico_65")
bourn_min <- min_add("Dominic_Solanke_259", "Dominic_Solanke_69")
bourn_min <- min_add("Emerson_Hyndman_41", "")
bourn_min <- min_add("Jack_Simpson_32", "Jack_Simpson_66")
bourn_min <- min_add("Jefferson_Lerma_494", "Jefferson_Lerma_82")
bourn_min <- min_add("Jermain_Defoe_46", "")
bourn_min <- min_add("Jordon_Ibe_38", "Jordon_Ibe_78")
bourn_min <- min_add("Joshua_King_45", "Joshua_King_68")
bourn_min <- min_add("Junior_Stanislas_36", "Junior_Stanislas_77")
bourn_min <- min_add("Lewis_Cook_39", "Lewis_Cook_79")
bourn_min <- min_add("Lys_Mousset_44", "Lys_Mousset_70")
bourn_min <- min_add("Marc_Pugh_34", "")
bourn_min <- min_add("Nathan_AkÔøΩ_31", "Nathan_Ak√©_59")
bourn_min <- min_add("Nathaniel_Clyne_241", "")
bourn_min <- min_add("Ryan_Fraser_40", "Ryan_Fraser_75")
bourn_min <- min_add("Simon_Francis_26", "Simon_Francis_62")
bourn_min <- min_add("Steve_Cook_27", "Steve_Cook_58")
bourn_min <- min_add("Tyrone_Mings_30", "Tyrone_Mings_445")

bmth <- small %>%
  slice(549:1018) %>%
  mutate(mins = bourn_min)

## BRIGHTON ------------------------------

jahanbakhsh <- raw_2018 %>%
  filter(name == "Alireza_Jahanbakhsh_476")
jahanbakhsh2 <- raw_2019 %>%
  filter(name == "Alireza_Jahanbakhsh_50")
jahan_min <- c(jahanbakhsh$minutes, jahanbakhsh2$minutes)

bri_min <- jahan_min

bri_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  bri_min <- c(bri_min, mins)
  
}

bri_min <- bri_add("Anthony_Knockaert_55", "Anthony_Knockaert_52")
bri_min <- bri_add("Ben_White_559", "")
bri_min <- bri_add("Beram_Kayal_57", "Beram_Kayal_56")
bri_min <- bri_add("Bernardo_Fernandes da Silva Junior_440", "Bernardo_Fernandes da Silva Junior_39")
bri_min <- bri_add("Bruno_Saltor Grau_50", "")
bri_min <- bri_add("Dale_Stephens_56", "Dale_Stephens_57")
bri_min <- bri_add("Dan_Burn_582", "Dan_Burn_475")
bri_min <- bri_add("David_Button_179", "David_Button_48")
bri_min <- bri_add("Davy_PrÔøΩpper_60", "Davy_Pr√∂pper_54")
bri_min <- bri_add("Ezequiel_Schelotto_53", "")
bri_min <- bri_add("Florin_Andone_66", "Florin_Andone_46")
bri_min <- bri_add("GaÔøΩtan_Bong_51", "Ga√´tan_Bong_41")
bri_min <- bri_add("Glenn_Murray_62", "Glenn_Murray_44")
bri_min <- bri_add("Jason_Steele_439", "")
bri_min <- bri_add("JosÔøΩ Heriberto_Izquierdo Mena_61", "Jos√© Heriberto_Izquierdo Mena_51")
bri_min <- bri_add("JÔøΩrgen_Locadia_65", "J√ºrgen_Locadia_45")
bri_min <- bri_add("Leon_Balogun_54", "Leon_Balogun_40")
bri_min <- bri_add("Lewis_Dunk_48", "Lewis_Dunk_42")
bri_min <- bri_add("Markus_Suttner_52", "")
bri_min <- bri_add("MartÔøΩn_Montoya_503", "Mart√≠n_Montoya_38")
bri_min <- bri_add("Mathew_Ryan_47", "Mathew_Ryan_47")
bri_min <- bri_add("Max_Sanders_572", "")
bri_min <- bri_add("Pascal_GroÔøΩ_59", "Pascal_Gro√ü_49")
bri_min <- bri_add("Sam_Baldock_64", "")
bri_min <- bri_add("Shane_Duffy_49", "Shane_Duffy_37")
bri_min <- bri_add("Solomon_March_58", "Solomon_March_55")
bri_min <- bri_add("Tomer_Hemed_63", "")
bri_min <- bri_add("Viktor_Gyokeres_551", "")
bri_min <- bri_add("Yves_Bissouma_466", "Yves_Bissouma_53")

brighton <- small %>%
  slice(1019:1522) %>%
  mutate(mins = bri_min)

## BURNLEY -------------------------------------

lennon <- raw_2018 %>%
  filter(name == "Aaron_Lennon_83")
lennon2 <- raw_2019 %>%
  filter(name == "Aaron_Lennon_430")
lennon_min <- c(lennon$minutes, lennon2$minutes)

bur_min <- lennon_min

bur_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  bur_min <- c(bur_min, mins)
  
}

bur_min <- bur_add("Abd-Al-Ali Morakinyo Olaposi_Koiki_564", "")
bur_min <- bur_add("Anders_Lindegaard_485", "")
bur_min <- bur_add("Ashley_Barnes_85", "Ashley_Barnes_90")
bur_min <- bur_add("Ashley_Westwood_80", "Ashley_Westwood_101")
bur_min <- bur_add("Ben_Gibson_491", "Ben_Gibson_89")
bur_min <- bur_add("Ben_Mee_70", "Ben_Mee_83")
bur_min <- bur_add("Charlie_Taylor_74", "Charlie_Taylor_87")
bur_min <- bur_add("Chris_Wood_87", "Chris_Wood_91")
bur_min <- bur_add("Dwight_McNeil_534", "Dwight_McNeil_97")
bur_min <- bur_add("Jack_Cork_82", "Jack_Cork_102")
bur_min <- bur_add("James_Tarkowski_72", "James_Tarkowski_84")
bur_min <- bur_add("Jeff_Hendrick_78", "Jeff_Hendrick_100")
bur_min <- bur_add("Joe_Hart_490", "Joe_Hart_95")
bur_min <- bur_add("Johann Berg_Gudmundsson_76", "Johann Berg_Gudmundsson_96")
bur_min <- bur_add("Jonathan_Walters_81", "")
bur_min <- bur_add("Josh_Benson_583", "")
bur_min <- bur_add("Kevin_Long_73", "Kevin_Long_88")
bur_min <- bur_add("Matej_Vydra_495", "Matej_Vydra_92")
bur_min <- bur_add("Matthew_Lowton_69", "Matthew_Lowton_85")
bur_min <- bur_add("Nahki_Wells_86", "")
bur_min <- bur_add("Nick_Pope_68", "Nick_Pope_93")
bur_min <- bur_add("Peter_Crouch_590", "")
bur_min <- bur_add("Phil_Bardsley_75", "Phil_Bardsley_86")
bur_min <- bur_add("Robbie_Brady_79", "Robbie_Brady_98")
bur_min <- bur_add("Sam_Vokes_84", "")
bur_min <- bur_add("Stephen_Ward_71", "")
bur_min <- bur_add("Steven_Defour_77", "Steven_Defour_99")
bur_min <- bur_add("Tom_Heaton_67", "Tom_Heaton_94")


burnley <- small %>%
  slice(1523:2012) %>%
  mutate(mins = bur_min)

## CARDIFF -------------------------------------------

car_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  car_min <- c(car_min, mins)
  
}

smithies <- raw_2018 %>%
  filter(name == "Alex_Smithies_89")
smithies_min <- smithies$minutes

car_min <- smithies_min

car_min <- car_add("Anthony_Pilkington_103", "")
car_min <- car_add("Aron_Gunnarsson_102", "")
car_min <- car_add("Ashley Darel Jazz_Richards_96", "")
car_min <- car_add("Bobby_Reid_110", "")
car_min <- car_add("Brian_Murphy_537", "")
car_min <- car_add("Bruno_Ecuele Manga_92", "")
car_min <- car_add("Callum_Paterson_101", "")
car_min <- car_add("David Junior_Hoilett_99", "")
car_min <- car_add("Gary_Madine_109", "")
car_min <- car_add("Greg_Cunninghamm_467", "")
car_min <- car_add("Greg_Halford_97", "")
car_min <- car_add("Harry_Arter_33", "")
car_min <- car_add("Joe_Bennett_94", "")
car_min <- car_add("Joe_Ralls_98", "")
car_min <- car_add("Jacob_Murphy_321", "")
car_min <- car_add("Kadeem_Harris_535", "")
car_min <- car_add("Kenneth_Zohore_107", "")
car_min <- car_add("Leandro_Bacuna_589", "")
car_min <- car_add("Lee_Peltier_95", "")
car_min <- car_add("LoÔøΩc_Damour_104", "")
car_min <- car_add("Matthew_Connolly_93", "")
car_min <- car_add("Nathaniel_Mendez-Laing_100", "")
car_min <- car_add("Neil_Etheridge_88", "")
car_min <- car_add("Omar_Bogle_108", "")
car_min <- car_add("Oumar_Niasse_176", "")
car_min <- car_add("Rhys_Healey_573", "")
car_min <- car_add("Sean_Morrison_90", "")
car_min <- car_add("Sol_Bamba_91", "")
car_min <- car_add("VÔøΩctor_Camarasa_504", "V√≠ctor_Camarasa_510")

cardiff <- small %>%
  slice(2013:2436) %>%
  mutate(mins = car_min)

# CHELSEA -------------------------------------

morata <- raw_2018 %>%
  filter(name == "ÔøΩlvaro_Morata_134")

morata_min <- morata$minutes

che_min <- morata_min

che_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  che_min <- c(che_min, mins)
  
}

che_min <- che_add("Andreas_Christensen_119", "Andreas_Christensen_108")
che_min <- che_add("Antonio_RÔøΩdiger_118", "Antonio_R√ºdiger_104")
che_min <- che_add("Callum_Hudson-Odoi_131", "Callum_Hudson-Odoi_116")
che_min <- che_add("CÔøΩsar_Azpilicueta_113", "C√©sar_Azpilicueta_105")
che_min <- che_add("Cesc_FÔøΩbregas_123", "")
che_min <- che_add("Daniel_Drinkwater_128", "Daniel_Drinkwater_120")
che_min <- che_add("David_Luiz Moreira Marinho_116", "David_Luiz Moreira Marinho_106")
che_min <- che_add("Davide_Zappacosta_120", "Davide_Zappacosta_109")
che_min <- che_add("Eden_Hazard_122", "")
che_min <- che_add("Emerson_Palmieri dos Santos_121", "Emerson_Palmieri dos Santos_107")
che_min <- che_add("Ethan_Ampadu_130", "Ethan_Ampadu_121")
che_min <- che_add("Gary_Cahill_114", "Gary_Cahill_503")
che_min <- che_add("Gonzalo_HiguaÔøΩn_579", "")
che_min <- che_add("Jorge Luiz_Frello Filho_459", "Jorge Luiz_Frello Filho_118")
che_min <- che_add("Kepa_Arrizabalaga_498", "Kepa_Arrizabalaga_111")
che_min <- che_add("Marcos_Alonso_115", "Marcos_Alonso_103")
che_min <- che_add("Mateo_Kovacic_499", "Mateo_Kovacic_432")
che_min <- che_add("N'Golo_KantÔøΩ_126", "N'Golo_Kant√©_119")
che_min <- che_add("Olivier_Giroud_133", "Olivier_Giroud_110")
che_min <- che_add("Pedro_RodrÔøΩguez Ledesma_125", "Pedro_Rodr√≠guez Ledesma_114")
che_min <- che_add("Ross_Barkley_127", "Ross_Barkley_117")
che_min <- che_add("Ruben_Loftus-Cheek_132", "Ruben_Loftus-Cheek_115")
che_min <- che_add("Tammy_Abraham_496", "Tammy_Abraham_460")
che_min <- che_add("Thibaut_Courtois_111", "")
che_min <- che_add("TiemouÔøΩ_Bakayoko_129", "")
che_min <- che_add("Victor_Moses_117", "")
che_min <- che_add("Willian_Borges Da Silva_124", "Willian_Borges Da Silva_113")
che_min <- che_add("Willy_Caballero_112", "Willy_Caballero_112")


chelsea <- slice(small, 2437:2930) %>%
  mutate(mins = che_min)

## PALACE -------------------------------

wan_b <- raw_2018 %>%
  filter(name == "Aaron_Wan-Bissaka_145")
wan_b2 <- raw_2019 %>%
  filter(name == "Aaron_Wan-Bissaka_122")

wanb_min <- c(wan_b$minutes, wan_b2$minutes)

cry_min <- wanb_min

cry_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  cry_min <- c(cry_min, mins)
  
}

cry_min <- cry_add("Alexander_SÔøΩrloth_153", "")
cry_min <- cry_add("Andros_Townsend_149", "Andros_Townsend_135")
cry_min <- cry_add("Bakary_Sako_148", "")
cry_min <- cry_add("Cheikhou_KouyatÔøΩ_412", "Cheikhou_Kouyat√©_139")
cry_min <- cry_add("Christian_Benteke_152", "Christian_Benteke_129")
cry_min <- cry_add("Connor_Wickham_444", "Connor_Wickham_130")
cry_min <- cry_add("Jairo_Riedewald_144", "")
cry_min <- cry_add("James_McArthur_147", "James_McArthur_138")
cry_min <- cry_add("James_Tomkins_138", "James_Tomkins_124")
cry_min <- cry_add("Jaroslaw_Jach_442", "")
cry_min <- cry_add("Jeffrey_Schlupp_141", "Jeffrey_Schlupp_137")
cry_min <- cry_add("Joe_Tupper_576", "")
cry_min <- cry_add("Joel_Ward_441", "Joel_Ward_126")
cry_min <- cry_add("Jordan_Ayew_505", "Jordan_Ayew_468")
cry_min <- cry_add("Julian_Speroni_136", "")
cry_min <- cry_add("Lucas_Perri_584", "")
cry_min <- cry_add("Luka_Milivojevic_150", "Luka_Milivojevic_134")
cry_min <- cry_add("Mamadou_Sakho_143", "Mamadou_Sakho_125")
cry_min <- cry_add("Martin_Kelly_140", "Martin_Kelly_128")
cry_min <- cry_add("Max_Meyer_486", "Max_Meyer_136")
cry_min <- cry_add("Michy_Batshuayi_592", "Michy_Batshuayi_461")
cry_min <- cry_add("Pape_SouarÔøΩ_443", "")
cry_min <- cry_add("Patrick_van Aanholt_142", "Patrick_van Aanholt_123")
cry_min <- cry_add("Scott_Dann_139", "Scott_Dann_127")
cry_min <- cry_add("Sullay_Kaikai_477", "")
cry_min <- cry_add("Vicente_Guaita_137", "Vicente_Guaita_131")
cry_min <- cry_add("Wayne_Hennessey_135", "Wayne_Hennessey_132")
cry_min <- cry_add("Wilfried_Zaha_151", "Wilfried_Zaha_133")

palace <- slice(small, 2931:3416) %>%
  mutate(mins = cry_min)

## EVERTON -------------------------------
eve_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  eve_min <- c(eve_min, mins)
  
}

lookman <- raw_2018 %>%
  filter(name == "Ademola_Lookman_170")
lookman2 <- raw_2019 %>%
  filter(name == "Ademola_Lookman_155")

lookman_min <- c(lookman$minutes, lookman2$minutes)

eve_min <- lookman_min

eve_min <- eve_add("AndrÔøΩ Filipe_Tavares Gomes_508", "Andr√© Filipe_Tavares Gomes_422")
eve_min <- eve_add("Ashley_Williams_159", "")
eve_min <- eve_add("Beni_Baningime_174", "")
eve_min <- eve_add("Bernard_AnÔøΩcio Caldeira Duarte_507", "Bernard_An√≠cio Caldeira Duarte_152")
eve_min <- eve_add("Cenk_Tosun_177", "Cenk_Tosun_146")
eve_min <- eve_add("Cuco_Martina_163", "")
eve_min <- eve_add("Davy_Klaassen_171", "")
eve_min <- eve_add("Dominic_Calvert-Lewin_175", "Dominic_Calvert-Lewin_147")
eve_min <- eve_add("Gylfi_Sigurdsson_172", "Gylfi_Sigurdsson_151")
eve_min <- eve_add("Idrissa_Gueye_168", "Idrissa_Gueye_156")
eve_min <- eve_add("James_McCarthy_166", "James_McCarthy_157")
eve_min <- eve_add("Jonjoe_Kenny_161", "")
eve_min <- eve_add("Jordan_Pickford_154", "Jordan_Pickford_148")
eve_min <- eve_add("Kevin_Mirallas_469", "")
eve_min <- eve_add("Kieran_Dowell_528", "")
eve_min <- eve_add("Kurt_Zouma_526", "Kurt_Zouma_459")
eve_min <- eve_add("Leighton_Baines_156", "Leighton_Baines_145")
eve_min <- eve_add("Lucas_Digne_484", "Lucas_Digne_141")
eve_min <- eve_add("Maarten_Stekelenburg_155", "Maarten_Stekelenburg_149")
eve_min <- eve_add("Mason_Holgate_160", "Mason_Holgate_478")
eve_min <- eve_add("Michael_Keane_162", "Michael_Keane_143")
eve_min <- eve_add("Morgan_Schneiderlin_167", "Morgan_Schneiderlin_158")
eve_min <- eve_add("Nikola_Vlasic_173", "")
eve_min <- eve_add("Phil_Jagielka_158", "Phil_Jagielka_444")
eve_min <- eve_add("Richarlison_de Andrade_393", "Richarlison_de Andrade_150")
eve_min <- eve_add("Sandro_RamÔøΩrez_470", "")
eve_min <- eve_add("Seamus_Coleman_157", "Seamus_Coleman_144")
eve_min <- eve_add("Theo_Walcott_164", "Theo_Walcott_153")
eve_min <- eve_add("Tom_Davies_169", "Tom_Davies_154")
eve_min <- eve_add("Tyias_Browning_532", "")
eve_min <- eve_add("Yannick_Bolasie_165", "")
eve_min <- eve_add("Yerry_Mina_506", "Yerry_Mina_142")


everton <- slice(small, 3417:3966) %>%
  mutate(mins = eve_min)

## FULHAM --------------------------------

ful_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  ful_min <- c(ful_min, mins)
  
}

kamara <- raw_2018 %>%
  filter(name == "Aboubakar_Kamara_189")

kamara_min <- kamara$minutes

ful_min <- kamara_min

ful_min <- ful_add("Aleksandar_Mitrovic_480", "")
ful_min <- ful_add("Alfie_Mawson_487", "")
ful_min <- ful_add("AndrÔøΩ_SchÔøΩrrle_478", "")
ful_min <- ful_add("AndrÔøΩ-Frank_Zambo Anguissa_512", "")
ful_min <- ful_add("Calum_Chambers_9", "Calum_Chambers_467")
ful_min <- ful_add("Cyrus_Christie_460", "")
ful_min <- ful_add("Denis_Odoi_181", "")
ful_min <- ful_add("Fabricio_Agosto RamÔøΩrez_474", "")
ful_min <- ful_add("Floyd_AyitÔøΩ_186", "")
ful_min <- ful_add("HÔøΩvard_Nordtveit_593", "")
ful_min <- ful_add("Ibrahima_CissÔøΩ_521", "")
ful_min <- ful_add("Jean Michael_Seri_456", "")
ful_min <- ful_add("Joe_Bryan_510", "")
ful_min <- ful_add("Kevin_McDonald_183", "")
ful_min <- ful_add("Lazar_Markovic_594", "")
ful_min <- ful_add("Luciano_Vietto_513", "")
ful_min <- ful_add("Marcus_Bettinelli_178", "")
ful_min <- ful_add("Maxime_Le Marchand_455", "")
ful_min <- ful_add("Neeskens_Kebano_187", "")
ful_min <- ful_add("Rui Pedro_da Rocha Fonte_188", "")
ful_min <- ful_add("Ryan_Babel_575", "")
ful_min <- ful_add("Ryan_Sessegnon_184", "Ryan_Sessegnon_524")
ful_min <- ful_add("Sergio_Rico_509", "")
ful_min <- ful_add("Stefan_Johansen_185", "")
ful_min <- ful_add("Tim_Ream_180", "")
ful_min <- ful_add("Timothy_Fosu-Mensah_511", "")
ful_min <- ful_add("Tom_Cairney_182", "")
ful_min <- ful_add("Zeze Steven_Sessegnon_541", "")

fulham <- slice(small, 3967:4380) %>%
  mutate(mins = ful_min)

## HUDDERSFIELD --------------------------

hud_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  hud_min <- c(hud_min, mins)
  
}

mooy <- raw_2018 %>%
  filter(name == "Aaron_Mooy_199") 
mooy2 <- raw_2019 %>%
  filter(name == "Aaron_Mooy_516")

hud_min <- c(mooy$minutes, mooy2$minutes)

hud_min <- hud_add("Abdelhamid_Sabiri_205", "")
hud_min <- hud_add("Adama_Diakhaby_471", "")
hud_min <- hud_add("Alex_Pritchard_206", "")
hud_min <- hud_add("Ben_Hamer_190", "")
hud_min <- hud_add("Chris_LÔøΩwe_193", "")
hud_min <- hud_add("Christopher_Schindler_192", "")
hud_min <- hud_add("Collin_Quaner_209", "")
hud_min <- hud_add("Danny_Williams_204", "")
hud_min <- hud_add("Elias_Kachunga_212", "")
hud_min <- hud_add("Erik_Durm_461", "")
hud_min <- hud_add("Florent_Hadergjonaj_197", "")
hud_min <- hud_add("Isaac_Mbenza_514", "")
hud_min <- hud_add("Jason_Puncheon_146", "")
hud_min <- hud_add("Jon Gorenc_Stankovic_522", "")
hud_min <- hud_add("Jonas_LÔøΩssl_191", "Jonas_L√∂ssl_479")
hud_min <- hud_add("Jonathan_Hogg_201", "")
hud_min <- hud_add("Juninho_Bacuna_208", "")
hud_min <- hud_add("Karlan_Grant_585", "")
hud_min <- hud_add("Laurent_Depoitre_210", "")
hud_min <- hud_add("Mathias_Jorgensen_195", "")
hud_min <- hud_add("Philip_Billing_202", "Philip_Billing_476")
hud_min <- hud_add("Rajiv_van La Parra_200", "")
hud_min <- hud_add("Ramadan_Sobhi_207", "")
hud_min <- hud_add("Ryan_Schofield_533", "")
hud_min <- hud_add("Scott_Malone_196", "")
hud_min <- hud_add("Steve_Mounie_211", "")
hud_min <- hud_add("Terence_Kongolo_198", "")
hud_min <- hud_add("Tom_Ince_203", "")
hud_min <- hud_add("Tommy_Smith_194", "")

hudders <- slice(small, 4381:4812) %>%
  mutate(mins = hud_min)

## LEICESTER ------------------

lei_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  lei_min <- c(lei_min, mins)
  
}

silva <- raw_2018 %>%
  filter(name == "Adrien Sebastian_Perruchet Silva_231") 

lei_min <- c(silva$minutes)

lei_min <- lei_add("Benjamin_Chilwell_219", "Benjamin_Chilwell_161")
soyuncu <- raw_2018 %>%
  filter(name == "Caglar_SÔøΩyÔøΩncÔøΩ_515") 
soyuncu2 <- raw_2018 %>%
  filter(name == "ÔøΩaglar_SÔøΩyÔøΩncÔøΩ_515")
soyuncu3 <- raw_2019 %>%
  filter(name == "√áaglar_S√∂y√ºnc√º_164")
soyuncu_min <- c(soyuncu$minutes, soyuncu2$minutes, soyuncu3$minutes)
lei_min <- c(lei_min, soyuncu_min)
lei_min <- lei_add("Christian_Fuchs_216", "Christian_Fuchs_163")
lei_min <- lei_add("Daniel_Amartey_226", "Daniel_Amartey_178")
lei_min <- lei_add("Danny_Simpson_217", "")
lei_min <- lei_add("Demarai_Gray_225", "Demarai_Gray_175")
lei_min <- lei_add("Eldin_Jakupovic_214", "Eldin_Jakupovic_169")
lei_min <- lei_add("Filip_Benkovic_501", "")
lei_min <- lei_add("Fousseni_DiabatÔøΩ_232", "")
lei_min <- lei_add("Hamza_Choudhury_230", "Hamza_Choudhury_180")
lei_min <- lei_add("Harry_Maguire_220", "Harry_Maguire_160")
lei_min <- lei_add("Harvey_Barnes_571", "Harvey_Barnes_172")
lei_min <- lei_add("James_Maddison_233", "James_Maddison_171")
lei_min <- lei_add("Jamie_Vardy_234", "Jamie_Vardy_166")
lei_min <- lei_add("Jonny_Evans_222", "Jonny_Evans_162")
lei_min <- lei_add("Josh_Knight_558", "")
lei_min <- lei_add("Kasper_Schmeichel_213", "Kasper_Schmeichel_168")
lei_min <- lei_add("Kelechi_Iheanacho_236", "Kelechi_Iheanacho_167")
lei_min <- lei_add("Marc_Albrighton_224", "Marc_Albrighton_174")
lei_min <- lei_add("Matty_James_229", "Matty_James_177")
lei_min <- lei_add("Nampalys_Mendy_527", "Nampalys_Mendy_179")
lei_min <- lei_add("Rachid_Ghezzal_492", "Rachid_Ghezzal_173")
lei_min <- lei_add("Ricardo Domingos_Barbosa Pereira_221", "Ricardo Domingos_Barbosa Pereira_159")
lei_min <- lei_add("Shinji_Okazaki_235", "")
lei_min <- lei_add("Vicente_Iborra_228", "")
lei_min <- lei_add("Wes_Morgan_215", "Wes_Morgan_165")
lei_min <- lei_add("Wilfred_Ndidi_227", "Wilfred_Ndidi_176")
lei_min <- lei_add("Yohan_Benalouane_218", "")
lei_min <- lei_add("Youri_Tielemans_591", "Youri_Tielemans_448")

leic <- small %>%
  slice(4813:5320) %>%
  mutate(mins = lei_min)

## LIVERPOOL ------------------------

liv_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  liv_min <- c(liv_min, mins)
  
}

lallana <- raw_2018 %>%
  filter(name == "Adam_Lallana_250") 
lallana2 <- raw_2019 %>%
  filter(name == "Adam_Lallana_195")

liv_min <- c(lallana$minutes, lallana2$minutes)

liv_min <- liv_add("Alberto_Moreno_240", "")
liv_min <- liv_add("Alex_Oxlade-Chamberlain_248", "Alex_Oxlade-Chamberlain_193")
liv_min <- liv_add("Alisson_Ramses Becker_468", "Alisson_Ramses Becker_189")
liv_min <- liv_add("Andrew_Robertson_247", "Andrew_Robertson_181")
liv_min <- liv_add("Curtis_Jones_597", "")
liv_min <- liv_add("Daniel_Sturridge_472", "")
liv_min <- liv_add("Dejan_Lovren_239", "Dejan_Lovren_186")
liv_min <- liv_add("Divock_Origi_543", "Divock_Origi_188")
liv_min <- liv_add("Fabio Henrique_Tavares_255", "Fabio Henrique_Tavares_197")
liv_min <- liv_add("Georginio_Wijnaldum_252", "Georginio_Wijnaldum_199")
liv_min <- liv_add("James_Milner_254", "James_Milner_200")
liv_min <- liv_add("Joel_Matip_243", "Joel_Matip_185")
liv_min <- liv_add("Jordan_Henderson_249", "Jordan_Henderson_198")
liv_min <- liv_add("Joseph_Gomez_242", "Joseph_Gomez_184")
liv_min <- liv_add("Loris_Karius_238", "")
liv_min <- liv_add("Mohamed_Salah_253", "Mohamed_Salah_191")
liv_min <- liv_add("Naby_Keita_256", "Naby_Keita_196")
liv_min <- liv_add("Rafael_Camacho_557", "Rafael_Camacho_201")
liv_min <- liv_add("Ragnar_Klavan_244", "")
liv_min <- liv_add("Roberto_Firmino_257", "Roberto_Firmino_187")
liv_min <- liv_add("Sadio_ManÔøΩ_251", "Sadio_Man√©_192")
liv_min <- liv_add("Simon_Mignolet_237", "Simon_Mignolet_190")
liv_min <- liv_add("Trent_Alexander-Arnold_245", "Trent_Alexander-Arnold_182")
liv_min <- liv_add("Virgil_van Dijk_246", "Virgil_van Dijk_183")
liv_min <- liv_add("Xherdan_Shaqiri_462", "Xherdan_Shaqiri_194")

pool <- small %>%
  slice(5321:5768) %>%
  mutate(mins = liv_min)

## MAN CITY --------------------------

city_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  city_min <- c(city_min, mins)
  
}

muric <- raw_2018 %>%
  filter(name == "Arijanet_Muric_529") 

city_min <- c(muric$minutes)

city_min <- city_add("Aymeric_Laporte_268", "Aymeric_Laporte_202")
city_min <- city_add("Benjamin_Mendy_267", "Benjamin_Mendy_204")
city_min <- city_add("Bernardo Mota_Veiga de Carvalho e Silva_276", "Bernardo Mota_Veiga de Carvalho e Silva_218")
city_min <- city_add("Brahim_Diaz_278", "")
city_min <- city_add("Claudio_Bravo_261", "Claudio_Bravo_213")
city_min <- city_add("Danilo Luiz_da Silva_266", "Danilo Luiz_da Silva_209")
city_min <- city_add("David_Silva_271", "David_Silva_219")
city_min <- city_add("Ederson_Santana de Moraes_260", "Ederson_Santana de Moraes_212")
city_min <- city_add("Fabian_Delph_269", "Fabian_Delph_205")
city_min <- city_add("Fernando_Luiz Rosa_272", "Fernando_Luiz Rosa_221")
city_min <- city_add("Gabriel Fernando_de Jesus_281", "Gabriel Fernando_de Jesus_211")
city_min <- city_add("Ilkay_GÔøΩndogan_274", "Ilkay_G√ºndogan_222")
city_min <- city_add("John_Stones_262", "John_Stones_207")
city_min <- city_add("Kevin_De Bruyne_273", "Kevin_De Bruyne_215")
city_min <- city_add("Kyle_Walker_265", "Kyle_Walker_203")
city_min <- city_add("Leroy_SanÔøΩ_275", "Leroy_San√©_216")
city_min <- city_add("NicolÔøΩs_Otamendi_264", "Nicol√°s_Otamendi_208")
city_min <- city_add("Oleksandr_Zinchenko_279", "Oleksandr_Zinchenko_206")
city_min <- city_add("Phil_Foden_277", "Phil_Foden_220")
city_min <- city_add("Raheem_Sterling_270", "Raheem_Sterling_214")
city_min <- city_add("Riyad_Mahrez_223", "Riyad_Mahrez_217")
city_min <- city_add("Sergio_AgÔøΩero_280", "Sergio_Ag√ºero_210")
city_min <- city_add("Vincent_Kompany_263", "")

city <- small %>%
  slice(5769:6188) %>%
  mutate(mins = city_min)


## MAN UTD --------------------------

utd_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  utd_min <- c(utd_min, mins)
  
}

alexis <- raw_2018 %>%
  filter(name == "Alexis_SÔøΩnchez_295") 
alexis2 <- raw_2019 %>%
  filter(name == "Alexis_S√°nchez_240")

utd_min <- c(alexis$minutes, alexis2$minutes)

utd_min <- utd_add("Ander_Herrera_299", "")
utd_min <- utd_add("Andreas_Pereira_481", "Andreas_Pereira_246")
utd_min <- utd_add("Angel_Gomes_568", "Angel_Gomes_245")
utd_min <- utd_add("Anthony_Martial_301", "Anthony_Martial_239")
utd_min <- utd_add("Antonio_Valencia_288", "")
utd_min <- utd_add("Ashley_Young_293", "Ashley_Young_224")
utd_min <- utd_add("Chris_Smalling_284", "Chris_Smalling_223")
utd_min <- utd_add("Daley_Blind_290", "")
utd_min <- utd_add("David_De Gea_282", "")
# de gea 2019 is at end of data for some reason
utd_min <- utd_add("Eric_Bailly_291", "Eric_Bailly_228")
utd_min <- utd_add("Frederico_Rodrigues de Paula Santos_304", "Frederico_Rodrigues de Paula Santos_244")
utd_min <- utd_add("Jesse_Lingard_300", "Jesse_Lingard_241")
utd_min <- utd_add("JosÔøΩ Diogo_Dalot Teixeira_294", "Jos√© Diogo_Dalot Teixeira_229")
utd_min <- utd_add("Juan_Mata_297", "Juan_Mata_242")
utd_min <- utd_add("Lee_Grant_520", "Lee_Grant_237")
utd_min <- utd_add("Luke_Shaw_286", "Luke_Shaw_226")
utd_min <- utd_add("Marcos_Rojo_287", "Marcos_Rojo_227")
utd_min <- utd_add("Marcus_Rashford_305", "Marcus_Rashford_233")
utd_min <- utd_add("Marouane_Fellaini_298", "")
utd_min <- utd_add("Matteo_Darmian_289", "Matteo_Darmian_230")
utd_min <- utd_add("Nemanja_Matic_296", "Nemanja_Matic_247")
utd_min <- utd_add("Paul_Pogba_302", "Paul_Pogba_238")
utd_min <- utd_add("Phil_Jones_285", "Phil_Jones_231")
utd_min <- utd_add("Romelu_Lukaku_306", "Romelu_Lukaku_232")
utd_min <- utd_add("Scott_McTominay_303", "Scott_McTominay_248")
utd_min <- utd_add("Sergio_Romero_283", "Sergio_Romero_236")
utd_min <- utd_add("Victor_LindelÔøΩf_292", "Victor_Lindel√∂f_225")

utd <- small %>%
  slice(6189:6672) %>%
  mutate(mins = utd_min)


## NEWCASTLE ----------------------

new_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  new_min <- c(new_min, mins)
  
}

barreca <- raw_2018 %>%
  filter(name == "Antonio_Barreca_588") 

new_min <- c(barreca$minutes)

new_min <- new_add("Ayoze_PÔøΩrez_326", "Ayoze_P√©rez_265")
new_min <- new_add("Callum_Roberts_577", "")
new_min <- new_add("Chancel_Mbemba_316", "")
new_min <- new_add("Christian_Atsu_320", "Christian_Atsu_267")
new_min <- new_add("Ciaran_Clark_311", "Ciaran_Clark_259")
new_min <- new_add("DeAndre_Yedlin_310", "DeAndre_Yedlin_253")
new_min <- new_add("Dwight_Gayle_325", "")
new_min <- new_add("Fabian_SchÔøΩr_482", "Fabian_Sch√§r_252")
new_min <- new_add("Federico_FernÔøΩndez_516", "Federico_Fern√°ndez_254")
new_min <- new_add("Florian_Lejeune_314", "Florian_Lejeune_257")
new_min <- new_add("Frederick_Woodman_553", "Frederick_Woodman_264")
new_min <- new_add("Isaac_Hayden_323", "Isaac_Hayden_271")
new_min <- new_add("Jacob_Murphy_321", "Jacob_Murphy_483")
new_min <- new_add("Jamaal_Lascelles_312", "Jamaal_Lascelles_258")
new_min <- new_add("Jamie_Sterry_530", "")
new_min <- new_add("Javier_Manquillo_315", "Javier_Manquillo_256")
new_min <- new_add("Jonjo_Shelvey_318", "Jonjo_Shelvey_269")
new_min <- new_add("Jose Luis_Mato SanmartÔøΩn_327", "Jose Luis_Mato Sanmart√≠n_261")
new_min <- new_add("Karl_Darlow_308", "Karl_Darlow_263")
new_min <- new_add("Martin_Dubravka_309", "Martin_Dubravka_262")
new_min <- new_add("Matt_Ritchie_317", "Matt_Ritchie_251")
new_min <- new_add("Miguel_AlmirÔøΩn_587", "Miguel_Almir√≥n_266")
new_min <- new_add("Mikel_Merino_322", "")
new_min <- new_add("Mohamed_DiamÔøΩ_319", "")
new_min <- new_add("Paul_Dummett_313", "Paul_Dummett_255")
new_min <- new_add("Robert_Elliot_307", "")
new_min <- new_add("Robert Kenedy_Nunes do Nascimento_458", "Robert Kenedy_Nunes do Nascimento_462")
new_min <- new_add("SalomÔøΩn_RondÔøΩn_493", "")
new_min <- new_add("Sean_Longstaff_531", "Sean_Longstaff_270")
new_min <- new_add("Sung-yueng_Ki_324", "Sung-yueng_Ki_268")
new_min <- new_add("Yoshinori_Muto_488", "Yoshinori_Muto_260")

newc <- small %>%
  slice(6673:7212) %>%
  mutate(mins = new_min)


## SOUTHAMPTON ------------------------

sou_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  sou_min <- c(sou_min, mins)
  
}

mccarthy <- raw_2018 %>%
  filter(name == "Alex_McCarthy_328") 
mccarthy2 <- raw_2019 %>%
  filter(name == "Alex_McCarthy_318")

sou_min <- c(mccarthy$minutes, mccarthy2$minutes)

sou_min <- sou_add("Alfie_Jones_595", "")
sou_min <- sou_add("Angus_Gunn_452", "Angus_Gunn_319")
sou_min <- sou_add("Callum_Slattery_570", "Callum_Slattery_327")
sou_min <- sou_add("CÔøΩdric_Soares_332", "C√©dric_Soares_486")
sou_min <- sou_add("Charlie_Austin_348", "Charlie_Austin_312")
sou_min <- sou_add("Danny_Ings_258", "Danny_Ings_313")
sou_min <- sou_add("Fraser_Forster_329", "Fraser_Forster_317")
sou_min <- sou_add("Guido_Carrillo_350", "")
sou_min <- sou_add("Jack_Stephens_333", "Jack_Stephens_308")
sou_min <- sou_add("James_Ward-Prowse_338", "James_Ward-Prowse_321")
sou_min <- sou_add("Jan_Bednarek_335", "Jan_Bednarek_307")
sou_min <- sou_add("Jannik_Vestergaard_463", "Jannik_Vestergaard_304")
sou_min <- sou_add("Joshua_Sims_342", "")
sou_min <- sou_add("Kayne_Ramsay_565", "Kayne_Ramsay_311")
sou_min <- sou_add("Manolo_Gabbiadini_349", "")
sou_min <- sou_add("Mario_Lemina_344", "Mario_Lemina_324")
sou_min <- sou_add("Matt_Targett_479", "Matt_Targett_309")
sou_min <- sou_add("Maya_Yoshida_331", "Maya_Yoshida_310")
sou_min <- sou_add("Michael_Obafemi_550", "Michael_Obafemi_314")
sou_min <- sou_add("Mohamed_Elyounoussi_346", "Mohamed_Elyounoussi_322")
sou_min <- sou_add("Nathan_Redmond_343", "Nathan_Redmond_320")
sou_min <- sou_add("Oriol_Romeu Vidal_339", "Oriol_Romeu Vidal_328")
sou_min <- sou_add("Pierre-Emile_HÔøΩjbjerg_340", "Pierre-Emile_H√∏jbjerg_325")
sou_min <- sou_add("Ryan_Bertrand_330", "Ryan_Bertrand_305")
sou_min <- sou_add("Sam_Gallagher_574", "Sam_Gallagher_316")
sou_min <- sou_add("Sam_McQueen_334", "")
sou_min <- sou_add("Shane_Long_347", "Shane_Long_315")
sou_min <- sou_add("Sofiane_Boufal_341", "Sofiane_Boufal_508")
sou_min <- sou_add("Steven_Davis_337", "")
sou_min <- sou_add("Stuart_Armstrong_345", "Stuart_Armstrong_323")
sou_min <- sou_add("Tyreke_Johnson_562", "Tyreke_Johnson_326")
sou_min <- sou_add("Wesley_Hoedt_336", "Wesley_Hoedt_485")
sou_min <- sou_add("Yan_Valery_556", "Yan_Valery_306")

soton <- small %>%
  slice(7213:7800) %>%
  mutate(mins = sou_min)

## SPURS ------------------------------

spurs_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  spurs_min <- c(spurs_min, mins)
  
}

whiteman <- raw_2018 %>%
  filter(name == "Alfie_Whiteman_538") 
spurs_min <- c(whiteman$minutes)

spurs_min <- spurs_add("Bamidele_Alli_365", "Bamidele_Alli_344")
spurs_min <- spurs_add("Ben_Davies_356", "Ben_Davies_329")
spurs_min <- spurs_add("Christian_Eriksen_364", "Christian_Eriksen_343")
spurs_min <- spurs_add("Danny_Rose_354", "Danny_Rose_332")
spurs_min <- spurs_add("Davinson_SÔøΩnchez_359", "Davinson_S√°nchez_333")
spurs_min <- spurs_add("Eric_Dier_361", "Eric_Dier_350")
spurs_min <- spurs_add("Erik_Lamela_363", "Erik_Lamela_346")
spurs_min <- spurs_add("Fernando_Llorente_371", "")
spurs_min <- spurs_add("Georges-KÔøΩvin_Nkoudou_497", "Georges-K√©vin_Nkoudou_527")
spurs_min <- spurs_add("Harry_Kane_372", "Harry_Kane_338")
spurs_min <- spurs_add("Harry_Winks_368", "Harry_Winks_347")
spurs_min <- spurs_add("Heung-Min_Son_367", "Heung-Min_Son_342")
spurs_min <- spurs_add("Hugo_Lloris_351", "Hugo_Lloris_340")
spurs_min <- spurs_add("Jan_Vertonghen_355", "Jan_Vertonghen_330")
spurs_min <- spurs_add("Juan_Foyth_549", "Juan_Foyth_335")
spurs_min <- spurs_add("Kazaiah_Sterling_578", "")
spurs_min <- spurs_add("Kieran_Trippier_357", "Kieran_Trippier_334")
spurs_min <- spurs_add("Kyle_Walker-Peters_358", "Kyle_Walker-Peters_337")
spurs_min <- spurs_add("Lucas_Rodrigues Moura da Silva_370", "Lucas_Rodrigues Moura da Silva_345")
spurs_min <- spurs_add("Luke_Amos_523", "Luke_Amos_351")
spurs_min <- spurs_add("Michel_Vorm_352", "")
spurs_min <- spurs_add("Mousa_DembÔøΩlÔøΩ_362", "")
spurs_min <- spurs_add("Moussa_Sissoko_369", "Moussa_Sissoko_349")
spurs_min <- spurs_add("Oliver_Skipp_540", "Oliver_Skipp_352")
spurs_min <- spurs_add("Paulo_Gazzaniga_536", "Paulo_Gazzaniga_341")
spurs_min <- spurs_add("Serge_Aurier_360", "Serge_Aurier_336")
spurs_min <- spurs_add("Timothy_Eyoma_561", "")
spurs_min <- spurs_add("Toby_Alderweireld_353", "Toby_Alderweireld_331")
spurs_min <- spurs_add("Victor_Wanyama_366", "Victor_Wanyama_348")

spurs <- small %>%
  slice(7801:8316) %>%
  mutate(mins = spurs_min)


## WATFORD -------------------------------

wat_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  wat_min <- c(wat_min, mins)
  
}

doucoure <- raw_2018 %>%
  filter(name == "Abdoulaye_DoucourÔøΩ_390") 
doucoure2 <- raw_2019 %>%
  filter(name == "Abdoulaye_Doucour√©_368")
wat_min <- c(doucoure$minutes, doucoure2$minutes)

wat_min <- wat_add("Adalberto_PeÔøΩaranda_554", "")
wat_min <- wat_add("Adam_Masina_386", "Adam_Masina_355")
wat_min <- wat_add("Adrian_Mariappa_382", "Adrian_Mariappa_356")
wat_min <- wat_add("Andre_Gray_395", "Andre_Gray_364")
wat_min <- wat_add("Ben_Foster_445", "Ben_Foster_366")
wat_min <- wat_add("Ben_Wilmot_544", "")
wat_min <- wat_add("Christian_Kabasele_380", "Christian_Kabasele_354")
wat_min <- wat_add("Craig_Cathcart_376", "Craig_Cathcart_358")
wat_min <- wat_add("Daryl_Janmaat_381", "Daryl_Janmaat_359")
wat_min <- wat_add("Domingos_Quina_517", "Domingos_Quina_375")
wat_min <- wat_add("Etienne_Capoue_389", "Etienne_Capoue_373")
wat_min <- wat_add("Francisco_FemenÔøΩa Far_383", "Francisco_Femen√≠a Far_357")
wat_min <- wat_add("Gerard_Deulofeu_394", "Gerard_Deulofeu_363")
wat_min <- wat_add("Heurelho_Gomes_373", "")
wat_min <- wat_add("Isaac_Success Ajayi_524", "Isaac_Success Ajayi_365")
wat_min <- wat_add("Jerome_Sinclair_398", "")
wat_min <- wat_add("JosÔøΩ_Holebas_378", "Jos√©_Holebas_353")
wat_min <- wat_add("Ken_Sema_446", "Ken_Sema_372")
wat_min <- wat_add("Marc_Navarro_385", "Marc_Navarro_360")
wat_min <- wat_add("Marvin_Zeegelaar_384", "")
wat_min <- wat_add("Miguel_Britos_379", "")
wat_min <- wat_add("Nathaniel_Chalobah_387", "Nathaniel_Chalobah_374")
wat_min <- wat_add("Pontus_Dahlberg_374", "Pontus_Dahlberg_367")
wat_min <- wat_add("Roberto_Pereyra_391", "Roberto_Pereyra_369")
wat_min <- wat_add("Sebastian_PrÔøΩdl_377", "Sebastian_Pr√∂dl_361")
wat_min <- wat_add("Stefano_Okaka_397", "")
wat_min <- wat_add("Tom_Cleverley_388", "Tom_Cleverley_371")
wat_min <- wat_add("Troy_Deeney_396", "Troy_Deeney_362")
wat_min <- wat_add("Will_Hughes_392", "Will_Hughes_370")
wat_min <- wat_add("Younes_Kaboul_375", "")

watford <- small %>%
  slice(8317:8842) %>%
  mutate(mins = wat_min)

## WEST HAM ------------------------------

wham_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  wham_min <- c(wham_min, mins)
  
}

cresswell <- raw_2018 %>%
  filter(name == "Aaron_Cresswell_402") 
cresswell2 <- raw_2019 %>%
  filter(name == "Aaron_Cresswell_376")
wham_min <- c(cresswell$minutes, cresswell2$minutes)

wham_min <- wham_add("AdriÔøΩn_San Miguel del Castillo_399", "Adri√°n_San Miguel del Castillo_526")
wham_min <- wham_add("Alexandre Nascimento_Costa Silva_560", "Alexandre Nascimento_Costa Silva_387")
wham_min <- wham_add("Andriy_Yarmolenko_453", "Andriy_Yarmolenko_392")
wham_min <- wham_add("Andy_Carroll_418", "Andy_Carroll_520")
wham_min <- wham_add("Angelo_Ogbonna_403", "Angelo_Ogbonna_377")
wham_min <- wham_add("Arthur_Masuaku_410", "Arthur_Masuaku_378")
wham_min <- wham_add("Carlos_SÔøΩnchez_518", "Carlos_S√°nchez_397")
wham_min <- wham_add("Conor_Coventry_548", "")
wham_min <- wham_add("Declan_Rice_406", "Declan_Rice_395")
wham_min <- wham_add("Edimilson_Fernandes_416", "")
wham_min <- wham_add("FabiÔøΩn_Balbuena_464", "Fabi√°n_Balbuena_382")
wham_min <- wham_add("Felipe Anderson_Pereira Gomes_465", "Felipe Anderson_Pereira Gomes_390")
wham_min <- wham_add("Grady_Diangana_539", "Grady_Diangana_398")
wham_min <- wham_add("Issa_Diop_409", "Issa_Diop_381")
wham_min <- wham_add("Jack_Wilshere_447", "Jack_Wilshere_394")
wham_min <- wham_add("Javier_HernÔøΩndez BalcÔøΩzar_419", "Javier_Hern√°ndez Balc√°zar_386")
wham_min <- wham_add("Joe_Powell_547", "")
wham_min <- wham_add("Jordan_Hugill_420", "")
wham_min <- wham_add("Lucas_PÔøΩrez_502", "")
wham_min <- wham_add("Lukasz_Fabianski_400", "Lukasz_Fabianski_388")
wham_min <- wham_add("Manuel_Lanzini_414", "Manuel_Lanzini_391")
wham_min <- wham_add("Mark_Noble_411", "Mark_Noble_396")
wham_min <- wham_add("Marko_Arnautovic_417", "Marko_Arnautovic_385")
wham_min <- wham_add("Michail_Antonio_415", "Michail_Antonio_389")
wham_min <- wham_add("Pablo_Zabaleta_405", "Pablo_Zabaleta_379")
wham_min <- wham_add("Pedro_Obiang_413", "Pedro_Obiang_400")
wham_min <- wham_add("Reece_Oxford_407", "")
wham_min <- wham_add("Robert_Snodgrass_489", "Robert_Snodgrass_393")
wham_min <- wham_add("Ryan_Fredericks_408", "Ryan_Fredericks_380")
wham_min <- wham_add("Sam_Byram_404", "Sam_Byram_454")
wham_min <- wham_add("Samir_Nasri_569", "")
wham_min <- wham_add("Winston_Reid_401", "Winston_Reid_383")

wham <- small %>%
  slice(8843:9408) %>%
  mutate(mins = wham_min)

## WOLVES ---------------------------------

wol_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  wol_min <- c(wol_min, mins)
  
}

traore <- raw_2018 %>%
  filter(name == "Adama_TraorÔøΩ_500") 
traore2 <- raw_2019 %>%
  filter(name == "Adama_Traor√©_417")
wol_min <- c(traore$minutes, traore2$minutes)

wol_min <- wol_add("Barry_Douglas_424", "")
wol_min <- wol_add("Bonatini Lohner Maia_Bonatini_438", "")
wol_min <- wol_add("Bright_Enobakhare_436", "")
wol_min <- wol_add("Cameron_John_596", "")
wol_min <- wol_add("Conor_Coady_430", "Conor_Coady_403")
wol_min <- wol_add("Danny_Batth_428", "")
wol_min <- wol_add("Diogo_Jota_432", "Diogo_Jota_410")
wol_min <- wol_add("HÔøΩlder_Costa_435", "H√©lder_Costa_418")
wol_min <- wol_add("Ivan_Cavaleiro_434", "Ivan_Cavaleiro_419")
wol_min <- wol_add("JoÔøΩo Filipe Iria_Santos Moutinho_475", "Jo√£o Filipe Iria_Santos Moutinho_415")
wol_min <- wol_add("John_Ruddy_421", "John_Ruddy_412")
wol_min <- wol_add("Jonathan_Castro Otto_483", "Jonathan_Castro Otto_402")
wol_min <- wol_add("Kortney_Hause_525", "Kortney_Hause_25")
wol_min <- wol_add("Leander_Dendoncker_519", "Leander_Dendoncker_420")
wol_min <- wol_add("Matt_Doherty_425", "Matt_Doherty_401")
wol_min <- wol_add("Max_Kilman_567", "Max_Kilman_408")
wol_min <- wol_add("Morgan_Gibbs-White_448", "Morgan_Gibbs-White_416")
wol_min <- wol_add("Rafa_Mir_449", "")
wol_min <- wol_add("RaÔøΩl_JimÔøΩnez_437", "Ra√∫l_Jim√©nez_409")
wol_min <- wol_add("Roderick Jefferson_GonÔøΩalves Miranda_429", "")
wol_min <- wol_add("Romain_SaÔøΩss_426", "Romain_Sa√Øss_407")
wol_min <- wol_add("RÔøΩben Diogo_da Silva Neves_433", "R√∫ben Diogo_da Silva Neves_414")
wol_min <- wol_add("RÔøΩben GonÔøΩalo_Silva Nascimento Vinagre_431", "R√∫ben Gon√ßalo_Silva Nascimento Vinagre_406")
wol_min <- wol_add("Rui Pedro_dos Santos PatrÔøΩcio_454", "Rui Pedro_dos Santos Patr√≠cio_411")
wol_min <- wol_add("Ryan_Bennett_427", "Ryan_Bennett_404")
wol_min <- wol_add("Ryan John_Giles_555", "")
wol_min <- wol_add("Will_Norris_422", "Will_Norris_413")
wol_min <- wol_add("Willy_Boly_423", "Willy_Boly_405")

wolves <- small %>%
  slice(9409:9898) %>%
  mutate(mins = wol_min)


## RANDOMS AND PROMOTEDS -----------------

rest_add <- function(name1, name2) {
  one <- filter(raw_2018, name == name1)
  two <- filter(raw_2019, name == name2)
  
  mins <- c(one$minutes, two$minutes)
  
  rest_min <- c(rest_min, mins)
  
}

taylor <- raw_2018 %>%
  filter(name == "Kyle_Taylor_600") 

rest_min <- c(taylor$minutes)

rest_min <- rest_add("Sam_Surridge_599", "Sam_Surridge_71")
rest_min <- rest_add("Joel_Coleman_598", "")
rest_min <- rest_add("Demeaco_Duhaney_601", "")
rest_min <- rest_add("Philippe_Sandler_604", "")
rest_min <- rest_add("James_Garner_602", "James_Garner_250")
rest_min <- rest_add("Tahith_Chong_603", "Tahith_Chong_249")
rest_min <- rest_add("Ben_Johnson_605", "Ben_Johnson_384")
rest_min <- rest_add("Matthew_Daly_606", "")
rest_min <- rest_add("Aaron_Rowe_607", "")
rest_min <- rest_add("Mason_Greenwood_608", "Mason_Greenwood_234")
rest_min <- rest_add("Sam_Woods_609", "")
rest_min <- rest_add("Harvey_Elliott_610", "")
rest_min <- rest_add("George_Marsh_612", "")
rest_min <- rest_add("Nathan_Holland_611", "")
rest_min <- rest_add("Nnamdi_Ofoborh_613", "")
rest_min <- rest_add("Vincent_Janssen_614", "Vincent_Janssen_339")
rest_min <- rest_add("Anthony_Driscoll-Glennon_615", "")
rest_min <- rest_add("Mark_Travers_616", "Mark_Travers_74")
rest_min <- rest_add("Matt_Butcher_620", "")
rest_min <- rest_add("Jayson_Molumby_617", "")
rest_min <- rest_add("Addji Keaninkin Marc-Israel_Guehi_624", "")
rest_min <- rest_add("Luke_Dreher_618", "Luke_Dreher_140")
rest_min <- rest_add("Nikola_Tavares_619", "")
rest_min <- rest_add("Luca_De La Torre_621", "")
rest_min <- rest_add("Kelland_Watts_622", "")
rest_min <- rest_add("Lewis_Cass_623", "")
rest_min <- rest_add("", "Allan_Saint-Maximin_500")
rest_min <- rest_add("", "Emil_Krafth_519")
rest_min <- rest_add("", "Jack_Colback_482")
rest_min <- rest_add("", "Jetro_Willems_498")
rest_min <- rest_add("", "Joelinton C√°ssio_Apolin√°rio de Lira_466")
rest_min <- rest_add("", "Rolando_Aarons_499")
rest_min <- rest_add("", "Giovani_Lo Celso_523")
rest_min <- rest_add("", "Tanguy_Ndombele_442")
rest_min <- rest_add("", "Troy_Parrott_509")
rest_min <- rest_add("", "Ben_Osborn_472")
rest_min <- rest_add("", "Billy_Sharp_298")
rest_min <- rest_add("", "Callum_Robinson_453")
rest_min <- rest_add("", "Chris_Basham_423")
rest_min <- rest_add("", "David_McGoldrick_303")
rest_min <- rest_add("", "Dean_Henderson_471")
rest_min <- rest_add("", "Enda_Stevens_291")
rest_min <- rest_add("", "George_Baldock_294")
rest_min <- rest_add("", "Jack_O'Connell_293")
rest_min <- rest_add("", "Jake_Eastwood_299")
rest_min <- rest_add("", "John_Egan_295")
rest_min <- rest_add("", "John_Fleck_301")
rest_min <- rest_add("", "John_Lundstram_297")
rest_min <- rest_add("", "Kieron_Freeman_292")
rest_min <- rest_add("", "Luke_Freeman_441")
rest_min <- rest_add("", "Mark_Duffy_300")
rest_min <- rest_add("", "Michael_Verrips_521")
rest_min <- rest_add("", "Muhamed_Be≈°iƒá_522")
rest_min <- rest_add("", "Oliver_McBurnie_501")
rest_min <- rest_add("", "Oliver_Norwood_302")
rest_min <- rest_add("", "Ravel_Morrison_456")
rest_min <- rest_add("", "Richard_Stearman_296")
rest_min <- rest_add("", "Simon_Moore_436")
rest_min <- rest_add("", "Craig_Dawson_439")
rest_min <- rest_add("", "Heurelho da Silva_Gomes_513")
rest_min <- rest_add("", "Isma√Øla_Sarr_525")
rest_min <- rest_add("", "Che_Adams_437")
rest_min <- rest_add("", "Moussa_Djenepo_438")
rest_min <- rest_add("", "Axel_Tuanzebe_481")
rest_min <- rest_add("", "Daniel_James_243")
rest_min <- rest_add("", "David_de Gea_235")
rest_min <- rest_add("", "Djibril_Sidib√©_511")
rest_min <- rest_add("", "Jean-Philippe_Gbamin_497")
rest_min <- rest_add("", "Lewis_Gibson_477")
rest_min <- rest_add("", "Moise_Kean_496")
rest_min <- rest_add("", "Jes√∫s_Vallejo L√°zaro_473")
rest_min <- rest_add("", "Patrick_Cutrone_487")
rest_min <- rest_add("", "Pedro_Lomba Neto_528")
rest_min <- rest_add("", "Alexander_Tettey_289")
rest_min <- rest_add("", "Ben_Godfrey_273")
rest_min <- rest_add("", "Christoph_Zimmermann_275")
rest_min <- rest_add("", "Dennis_Srbeny_279")
rest_min <- rest_add("", "Emiliano_Buend√≠a_283")
rest_min <- rest_add("", "Grant_Hanley_277")
rest_min <- rest_add("", "Ibrahim_Amadou_507")
rest_min <- rest_add("", "Jamal_Lewis_276")
rest_min <- rest_add("", "Josip_Drmic_434")
rest_min <- rest_add("", "Kenny_McLean_286")
rest_min <- rest_add("", "Marco_Stiepermann_285")
rest_min <- rest_add("", "Mario_Vrancic_282")
rest_min <- rest_add("", "Maximillian_Aarons_274")
rest_min <- rest_add("", "Michael_McGovern_281")
rest_min <- rest_add("", "Moritz_Leitner_288")
rest_min <- rest_add("", "Onel_Hern√°ndez_284")
rest_min <- rest_add("", "Patrick_Roberts_435")
rest_min <- rest_add("", "Philip_Heise_484")
rest_min <- rest_add("", "Ralf_Fahrmann_449")
rest_min <- rest_add("", "Teemu_Pukki_278")
rest_min <- rest_add("", "Timm_Klose_272")
rest_min <- rest_add("", "Tim_Krul_280")
rest_min <- rest_add("", "Todd_Cantwell_287")
rest_min <- rest_add("", "Tom_Trybull_290")
rest_min <- rest_add("", "Albian_Ajeti_514")
rest_min <- rest_add("", "Pablo_Fornals_399")
rest_min <- rest_add("", "Roberto_Jimenez Gago_450")
rest_min <- rest_add("", "S√©bastien_Haller_457")
rest_min <- rest_add("", "Christian_Pulisic_431")
rest_min <- rest_add("", "Fikayo_Tomori_529")
rest_min <- rest_add("", "Mason_Mount_463")
rest_min <- rest_add("", "Reece_James_506")
rest_min <- rest_add("", "Daniel_Ceballos Fern√°ndez_469")
rest_min <- rest_add("", "Gabriel Teodoro_Martinelli Silva_504")
rest_min <- rest_add("", "Kieran_Tierney_515")
rest_min <- rest_add("", "Nicolas_P√©p√©_488")
rest_min <- rest_add("", "Rhian_Brewster_464")
rest_min <- rest_add("", "Aaron_Ramsdale_494")
rest_min <- rest_add("", "Arnaut_Danjuma Groeneveld_492")
rest_min <- rest_add("", "Harry_Wilson_505")
rest_min <- rest_add("", "Jack_Stacey_446")
rest_min <- rest_add("", "Lloyd_Kelly_64")
rest_min <- rest_add("", "Bailey_Peacock-Farrell_495")
rest_min <- rest_add("", "Erik_Pieters_447")
rest_min <- rest_add("", "Jay_Rodriguez_451")
rest_min <- rest_add("", "Ahmed_El Mohamady_22")
rest_min <- rest_add("", "Andre_Green_32")
rest_min <- rest_add("", "Anwar_El Ghazi_30")
rest_min <- rest_add("", "Birkir_Bjarnason_33")
rest_min <- rest_add("", "Bjorn_Engels_455")
rest_min <- rest_add("", "Conor_Hourihane_28")
rest_min <- rest_add("", "Douglas Luiz_Soares de Paulo_470")
rest_min <- rest_add("", "Ezri_Konsa Ngoyo_452")
rest_min <- rest_add("", "Fr√©d√©ric_Guilbert_458")
rest_min <- rest_add("", "Henri_Lansbury_35")
rest_min <- rest_add("", "Jack_Grealish_29")
rest_min <- rest_add("", "James_Chester_23")
rest_min <- rest_add("", "Jed_Steer_429")
rest_min <- rest_add("", "John_McGinn_31")
rest_min <- rest_add("", "Jonathan_Kodjia_26")
rest_min <- rest_add("", "Jos√© Ignacio_Peleteiro Romallo_36")
rest_min <- rest_add("", "Keinan_Davis_34")
rest_min <- rest_add("", "Lovre_Kalinic_474")
rest_min <- rest_add("", "Mahmoud Ahmed_Ibrahim Hassan_465")
rest_min <- rest_add("", "Marvelous_Nakamba_491")
rest_min <- rest_add("", "Neil_Taylor_24")
rest_min <- rest_add("", "Wesley_Moraes_428")
rest_min <- rest_add("", "√òrjan_Nyland_27")
rest_min <- rest_add("", "Adam_Webster_493")
rest_min <- rest_add("", "Leandro_Trossard_421")
rest_min <- rest_add("", "Matthew_Clarke_43")
rest_min <- rest_add("", "Neal_Maupay_502")
rest_min <- rest_add("", "Jos√© √Ångel_Esmor√≠s Tasende_440")
rest_min <- rest_add("", "Jo√£o Pedro Cavaco_Cancelo_518")
rest_min <- rest_add("", "Rodrigo_Hernandez_443")
rest_min <- rest_add("", "Andy_King_480")
rest_min <- rest_add("", "Danny_Ward_170")
rest_min <- rest_add("", "Dennis_Praet_517")
rest_min <- rest_add("", "James_Justin_433")
rest_min <- rest_add("", "Kevin_Danso_532")
rest_min <- rest_add("", "Andy_Lonergan_530")
rest_min <- rest_add("", "Caoimhin_Kelleher_531")
rest_min <- rest_add("", "Aaron_Connolly_534")
rest_min <- rest_add("", "Daniel_N'Lundulu_535")
rest_min <- rest_add("", "Billy_Gilmour_533")

rest <- small %>%
  slice(9899:10612) %>%
  mutate(mins = rest_min)



## SAVE ALL -------------------------------

all_teams <- rbind(arsenal,
                   bmth,
                   brighton,
                   burnley,
                   cardiff,
                   chelsea,
                   palace,
                   everton,
                   fulham,
                   hudders,
                   leic,
                   pool,
                   city,
                   utd,
                   newc,
                   soton,
                   spurs,
                   watford,
                   wham,
                   wolves,
                   rest
)

all_min <- c(ars_min,
             bourn_min,
             bri_min,
             bur_min,
             car_min,
             che_min,
             cry_min,
             eve_min)

fpl_min <- fpl_all %>%
  arrange(player) %>%
  cbind(all_teams$mins) %>%
  rename(minutes = `all_teams$mins`)

fpl_all <- fpl_min

save(fpl_all, file = here::here("data", "fpl_all.rda"))




two_teams <- fpl_all %>%
  group_by(player) %>%
  filter(length(unique(team)) > 1) %>%
  mutate(team_1 = unique(team)[[1]]) %>%
  mutate(team_2 = unique(team)[[2]]) 


fpl_all <- fpl_all %>%
  group_by(player) %>%
  mutate(team_1 = case_when(length(unique(team)) > 1 ~
                              unique(team)[[1]],
                            TRUE ~ team))

fpl_all <- fpl_all %>%
  group_by(player) %>%
  mutate(team_2 = case_when(length(unique(team)) > 1 ~
                              unique(team)[2],
                            TRUE ~ team))




two_teams$player <- two_teams %>%
  group_by(player) %>%
  unique(team)[2]
