#!/bin/bash

TMP=$(mktemp)
trap 'rm -f "$TMP"; clear' EXIT

ORG=""
EVENT=""
STATE=""
COUNTY=""
DURATION=""
JULIAN=""
UTCTIME=""
CALLSIGN=""

while true; do
  dialog \
  --clear \
  --nocancel \
  --extra-button \
  --extra-label "Exit" \
  --title "Custom United States of America Emergency Alert System Builder" \
  --menu "" 20 80 10 \
    1 "Originator [${ORG:-unset}]" \
    2 "Event Code [${EVENT:-unset}]" \
    3 "State [${STATE:-unset}]" \
    4 "County [${COUNTY:-unset}]" \
    5 "Duration [${DURATION:-unset}]" \
    6 "Date [${JULIAN:-unset}]" \
    7 "Time [${UTCTIME:-unset}]" \
    8 "Station Call Sign [${CALLSIGN:-unset}]" \
    9 "Show SAME Header" \
    0 "Play EAS" \
    2>"$TMP"

  ret=$?

  if [ $ret -eq 3 ]; then
    clear
    exit 0
  fi

  CHOICE=$(<"$TMP")

  case "$CHOICE" in
    1)
      dialog --menu "Choose originator:" 10 40 2 \
        WXR "National Weather Service" \
        CIV "Civil Authority" 2>"$TMP"
      ORG=$(<"$TMP")
      ;;
    2)
      dialog --menu "Choose event code:" 15 50 6 \
        TOR "Tornado Warning" \
        SVR "Severe Thunderstorm" \
        FFW "Flash Flood Warning" \
        EVI "Evacuation Immediate" \
        HMW "Hazardous Materials" \
        TST "Test Message" 2>"$TMP"
      EVENT=$(<"$TMP")
      ;;
    3)
      dialog --menu "Choose state:" 20 50 10 \
        01 "Alabama" \
        02 "Alaska" \
        04 "Arizona" \
        05 "Arkansas" \
        06 "California" \
        08 "Colorado" \
        09 "Connecticut" \
        10 "Delaware" \
        11 "DC" \
        12 "Florida" \
        13 "Georgia" \
        15 "Hawaii" \
        16 "Idaho" \
        17 "Illinois" \
        18 "Indiana" \
        19 "Iowa" \
        20 "Kansas" \
        21 "Kentucky" \
        22 "Louisiana" \
        23 "Maine" \
        24 "Maryland" \
        25 "Massachusetts" \
        26 "Michigan" \
        27 "Minnesota" \
        28 "Mississippi" \
        29 "Missouri" \
        30 "Montana" \
        31 "Nebraska" \
        32 "Nevada" \
        33 "New Hampshire" \
        34 "New Jersey" \
        35 "New Mexico" \
        36 "New York" \
        37 "North Carolina" \
        38 "North Dakota" \
        39 "Ohio" \
        40 "Oklahoma" \
        41 "Oregon" \
        42 "Pennsylvania" \
        44 "Rhode Island" \
        45 "South Carolina" \
        46 "South Dakota" \
        47 "Tennessee" \
        48 "Texas" \
        49 "Utah" \
        50 "Vermont" \
        51 "Virginia" \
        53 "Washington" \
        54 "West Virginia" \
        55 "Wisconsin" \
        56 "Wyoming" \
        60 "American Samoa" \
        66 "Guam" \
        69 "Northern Mariana Islands" \
        72 "Puerto Rico" \
        78 "U.S. Virgin Islands" \
        2>"$TMP"
  
        STATE=$(<"$TMP")
      ;;
    4)
      dialog --menu "Choose county:" 20 50 10 \
      045001 "Abbeville" \
      022001 "Acadia" \
      051001 "Accomack" \
      016001 "Ada" \
      019001 "Adair" \
      021001 "Adair" \
      029001 "Adair" \
      040001 "Adair" \
      008001 "Adams" \
      016003 "Adams" \
      017001 "Adams" \
      018001 "Adams" \
      019003 "Adams" \
      028001 "Adams" \
      031001 "Adams" \
      038001 "Adams" \
      039001 "Adams" \
      042001 "Adams" \
      053001 "Adams" \
      055001 "Adams" \
      050001 "Addison" \
      072001 "Adjuntas" \
      072003 "Aguada" \
      072005 "Aguadilla" \
      072007 "Aguas Buenas" \
      072009 "Aibonito" \
      045003 "Aiken" \
      068007 "Ailinginae" \
      068010 "Ailinglaplap" \
      068030 "Ailuk" \
      070002 "Aimeliik" \
      070004 "Airai" \
      027001 "Aitkin" \
      012001 "Alachua" \
      037001 "Alamance" \
      006001 "Alameda" \
      008003 "Alamosa" \
      036001 "Albany" \
      056001 "Albany" \
      051003 "Albemarle" \
      026001 "Alcona" \
      028003 "Alcorn" \
      002013 "Aleutians East" \
      002016 "Aleutians West" \
      017003 "Alexander" \
      037003 "Alexander" \
      051510 "Alexandria (city)" \
      040003 "Alfalfa" \
      026003 "Alger" \
      019005 "Allamakee" \
      026005 "Allegan" \
      024001 "Allegany" \
      036003 "Allegany" \
      037005 "Alleghany" \
      051005 "Alleghany" \
      042003 "Allegheny" \
      018003 "Allen" \
      020001 "Allen" \
      021003 "Allen" \
      022003 "Allen" \
      039003 "Allen" \
      045005 "Allendale" \
      026007 "Alpena" \
      006003 "Alpine" \
      006005 "Amador" \
      051007 "Amelia" \
      051009 "Amherst" \
      028005 "Amite" \
      072011 "Anasco" \
      002020 "Anchorage" \
      020003 "Anderson" \
      021005 "Anderson" \
      045007 "Anderson" \
      047001 "Anderson" \
      048001 "Anderson" \
      029003 "Andrew" \
      048003 "Andrews" \
      023001 "Androscoggin" \
      070010 "Angaur" \
      048005 "Angelina" \
      024003 "Anne Arundel" \
      027003 "Anoka" \
      037007 "Anson" \
      031003 "Antelope" \
      026009 "Antrim" \
      004001 "Apache" \
      019007 "Appanoose" \
      013001 "Appling" \
      051011 "Appomattox" \
      048007 "Aransas" \
      008005 "Arapahoe" \
      048009 "Archer" \
      008007 "Archuleta" \
      072013 "Arecibo" \
      026011 "Arenac" \
      005001 "Arkansas" \
      051013 "Arlington" \
      042005 "Armstrong" \
      048011 "Armstrong" \
      068040 "Arno" \
      023003 "Aroostook" \
      072015 "Arroyo" \
      031005 "Arthur" \
      022005 "Ascension" \
      037009 "Ashe" \
      039005 "Ashland" \
      055003 "Ashland" \
      005003 "Ashley" \
      039007 "Ashtabula" \
      053003 "Asotin" \
      022007 "Assumption" \
      048013 "Atascosa" \
      020005 "Atchison" \
      029005 "Atchison" \
      039009 "Athens" \
      013003 "Atkinson" \
      034001 "Atlantic" \
      040005 "Atoka" \
      028007 "Attala" \
      029007 "Audrain" \
      019009 "Audubon" \
      039011 "Auglaize" \
      051015 "Augusta" \
      068050 "Aur" \
      046003 "Aurora" \
      048015 "Austin" \
      001001 "Autauga" \
      037011 "Avery" \
      022009 "Avoyelles" \
      008009 "Baca" \
      013005 "Bacon" \
      048017 "Bailey" \
      012003 "Baker" \
      013007 "Baker" \
      041001 "Baker" \
      074050 "Baker Island" \
      001003 "Baldwin" \
      013009 "Baldwin" \
      021007 "Ballard" \
      024005 "Baltimore" \
      024510 "Baltimore (city)" \
      045009 "Bamberg" \
      048019 "Bandera" \
      013011 "Banks" \
      031007 "Banner" \
      016005 "Bannock" \
      026013 "Baraga" \
      020007 "Barber" \
      001005 "Barbour" \
      054001 "Barbour" \
      072017 "Barceloneta" \
      038003 "Barnes" \
      025001 "Barnstable" \
      045011 "Barnwell" \
      072019 "Barranquitas" \
      021009 "Barren" \
      055005 "Barron" \
      013013 "Barrow" \
      026015 "Barry" \
      029009 "Barry" \
      018005 "Bartholomew" \
      020009 "Barton" \
      029011 "Barton" \
      013015 "Bartow" \
      048021 "Bastrop" \
      029013 "Bates" \
      021011 "Bath" \
      051017 "Bath" \
      005005 "Baxter" \
      012005 "Bay" \
      026017 "Bay" \
      072021 "Bayamo'n" \
      055007 "Bayfield" \
      048023 "Baylor" \
      046005 "Beadle" \
      016007 "Bear Lake" \
      037013 "Beaufort" \
      045013 "Beaufort" \
      022011 "Beauregard" \
      040007 "Beaver" \
      042007 "Beaver" \
      049001 "Beaver" \
      030001 "Beaverhead" \
      027005 "Becker" \
      040009 "Beckham" \
      042009 "Bedford" \
      047003 "Bedford" \
      051019 "Bedford" \
      051515 "Bedford (city)" \
      048025 "Bee" \
      033001 "Belknap" \
      021013 "Bell" \
      048027 "Bell" \
      039013 "Belmont" \
      027007 "Beltrami" \
      013017 "Ben Hill" \
      016009 "Benewah" \
      046007 "Bennett" \
      050003 "Bennington" \
      038005 "Benson" \
      008011 "Bent" \
      005007 "Benton" \
      018007 "Benton" \
      019011 "Benton" \
      027009 "Benton" \
      028009 "Benton" \
      029015 "Benton" \
      041003 "Benton" \
      047005 "Benton" \
      053005 "Benton" \
      026019 "Benzie" \
      034003 "Bergen" \
      045015 "Berkeley" \
      054003 "Berkeley" \
      042011 "Berks" \
      025003 "Berkshire" \
      035001 "Bernalillo" \
      013019 "Berrien" \
      026021 "Berrien" \
      037015 "Bertie" \
      002050 "Bethel" \
      048029 "Bexar" \
      001007 "Bibb" \
      013021 "Bibb" \
      022013 "Bienville" \
      030003 "Big Horn" \
      056003 "Big Horn" \
      027011 "Big Stone" \
      068060 "Bikar" \
      068070 "Bikini" \
      038007 "Billings" \
      016011 "Bingham" \
      019013 "Black Hawk" \
      018009 "Blackford" \
      037017 "Bladen" \
      016013 "Blaine" \
      030005 "Blaine" \
      031009 "Blaine" \
      040011 "Blaine" \
      042013 "Blair" \
      048031 "Blanco" \
      051021 "Bland" \
      013023 "Bleckley" \
      047007 "Bledsoe" \
      001009 "Blount" \
      047009 "Blount" \
      027013 "Blue Earth" \
      016015 "Boise" \
      068073 "Bokak" \
      028011 "Bolivar" \
      029017 "Bollinger" \
      046009 "Bon Homme" \
      017005 "Bond" \
      016017 "Bonner" \
      016019 "Bonneville" \
      005009 "Boone" \
      017007 "Boone" \
      018011 "Boone" \
      019015 "Boone" \
      021015 "Boone" \
      029019 "Boone" \
      031011 "Boone" \
      054005 "Boone" \
      048033 "Borden" \
      048035 "Bosque" \
      022015 "Bossier" \
      051023 "Botetourt" \
      038009 "Bottineau" \
      008013 "Boulder" \
      016021 "Boundary" \
      020011 "Bourbon" \
      021017 "Bourbon" \
      048037 "Bowie" \
      038011 "Bowman" \
      031013 "Box Butte" \
      049003 "Box Elder" \
      021019 "Boyd" \
      031015 "Boyd" \
      021021 "Boyle" \
      021023 "Bracken" \
      012007 "Bradford" \
      042015 "Bradford" \
      005011 "Bradley" \
      047011 "Bradley" \
      026023 "Branch" \
      013025 "Brantley" \
      054007 "Braxton" \
      048039 "Brazoria" \
      048041 "Brazos" \
      021025 "Breathitt" \
      021027 "Breckinridge" \
      019017 "Bremer" \
      012009 "Brevard" \
      048043 "Brewster" \
      048045 "Briscoe" \
      025005 "Bristol" \
      044001 "Bristol" \
      051520 "Bristol (city)" \
      002060 "Bristol Bay" \
      030007 "Broadwater" \
      036005 "Bronx" \
      054009 "Brooke" \
      046011 "Brookings" \
      013027 "Brooks" \
      048047 "Brooks" \
      036007 "Broome" \
      008014 "Broomfield" \
      012011 "Broward" \
      017009 "Brown" \
      018013 "Brown" \
      020013 "Brown" \
      027015 "Brown" \
      031017 "Brown" \
      039015 "Brown" \
      046013 "Brown" \
      048049 "Brown" \
      055009 "Brown" \
      046015 "Brule" \
      037019 "Brunswick" \
      051025 "Brunswick" \
      013029 "Bryan" \
      040013 "Bryan" \
      019019 "Buchanan" \
      029021 "Buchanan" \
      051027 "Buchanan" \
      051029 "Buckingham" \
      042017 "Bucks" \
      019021 "Buena Vista" \
      051530 "Buena Vista (city)" \
      031019 "Buffalo" \
      046017 "Buffalo" \
      055011 "Buffalo" \
      021029 "Bullitt" \
      013031 "Bulloch" \
      001011 "Bullock" \
      037021 "Buncombe" \
      017011 "Bureau" \
      013033 "Burke" \
      037023 "Burke" \
      038013 "Burke" \
      038015 "Burleigh" \
      048051 "Burleson" \
      034005 "Burlington" \
      048053 "Burnet" \
      055013 "Burnett" \
      031021 "Burt" \
      001013 "Butler" \
      019023 "Butler" \
      020015 "Butler" \
      021031 "Butler" \
      029023 "Butler" \
      031023 "Butler" \
      039017 "Butler" \
      042019 "Butler" \
      006007 "Butte" \
      016023 "Butte" \
      046019 "Butte" \
      013035 "Butts" \
      037025 "Cabarrus" \
      054011 "Cabell" \
      072023 "Cabo Rojo" \
      049005 "Cache" \
      022017 "Caddo" \
      040015 "Caddo" \
      072025 "Caguas" \
      006009 "Calaveras" \
      022019 "Calcasieu" \
      021033 "Caldwell" \
      022021 "Caldwell" \
      029025 "Caldwell" \
      037027 "Caldwell" \
      048055 "Caldwell" \
      050005 "Caledonia" \
      001015 "Calhoun" \
      005013 "Calhoun" \
      012013 "Calhoun" \
      013037 "Calhoun" \
      017013 "Calhoun" \
      019025 "Calhoun" \
      026025 "Calhoun" \
      028013 "Calhoun" \
      045017 "Calhoun" \
      048057 "Calhoun" \
      054013 "Calhoun" \
      048059 "Callahan" \
      029027 "Callaway" \
      021035 "Calloway" \
      055015 "Calumet" \
      024009 "Calvert" \
      016025 "Camas" \
      042021 "Cambria" \
      013039 "Camden" \
      029029 "Camden" \
      034007 "Camden" \
      037029 "Camden" \
      022023 "Cameron" \
      042023 "Cameron" \
      048061 "Cameron" \
      048063 "Camp" \
      021037 "Campbell" \
      046021 "Campbell" \
      047013 "Campbell" \
      051031 "Campbell" \
      056005 "Campbell" \
      072027 "Camuy" \
      040017 "Canadian" \
      013043 "Candler" \
      047015 "Cannon" \
      072029 "Canovanas" \
      016027 "Canyon" \
      029031 "Cape Girardeau" \
      034009 "Cape May" \
      030009 "Carbon" \
      042025 "Carbon" \
      049007 "Carbon" \
      056007 "Carbon" \
      016029 "Caribou" \
      021039 "Carlisle" \
      027017 "Carlton" \
      072031 "Carolina" \
      024011 "Caroline" \
      051033 "Caroline" \
      005015 "Carroll" \
      013045 "Carroll" \
      017015 "Carroll" \
      018015 "Carroll" \
      019027 "Carroll" \
      021041 "Carroll" \
      024013 "Carroll" \
      028015 "Carroll" \
      029033 "Carroll" \
      033003 "Carroll" \
      039019 "Carroll" \
      047017 "Carroll" \
      051035 "Carroll" \
      048065 "Carson" \
      032510 "Carson (city)" \
      021043 "Carter" \
      029035 "Carter" \
      030011 "Carter" \
      040019 "Carter" \
      047019 "Carter" \
      037031 "Carteret" \
      027019 "Carver" \
      030013 "Cascade" \
      021045 "Casey" \
      017017 "Cass" \
      018017 "Cass" \
      019029 "Cass" \
      026027 "Cass" \
      027021 "Cass" \
      029037 "Cass" \
      031025 "Cass" \
      038017 "Cass" \
      048067 "Cass" \
      016031 "Cassia" \
      048069 "Castro" \
      037033 "Caswell" \
      022025 "Catahoula" \
      072033 "Catano" \
      037035 "Catawba" \
      013047 "Catoosa" \
      035003 "Catron" \
      036009 "Cattaraugus" \
      038019 "Cavalier" \
      072035 "Cayey" \
      036011 "Cayuga" \
      024015 "Cecil" \
      019031 "Cedar" \
      029039 "Cedar" \
      031027 "Cedar" \
      072037 "Ceiba" \
      042027 "Centre" \
      019033 "Cerro Gordo" \
      008015 "Chaffee" \
      001017 "Chambers" \
      048071 "Chambers" \
      017019 "Champaign" \
      039021 "Champaign" \
      029041 "Chariton" \
      024017 "Charles" \
      051036 "Charles City (city)" \
      046023 "Charles Mix" \
      045019 "Charleston" \
      026029 "Charlevoix" \
      012015 "Charlotte" \
      051037 "Charlotte" \
      051540 "Charlottesville (city)" \
      013049 "Charlton" \
      020017 "Chase" \
      031029 "Chase" \
      013051 "Chatham" \
      037037 "Chatham" \
      013053 "Chattahoochee" \
      013055 "Chattooga" \
      020019 "Chautauqua" \
      036013 "Chautauqua" \
      035005 "Chaves" \
      047021 "Cheatham" \
      026031 "Cheboygan" \
      053007 "Chelan" \
      036015 "Chemung" \
      036017 "Chenango" \
      001019 "Cherokee" \
      013057 "Cherokee" \
      019035 "Cherokee" \
      020021 "Cherokee" \
      037039 "Cherokee" \
      040021 "Cherokee" \
      045021 "Cherokee" \
      048073 "Cherokee" \
      031031 "Cherry" \
      051550 "Chesapeake (city)" \
      033005 "Cheshire" \
      042029 "Chester" \
      045023 "Chester" \
      047023 "Chester" \
      045025 "Chesterfield" \
      051041 "Chesterfield" \
      008017 "Cheyenne" \
      020023 "Cheyenne" \
      031033 "Cheyenne" \
      019037 "Chickasaw" \
      028017 "Chickasaw" \
      005017 "Chicot" \
      048075 "Childress" \
      001021 "Chilton" \
      026033 "Chippewa" \
      027023 "Chippewa" \
      055017 "Chippewa" \
      027025 "Chisago" \
      050007 "Chittenden" \
      001023 "Choctaw" \
      028019 "Choctaw" \
      040023 "Choctaw" \
      030015 "Chouteau" \
      037041 "Chowan" \
      017021 "Christian" \
      021047 "Christian" \
      029043 "Christian" \
      032001 "Churchill" \
      064002 "Chuuk*" \
      072039 "Ciales" \
      035006 "Cibola" \
      072041 "Cidra" \
      040025 "Cimarron" \
      012017 "Citrus" \
      041005 "Clackamas" \
      022027 "Claiborne" \
      028021 "Claiborne" \
      047025 "Claiborne" \
      053009 "Clallam" \
      026035 "Clare" \
      045027 "Clarendon" \
      042031 "Clarion" \
      005019 "Clark" \
      016033 "Clark" \
      017023 "Clark" \
      018019 "Clark" \
      020025 "Clark" \
      021049 "Clark" \
      029045 "Clark" \
      032003 "Clark" \
      039023 "Clark" \
      046025 "Clark" \
      053011 "Clark" \
      055019 "Clark" \
      001025 "Clarke" \
      013059 "Clarke" \
      019039 "Clarke" \
      028023 "Clarke" \
      051043 "Clarke" \
      041007 "Clatsop" \
      001027 "Clay" \
      005021 "Clay" \
      012019 "Clay" \
      013061 "Clay" \
      017025 "Clay" \
      018021 "Clay" \
      019041 "Clay" \
      020027 "Clay" \
      021051 "Clay" \
      027027 "Clay" \
      028025 "Clay" \
      029047 "Clay" \
      031035 "Clay" \
      037043 "Clay" \
      046027 "Clay" \
      047027 "Clay" \
      048077 "Clay" \
      054015 "Clay" \
      013063 "Clayton" \
      019043 "Clayton" \
      008019 "Clear Creek" \
      042033 "Clearfield" \
      016035 "Clearwater" \
      027029 "Clearwater" \
      001029 "Cleburne" \
      005023 "Cleburne" \
      039025 "Clermont" \
      005025 "Cleveland" \
      037045 "Cleveland" \
      040027 "Cleveland" \
      051560 "Clifton Forge (city)" \
      013065 "Clinch" \
      017027 "Clinton" \
      018023 "Clinton" \
      019045 "Clinton" \
      021053 "Clinton" \
      026037 "Clinton" \
      029049 "Clinton" \
      036019 "Clinton" \
      039027 "Clinton" \
      042035 "Clinton" \
      020029 "Cloud" \
      028027 "Coahoma" \
      040029 "Coal" \
      072043 "Coamo" \
      013067 "Cobb" \
      004003 "Cochise" \
      048079 "Cochran" \
      047029 "Cocke" \
      004005 "Coconino" \
      046029 "Codington" \
      001031 "Coffee" \
      013069 "Coffee" \
      047031 "Coffee" \
      020031 "Coffey" \
      048081 "Coke" \
      001033 "Colbert" \
      029051 "Cole" \
      048083 "Coleman" \
      017029 "Coles" \
      031037 "Colfax" \
      035007 "Colfax" \
      045029 "Colleton" \
      012021 "Collier" \
      048085 "Collin" \
      048087 "Collingsworth" \
      051570 "Colonial Heights (city)" \
      048089 "Colorado" \
      013071 "Colquitt" \
      005027 "Columbia" \
      012023 "Columbia" \
      013073 "Columbia" \
      036021 "Columbia" \
      041009 "Columbia" \
      042037 "Columbia" \
      053013 "Columbia" \
      055021 "Columbia" \
      039029 "Columbiana" \
      037047 "Columbus" \
      006011 "Colusa" \
      048091 "Comal" \
      020033 "Comanche" \
      040031 "Comanche" \
      048093 "Comanche" \
      072045 "Comerio" \
      048095 "Concho" \
      022029 "Concordia" \
      001035 "Conecuh" \
      008021 "Conejos" \
      006013 "Contra Costa" \
      056009 "Converse" \
      005029 "Conway" \
      013075 "Cook" \
      017031 "Cook" \
      027031 "Cook" \
      048097 "Cooke" \
      029053 "Cooper" \
      033007 "Coos" \
      041011 "Coos" \
      001037 "Coosa" \
      028029 "Copiah" \
      072047 "Corozal" \
      046031 "Corson" \
      036023 "Cortland" \
      048099 "Coryell" \
      039031 "Coshocton" \
      008023 "Costilla" \
      048101 "Cottle" \
      040033 "Cotton" \
      027033 "Cottonwood" \
      001039 "Covington" \
      028031 "Covington" \
      051580 "Covington (city)" \
      013077 "Coweta" \
      020035 "Cowley" \
      053015 "Cowlitz" \
      040035 "Craig" \
      051045 "Craig" \
      005031 "Craighead" \
      048103 "Crane" \
      037049 "Craven" \
      005033 "Crawford" \
      013079 "Crawford" \
      017033 "Crawford" \
      018025 "Crawford" \
      019047 "Crawford" \
      020037 "Crawford" \
      026039 "Crawford" \
      029055 "Crawford" \
      039033 "Crawford" \
      042039 "Crawford" \
      055023 "Crawford" \
      040037 "Creek" \
      001041 "Crenshaw" \
      013081 "Crisp" \
      005035 "Crittenden" \
      021055 "Crittenden" \
      047033 "Crockett" \
      048105 "Crockett" \
      041013 "Crook" \
      056011 "Crook" \
      048107 "Crosby" \
      005037 "Cross" \
      027035 "Crow Wing" \
      008025 "Crowley" \
      048109 "Culberson" \
      072049 "Culebra" \
      001043 "Cullman" \
      051047 "Culpeper" \
      017035 "Cumberland" \
      021057 "Cumberland" \
      023005 "Cumberland" \
      034011 "Cumberland" \
      037051 "Cumberland" \
      042041 "Cumberland" \
      047035 "Cumberland" \
      051049 "Cumberland" \
      031039 "Cuming" \
      037053 "Currituck" \
      035009 "Curry" \
      041015 "Curry" \
      008027 "Custer" \
      016037 "Custer" \
      030017 "Custer" \
      031041 "Custer" \
      040039 "Custer" \
      046033 "Custer" \
      039035 "Cuyahoga" \
      013083 "Dade" \
      029057 "Dade" \
      049009 "Daggett" \
      027037 "Dakota" \
      031043 "Dakota" \
      001045 "Dale" \
      048111 "Dallam" \
      001047 "Dallas" \
      005039 "Dallas" \
      019049 "Dallas" \
      029059 "Dallas" \
      048113 "Dallas" \
      055025 "Dane" \
      030019 "Daniels" \
      051590 "Danville (city)" \
      037055 "Dare" \
      039037 "Darke" \
      045031 "Darlington" \
      042043 "Dauphin" \
      037057 "Davidson" \
      047037 "Davidson" \
      037059 "Davie" \
      018027 "Daviess" \
      021059 "Daviess" \
      029061 "Daviess" \
      019051 "Davis" \
      049011 "Davis" \
      046035 "Davison" \
      031045 "Dawes" \
      013085 "Dawson" \
      030021 "Dawson" \
      031047 "Dawson" \
      048115 "Dawson" \
      046037 "Day" \
      018033 "De Kalb" \
      022031 "De Soto" \
      017039 "De Witt" \
      035011 "DeBaca" \
      001049 "DeKalb" \
      013089 "DeKalb" \
      017037 "DeKalb" \
      029063 "DeKalb" \
      047041 "DeKalb" \
      012027 "DeSoto" \
      028033 "DeSoto" \
      048123 "DeWitt" \
      048117 "Deaf Smith" \
      018029 "Dearborn" \
      013087 "Decatur" \
      018031 "Decatur" \
      019053 "Decatur" \
      020039 "Decatur" \
      047039 "Decatur" \
      030023 "Deer Lodge" \
      039039 "Defiance" \
      006015 "Del Norte" \
      018035 "Delaware" \
      019055 "Delaware" \
      036025 "Delaware" \
      039041 "Delaware" \
      040041 "Delaware" \
      042045 "Delaware" \
      008029 "Delta" \
      026041 "Delta" \
      048119 "Delta" \
      002068 "Denali" \
      029065 "Dent" \
      048121 "Denton" \
      008031 "Denver" \
      019057 "Des Moines" \
      041017 "Deschutes" \
      005041 "Desha" \
      031049 "Deuel" \
      046039 "Deuel" \
      040043 "Dewey" \
      046041 "Dewey" \
      048125 "Dickens" \
      051051 "Dickenson" \
      038021 "Dickey" \
      019059 "Dickinson" \
      020041 "Dickinson" \
      026043 "Dickinson" \
      047043 "Dickson" \
      002070 "Dillingham" \
      045033 "Dillon" \
      048127 "Dimmit" \
      051053 "Dinwiddie" \
      011001 "District of Columbia" \
      038023 "Divide" \
      012029 "Dixie" \
      031051 "Dixon" \
      054017 "Doddridge" \
      013091 "Dodge" \
      027039 "Dodge" \
      031053 "Dodge" \
      055027 "Dodge" \
      008033 "Dolores" \
      035013 "Dona Ana" \
      020043 "Doniphan" \
      048129 "Donley" \
      013093 "Dooly" \
      055029 "Door" \
      072051 "Dorado" \
      024019 "Dorchester" \
      045035 "Dorchester" \
      013095 "Dougherty" \
      008035 "Douglas" \
      013097 "Douglas" \
      017041 "Douglas" \
      020045 "Douglas" \
      027041 "Douglas" \
      029067 "Douglas" \
      031055 "Douglas" \
      032005 "Douglas" \
      041019 "Douglas" \
      046043 "Douglas" \
      053017 "Douglas" \
      055031 "Douglas" \
      005043 "Drew" \
      017043 "DuPage" \
      018037 "Dubois" \
      019061 "Dubuque" \
      049013 "Duchesne" \
      025007 "Dukes" \
      031057 "Dundy" \
      029069 "Dunklin" \
      038025 "Dunn" \
      055033 "Dunn" \
      037061 "Duplin" \
      037063 "Durham" \
      036027 "Dutchess" \
      012031 "Duval" \
      048131 "Duval" \
      047045 "Dyer" \
      008037 "Eagle" \
      013099 "Early" \
      022033 "East Baton Rouge" \
      022035 "East Carroll" \
      022037 "East Feliciana" \
      060010 "Eastern District" \
      048133 "Eastland" \
      026045 "Eaton" \
      055035 "Eau Claire" \
      068080 "Ebon" \
      013101 "Echols" \
      048135 "Ector" \
      035015 "Eddy" \
      038027 "Eddy" \
      017045 "Edgar" \
      037065 "Edgecombe" \
      045037 "Edgefield" \
      021061 "Edmonson" \
      046045 "Edmunds" \
      017047 "Edwards" \
      020047 "Edwards" \
      048137 "Edwards" \
      013103 "Effingham" \
      017049 "Effingham" \
      006017 "El Dorado" \
      008041 "El Paso" \
      048141 "El Paso" \
      008039 "Elbert" \
      013105 "Elbert" \
      020049 "Elk" \
      042047 "Elk" \
      018039 "Elkhart" \
      032007 "Elko" \
      021063 "Elliott" \
      020051 "Ellis" \
      040045 "Ellis" \
      048139 "Ellis" \
      020053 "Ellsworth" \
      001051 "Elmore" \
      016039 "Elmore" \
      013107 "Emanuel" \
      049015 "Emery" \
      019063 "Emmet" \
      026047 "Emmet" \
      038029 "Emmons" \
      051595 "Emporia (city)" \
      068090 "Enewetak" \
      048143 "Erath" \
      036029 "Erie" \
      039043 "Erie" \
      042049 "Erie" \
      068100 "Erikub" \
      001053 "Escambia" \
      012033 "Escambia" \
      032009 "Esmeralda" \
      025009 "Essex" \
      034013 "Essex" \
      036031 "Essex" \
      050009 "Essex" \
      051057 "Essex" \
      021065 "Estill" \
      001055 "Etowah" \
      032011 "Eureka" \
      022039 "Evangeline" \
      013109 "Evans" \
      002090 "Fairbanks North Star" \
      051059 "Fairfax" \
      051600 "Fairfax (city)" \
      009001 "Fairfield" \
      039045 "Fairfield" \
      045039 "Fairfield" \
      072053 "Fajardo" \
      046047 "Fall River" \
      030025 "Fallon" \
      048145 "Falls" \
      051610 "Falls Church (city)" \
      013111 "Fannin" \
      048147 "Fannin" \
      027043 "Faribault" \
      046049 "Faulk" \
      005045 "Faulkner" \
      051061 "Fauquier" \
      001057 "Fayette" \
      013113 "Fayette" \
      017051 "Fayette" \
      018041 "Fayette" \
      019065 "Fayette" \
      021067 "Fayette" \
      039047 "Fayette" \
      042051 "Fayette" \
      047047 "Fayette" \
      048149 "Fayette" \
      054019 "Fayette" \
      047049 "Fentress" \
      030027 "Fergus" \
      053019 "Ferry" \
      027045 "Fillmore" \
      031059 "Fillmore" \
      020055 "Finney" \
      048151 "Fisher" \
      012035 "Flagler" \
      030029 "Flathead" \
      021069 "Fleming" \
      045041 "Florence" \
      055037 "Florence" \
      072054 "Florida" \
      013115 "Floyd" \
      018043 "Floyd" \
      019067 "Floyd" \
      021071 "Floyd" \
      048153 "Floyd" \
      051063 "Floyd" \
      051065 "Fluvanna" \
      048155 "Foard" \
      055039 "Fond du Lac" \
      017053 "Ford" \
      020057 "Ford" \
      042053 "Forest" \
      055041 "Forest" \
      028035 "Forrest" \
      013117 "Forsyth" \
      037067 "Forsyth" \
      048157 "Fort Bend" \
      038031 "Foster" \
      018045 "Fountain" \
      001059 "Franklin" \
      005047 "Franklin" \
      012037 "Franklin" \
      013119 "Franklin" \
      016041 "Franklin" \
      017055 "Franklin" \
      018047 "Franklin" \
      019069 "Franklin" \
      020059 "Franklin" \
      021073 "Franklin" \
      022041 "Franklin" \
      023007 "Franklin" \
      025011 "Franklin" \
      028037 "Franklin" \
      029071 "Franklin" \
      031061 "Franklin" \
      036033 "Franklin" \
      037069 "Franklin" \
      039049 "Franklin" \
      042055 "Franklin" \
      047051 "Franklin" \
      048159 "Franklin" \
      050011 "Franklin" \
      051067 "Franklin" \
      053021 "Franklin" \
      051620 "Franklin (city)" \
      024021 "Frederick" \
      051069 "Frederick" \
      051630 "Fredericksburg (city)" \
      027047 "Freeborn" \
      048161 "Freestone" \
      008043 "Fremont" \
      016043 "Fremont" \
      019071 "Fremont" \
      056013 "Fremont" \
      006019 "Fresno" \
      048163 "Frio" \
      031063 "Frontier" \
      005049 "Fulton" \
      013121 "Fulton" \
      017057 "Fulton" \
      018049 "Fulton" \
      021075 "Fulton" \
      036035 "Fulton" \
      039051 "Fulton" \
      042057 "Fulton" \
      031065 "Furnas" \
      012039 "Gadsden" \
      031067 "Gage" \
      048165 "Gaines" \
      051640 "Galax (city)" \
      017059 "Gallatin" \
      021077 "Gallatin" \
      030031 "Gallatin" \
      039053 "Gallia" \
      048167 "Galveston" \
      031069 "Garden" \
      008045 "Garfield" \
      030033 "Garfield" \
      031071 "Garfield" \
      040047 "Garfield" \
      049017 "Garfield" \
      053023 "Garfield" \
      005051 "Garland" \
      021079 "Garrard" \
      024023 "Garrett" \
      040049 "Garvin" \
      048169 "Garza" \
      029073 "Gasconade" \
      037071 "Gaston" \
      037073 "Gates" \
      020061 "Geary" \
      039055 "Geauga" \
      016045 "Gem" \
      026049 "Genesee" \
      036037 "Genesee" \
      001061 "Geneva" \
      029075 "Gentry" \
      028039 "George" \
      045043 "Georgetown" \
      018051 "Gibson" \
      047053 "Gibson" \
      004007 "Gila" \
      012041 "Gilchrist" \
      047055 "Giles" \
      051071 "Giles" \
      048171 "Gillespie" \
      041021 "Gilliam" \
      013123 "Gilmer" \
      054021 "Gilmer" \
      008047 "Gilpin" \
      030035 "Glacier" \
      012043 "Glades" \
      026051 "Gladwin" \
      013125 "Glascock" \
      048173 "Glasscock" \
      006021 "Glenn" \
      034015 "Gloucester" \
      051073 "Gloucester" \
      013127 "Glynn" \
      026053 "Gogebic" \
      030037 "Golden Valley" \
      038033 "Golden Valley" \
      048175 "Goliad" \
      048177 "Gonzales" \
      051075 "Goochland" \
      027049 "Goodhue" \
      016047 "Gooding" \
      013129 "Gordon" \
      056015 "Goshen" \
      031073 "Gosper" \
      020063 "Gove" \
      013131 "Grady" \
      040051 "Grady" \
      033009 "Grafton" \
      004009 "Graham" \
      020065 "Graham" \
      037075 "Graham" \
      047057 "Grainger" \
      008049 "Grand" \
      049019 "Grand" \
      038035 "Grand Forks" \
      050013 "Grand Isle" \
      026055 "Grand Traverse" \
      030039 "Granite" \
      005053 "Grant" \
      018053 "Grant" \
      020067 "Grant" \
      021081 "Grant" \
      022043 "Grant" \
      027051 "Grant" \
      031075 "Grant" \
      035017 "Grant" \
      038037 "Grant" \
      040053 "Grant" \
      041023 "Grant" \
      046051 "Grant" \
      053025 "Grant" \
      054023 "Grant" \
      055043 "Grant" \
      037077 "Granville" \
      026057 "Gratiot" \
      021083 "Graves" \
      020069 "Gray" \
      048179 "Gray" \
      053027 "Grays Harbor" \
      021085 "Grayson" \
      048181 "Grayson" \
      051077 "Grayson" \
      020071 "Greeley" \
      031077 "Greeley" \
      021087 "Green" \
      055045 "Green" \
      055047 "Green Lake" \
      054025 "Greenbrier" \
      001063 "Greene" \
      005055 "Greene" \
      013133 "Greene" \
      017061 "Greene" \
      018055 "Greene" \
      019073 "Greene" \
      028041 "Greene" \
      029077 "Greene" \
      036039 "Greene" \
      037079 "Greene" \
      039057 "Greene" \
      042059 "Greene" \
      047059 "Greene" \
      051079 "Greene" \
      004011 "Greenlee" \
      051081 "Greensville" \
      021089 "Greenup" \
      045045 "Greenville" \
      020073 "Greenwood" \
      045047 "Greenwood" \
      040055 "Greer" \
      048183 "Gregg" \
      046053 "Gregory" \
      028043 "Grenada" \
      038039 "Griggs" \
      048185 "Grimes" \
      017063 "Grundy" \
      019075 "Grundy" \
      029079 "Grundy" \
      047061 "Grundy" \
      035019 "Guadalupe" \
      048187 "Guadalupe" \
      066010 "Guam" \
      072055 "Guanica" \
      072057 "Guayama" \
      072059 "Guayanilla" \
      072061 "Guaynabo" \
      039059 "Guernsey" \
      037081 "Guilford" \
      012045 "Gulf" \
      008051 "Gunnison" \
      072063 "Gurabo" \
      019077 "Guthrie" \
      013135 "Gwinnett" \
      046055 "Haakon" \
      013137 "Habersham" \
      002100 "Haines" \
      001065 "Hale" \
      048189 "Hale" \
      037083 "Halifax" \
      051083 "Halifax" \
      013139 "Hall" \
      031079 "Hall" \
      048191 "Hall" \
      047063 "Hamblen" \
      012047 "Hamilton" \
      017065 "Hamilton" \
      018057 "Hamilton" \
      019079 "Hamilton" \
      020075 "Hamilton" \
      031081 "Hamilton" \
      036041 "Hamilton" \
      039061 "Hamilton" \
      047065 "Hamilton" \
      048193 "Hamilton" \
      046057 "Hamlin" \
      025013 "Hampden" \
      025015 "Hampshire" \
      054027 "Hampshire" \
      045049 "Hampton" \
      051650 "Hampton (city)" \
      013141 "Hancock" \
      017067 "Hancock" \
      018059 "Hancock" \
      019081 "Hancock" \
      021091 "Hancock" \
      023009 "Hancock" \
      028045 "Hancock" \
      039063 "Hancock" \
      047067 "Hancock" \
      054029 "Hancock" \
      046059 "Hand" \
      051085 "Hanover" \
      048195 "Hansford" \
      046061 "Hanson" \
      013143 "Haralson" \
      012049 "Hardee" \
      047069 "Hardeman" \
      048197 "Hardeman" \
      017069 "Hardin" \
      019083 "Hardin" \
      021093 "Hardin" \
      039065 "Hardin" \
      047071 "Hardin" \
      048199 "Hardin" \
      035021 "Harding" \
      046063 "Harding" \
      054031 "Hardy" \
      024025 "Harford" \
      021095 "Harlan" \
      031083 "Harlan" \
      040057 "Harmon" \
      037085 "Harnett" \
      041025 "Harney" \
      020077 "Harper" \
      040059 "Harper" \
      013145 "Harris" \
      048201 "Harris" \
      018061 "Harrison" \
      019085 "Harrison" \
      021097 "Harrison" \
      028047 "Harrison" \
      029081 "Harrison" \
      039067 "Harrison" \
      048203 "Harrison" \
      054033 "Harrison" \
      051660 "Harrisonburg (city)" \
      013147 "Hart" \
      021099 "Hart" \
      009003 "Hartford" \
      048205 "Hartley" \
      020079 "Harvey" \
      020081 "Haskell" \
      040061 "Haskell" \
      048207 "Haskell" \
      072065 "Hatillo" \
      070050 "Hatoboheit*" \
      015001 "Hawaii" \
      047073 "Hawkins" \
      031085 "Hayes" \
      048209 "Hays" \
      037087 "Haywood" \
      047075 "Haywood" \
      013149 "Heard" \
      048211 "Hemphill" \
      005057 "Hempstead" \
      017071 "Henderson" \
      021101 "Henderson" \
      037089 "Henderson" \
      047077 "Henderson" \
      048213 "Henderson" \
      018063 "Hendricks" \
      012051 "Hendry" \
      027053 "Hennepin" \
      051087 "Henrico" \
      001067 "Henry" \
      013151 "Henry" \
      017073 "Henry" \
      018065 "Henry" \
      019087 "Henry" \
      021103 "Henry" \
      029083 "Henry" \
      039069 "Henry" \
      047079 "Henry" \
      051089 "Henry" \
      036043 "Herkimer" \
      012053 "Hernando" \
      037091 "Hertford" \
      038041 "Hettinger" \
      021105 "Hickman" \
      047081 "Hickman" \
      029085 "Hickory" \
      035023 "Hidalgo" \
      048215 "Hidalgo" \
      039071 "Highland" \
      051091 "Highland" \
      012055 "Highlands" \
      030041 "Hill" \
      048217 "Hill" \
      012057 "Hillsborough" \
      033011 "Hillsborough" \
      026059 "Hillsdale" \
      028049 "Hinds" \
      008053 "Hinsdale" \
      031087 "Hitchcock" \
      039073 "Hocking" \
      048219 "Hockley" \
      020083 "Hodgeman" \
      037093 "Hoke" \
      012059 "Holmes" \
      028051 "Holmes" \
      039075 "Holmes" \
      029087 "Holt" \
      031089 "Holt" \
      015003 "Honolulu" \
      048221 "Hood" \
      041027 "Hood River" \
      031091 "Hooker" \
      051670 "Hopewell (city)" \
      021107 "Hopkins" \
      048223 "Hopkins" \
      072067 "Hormigueros" \
      045051 "Horry" \
      005059 "Hot Spring" \
      056017 "Hot Springs" \
      026061 "Houghton" \
      001069 "Houston" \
      013153 "Houston" \
      027055 "Houston" \
      047083 "Houston" \
      048225 "Houston" \
      005061 "Howard" \
      018067 "Howard" \
      019089 "Howard" \
      024027 "Howard" \
      029089 "Howard" \
      031093 "Howard" \
      048227 "Howard" \
      029091 "Howell" \
      074100 "Howland Island" \
      027057 "Hubbard" \
      034017 "Hudson" \
      048229 "Hudspeth" \
      008055 "Huerfano" \
      040063 "Hughes" \
      046065 "Hughes" \
      072069 "Humacao" \
      006023 "Humboldt" \
      019091 "Humboldt" \
      032013 "Humboldt" \
      028053 "Humphreys" \
      047085 "Humphreys" \
      048231 "Hunt" \
      034019 "Hunterdon" \
      042061 "Huntingdon" \
      018069 "Huntington" \
      026063 "Huron" \
      039077 "Huron" \
      046067 "Hutchinson" \
      048233 "Hutchinson" \
      037095 "Hyde" \
      046069 "Hyde" \
      022045 "Iberia" \
      022047 "Iberville" \
      019093 "Ida" \
      016049 "Idaho" \
      006025 "Imperial" \
      005063 "Independence" \
      012061 "Indian River" \
      042063 "Indiana" \
      026065 "Ingham" \
      006027 "Inyo" \
      026067 "Ionia" \
      026069 "Iosco" \
      019095 "Iowa" \
      055049 "Iowa" \
      037097 "Iredell" \
      048235 "Irion" \
      026071 "Iron" \
      029093 "Iron" \
      049021 "Iron" \
      055051 "Iron" \
      017075 "Iroquois" \
      013155 "Irwin" \
      026073 "Isabella" \
      027059 "Isanti" \
      053029 "Island" \
      051093 "Isle of Wight" \
      028055 "Issaquena" \
      027061 "Itasca" \
      028057 "Itawamba" \
      005065 "Izard" \
      068110 "Jabat" \
      048237 "Jack" \
      001071 "Jackson" \
      005067 "Jackson" \
      008057 "Jackson" \
      012063 "Jackson" \
      013157 "Jackson" \
      017077 "Jackson" \
      018071 "Jackson" \
      019097 "Jackson" \
      020085 "Jackson" \
      021109 "Jackson" \
      022049 "Jackson" \
      026075 "Jackson" \
      027063 "Jackson" \
      028059 "Jackson" \
      029095 "Jackson" \
      037099 "Jackson" \
      039079 "Jackson" \
      040065 "Jackson" \
      041029 "Jackson" \
      046071 "Jackson" \
      047087 "Jackson" \
      048239 "Jackson" \
      054035 "Jackson" \
      055053 "Jackson" \
      068120 "Jaluit" \
      051095 "James City (city)" \
      074150 "Jarvis Island" \
      013159 "Jasper" \
      017079 "Jasper" \
      018073 "Jasper" \
      019099 "Jasper" \
      028061 "Jasper" \
      029097 "Jasper" \
      045053 "Jasper" \
      048241 "Jasper" \
      018075 "Jay" \
      072073 "Jayuya" \
      013161 "Jeff Davis" \
      048243 "Jeff Davis" \
      001073 "Jefferson" \
      005069 "Jefferson" \
      008059 "Jefferson" \
      012065 "Jefferson" \
      013163 "Jefferson" \
      016051 "Jefferson" \
      017081 "Jefferson" \
      018077 "Jefferson" \
      019101 "Jefferson" \
      020087 "Jefferson" \
      021111 "Jefferson" \
      022051 "Jefferson" \
      028063 "Jefferson" \
      029099 "Jefferson" \
      030043 "Jefferson" \
      031095 "Jefferson" \
      036045 "Jefferson" \
      039081 "Jefferson" \
      040067 "Jefferson" \
      041031 "Jefferson" \
      042065 "Jefferson" \
      047089 "Jefferson" \
      048245 "Jefferson" \
      053031 "Jefferson" \
      054037 "Jefferson" \
      055055 "Jefferson" \
      022053 "Jefferson Davis" \
      028065 "Jefferson Davis" \
      068130 "Jemo*" \
      013165 "Jenkins" \
      018079 "Jennings" \
      046073 "Jerauld" \
      016053 "Jerome" \
      017083 "Jersey" \
      021113 "Jessamine" \
      020089 "Jewell" \
      048247 "Jim Hogg" \
      048249 "Jim Wells" \
      017085 "Jo Daviess" \
      005071 "Johnson" \
      013167 "Johnson" \
      017087 "Johnson" \
      018081 "Johnson" \
      019103 "Johnson" \
      020091 "Johnson" \
      021115 "Johnson" \
      029101 "Johnson" \
      031097 "Johnson" \
      047091 "Johnson" \
      048251 "Johnson" \
      056019 "Johnson" \
      037101 "Johnston" \
      040069 "Johnston" \
      074200 "Johnston Island" \
      013169 "Jones" \
      019105 "Jones" \
      028067 "Jones" \
      037103 "Jones" \
      046075 "Jones" \
      048253 "Jones" \
      041033 "Josephine" \
      049023 "Juab" \
      072075 "Juana Diaz" \
      030045 "Judith Basin" \
      072077 "Juncos" \
      002110 "Juneau" \
      055057 "Juneau" \
      042067 "Juniata" \
      026077 "Kalamazoo" \
      015005 "Kalawao" \
      026079 "Kalkaska" \
      027065 "Kanabec" \
      054039 "Kanawha" \
      027067 "Kandiyohi" \
      017089 "Kane" \
      049025 "Kane" \
      017091 "Kankakee" \
      048255 "Karnes" \
      015007 "Kauai" \
      048257 "Kaufman" \
      040071 "Kay" \
      070100 "Kayangel" \
      031099 "Kearney" \
      020093 "Kearny" \
      031101 "Keith" \
      028069 "Kemper" \
      002122 "Kenai Peninsula" \
      017093 "Kendall" \
      048259 "Kendall" \
      048261 "Kenedy" \
      023011 "Kennebec" \
      055059 "Kenosha" \
      010001 "Kent" \
      024029 "Kent" \
      026081 "Kent" \
      044003 "Kent" \
      048263 "Kent" \
      021117 "Kenton" \
      019107 "Keokuk" \
      006029 "Kern" \
      048265 "Kerr" \
      045055 "Kershaw" \
      002130 "Ketchikan Gateway" \
      055061 "Kewaunee" \
      026083 "Keweenaw" \
      031103 "Keya Paha" \
      038043 "Kidder" \
      068140 "Kili" \
      031105 "Kimball" \
      048267 "Kimble" \
      048269 "King" \
      053033 "King" \
      051099 "King George" \
      051101 "King William" \
      051097 "King and Queen" \
      040073 "Kingfisher" \
      020095 "Kingman" \
      074250 "Kingman Reef" \
      006031 "Kings" \
      036047 "Kings" \
      046077 "Kingsbury" \
      048271 "Kinney" \
      008061 "Kiowa" \
      020097 "Kiowa" \
      040075 "Kiowa" \
      008063 "Kit Carson" \
      053035 "Kitsap" \
      053037 "Kittitas" \
      027069 "Kittson" \
      041035 "Klamath" \
      048273 "Kleberg" \
      053039 "Klickitat" \
      021119 "Knott" \
      017095 "Knox" \
      018083 "Knox" \
      021121 "Knox" \
      023013 "Knox" \
      029103 "Knox" \
      031107 "Knox" \
      039083 "Knox" \
      047093 "Knox" \
      048275 "Knox" \
      002150 "Kodiak Island" \
      027071 "Koochiching" \
      016055 "Kootenai" \
      070150 "Koror" \
      018085 "Kosciusko" \
      064005 "Kosrae" \
      019109 "Kossuth" \
      068150 "Kwajalein" \
      055063 "La Crosse" \
      004012 "La Paz" \
      008067 "La Plata" \
      018091 "La Porte" \
      017099 "La Salle" \
      022059 "La Salle" \
      048283 "La Salle" \
      038045 "LaMoure" \
      020099 "Labette" \
      027073 "Lac qui Parle" \
      042069 "Lackawanna" \
      029105 "Laclede" \
      068160 "Lae" \
      005073 "Lafayette" \
      012067 "Lafayette" \
      022055 "Lafayette" \
      028071 "Lafayette" \
      029107 "Lafayette" \
      055065 "Lafayette" \
      022057 "Lafourche" \
      018087 "Lagrange" \
      072079 "Lajas" \
      006033 "Lake" \
      008065 "Lake" \
      012069 "Lake" \
      017097 "Lake" \
      018089 "Lake" \
      026085 "Lake" \
      027075 "Lake" \
      030047 "Lake" \
      039085 "Lake" \
      041037 "Lake" \
      046079 "Lake" \
      047095 "Lake" \
      002164 "Lake and Peninsula" \
      027077 "Lake of the Woods" \
      001075 "Lamar" \
      013171 "Lamar" \
      028073 "Lamar" \
      048277 "Lamar" \
      048279 "Lamb" \
      050015 "Lamoille" \
      048281 "Lampasas" \
      031109 "Lancaster" \
      042071 "Lancaster" \
      045057 "Lancaster" \
      051103 "Lancaster" \
      032015 "Lander" \
      020101 "Lane" \
      041039 "Lane" \
      055067 "Langlade" \
      013173 "Lanier" \
      026087 "Lapeer" \
      056021 "Laramie" \
      072081 "Lares" \
      008069 "Larimer" \
      021123 "Larue" \
      008071 "Las Animas" \
      072083 "Las Marias" \
      072085 "Las Piedras" \
      006035 "Lassen" \
      016057 "Latah" \
      040077 "Latimer" \
      001077 "Lauderdale" \
      028075 "Lauderdale" \
      047097 "Lauderdale" \
      021125 "Laurel" \
      013175 "Laurens" \
      045059 "Laurens" \
      048285 "Lavaca" \
      001079 "Lawrence" \
      005075 "Lawrence" \
      017101 "Lawrence" \
      018093 "Lawrence" \
      021127 "Lawrence" \
      028077 "Lawrence" \
      029109 "Lawrence" \
      039087 "Lawrence" \
      042073 "Lawrence" \
      046081 "Lawrence" \
      047099 "Lawrence" \
      040079 "Le Flore" \
      027079 "Le Sueur" \
      035025 "Lea" \
      028079 "Leake" \
      020103 "Leavenworth" \
      042075 "Lebanon" \
      001081 "Lee" \
      005077 "Lee" \
      012071 "Lee" \
      013177 "Lee" \
      017103 "Lee" \
      019111 "Lee" \
      021129 "Lee" \
      028081 "Lee" \
      037105 "Lee" \
      045061 "Lee" \
      048287 "Lee" \
      051105 "Lee" \
      026089 "Leelanau" \
      028083 "Leflore" \
      042077 "Lehigh" \
      016059 "Lemhi" \
      026091 "Lenawee" \
      037107 "Lenoir" \
      012073 "Leon" \
      048289 "Leon" \
      021131 "Leslie" \
      021133 "Letcher" \
      012075 "Levy" \
      016061 "Lewis" \
      021135 "Lewis" \
      029111 "Lewis" \
      036049 "Lewis" \
      047101 "Lewis" \
      053041 "Lewis" \
      054041 "Lewis" \
      030049 "Lewis and Clark" \
      045063 "Lexington" \
      051678 "Lexington (city)" \
      068170 "Lib" \
      012077 "Liberty" \
      013179 "Liberty" \
      030051 "Liberty" \
      048291 "Liberty" \
      039089 "Licking" \
      068180 "Likiep" \
      001083 "Limestone" \
      048293 "Limestone" \
      005079 "Lincoln" \
      008073 "Lincoln" \
      013181 "Lincoln" \
      016063 "Lincoln" \
      020105 "Lincoln" \
      021137 "Lincoln" \
      022061 "Lincoln" \
      023015 "Lincoln" \
      027081 "Lincoln" \
      028085 "Lincoln" \
      029113 "Lincoln" \
      030053 "Lincoln" \
      031111 "Lincoln" \
      032017 "Lincoln" \
      035027 "Lincoln" \
      037109 "Lincoln" \
      040081 "Lincoln" \
      041041 "Lincoln" \
      046083 "Lincoln" \
      047103 "Lincoln" \
      053043 "Lincoln" \
      054043 "Lincoln" \
      055069 "Lincoln" \
      056023 "Lincoln" \
      019113 "Linn" \
      020107 "Linn" \
      029115 "Linn" \
      041043 "Linn" \
      048295 "Lipscomb" \
      009005 "Litchfield" \
      005081 "Little River" \
      048297 "Live Oak" \
      017105 "Livingston" \
      021139 "Livingston" \
      022063 "Livingston" \
      026093 "Livingston" \
      029117 "Livingston" \
      036051 "Livingston" \
      048299 "Llano" \
      005083 "Logan" \
      008075 "Logan" \
      017107 "Logan" \
      020109 "Logan" \
      021141 "Logan" \
      031113 "Logan" \
      038047 "Logan" \
      039091 "Logan" \
      040083 "Logan" \
      054045 "Logan" \
      072087 "Loiza" \
      013183 "Long" \
      005085 "Lonoke" \
      039093 "Lorain" \
      035028 "Los Alamos" \
      006037 "Los Angeles" \
      047105 "Loudon" \
      051107 "Loudoun" \
      019115 "Louisa" \
      051109 "Louisa" \
      031115 "Loup" \
      040085 "Love" \
      048301 "Loving" \
      001085 "Lowndes" \
      013185 "Lowndes" \
      028087 "Lowndes" \
      048303 "Lubbock" \
      019117 "Lucas" \
      039095 "Lucas" \
      026095 "Luce" \
      013187 "Lumpkin" \
      035029 "Luna" \
      051111 "Lunenburg" \
      072089 "Luquillo" \
      042079 "Luzerne" \
      042081 "Lycoming" \
      046085 "Lyman" \
      051680 "Lynchburg (city)" \
      048305 "Lynn" \
      019119 "Lyon" \
      020111 "Lyon" \
      021143 "Lyon" \
      027083 "Lyon" \
      032019 "Lyon" \
      026097 "Mackinac" \
      026099 "Macomb" \
      001087 "Macon" \
      013193 "Macon" \
      017115 "Macon" \
      029121 "Macon" \
      037113 "Macon" \
      047111 "Macon" \
      017117 "Macoupin" \
      006039 "Madera" \
      001089 "Madison" \
      005087 "Madison" \
      012079 "Madison" \
      013195 "Madison" \
      016065 "Madison" \
      017119 "Madison" \
      018095 "Madison" \
      019121 "Madison" \
      021151 "Madison" \
      022065 "Madison" \
      028089 "Madison" \
      029123 "Madison" \
      030057 "Madison" \
      031119 "Madison" \
      036053 "Madison" \
      037115 "Madison" \
      039097 "Madison" \
      047113 "Madison" \
      048313 "Madison" \
      051113 "Madison" \
      021153 "Magoffin" \
      019123 "Mahaska" \
      027087 "Mahnomen" \
      039099 "Mahoning" \
      040093 "Major" \
      068190 "Majuro" \
      041045 "Malheur" \
      068300 "Maloelap" \
      051683 "Manassas (city)" \
      051685 "Manassas Park (city)" \
      012081 "Manatee" \
      072091 "Manati" \
      026101 "Manistee" \
      055071 "Manitowoc" \
      060020 "Manu'a District" \
      055073 "Marathon" \
      001091 "Marengo" \
      072093 "Maricao" \
      004013 "Maricopa" \
      029125 "Maries" \
      006041 "Marin" \
      055075 "Marinette" \
      001093 "Marion" \
      005089 "Marion" \
      012083 "Marion" \
      013197 "Marion" \
      017121 "Marion" \
      018097 "Marion" \
      019125 "Marion" \
      020115 "Marion" \
      021155 "Marion" \
      028091 "Marion" \
      029127 "Marion" \
      039101 "Marion" \
      041047 "Marion" \
      045067 "Marion" \
      047115 "Marion" \
      048315 "Marion" \
      054049 "Marion" \
      006043 "Mariposa" \
      045069 "Marlboro" \
      026103 "Marquette" \
      055077 "Marquette" \
      001095 "Marshall" \
      017123 "Marshall" \
      018099 "Marshall" \
      019127 "Marshall" \
      020117 "Marshall" \
      021157 "Marshall" \
      027089 "Marshall" \
      028093 "Marshall" \
      040095 "Marshall" \
      046091 "Marshall" \
      047117 "Marshall" \
      054051 "Marshall" \
      012085 "Martin" \
      018101 "Martin" \
      021159 "Martin" \
      027091 "Martin" \
      037117 "Martin" \
      048317 "Martin" \
      051690 "Martinsville (city)" \
      017125 "Mason" \
      021161 "Mason" \
      026105 "Mason" \
      048319 "Mason" \
      053045 "Mason" \
      054053 "Mason" \
      017127 "Massac" \
      048321 "Matagorda" \
      002170 "Matanuska-Susitna" \
      051115 "Mathews" \
      015009 "Maui" \
      072095 "Maunabo" \
      047119 "Maury" \
      048323 "Maverick" \
      072097 "Mayaguez" \
      040097 "Mayes" \
      040087 "McClain" \
      030055 "McCone" \
      046087 "McCook" \
      045065 "McCormick" \
      021145 "McCracken" \
      021147 "McCreary" \
      048307 "McCulloch" \
      040089 "McCurtain" \
      029119 "McDonald" \
      017109 "McDonough" \
      037111 "McDowell" \
      054047 "McDowell" \
      013189 "McDuffie" \
      017111 "McHenry" \
      038049 "McHenry" \
      013191 "McIntosh" \
      038051 "McIntosh" \
      040091 "McIntosh" \
      042083 "McKean" \
      038053 "McKenzie" \
      035031 "McKinley" \
      017113 "McLean" \
      021149 "McLean" \
      038055 "McLean" \
      048309 "McLennan" \
      027085 "McLeod" \
      047107 "McMinn" \
      048311 "McMullen" \
      047109 "McNairy" \
      020113 "McPherson" \
      031117 "McPherson" \
      046089 "McPherson" \
      020119 "Meade" \
      021163 "Meade" \
      046093 "Meade" \
      030059 "Meagher" \
      037119 "Mecklenburg" \
      051117 "Mecklenburg" \
      026107 "Mecosta" \
      039103 "Medina" \
      048325 "Medina" \
      027093 "Meeker" \
      039105 "Meigs" \
      047121 "Meigs" \
      068310 "Mejit" \
      070212 "Melekeok*" \
      046095 "Mellette" \
      017129 "Menard" \
      048327 "Menard" \
      006045 "Mendocino" \
      021165 "Menifee" \
      026109 "Menominee" \
      055078 "Menominee" \
      006047 "Merced" \
      017131 "Mercer" \
      021167 "Mercer" \
      029129 "Mercer" \
      034021 "Mercer" \
      038057 "Mercer" \
      039107 "Mercer" \
      042085 "Mercer" \
      054055 "Mercer" \
      013199 "Meriwether" \
      031121 "Merrick" \
      033013 "Merrimack" \
      008077 "Mesa" \
      021169 "Metcalfe" \
      018103 "Miami" \
      020121 "Miami" \
      039109 "Miami" \
      012086 "Miami-Dade" \
      009007 "Middlesex" \
      025017 "Middlesex" \
      034023 "Middlesex" \
      051119 "Middlesex" \
      026111 "Midland" \
      048329 "Midland" \
      074300 "Midway Islands" \
      042087 "Mifflin" \
      048331 "Milam" \
      068320 "Mili" \
      049027 "Millard" \
      027095 "Mille Lacs" \
      005091 "Miller" \
      013201 "Miller" \
      029131 "Miller" \
      019129 "Mills" \
      048333 "Mills" \
      055079 "Milwaukee" \
      046097 "Miner" \
      008079 "Mineral" \
      030061 "Mineral" \
      032021 "Mineral" \
      054057 "Mineral" \
      054059 "Mingo" \
      016067 "Minidoka" \
      046099 "Minnehaha" \
      026113 "Missaukee" \
      005093 "Mississippi" \
      029133 "Mississippi" \
      030063 "Missoula" \
      013205 "Mitchell" \
      019131 "Mitchell" \
      020123 "Mitchell" \
      037121 "Mitchell" \
      048335 "Mitchell" \
      001097 "Mobile" \
      072099 "Moca" \
      006049 "Modoc" \
      008081 "Moffat" \
      004015 "Mohave" \
      029135 "Moniteau" \
      034025 "Monmouth" \
      006051 "Mono" \
      019133 "Monona" \
      054061 "Monongalia" \
      001099 "Monroe" \
      005095 "Monroe" \
      012087 "Monroe" \
      013207 "Monroe" \
      017133 "Monroe" \
      018105 "Monroe" \
      019135 "Monroe" \
      021171 "Monroe" \
      026115 "Monroe" \
      028095 "Monroe" \
      029137 "Monroe" \
      036055 "Monroe" \
      039111 "Monroe" \
      042089 "Monroe" \
      047123 "Monroe" \
      054063 "Monroe" \
      055081 "Monroe" \
      048337 "Montague" \
      026117 "Montcalm" \
      006053 "Monterey" \
      008083 "Montezuma" \
      001101 "Montgomery" \
      005097 "Montgomery" \
      013209 "Montgomery" \
      017135 "Montgomery" \
      018107 "Montgomery" \
      019137 "Montgomery" \
      020125 "Montgomery" \
      021173 "Montgomery" \
      024031 "Montgomery" \
      028097 "Montgomery" \
      029139 "Montgomery" \
      036057 "Montgomery" \
      037123 "Montgomery" \
      039113 "Montgomery" \
      042091 "Montgomery" \
      047125 "Montgomery" \
      048339 "Montgomery" \
      051121 "Montgomery" \
      026119 "Montmorency" \
      042093 "Montour" \
      008085 "Montrose" \
      046101 "Moody" \
      037125 "Moore" \
      047127 "Moore" \
      048341 "Moore" \
      035033 "Mora" \
      022067 "Morehouse" \
      001103 "Morgan" \
      008087 "Morgan" \
      013211 "Morgan" \
      017137 "Morgan" \
      018109 "Morgan" \
      021175 "Morgan" \
      029141 "Morgan" \
      039115 "Morgan" \
      047129 "Morgan" \
      049029 "Morgan" \
      054065 "Morgan" \
      072101 "Morovis" \
      031123 "Morrill" \
      020127 "Morris" \
      034027 "Morris" \
      048343 "Morris" \
      027097 "Morrison" \
      039117 "Morrow" \
      041049 "Morrow" \
      020129 "Morton" \
      038059 "Morton" \
      048345 "Motley" \
      017139 "Moultrie" \
      038061 "Mountrail" \
      027099 "Mower" \
      021177 "Muhlenberg" \
      041051 "Multnomah" \
      013213 "Murray" \
      027101 "Murray" \
      040099 "Murray" \
      019139 "Muscatine" \
      013215 "Muscogee" \
      026121 "Muskegon" \
      039119 "Muskingum" \
      040101 "Muskogee" \
      030065 "Musselshell" \
      048347 "Nacogdoches" \
      072103 "Naguabo" \
      068330 "Namorik" \
      068340 "Namu" \
      031125 "Nance" \
      025019 "Nantucket" \
      006055 "Napa" \
      072105 "Naranjito" \
      037127 "Nash" \
      012089 "Nassau" \
      036059 "Nassau" \
      022069 "Natchitoches" \
      056025 "Natrona" \
      004017 "Navajo" \
      048349 "Navarro" \
      074350 "Navassa Island" \
      021179 "Nelson" \
      038063 "Nelson" \
      051125 "Nelson" \
      020131 "Nemaha" \
      031127 "Nemaha" \
      020133 "Neosho" \
      028099 "Neshoba" \
      020135 "Ness" \
      005099 "Nevada" \
      006057 "Nevada" \
      010003 "New Castle" \
      037129 "New Hanover" \
      009009 "New Haven" \
      051127 "New Kent" \
      009011 "New London" \
      029143 "New Madrid" \
      036061 "New York" \
      026123 "Newaygo" \
      045071 "Newberry" \
      044005 "Newport" \
      051700 "Newport News (city)" \
      005101 "Newton" \
      013217 "Newton" \
      018111 "Newton" \
      028101 "Newton" \
      029145 "Newton" \
      048351 "Newton" \
      016069 "Nez Perce" \
      070214 "Ngaraard" \
      070218 "Ngarchelong" \
      070222 "Ngardmau" \
      070224 "Ngatpang" \
      070226 "Ngchesar" \
      070227 "Ngernmlengui*" \
      070228 "Ngiwal" \
      036063 "Niagara" \
      021181 "Nicholas" \
      054067 "Nicholas" \
      027103 "Nicollet" \
      056027 "Niobrara" \
      018113 "Noble" \
      039121 "Noble" \
      040103 "Noble" \
      027105 "Nobles" \
      029147 "Nodaway" \
      048353 "Nolan" \
      002180 "Nome" \
      025021 "Norfolk" \
      051710 "Norfolk (city)" \
      027107 "Norman" \
      002185 "North Slope" \
      037131 "Northampton" \
      042095 "Northampton" \
      051131 "Northampton" \
      069085 "Northern Islands" \
      042097 "Northumberland" \
      051133 "Northumberland" \
      002188 "Northwest Arctic" \
      020137 "Norton" \
      051720 "Norton (city)" \
      051135 "Nottoway" \
      040105 "Nowata" \
      028103 "Noxubee" \
      031129 "Nuckolls" \
      048355 "Nueces" \
      032023 "Nye" \
      019141 "O'Brien" \
      026125 "Oakland" \
      047131 "Obion" \
      034029 "Ocean" \
      026127 "Oceana" \
      048357 "Ochiltree" \
      013219 "Oconee" \
      045073 "Oconee" \
      055083 "Oconto" \
      026129 "Ogemaw" \
      017141 "Ogle" \
      013221 "Oglethorpe" \
      018115 "Ohio" \
      021183 "Ohio" \
      054069 "Ohio" \
      012091 "Okaloosa" \
      053047 "Okanogan" \
      012093 "Okeechobee" \
      040107 "Okfuskee" \
      040109 "Oklahoma" \
      040111 "Okmulgee" \
      028105 "Oktibbeha" \
      021185 "Oldham" \
      048359 "Oldham" \
      038065 "Oliver" \
      027109 "Olmsted" \
      016071 "Oneida" \
      036065 "Oneida" \
      055085 "Oneida" \
      036067 "Onondaga" \
      037133 "Onslow" \
      036069 "Ontario" \
      026131 "Ontonagon" \
      006059 "Orange" \
      012095 "Orange" \
      018117 "Orange" \
      036071 "Orange" \
      037135 "Orange" \
      048361 "Orange" \
      050017 "Orange" \
      051137 "Orange" \
      045075 "Orangeburg" \
      029149 "Oregon" \
      022071 "Orleans" \
      036073 "Orleans" \
      050019 "Orleans" \
      072107 "Orocovis" \
      020139 "Osage" \
      029151 "Osage" \
      040113 "Osage" \
      020141 "Osborne" \
      012097 "Osceola" \
      019143 "Osceola" \
      026133 "Osceola" \
      026135 "Oscoda" \
      036075 "Oswego" \
      008089 "Otero" \
      035035 "Otero" \
      031131 "Otoe" \
      026137 "Otsego" \
      036077 "Otsego" \
      020143 "Ottawa" \
      026139 "Ottawa" \
      039123 "Ottawa" \
      040115 "Ottawa" \
      027111 "Otter Tail" \
      005103 "Ouachita" \
      022073 "Ouachita" \
      008091 "Ouray" \
      055087 "Outagamie" \
      047133 "Overton" \
      018119 "Owen" \
      021187 "Owen" \
      021189 "Owsley" \
      016073 "Owyhee" \
      023017 "Oxford" \
      029153 "Ozark" \
      055089 "Ozaukee" \
      053049 "Pacific" \
      019145 "Page" \
      051139 "Page" \
      012099 "Palm Beach" \
      074400 "Palmyra Atoll" \
      019147 "Palo Alto" \
      048363 "Palo Pinto" \
      037137 "Pamlico" \
      028107 "Panola" \
      048365 "Panola" \
      008093 "Park" \
      030067 "Park" \
      056029 "Park" \
      018121 "Parke" \
      048367 "Parker" \
      048369 "Parmer" \
      012101 "Pasco" \
      037139 "Pasquotank" \
      034031 "Passaic" \
      072109 "Patillas" \
      051141 "Patrick" \
      013223 "Paulding" \
      039125 "Paulding" \
      020145 "Pawnee" \
      031133 "Pawnee" \
      040117 "Pawnee" \
      016075 "Payette" \
      040119 "Payne" \
      013225 "Peach" \
      028109 "Pearl River" \
      048371 "Pecos" \
      070350 "Peleliu" \
      038067 "Pembina" \
      029155 "Pemiscot" \
      053051 "Pend Oreille" \
      037141 "Pender" \
      021191 "Pendleton" \
      054071 "Pendleton" \
      027113 "Pennington" \
      046103 "Pennington" \
      023019 "Penobscot" \
      072111 "Penuelas" \
      017143 "Peoria" \
      055091 "Pepin" \
      031135 "Perkins" \
      046105 "Perkins" \
      037143 "Perquimans" \
      001105 "Perry" \
      005105 "Perry" \
      017145 "Perry" \
      018123 "Perry" \
      021193 "Perry" \
      028111 "Perry" \
      029157 "Perry" \
      039127 "Perry" \
      042099 "Perry" \
      047135 "Perry" \
      032027 "Pershing" \
      037145 "Person" \
      051730 "Petersburg (city)" \
      030069 "Petroleum" \
      029159 "Pettis" \
      029161 "Phelps" \
      031137 "Phelps" \
      042101 "Philadelphia" \
      005107 "Phillips" \
      008095 "Phillips" \
      020147 "Phillips" \
      030071 "Phillips" \
      017147 "Piatt" \
      039129 "Pickaway" \
      001107 "Pickens" \
      013227 "Pickens" \
      045077 "Pickens" \
      047137 "Pickett" \
      013229 "Pierce" \
      031139 "Pierce" \
      038069 "Pierce" \
      053053 "Pierce" \
      055093 "Pierce" \
      001109 "Pike" \
      005109 "Pike" \
      013231 "Pike" \
      017149 "Pike" \
      018125 "Pike" \
      021195 "Pike" \
      028113 "Pike" \
      029163 "Pike" \
      039131 "Pike" \
      042103 "Pike" \
      004019 "Pima" \
      004021 "Pinal" \
      027115 "Pine" \
      012103 "Pinellas" \
      027117 "Pipestone" \
      023021 "Piscataquis" \
      008097 "Pitkin" \
      037147 "Pitt" \
      040121 "Pittsburg" \
      051143 "Pittsylvania" \
      049031 "Piute" \
      006061 "Placer" \
      022075 "Plaquemines" \
      029165 "Platte" \
      031141 "Platte" \
      056031 "Platte" \
      054073 "Pleasants" \
      006063 "Plumas" \
      019149 "Plymouth" \
      025023 "Plymouth" \
      019151 "Pocahontas" \
      054075 "Pocahontas" \
      064040 "Pohnpeit*" \
      005111 "Poinsett" \
      022077 "Pointe Coupee" \
      005113 "Polk" \
      012105 "Polk" \
      013233 "Polk" \
      019153 "Polk" \
      027119 "Polk" \
      029167 "Polk" \
      031143 "Polk" \
      037149 "Polk" \
      041053 "Polk" \
      047139 "Polk" \
      048373 "Polk" \
      055095 "Polk" \
      072113 "Ponce" \
      030073 "Pondera" \
      028115 "Pontotoc" \
      040123 "Pontotoc" \
      005115 "Pope" \
      017151 "Pope" \
      027121 "Pope" \
      051735 "Poquoson (city)" \
      039133 "Portage" \
      055097 "Portage" \
      018127 "Porter" \
      051740 "Portsmouth (city)" \
      018129 "Posey" \
      020149 "Pottawatomie" \
      040125 "Pottawatomie" \
      019155 "Pottawattamie" \
      042105 "Potter" \
      046107 "Potter" \
      048375 "Potter" \
      030075 "Powder River" \
      021197 "Powell" \
      030077 "Powell" \
      016077 "Power" \
      019157 "Poweshiek" \
      051145 "Powhatan" \
      005117 "Prairie" \
      030079 "Prairie" \
      020151 "Pratt" \
      039135 "Preble" \
      028117 "Prentiss" \
      048377 "Presidio" \
      026141 "Presque Isle" \
      054077 "Preston" \
      055099 "Price" \
      051147 "Prince Edward" \
      051149 "Prince George" \
      024033 "Prince George's" \
      051153 "Prince William" \
      002201 "Prince of Wales-Outer Ketchikan" \
      044007 "Providence" \
      008099 "Prowers" \
      008101 "Pueblo" \
      005119 "Pulaski" \
      013235 "Pulaski" \
      017153 "Pulaski" \
      018131 "Pulaski" \
      021199 "Pulaski" \
      029169 "Pulaski" \
      051155 "Pulaski" \
      040127 "Pushmataha" \
      012107 "Putnam" \
      013237 "Putnam" \
      017155 "Putnam" \
      018133 "Putnam" \
      029171 "Putnam" \
      036079 "Putnam" \
      039137 "Putnam" \
      047141 "Putnam" \
      054079 "Putnam" \
      035037 "Quay" \
      072115 "Quebradillas" \
      024035 "Queen Anne's" \
      036081 "Queens" \
      013239 "Quitman" \
      028119 "Quitman" \
      013241 "Rabun" \
      055101 "Racine" \
      051750 "Radford (city)" \
      048379 "Rains" \
      054081 "Raleigh" \
      029173 "Ralls" \
      027123 "Ramsey" \
      038071 "Ramsey" \
      048381 "Randall" \
      001111 "Randolph" \
      005121 "Randolph" \
      013243 "Randolph" \
      017157 "Randolph" \
      018135 "Randolph" \
      029175 "Randolph" \
      037151 "Randolph" \
      054083 "Randolph" \
      028121 "Rankin" \
      038073 "Ransom" \
      022079 "Rapides" \
      051157 "Rappahannock" \
      030081 "Ravalli" \
      020153 "Rawlins" \
      029177 "Ray" \
      048383 "Reagan" \
      048385 "Real" \
      027125 "Red Lake" \
      022081 "Red River" \
      048387 "Red River" \
      031145 "Red Willow" \
      027127 "Redwood" \
      048389 "Reeves" \
      048391 "Refugio" \
      020155 "Reno" \
      036083 "Rensselaer" \
      027129 "Renville" \
      038075 "Renville" \
      020157 "Republic" \
      029179 "Reynolds" \
      047143 "Rhea" \
      020159 "Rice" \
      027131 "Rice" \
      049033 "Rich" \
      031147 "Richardson" \
      017159 "Richland" \
      022083 "Richland" \
      030083 "Richland" \
      038077 "Richland" \
      039139 "Richland" \
      045079 "Richland" \
      055103 "Richland" \
      013245 "Richmond" \
      036085 "Richmond" \
      037153 "Richmond" \
      051159 "Richmond" \
      051760 "Richmond (city)" \
      020161 "Riley" \
      072117 "Rincon" \
      019159 "Ringgold" \
      035039 "Rio Arriba" \
      008103 "Rio Blanco" \
      008105 "Rio Grande" \
      072119 "Rio Grande" \
      018137 "Ripley" \
      029181 "Ripley" \
      054085 "Ritchie" \
      006065 "Riverside" \
      047145 "Roane" \
      054087 "Roane" \
      051161 "Roanoke" \
      051770 "Roanoke (city)" \
      046109 "Roberts" \
      048393 "Roberts" \
      021201 "Robertson" \
      047147 "Robertson" \
      048395 "Robertson" \
      037155 "Robeson" \
      027133 "Rock" \
      031149 "Rock" \
      055105 "Rock" \
      017161 "Rock Island" \
      051163 "Rockbridge" \
      021203 "Rockcastle" \
      013247 "Rockdale" \
      033015 "Rockingham" \
      037157 "Rockingham" \
      051165 "Rockingham" \
      036087 "Rockland" \
      048397 "Rockwall" \
      040129 "Roger Mills" \
      040131 "Rogers" \
      038079 "Rolette" \
      068350 "Rongelap" \
      068360 "Rongrik" \
      020163 "Rooks" \
      030085 "Roosevelt" \
      035041 "Roosevelt" \
      026143 "Roscommon" \
      060030 "Rose Island" \
      027135 "Roseau" \
      030087 "Rosebud" \
      039141 "Ross" \
      069100 "Rota" \
      008107 "Routt" \
      021205 "Rowan" \
      037159 "Rowan" \
      048399 "Runnels" \
      018139 "Rush" \
      020165 "Rush" \
      048401 "Rusk" \
      055107 "Rusk" \
      001113 "Russell" \
      020167 "Russell" \
      021207 "Russell" \
      051167 "Russell" \
      037161 "Rutherford" \
      047149 "Rutherford" \
      050021 "Rutland" \
      072121 "Sabana Grande" \
      022085 "Sabine" \
      048403 "Sabine" \
      019161 "Sac" \
      006067 "Sacramento" \
      023023 "Sagadahoc" \
      026145 "Saginaw" \
      008109 "Saguache" \
      069110 "Saipan" \
      034033 "Salem" \
      051775 "Salem (city)" \
      072123 "Salinas" \
      005125 "Saline" \
      017165 "Saline" \
      020169 "Saline" \
      029195 "Saline" \
      031151 "Saline" \
      049035 "Salt Lake" \
      045081 "Saluda" \
      037163 "Sampson" \
      048405 "San Augustine" \
      006069 "San Benito" \
      006071 "San Bernardino" \
      006073 "San Diego" \
      006075 "San Francisco" \
      072125 "San German" \
      048407 "San Jacinto" \
      006077 "San Joaquin" \
      008111 "San Juan" \
      035045 "San Juan" \
      049037 "San Juan" \
      053055 "San Juan" \
      072127 "San Juan" \
      072129 "San Lorenzo" \
      006079 "San Luis Obispo" \
      006081 "San Mateo" \
      008113 "San Miguel" \
      035047 "San Miguel" \
      048409 "San Patricio" \
      048411 "San Saba" \
      072131 "San Sebastian" \
      046111 "Sanborn" \
      030089 "Sanders" \
      035043 "Sandoval" \
      039143 "Sandusky" \
      017167 "Sangamon" \
      026151 "Sanilac" \
      049039 "Sanpete" \
      006083 "Santa Barbara" \
      006085 "Santa Clara" \
      004023 "Santa Cruz" \
      006087 "Santa Cruz" \
      035049 "Santa Fe" \
      072133 "Santa Isabel" \
      012113 "Santa Rosa" \
      012115 "Sarasota" \
      036091 "Saratoga" \
      038081 "Sargent" \
      031153 "Sarpy" \
      055111 "Sauk" \
      031155 "Saunders" \
      055113 "Sawyer" \
      036093 "Schenectady" \
      048413 "Schleicher" \
      013249 "Schley" \
      036095 "Schoharie" \
      026153 "Schoolcraft" \
      017169 "Schuyler" \
      029197 "Schuyler" \
      036097 "Schuyler" \
      042107 "Schuylkill" \
      039145 "Scioto" \
      029199 "Scotland" \
      037165 "Scotland" \
      005127 "Scott" \
      017171 "Scott" \
      018143 "Scott" \
      019163 "Scott" \
      020171 "Scott" \
      021209 "Scott" \
      027139 "Scott" \
      028123 "Scott" \
      029201 "Scott" \
      047151 "Scott" \
      051169 "Scott" \
      031157 "Scotts Bluff" \
      013251 "Screven" \
      048415 "Scurry" \
      005129 "Searcy" \
      005131 "Sebastian" \
      008115 "Sedgwick" \
      020173 "Sedgwick" \
      012117 "Seminole" \
      013253 "Seminole" \
      040133 "Seminole" \
      036099 "Seneca" \
      039147 "Seneca" \
      047153 "Sequatchie" \
      040135 "Sequoyah" \
      005133 "Sevier" \
      047155 "Sevier" \
      049041 "Sevier" \
      020175 "Seward" \
      031159 "Seward" \
      048417 "Shackelford" \
      029203 "Shannon" \
      046113 "Shannon" \
      028125 "Sharkey" \
      005135 "Sharp" \
      006089 "Shasta" \
      055115 "Shawano" \
      020177 "Shawnee" \
      055117 "Sheboygan" \
      001117 "Shelby" \
      017173 "Shelby" \
      018145 "Shelby" \
      019165 "Shelby" \
      021211 "Shelby" \
      029205 "Shelby" \
      039149 "Shelby" \
      047157 "Shelby" \
      048419 "Shelby" \
      051171 "Shenandoah" \
      027141 "Sherburne" \
      020179 "Sheridan" \
      030091 "Sheridan" \
      031161 "Sheridan" \
      038083 "Sheridan" \
      056033 "Sheridan" \
      020181 "Sherman" \
      031163 "Sherman" \
      041055 "Sherman" \
      048421 "Sherman" \
      026155 "Shiawassee" \
      016079 "Shoshone" \
      027143 "Sibley" \
      006091 "Sierra" \
      035051 "Sierra" \
      030093 "Silver Bow" \
      021213 "Simpson" \
      028127 "Simpson" \
      019167 "Sioux" \
      031165 "Sioux" \
      038085 "Sioux" \
      006093 "Siskiyou" \
      002220 "Sitka" \
      053057 "Skagit" \
      002232 "Skagway-Hoonah-Angoon" \
      053059 "Skamania" \
      038087 "Slope" \
      020183 "Smith" \
      028129 "Smith" \
      047159 "Smith" \
      048423 "Smith" \
      051173 "Smyth" \
      053061 "Snohomish" \
      042109 "Snyder" \
      035053 "Socorro" \
      006095 "Solano" \
      023025 "Somerset" \
      024039 "Somerset" \
      034035 "Somerset" \
      042111 "Somerset" \
      048425 "Somervell" \
      006097 "Sonoma" \
      070370 "Sonsorol" \
      051175 "Southampton" \
      002240 "Southeast Fairbanks" \
      013255 "Spalding" \
      045083 "Spartanburg" \
      018147 "Spencer" \
      021215 "Spencer" \
      046115 "Spink" \
      053063 "Spokane" \
      051177 "Spotsylvania" \
      022087 "St. Bernard" \
      022089 "St. Charles" \
      029183 "St. Charles" \
      001115 "St. Clair" \
      017163 "St. Clair" \
      026147 "St. Clair" \
      029185 "St. Clair" \
      055109 "St. Croix" \
      078010 "St. Croix" \
      005123 "St. Francis" \
      029187 "St. Francois" \
      022091 "St. Helena" \
      022093 "St. James" \
      078020 "St. John" \
      022095 "St. John the Baptist" \
      012109 "St. Johns" \
      018141 "St. Joseph" \
      026149 "St. Joseph" \
      022097 "St. Landry" \
      036089 "St. Lawrence" \
      027137 "St. Louis" \
      029189 "St. Louis" \
      029510 "St. Louis (city)" \
      012111 "St. Lucie" \
      022099 "St. Martin" \
      022101 "St. Mary" \
      024037 "St. Mary's" \
      022103 "St. Tammany" \
      078030 "St. Thomas" \
      020185 "Stafford" \
      051179 "Stafford" \
      006099 "Stanislaus" \
      046117 "Stanley" \
      037167 "Stanly" \
      020187 "Stanton" \
      031167 "Stanton" \
      017175 "Stark" \
      038089 "Stark" \
      039151 "Stark" \
      018149 "Starke" \
      048427 "Starr" \
      051790 "Staunton (city)" \
      029186 "Ste. Genevieve" \
      027145 "Stearns" \
      027147 "Steele" \
      038091 "Steele" \
      013257 "Stephens" \
      040137 "Stephens" \
      048429 "Stephens" \
      017177 "Stephenson" \
      048431 "Sterling" \
      018151 "Steuben" \
      036101 "Steuben" \
      020189 "Stevens" \
      027149 "Stevens" \
      053065 "Stevens" \
      013259 "Stewart" \
      047161 "Stewart" \
      030095 "Stillwater" \
      029207 "Stoddard" \
      037169 "Stokes" \
      005137 "Stone" \
      028131 "Stone" \
      029209 "Stone" \
      048433 "Stonewall" \
      032029 "Storey" \
      019169 "Story" \
      033017 "Strafford" \
      038093 "Stutsman" \
      056035 "Sublette" \
      025025 "Suffolk" \
      036103 "Suffolk" \
      051800 "Suffolk (city)" \
      018153 "Sullivan" \
      029211 "Sullivan" \
      033019 "Sullivan" \
      036105 "Sullivan" \
      042113 "Sullivan" \
      047163 "Sullivan" \
      046119 "Sully" \
      054089 "Summers" \
      008117 "Summit" \
      039153 "Summit" \
      049043 "Summit" \
      020191 "Sumner" \
      047165 "Sumner" \
      001119 "Sumter" \
      012119 "Sumter" \
      013261 "Sumter" \
      045085 "Sumter" \
      028133 "Sunflower" \
      037171 "Surry" \
      051181 "Surry" \
      042115 "Susquehanna" \
      010005 "Sussex" \
      034037 "Sussex" \
      051183 "Sussex" \
      006101 "Sutter" \
      048435 "Sutton" \
      012121 "Suwannee" \
      037173 "Swain" \
      060040 "Swains Island" \
      030097 "Sweet Grass" \
      056037 "Sweetwater" \
      027151 "Swift" \
      048437 "Swisher" \
      018155 "Switzerland" \
      013263 "Talbot" \
      024041 "Talbot" \
      013265 "Taliaferro" \
      001121 "Talladega" \
      028135 "Tallahatchie" \
      001123 "Tallapoosa" \
      019171 "Tama" \
      029213 "Taney" \
      022105 "Tangipahoa" \
      035055 "Taos" \
      048439 "Tarrant" \
      028137 "Tate" \
      013267 "Tattnall" \
      012123 "Taylor" \
      013269 "Taylor" \
      019173 "Taylor" \
      021217 "Taylor" \
      048441 "Taylor" \
      054091 "Taylor" \
      055119 "Taylor" \
      017179 "Tazewell" \
      051185 "Tazewell" \
      006103 "Tehama" \
      013271 "Telfair" \
      008119 "Teller" \
      022107 "Tensas" \
      022109 "Terrebonne" \
      013273 "Terrell" \
      048443 "Terrell" \
      048445 "Terry" \
      016081 "Teton" \
      030099 "Teton" \
      056039 "Teton" \
      029215 "Texas" \
      040139 "Texas" \
      031169 "Thayer" \
      013275 "Thomas" \
      020193 "Thomas" \
      031171 "Thomas" \
      048447 "Throckmorton" \
      031173 "Thurston" \
      053067 "Thurston" \
      013277 "Tift" \
      041057 "Tillamook" \
      040141 "Tillman" \
      069120 "Tinian" \
      036107 "Tioga" \
      042117 "Tioga" \
      028139 "Tippah" \
      018157 "Tippecanoe" \
      018159 "Tipton" \
      047167 "Tipton" \
      028141 "Tishomingo" \
      048449 "Titus" \
      072135 "Toa Alta" \
      072137 "Toa Baja" \
      021219 "Todd" \
      027153 "Todd" \
      046121 "Todd" \
      068385 "Toke" \
      009013 "Tolland" \
      048451 "Tom Green" \
      036109 "Tompkins" \
      049045 "Tooele" \
      030101 "Toole" \
      013279 "Toombs" \
      035057 "Torrance" \
      038095 "Towner" \
      013281 "Towns" \
      038097 "Traill" \
      037175 "Transylvania" \
      027155 "Traverse" \
      048453 "Travis" \
      030103 "Treasure" \
      020195 "Trego" \
      055121 "Trempealeau" \
      013283 "Treutlen" \
      021221 "Trigg" \
      021223 "Trimble" \
      006105 "Trinity" \
      048455 "Trinity" \
      046123 "Tripp" \
      013285 "Troup" \
      047169 "Trousdale" \
      072139 "Trujillo Alto" \
      039155 "Trumbull" \
      054093 "Tucker" \
      006107 "Tulare" \
      040143 "Tulsa" \
      028143 "Tunica" \
      006109 "Tuolumne" \
      013287 "Turner" \
      046125 "Turner" \
      001125 "Tuscaloosa" \
      039157 "Tuscarawas" \
      026157 "Tuscola" \
      013289 "Twiggs" \
      016083 "Twin Falls" \
      048457 "Tyler" \
      054095 "Tyler" \
      037177 "Tyrrell" \
      056041 "Uinta" \
      049047 "Uintah" \
      068390 "Ujae" \
      068400 "Ujelang" \
      036111 "Ulster" \
      041059 "Umatilla" \
      047171 "Unicoi" \
      005139 "Union" \
      012125 "Union" \
      013291 "Union" \
      017181 "Union" \
      018161 "Union" \
      019175 "Union" \
      021225 "Union" \
      022111 "Union" \
      028145 "Union" \
      034039 "Union" \
      035059 "Union" \
      037179 "Union" \
      039159 "Union" \
      041061 "Union" \
      042119 "Union" \
      045087 "Union" \
      046127 "Union" \
      047173 "Union" \
      048459 "Upshur" \
      054097 "Upshur" \
      013293 "Upson" \
      048461 "Upton" \
      049049 "Utah" \
      068410 "Utrik" \
      072141 "Utuado" \
      048463 "Uvalde" \
      048465 "Val Verde" \
      002261 "Valdez-Cordova" \
      035061 "Valencia" \
      016085 "Valley" \
      030105 "Valley" \
      031175 "Valley" \
      005141 "Van Buren" \
      019177 "Van Buren" \
      026159 "Van Buren" \
      047175 "Van Buren" \
      039161 "Van Wert" \
      048467 "Van Zandt" \
      037181 "Vance" \
      018163 "Vanderburgh" \
      072143 "Vega Alta" \
      072145 "Vega Baja" \
      042121 "Venango" \
      006111 "Ventura" \
      017183 "Vermilion" \
      022113 "Vermilion" \
      018165 "Vermillion" \
      022115 "Vernon" \
      029217 "Vernon" \
      055123 "Vernon" \
      048469 "Victoria" \
      072147 "Vieques" \
      018167 "Vigo" \
      055125 "Vilas" \
      072149 "Villalba" \
      039163 "Vinton" \
      051810 "Virginia Beach (city)" \
      012127 "Volusia" \
      017185 "Wabash" \
      018169 "Wabash" \
      027157 "Wabasha" \
      020197 "Wabaunsee" \
      002270 "Wade Hampton" \
      027159 "Wadena" \
      040145 "Wagoner" \
      053069 "Wahkiakum" \
      037183 "Wake" \
      074450 "Wake Island" \
      012129 "Wakulla" \
      023027 "Waldo" \
      001127 "Walker" \
      013295 "Walker" \
      048471 "Walker" \
      053071 "Walla Walla" \
      020199 "Wallace" \
      048473 "Waller" \
      041063 "Wallowa" \
      038099 "Walsh" \
      028147 "Walthall" \
      012131 "Walton" \
      013297 "Walton" \
      046129 "Walworth" \
      055127 "Walworth" \
      019179 "Wapello" \
      038101 "Ward" \
      048475 "Ward" \
      013299 "Ware" \
      013301 "Warren" \
      017187 "Warren" \
      018171 "Warren" \
      019181 "Warren" \
      021227 "Warren" \
      028149 "Warren" \
      029219 "Warren" \
      034041 "Warren" \
      036113 "Warren" \
      037185 "Warren" \
      039165 "Warren" \
      042123 "Warren" \
      047177 "Warren" \
      051187 "Warren" \
      018173 "Warrick" \
      049051 "Wasatch" \
      041065 "Wasco" \
      027161 "Waseca" \
      056043 "Washakie" \
      055129 "Washburn" \
      001129 "Washington" \
      005143 "Washington" \
      008121 "Washington" \
      012133 "Washington" \
      013303 "Washington" \
      016087 "Washington" \
      017189 "Washington" \
      018175 "Washington" \
      019183 "Washington" \
      020201 "Washington" \
      021229 "Washington" \
      022117 "Washington" \
      023029 "Washington" \
      024043 "Washington" \
      027163 "Washington" \
      028151 "Washington" \
      029221 "Washington" \
      031177 "Washington" \
      036115 "Washington" \
      037187 "Washington" \
      039167 "Washington" \
      040147 "Washington" \
      041067 "Washington" \
      042125 "Washington" \
      044009 "Washington" \
      047179 "Washington" \
      048477 "Washington" \
      049053 "Washington" \
      050023 "Washington" \
      051191 "Washington" \
      055131 "Washington" \
      040149 "Washita" \
      032031 "Washoe" \
      026161 "Washtenaw" \
      037189 "Watauga" \
      027165 "Watonwan" \
      055133 "Waukesha" \
      055135 "Waupaca" \
      055137 "Waushara" \
      013305 "Wayne" \
      017191 "Wayne" \
      018177 "Wayne" \
      019185 "Wayne" \
      021231 "Wayne" \
      026163 "Wayne" \
      028153 "Wayne" \
      029223 "Wayne" \
      031179 "Wayne" \
      036117 "Wayne" \
      037191 "Wayne" \
      039169 "Wayne" \
      042127 "Wayne" \
      047181 "Wayne" \
      049055 "Wayne" \
      054099 "Wayne" \
      051820 "Waynesboro (city)" \
      047183 "Weakley" \
      048479 "Webb" \
      049057 "Weber" \
      013307 "Webster" \
      019187 "Webster" \
      021233 "Webster" \
      022119 "Webster" \
      028155 "Webster" \
      029225 "Webster" \
      031181 "Webster" \
      054101 "Webster" \
      008123 "Weld" \
      018179 "Wells" \
      038103 "Wells" \
      022121 "West Baton Rouge" \
      022123 "West Carroll" \
      022125 "West Feliciana" \
      036119 "Westchester" \
      060050 "Western District" \
      042129 "Westmoreland" \
      051193 "Westmoreland" \
      056045 "Weston" \
      054103 "Wetzel" \
      026165 "Wexford" \
      048481 "Wharton" \
      053073 "Whatcom" \
      030107 "Wheatland" \
      013309 "Wheeler" \
      031183 "Wheeler" \
      041069 "Wheeler" \
      048483 "Wheeler" \
      005145 "White" \
      013311 "White" \
      017193 "White" \
      018181 "White" \
      047185 "White" \
      032033 "White Pine" \
      017195 "Whiteside" \
      013313 "Whitfield" \
      018183 "Whitley" \
      021235 "Whitley" \
      053075 "Whitman" \
      030109 "Wibaux" \
      020203 "Wichita" \
      048485 "Wichita" \
      024045 "Wicomico" \
      048487 "Wilbarger" \
      001131 "Wilcox" \
      013315 "Wilcox" \
      013317 "Wilkes" \
      037193 "Wilkes" \
      027167 "Wilkin" \
      013319 "Wilkinson" \
      028157 "Wilkinson" \
      017197 "Will" \
      048489 "Willacy" \
      038105 "Williams" \
      039171 "Williams" \
      045089 "Williamsburg" \
      051830 "Williamsburg (city)" \
      017199 "Williamson" \
      047187 "Williamson" \
      048491 "Williamson" \
      020205 "Wilson" \
      037195 "Wilson" \
      047189 "Wilson" \
      048493 "Wilson" \
      051840 "Winchester (city)" \
      009015 "Windham" \
      050025 "Windham" \
      050027 "Windsor" \
      048495 "Winkler" \
      022127 "Winn" \
      017201 "Winnebago" \
      019189 "Winnebago" \
      055139 "Winnebago" \
      019191 "Winneshiek" \
      027169 "Winona" \
      001133 "Winston" \
      028159 "Winston" \
      054105 "Wirt" \
      048497 "Wise" \
      051195 "Wise" \
      021237 "Wolfe" \
      039173 "Wood" \
      048499 "Wood" \
      054107 "Wood" \
      055141 "Wood" \
      019193 "Woodbury" \
      017203 "Woodford" \
      021239 "Woodford" \
      005147 "Woodruff" \
      040151 "Woods" \
      020207 "Woodson" \
      040153 "Woodward" \
      024047 "Worcester" \
      025027 "Worcester" \
      013321 "Worth" \
      019195 "Worth" \
      029227 "Worth" \
      068420 "Wotho" \
      068430 "Wotle" \
      002280 "Wrangell-Petersburg" \
      019197 "Wright" \
      027171 "Wright" \
      029229 "Wright" \
      039175 "Wyandot" \
      020209 "Wyandotte" \
      036121 "Wyoming" \
      042131 "Wyoming" \
      054109 "Wyoming" \
      051197 "Wythe" \
      072151 "Yabucoa" \
      037197 "Yadkin" \
      053077 "Yakima" \
      002282 "Yakutat" \
      028161 "Yalobusha" \
      041071 "Yamhill" \
      037199 "Yancey" \
      046135 "Yankton" \
      064060 "Yap" \
      036123 "Yates" \
      072153 "Yauco" \
      004025 "Yavapai" \
      028163 "Yazoo" \
      005149 "Yell" \
      027173 "Yellow Medicine" \
      030111 "Yellowstone" \
      048501 "Yoakum" \
      006113 "Yolo" \
      023031 "York" \
      031185 "York" \
      042133 "York" \
      045091 "York" \
      051199 "York" \
      048503 "Young" \
      006115 "Yuba" \
      002290 "Yukon-Koyukuk" \
      004027 "Yuma" \
      008125 "Yuma" \
      048505 "Zapata" \
      048507 "Zavala" \
      046137 "Ziebach" \
      072071 "lsabela"
      COUNTY=$(<"$TMP")
      ;;
    5)
      dialog --inputbox "Enter duration in minutes:" 8 40 "${DURATION#+}" 2>"$TMP"
      RAW_DURATION=$(<"$TMP")
      if [[ "$RAW_DURATION" =~ ^[0-9]+$ ]]; then
        DURATION="+$(printf "%04d" "$RAW_DURATION")"
      else
        dialog --msgbox "Invalid duration. Must be a number." 6 40
      fi
      ;;
    6)
      dialog --inputbox "Enter date as MM/DD/YYYY:" 8 40 "" 2>"$TMP"
      DATE_INPUT=$(<"$TMP")
      if date -d "$DATE_INPUT" >/dev/null 2>&1; then
        JULIAN=$(date -d "$DATE_INPUT" +%j)
      else
        dialog --msgbox "Invalid date format. Use MM/DD/YYYY." 6 50
      fi
      ;;
    7)
      dialog --inputbox "Enter UTC time (HHMM):" 8 40 "$UTCTIME" 2>"$TMP"
      UTCTIME=$(<"$TMP")
      ;;
    8)
      dialog --inputbox "Enter station call sign:" 8 40 "$CALLSIGN" 2>"$TMP"
      CALLSIGN=$(<"$TMP")
      ;;
    9)
      if [[ -z "$ORG" || -z "$EVENT" || -z "$STATE" || -z "$COUNTY" || -z "$DURATION" || -z "$JULIAN" || -z "$UTCTIME" || -z "$CALLSIGN" ]]; then
        dialog --msgbox "Please fill in all fields before generating the header." 8 50
      else
        HEADER="ZCZC-$ORG-$EVENT-${STATE}${COUNTY}${DURATION}-${JULIAN}${UTCTIME}-${CALLSIGN}-"
        dialog --msgbox "Your SAME header is:\n\n$HEADER" 10 60
      fi
      ;;
    0)
      if [[ -z "$ORG" || -z "$EVENT" || -z "$STATE" || -z "$COUNTY" || -z "$DURATION" || -z "$JULIAN" || -z "$UTCTIME" || -z "$CALLSIGN" ]]; then
        dialog --msgbox "Please fill in all fields before playing." 8 50
      else
        HEADER="ZCZC-$ORG-$EVENT-${STATE}${COUNTY}${DURATION}-${JULIAN}${UTCTIME}-${CALLSIGN}-"
        for i in {1..3}; do echo "$HEADER" | \
        minimodem --tx SAME; sleep 1; done
        play -n synth 8 sine 853 sine 960 > /dev/null 2>&1 && \
        sleep 5 && \
        for i in {1..3}; do echo "NNNN" | \
        minimodem --tx SAME; sleep 0.75; done
      fi
      ;;
  esac
done
