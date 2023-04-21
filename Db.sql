create database agile_poc;
create schema raw;
use database agile_poc;
use schema raw;

drop table if exists siteinfo;
create table siteinfo
(
    SiteID Numeric,
    MacAddress Varchar(100),
    ApName Varchar(100),
    IpAddress Varchar(100),
    ModelNumber Varchar(100),
    SerialNumber Varchar(100),
    ApFirmware Varchar(100),
    Antenna Varchar(100),
    Location Varchar(500),
    VlanId Numeric,
    RfBand Varchar(100)
)
;

insert into siteinfo values ('1','00:11:22:33:44:55','MyWiFiNetwork1','192.168.0.1','AP-1234','123456','3.2.1','Omni-Directional','Building A, 1st Floor, Room 101','10','2.4Gz');
insert into siteinfo values ('2','00:11:22:33:44:56','MyWiFiNetwork2','192.168.0.2','AP-1233','123457','3.2.1','Directional','Building A, 1st Floor, Room 102','20','5Gz');
insert into siteinfo values ('3','00:11:22:33:44:57','MyWiFiNetwork3','192.168.0.3','AP-1232','123458','3.2.1','Omni-Directional','Building A, 1st Floor, Room 103','30','2.4Gz');
insert into siteinfo values ('4','00:11:22:33:44:58','MyWiFiNetwork4','192.168.0.4','AP-1231','123459','3.2.1','Directional','Building A, 1st Floor, Room 104','40','5Gz');
insert into siteinfo values ('5','00:11:22:33:44:59','MyWiFiNetwork5','192.168.0.5','AP-1230','123460','3.2.1','Omni-Directional','Building A, 1st Floor, Room 105','50','2.4Gz');
insert into siteinfo values ('6','00:11:22:33:44:60','MyWiFiNetwork6','192.168.0.6','AP-1229','123461','3.2.1','Directional','Building A, 1st Floor, Room 106','60','5Gz');
insert into siteinfo values ('7','00:11:22:33:44:61','MyWiFiNetwork7','192.168.0.7','AP-1228','123462','3.2.1','Omni-Directional','Building A, 1st Floor, Room 107','70','2.4Gz');
insert into siteinfo values ('8','00:11:22:33:44:62','MyWiFiNetwork8','192.168.0.8','AP-1227','123463','3.2.1','Directional','Building A, 1st Floor, Room 108','80','5Gz');
insert into siteinfo values ('9','00:11:22:33:44:63','MyWiFiNetwork9','192.168.0.9','AP-1226','123464','3.2.1','Omni-Directional','Building A, 1st Floor, Room 109','90','2.4Gz');
insert into siteinfo values ('10','00:11:22:33:44:64','MyWiFiNetwork10','192.168.0.10','AP-1225','123465','3.2.1','Directional','Building A, 1st Floor, Room 110','100','5Gz');


drop table if exists InterferenceSources;
create table InterferenceSources
(
    InterferenceSourceId Numeric,
    SourceType Varchar(100),
    SourceFrequency Varchar(100)
);


insert into InterferenceSources values (1,'Bluetooth Device','2.4Gz');
insert into InterferenceSources values (2,'Wireless Video Camera','2.4Gz');
insert into InterferenceSources values (3,'Microwave Oven','2.4Gz');
insert into InterferenceSources values (4,'Phone','2.4Gz');
insert into InterferenceSources values (5,'Wi-Fi Device','5Gz');


drop table if exists EventDetails;
create table EventDetails
(
    EventId Numeric,
    SiteId Numeric,
    AvailableChannels Varchar(100),
    InterferenceSourceId numeric,
    InterfenceSourceLoc Varchar(100),
    Channel Numeric,
    DataRateMbps Numeric,
    BSSID Varchar(100),
    NoiseFloorDbm Numeric,
    InterferenceSourcePowerDbm Numeric,
    AdjacentChannelInterferenceDbm Numeric,
    RecievedSignalStrengthIndicator Numeric,
    APTxPowerDbm Numeric,
    SNRDb Numeric
);
insert into EventDetails values ('1','1','108, 40 ,82 ,81','1','Conference Room','82','54','12:34:56:78:90:AB','-82','-70','-75','-70','15','25');
insert into EventDetails values ('2','1','67, 73 ,32 ,58','5','Lobby','73','12','98:76:54:32:10:FE','-75','-80','-70','-85','20','20');
insert into EventDetails values ('3','1','35, 45 ,71 ,11','3','Kitchen','71','24','11:22:33:44:55:66','-80','-70','-90','-60','12','18');
insert into EventDetails values ('4','1','37, 102 ,77 ,34','1','Break Room','102','6','AA:BB:CC:DD:EE:FF','-85','-75','-78','-75','18','30');
insert into EventDetails values ('5','1','40, 110 ,54 ,17','1','Hallway','54','18','12:34:56:78:90:CD','-78','-80','-80','-80','21','20');
insert into EventDetails values ('6','1','51, 72 ,36 ,34','4','Bedroom','72','24','91:94:2b:e2:41:a4','-84','-68','-84','-71','16','23');
insert into EventDetails values ('7','1','117, 15 ,42 ,53','2','Lobby','117','37','0b:26:99:be:1f:80','-98','-81','-68','-56','18','16');
insert into EventDetails values ('8','1','19, 97 ,25 ,47','5','Kitchen','97','17','28:01:71:03:51:10','-79','-77','-85','-86','26','5');
insert into EventDetails values ('9','1','121, 115 ,23 ,86','2','Break Room','121','48','0f:9c:00:7e:65:19','-81','-79','-84','-43','29','32');
insert into EventDetails values ('10','1','66, 51 ,62 ,31','2','Hallway','66','11','21:3e:5e:5f:c8:30','-75','-90','-90','-83','10','16');
insert into EventDetails values ('11','2','108, 40 ,82 ,81','1','Conference Room','82','54','22:da:f2:b9:be:4a','-91','-84','-44','-84','6','17');
insert into EventDetails values ('12','2','67, 73 ,32 ,58','5','Lobby','73','12','36:55:29:03:a2:3d','-77','-77','-88','-69','15','18');
insert into EventDetails values ('13','2','35, 45 ,71 ,11','3','Kitchen','71','24','c4:de:8a:db:41:8d','-95','-82','-81','-79','15','12');
insert into EventDetails values ('14','2','37, 102 ,77 ,34','1','Break Room','102','6','cc:66:0e:e4:57:e3','-85','-60','-86','-61','22','29');
insert into EventDetails values ('15','2','40, 110 ,54 ,17','1','Hallway','54','18','44:4e:5d:e8:12:77','-93','-80','-75','-74','26','6');
insert into EventDetails values ('16','2','51, 72 ,36 ,34','4','Bedroom','72','24','8c:07:0c:6e:36:a8','-74','-68','-93','-84','37','28');
insert into EventDetails values ('17','2','117, 15 ,42 ,53','2','Lobby','117','37','fc:37:5f:ac:08:bf','-82','-75','-80','-68','28','32');
insert into EventDetails values ('18','2','19, 97 ,25 ,47','5','Kitchen','97','17','60:f6:52:75:24:52','-92','-69','-72','-74','26','14');
insert into EventDetails values ('19','2','121, 115 ,23 ,86','2','Break Room','121','48','53:88:08:f8:57:dd','-73','-61','-94','-61','28','12');
insert into EventDetails values ('20','2','66, 51 ,62 ,31','2','Hallway','66','11','bc:f8:c9:e2:04:f0','-90','-69','-68','-71','19','10');
insert into EventDetails values ('21','3','108, 40 ,82 ,81','1','Conference Room','82','54','bb:20:73:fc:67:c1','-97','-74','-69','-60','19','17');
insert into EventDetails values ('22','3','67, 73 ,32 ,58','5','Lobby','73','12','89:79:a5:3e:b5:1c','-76','-65','-80','-69','2','23');
insert into EventDetails values ('23','3','35, 45 ,71 ,11','3','Kitchen','71','24','fb:55:fc:6a:7b:62','-93','-69','-82','-70','27','19');
insert into EventDetails values ('24','3','37, 102 ,77 ,34','1','Break Room','102','6','2c:be:c9:6a:e4:12','-83','-71','-96','-85','14','25');
insert into EventDetails values ('25','3','40, 110 ,54 ,17','1','Hallway','54','18','a7:60:9b:7a:b9:da','-85','-85','-93','-76','28','24');
insert into EventDetails values ('26','3','51, 72 ,36 ,34','4','Bedroom','72','24','b3:4c:f4:1f:38:71','-98','-82','-79','-63','13','37');
insert into EventDetails values ('27','3','117, 15 ,42 ,53','2','Lobby','117','37','43:b8:1b:72:a7:af','-74','-72','-69','-65','24','18');
insert into EventDetails values ('28','3','19, 97 ,25 ,47','5','Kitchen','97','17','59:7d:b3:aa:68:48','-94','-67','-93','-82','20','18');
insert into EventDetails values ('29','3','121, 115 ,23 ,86','2','Break Room','121','48','cc:d6:05:f4:d6:f3','-80','-71','-88','-61','7','23');
insert into EventDetails values ('30','3','66, 51 ,62 ,31','2','Hallway','66','11','c2:38:85:09:e5:75','-72','-84','-80','-72','1','15');
insert into EventDetails values ('31','4','108, 40 ,82 ,81','1','Conference Room','82','54','49:e0:05:10:27:8e','-95','-88','-85','-80','16','19');
insert into EventDetails values ('32','4','67, 73 ,32 ,58','5','Lobby','73','12','f5:43:1d:43:b4:b1','-99','-89','-78','-74','1','8');
insert into EventDetails values ('33','4','35, 45 ,71 ,11','3','Kitchen','71','24','fa:b1:6f:2f:cb:d7','-84','-82','-60','-61','20','11');
insert into EventDetails values ('34','4','37, 102 ,77 ,34','1','Break Room','102','6','86:99:39:15:39:fd','-101','-86','-82','-71','26','18');
insert into EventDetails values ('35','4','40, 110 ,54 ,17','1','Hallway','54','18','15:ce:1e:06:ca:d1','-82','-87','-75','-60','6','26');
insert into EventDetails values ('36','4','51, 72 ,36 ,34','4','Bedroom','72','24','05:f7:f0:ed:aa:07','-82','-76','-66','-69','4','42');
insert into EventDetails values ('37','4','117, 15 ,42 ,53','2','Lobby','117','37','7c:40:90:fa:fe:38','-95','-67','-86','-70','24','10');
insert into EventDetails values ('38','4','19, 97 ,25 ,47','5','Kitchen','97','17','ba:a0:63:a4:67:f2','-107','-81','-68','-85','10','16');
insert into EventDetails values ('39','4','121, 115 ,23 ,86','2','Break Room','121','48','5e:8e:4f:dc:7f:42','-92','-87','-72','-76','23','15');
insert into EventDetails values ('40','4','66, 51 ,62 ,31','2','Hallway','66','11','46:d1:3d:f6:59:3b','-92','-66','-95','-74','2','18');
insert into EventDetails values ('41','5','108, 40 ,82 ,81','1','Conference Room','82','54','f9:39:23:6e:72:ec','-112','-65','-90','-61','7','20');
insert into EventDetails values ('42','5','67, 73 ,32 ,58','5','Lobby','73','12','25:ae:4a:cf:85:a3','-98','-73','-80','-71','34','13');
insert into EventDetails values ('43','5','35, 45 ,71 ,11','3','Kitchen','71','24','8b:a3:d8:98:9b:74','-101','-68','-70','-60','2','20');
insert into EventDetails values ('44','5','37, 102 ,77 ,34','1','Break Room','102','6','92:b2:94:6f:42:cc','-85','-81','-75','-69','6','34');
insert into EventDetails values ('45','5','40, 110 ,54 ,17','1','Hallway','54','18','39:72:dd:20:ea:57','-94','-72','-99','-70','15','19');
insert into EventDetails values ('46','5','51, 72 ,36 ,34','4','Bedroom','72','24','87:91:cd:bf:ca:cd','-101','-81','-99','-85','12','13');
insert into EventDetails values ('47','5','117, 15 ,42 ,53','2','Lobby','117','37','3c:9c:88:cd:f2:b7','-83','-79','-68','-76','11','12');
insert into EventDetails values ('48','5','19, 97 ,25 ,47','5','Kitchen','97','17','ec:d2:2f:71:7f:60','-91','-90','-85','-60','1','38');
insert into EventDetails values ('49','5','121, 115 ,23 ,86','2','Break Room','121','48','7c:98:f5:60:32:e5','-75','-84','-90','-74','8','15');
insert into EventDetails values ('50','5','66, 51 ,62 ,31','2','Hallway','66','11','6c:08:15:96:09:2c','-93','-77','-75','-60','15','29');
insert into EventDetails values ('51','6','108, 40 ,82 ,81','1','Conference Room','82','54','0a:bb:57:15:84:c9','-93','-82','-72','-64','24','5');
insert into EventDetails values ('52','6','67, 73 ,32 ,58','5','Lobby','73','12','ab:69:08:bd:f8:fb','-82','-60','-62','-82','26','13');
insert into EventDetails values ('53','6','35, 45 ,71 ,11','3','Kitchen','71','24','0a:08:f4:cf:ea:9f','-103','-80','-82','-61','29','32');
insert into EventDetails values ('54','6','37, 102 ,77 ,34','1','Break Room','102','6','8c:dc:09:95:f7:f7','-105','-68','-96','-73','10','8');
insert into EventDetails values ('55','6','40, 110 ,54 ,17','1','Hallway','54','18','8c:dc:09:95:f7:f8','-84','-75','-93','-74','6','11');
insert into EventDetails values ('56','6','51, 72 ,36 ,34','4','Bedroom','72','24','8c:dc:09:95:f7:f9','-85','-69','-79','-61','15','18');
insert into EventDetails values ('57','6','117, 15 ,42 ,53','2','Lobby','117','37','8c:dc:09:95:f7:f10','-98','-79','-69','-71','15','26');
insert into EventDetails values ('58','6','19, 97 ,25 ,47','5','Kitchen','97','17','8c:dc:09:95:f7:f11','-74','-90','-93','-60','22','42');
insert into EventDetails values ('59','6','121, 115 ,23 ,86','2','Break Room','121','48','8c:dc:09:95:f7:f12','-94','-84','-82','-69','26','10');
insert into EventDetails values ('60','6','66, 51 ,62 ,31','2','Hallway','66','11','8c:dc:09:95:f7:f13','-80','-77','-96','-70','6','8');
insert into EventDetails values ('61','7','108, 40 ,82 ,81','1','Conference Room','82','54','8c:dc:09:95:f7:f14','-72','-82','-93','-74','28','11');
insert into EventDetails values ('62','7','67, 73 ,32 ,58','5','Lobby','73','12','8c:dc:09:95:f7:f15','-95','-60','-79','-61','26','18');
insert into EventDetails values ('63','7','35, 45 ,71 ,11','3','Kitchen','71','24','8c:dc:09:95:f7:f16','-99','-80','-69','-71','28','26');
insert into EventDetails values ('64','7','37, 102 ,77 ,34','1','Break Room','102','6','8c:dc:09:95:f7:f17','-84','-68','-93','-60','19','42');
insert into EventDetails values ('65','7','40, 110 ,54 ,17','1','Hallway','54','18','8c:dc:09:95:f7:f18','-101','-79','-88','-69','19','10');
insert into EventDetails values ('66','7','51, 72 ,36 ,34','4','Bedroom','72','24','8c:dc:09:95:f7:f19','-82','-90','-82','-70','2','16');
insert into EventDetails values ('67','7','117, 15 ,42 ,53','2','Lobby','117','37','8c:dc:09:95:f7:f20','-82','-84','-96','-85','27','15');
insert into EventDetails values ('68','7','19, 97 ,25 ,47','5','Kitchen','97','17','8c:dc:09:95:f7:f21','-95','-77','-93','-74','11','8');
insert into EventDetails values ('69','7','121, 115 ,23 ,86','2','Break Room','121','48','8c:dc:09:95:f7:f22','-107','-82','-79','-61','1','11');
insert into EventDetails values ('70','8','66, 51 ,62 ,31','2','Hallway','66','11','8c:dc:09:95:f7:f23','-92','-60','-69','-71','8','18');
insert into EventDetails values ('71','8','108, 40 ,82 ,81','1','Conference Room','82','54','8c:dc:09:95:f7:f24','-92','-80','-93','-60','15','26');
insert into EventDetails values ('72','8','67, 73 ,32 ,58','5','Lobby','73','12','8c:dc:09:95:f7:f25','-95','-79','-82','-69','24','42');
insert into EventDetails values ('73','8','35, 45 ,71 ,11','3','Kitchen','71','24','8c:dc:09:95:f7:f26','-99','-90','-96','-70','26','10');
insert into EventDetails values ('74','8','37, 102 ,77 ,34','1','Break Room','102','6','8c:dc:09:95:f7:f27','-84','-84','-93','-61','11','16');
insert into EventDetails values ('75','8','40, 110 ,54 ,17','1','Hallway','54','18','8c:dc:09:95:f7:f28','-101','-77','-79','-74','1','15');
insert into EventDetails values ('76','8','51, 72 ,36 ,34','4','Bedroom','72','24','8c:dc:09:95:f7:f29','-82','-82','-69','-84','8','8');
insert into EventDetails values ('77','8','117, 15 ,42 ,53','2','Lobby','117','37','8c:dc:09:95:f7:f30','-82','-60','-93','-68','15','11');
insert into EventDetails values ('78','8','19, 97 ,25 ,47','5','Kitchen','97','17','8c:dc:09:95:f7:f31','-95','-79','-88','-74','24','18');
insert into EventDetails values ('79','8','121, 115 ,23 ,86','2','Break Room','121','48','8c:dc:09:95:f7:f32','-107','-90','-80','-61','11','26');
insert into EventDetails values ('80','8','66, 51 ,62 ,31','2','Hallway','66','11','8c:dc:09:95:f7:f33','-92','-84','-82','-71','1','42');
insert into EventDetails values ('81','9','108, 40 ,82 ,81','1','Conference Room','82','54','8c:dc:09:95:f7:f34','-101','-77','-96','-60','8','10');
insert into EventDetails values ('82','9','67, 73 ,32 ,58','5','Lobby','73','12','8c:dc:09:95:f7:f35','-82','-82','-93','-69','15','16');
insert into EventDetails values ('83','9','35, 45 ,71 ,11','3','Kitchen','71','24','8c:dc:09:95:f7:f36','-95','-60','-79','-70','24','15');
insert into EventDetails values ('84','9','37, 102 ,77 ,34','1','Break Room','102','6','8c:dc:09:95:f7:f37','-99','-80','-69','-85','26','18');
insert into EventDetails values ('85','9','40, 110 ,54 ,17','1','Hallway','54','18','8c:dc:09:95:f7:f38','-84','-68','-93','-76','29','8');
insert into EventDetails values ('86','9','51, 72 ,36 ,34','4','Bedroom','72','24','8c:dc:09:95:f7:f39','-101','-75','-88','-63','10','11');
insert into EventDetails values ('87','9','117, 15 ,42 ,53','2','Lobby','117','37','8c:dc:09:95:f7:f40','-82','-79','-82','-61','11','18');
insert into EventDetails values ('88','9','19, 97 ,25 ,47','5','Kitchen','97','17','8c:dc:09:95:f7:f41','-82','-90','-96','-74','1','26');
insert into EventDetails values ('89','9','121, 115 ,23 ,86','2','Break Room','121','48','8c:dc:09:95:f7:f42','-95','-84','-93','-84','8','42');
insert into EventDetails values ('90','9','66, 51 ,62 ,31','2','Hallway','66','11','8c:dc:09:95:f7:f43','-107','-77','-79','-68','15','8');
insert into EventDetails values ('91','10','108, 40 ,82 ,81','1','Conference Room','82','54','8c:dc:09:95:f7:f44','-92','-82','-69','-74','24','8');
insert into EventDetails values ('92','10','67, 73 ,32 ,58','5','Lobby','73','12','8c:dc:09:95:f7:f45','-95','-79','-93','-61','26','11');
insert into EventDetails values ('93','10','35, 45 ,71 ,11','3','Kitchen','71','24','8c:dc:09:95:f7:f46','-95','-90','-88','-71','11','18');
insert into EventDetails values ('94','10','37, 102 ,77 ,34','1','Break Room','102','6','8c:dc:09:95:f7:f47','-99','-84','-80','-60','1','26');
insert into EventDetails values ('95','10','40, 110 ,54 ,17','1','Hallway','54','18','8c:dc:09:95:f7:f48','-84','-77','-85','-69','8','42');
insert into EventDetails values ('96','10','51, 72 ,36 ,34','4','Bedroom','72','24','8c:dc:09:95:f7:f49','-101','-82','-78','-70','15','10');
insert into EventDetails values ('97','10','117, 15 ,42 ,53','2','Lobby','117','37','8c:dc:09:95:f7:f50','-82','-60','-60','-85','24','16');
insert into EventDetails values ('98','10','19, 97 ,25 ,47','5','Kitchen','97','17','8c:dc:09:95:f7:f51','-82','-80','-82','-76','26','15');
insert into EventDetails values ('99','10','121, 115 ,23 ,86','2','Break Room','121','48','8c:dc:09:95:f7:f52','-95','-68','-75','-63','29','18');

drop table if exists EventPacketDetails;
create table EventPacketDetails
(
    EventID Numeric,
    PacketSent numeric,
    PacketLost numeric,
    Retries numeric
);



insert into EventPacketDetails values ('1','200','5','2');
insert into EventPacketDetails values ('2','150','10','4');
insert into EventPacketDetails values ('3','300','2','1');
insert into EventPacketDetails values ('4','100','15','5');
insert into EventPacketDetails values ('5','250','7','3');
insert into EventPacketDetails values ('6','232','16','5');
insert into EventPacketDetails values ('7','223','16','4');
insert into EventPacketDetails values ('8','245','18','6');
insert into EventPacketDetails values ('9','241','18','5');
insert into EventPacketDetails values ('10','261','18','4');
insert into EventPacketDetails values ('11','237','14','4');
insert into EventPacketDetails values ('12','251','19','4');
insert into EventPacketDetails values ('13','245','12','2');
insert into EventPacketDetails values ('14','244','14','3');
insert into EventPacketDetails values ('15','233','14','3');
insert into EventPacketDetails values ('16','243','13','3');
insert into EventPacketDetails values ('17','232','16','5');
insert into EventPacketDetails values ('18','252','9','2');
insert into EventPacketDetails values ('19','246','14','5');
insert into EventPacketDetails values ('20','233','22','8');
insert into EventPacketDetails values ('21','237','17','6');
insert into EventPacketDetails values ('22','229','16','5');
insert into EventPacketDetails values ('23','218','19','6');
insert into EventPacketDetails values ('24','241','18','6');
insert into EventPacketDetails values ('25','232','19','7');
insert into EventPacketDetails values ('26','244','13','4');
insert into EventPacketDetails values ('27','224','20','5');
insert into EventPacketDetails values ('28','227','19','5');
insert into EventPacketDetails values ('29','244','13','3');
insert into EventPacketDetails values ('30','223','16','4');
insert into EventPacketDetails values ('31','245','18','6');
insert into EventPacketDetails values ('32','241','18','5');
insert into EventPacketDetails values ('33','261','18','4');
insert into EventPacketDetails values ('34','237','14','4');
insert into EventPacketDetails values ('35','251','19','4');
insert into EventPacketDetails values ('36','245','12','2');
insert into EventPacketDetails values ('37','244','14','3');
insert into EventPacketDetails values ('38','233','14','3');
insert into EventPacketDetails values ('39','243','13','3');
insert into EventPacketDetails values ('40','232','16','5');
insert into EventPacketDetails values ('41','252','9','2');
insert into EventPacketDetails values ('42','246','14','5');
insert into EventPacketDetails values ('43','233','22','8');
insert into EventPacketDetails values ('44','237','17','6');
insert into EventPacketDetails values ('45','229','16','5');
insert into EventPacketDetails values ('46','218','19','6');
insert into EventPacketDetails values ('47','241','18','6');
insert into EventPacketDetails values ('48','232','19','7');
insert into EventPacketDetails values ('49','244','13','4');
insert into EventPacketDetails values ('50','224','20','5');
insert into EventPacketDetails values ('51','227','19','5');
insert into EventPacketDetails values ('52','244','13','3');
insert into EventPacketDetails values ('53','225','16','5');
insert into EventPacketDetails values ('54','223','16','4');
insert into EventPacketDetails values ('55','245','18','6');
insert into EventPacketDetails values ('56','241','18','5');
insert into EventPacketDetails values ('57','261','18','4');
insert into EventPacketDetails values ('58','237','14','4');
insert into EventPacketDetails values ('59','251','19','4');
insert into EventPacketDetails values ('60','245','12','2');
insert into EventPacketDetails values ('61','244','14','3');
insert into EventPacketDetails values ('62','233','14','3');
insert into EventPacketDetails values ('63','223','16','4');
insert into EventPacketDetails values ('64','245','18','6');
insert into EventPacketDetails values ('65','241','18','5');
insert into EventPacketDetails values ('66','261','18','4');
insert into EventPacketDetails values ('67','237','14','4');
insert into EventPacketDetails values ('68','251','19','4');
insert into EventPacketDetails values ('69','245','12','2');
insert into EventPacketDetails values ('70','244','14','3');
insert into EventPacketDetails values ('71','233','14','3');
insert into EventPacketDetails values ('72','243','13','3');
insert into EventPacketDetails values ('73','232','16','5');
insert into EventPacketDetails values ('74','252','9','2');
insert into EventPacketDetails values ('75','246','14','5');
insert into EventPacketDetails values ('76','233','22','8');
insert into EventPacketDetails values ('77','237','17','6');
insert into EventPacketDetails values ('78','229','16','5');
insert into EventPacketDetails values ('79','218','19','6');
insert into EventPacketDetails values ('80','223','16','4');
insert into EventPacketDetails values ('81','245','18','6');
insert into EventPacketDetails values ('82','241','18','5');
insert into EventPacketDetails values ('83','261','18','4');
insert into EventPacketDetails values ('84','237','14','4');
insert into EventPacketDetails values ('85','251','19','4');
insert into EventPacketDetails values ('86','245','12','2');
insert into EventPacketDetails values ('87','244','14','3');
insert into EventPacketDetails values ('88','233','14','3');
insert into EventPacketDetails values ('89','243','13','3');
insert into EventPacketDetails values ('90','232','16','5');
insert into EventPacketDetails values ('91','252','9','2');
insert into EventPacketDetails values ('92','246','14','5');
insert into EventPacketDetails values ('93','233','22','8');
insert into EventPacketDetails values ('94','237','17','6');
insert into EventPacketDetails values ('95','229','16','5');
insert into EventPacketDetails values ('96','218','19','6');
insert into EventPacketDetails values ('97','241','18','6');
insert into EventPacketDetails values ('98','232','19','7');
insert into EventPacketDetails values ('99','244','13','4');

drop table if exists CategoryMaster;
Create table CategoryMaster
(
    CategoryId Numeric,
    Categorytype Varchar(100),
    CategoryDesc Varchar(100)
);

insert into CategoryMaster values ('1','P1','Category P1');
insert into CategoryMaster values ('2','P2','Category P2');
insert into CategoryMaster values ('3','P3','Category P3');
insert into CategoryMaster values ('4','P4','Category P4');
insert into CategoryMaster values ('5','P-Null','Category Clean');


drop table if exists ThresholdDetails;
create table ThresholdDetails
(
    ParameterId Numeric,
    ParameterSource Varchar(100),
    MinimumThreshold Numeric,
    MaximumThreshold Numeric

);

insert into ThresholdDetails values ('1','Noise_floor','-100','-90');
insert into ThresholdDetails values ('2','Interference Source Power','-85','-65');
insert into ThresholdDetails values ('3','Adjacent Channel Interference','-90','-70');
insert into ThresholdDetails values ('4','RSSI','-80','-60');
insert into ThresholdDetails values ('5','AP Tx Power','5','25');
insert into ThresholdDetails values ('6','SNR','10','30');


Commit;

---RAW Data With Flag after thresholdApplied

drop table if exists Siterawdata;
create or replace table Siterawdata as
Select
    si.SiteID ,
    si.MacAddress ,
    si.ApName ,
    si.IpAddress ,
    si.ModelNumber ,
    si.SerialNumber ,
    si.ApFirmware ,
    si.Antenna,
    si.Location ,
    si.VlanId ,
    si.RfBand,
    ed.EventId ,
    ed.AvailableChannels ,
    IFS.InterferenceSourceId ,
    IFS.SourceType ,
    IFS.SourceFrequency ,
    ed.InterfenceSourceLoc ,
    ed.Channel ,
    ed.DataRateMbps ,
    ed.BSSID ,
    ed.NoiseFloorDbm,
    Case when ed.NoiseFloorDbm > td_noise.MaximumThreshold
              or ed.NoiseFloorDbm < td_noise.MinimumThreshold
         then 1
    else 0 end as noiseIncidentFlag,
    ed.InterferenceSourcePowerDbm ,
    Case when ed.InterferenceSourcePowerDbm > td_isp.MaximumThreshold
         or ed.InterferenceSourcePowerDbm < td_isp.MinimumThreshold
         then 1
    else 0 end as InterferenceSourcePowerIncidentFlag,
    ed.AdjacentChannelInterferenceDbm ,
    Case when ed.AdjacentChannelInterferenceDbm > td_aci.MaximumThreshold
         or ed.AdjacentChannelInterferenceDbm < td_aci.MinimumThreshold
         then 1
    else 0 end as AdjacentChannelInterferenceDbmIncidentFlag,
    ed.RecievedSignalStrengthIndicator ,
    Case when ed.RecievedSignalStrengthIndicator > td_rssi.MaximumThreshold
         or ed.RecievedSignalStrengthIndicator < td_rssi.MinimumThreshold
    then 1 else 0 end as RSSIIncidentFlag,
    ed.APTxPowerDbm ,
    Case when ed.APTxPowerDbm > td_APTX.MaximumThreshold
         or ed.APTxPowerDbm < td_APTX.MinimumThreshold
         then 1
    else 0 end as APTxPowerDbmIncidentFlag,
    ed.SNRDb,
    Case when ed.SNRDb > td_SNRDb.MaximumThreshold or ed.SNRDb < td_SNRDb.MinimumThreshold then 1 else 0 end as SNRDbIncidentFlag,
    epd.PacketSent ,
    epd.PacketLost ,
    epd.Retries,
    round((100 *(epd.PacketSent - epd.Packetlost)/ epd.PacketSent )) as utilisationPct
from EventDetails ed
inner join EventPacketDetails epd
on ed.EventId = epd.EventID
inner join siteinfo SI
on SI.SiteID=ed.SiteID
left  join InterferenceSources  IFS
on ifs.InterferenceSourceId =ed.InterferenceSourceId
left  join ThresholdDetails td_noise
on td_noise.ParameterSource='Noise_floor'
left  join ThresholdDetails  td_isp
on td_isp.ParameterSource='Interference Source Power'
left  join ThresholdDetails  td_aci
on td_aci.ParameterSource='Adjacent Channel Interference'
left  join ThresholdDetails  td_rssi
on td_rssi.ParameterSource='RSSI'
left  join ThresholdDetails  td_aptx
on td_aptx.ParameterSource='AP Tx Power'
left  join ThresholdDetails  td_snrdb
on td_snrdb.ParameterSource='SNR'
;



--Calculating incident count against each Site
drop table if  exists SiteIncidentDetails;
create table SiteIncidentDetails as
Select
    SiteID,
    MODELNUMBER,
    EVENTID,
    (noiseIncidentFlag +
        InterferenceSourcePowerIncidentFlag +
        AdjacentChannelInterferenceDbmIncidentFlag +
        APTxPowerDbmIncidentFlag +
        RSSIIncidentFlag +
        SNRDbIncidentFlag) as TotalIncidents ,
    CASE WHEN (noiseIncidentFlag +
        InterferenceSourcePowerIncidentFlag +
        AdjacentChannelInterferenceDbmIncidentFlag +
        APTxPowerDbmIncidentFlag +
        RSSIIncidentFlag +
        SNRDbIncidentFlag) >=5
        then 'P1'
        WHEN (noiseIncidentFlag +
        InterferenceSourcePowerIncidentFlag +
        AdjacentChannelInterferenceDbmIncidentFlag +
        APTxPowerDbmIncidentFlag +
        RSSIIncidentFlag +
        SNRDbIncidentFlag) >=4
        then 'P2'
        WHEN (noiseIncidentFlag +
        InterferenceSourcePowerIncidentFlag +
        AdjacentChannelInterferenceDbmIncidentFlag +
        APTxPowerDbmIncidentFlag +
        RSSIIncidentFlag +
        SNRDbIncidentFlag) >=3
        then 'P3'
        WHEN (noiseIncidentFlag +
        InterferenceSourcePowerIncidentFlag +
        AdjacentChannelInterferenceDbmIncidentFlag +
        APTxPowerDbmIncidentFlag +
        RSSIIncidentFlag +
        SNRDbIncidentFlag) >=2
        then 'P4'
    else 'P-Null' END as IncidentsSeverity
from Siterawdata
;

--Calculating Severity count in each site
with temp as (
    select si.ModelNumber, cm.Categorytype
    from CategoryMaster cm
    inner join siteinfo si
    on 1=1
)
Select t.ModelNumber, t.Categorytype , Sum(case when sid.IncidentsSeverity is not null then 1 else 0 end ) as severityCount
from temp t
left  join SiteIncidentDetails sid
on t.Categorytype = sid.IncidentsSeverity
and  t.ModelNumber = sid .ModelNumber
group by t.ModelNumber, t.Categorytype
order by 1, 2 desc;


--Assigning Scores
with temp as (
    select si.ModelNumber, cm.Categorytype
    from CategoryMaster cm
    inner join siteinfo si
    on 1=1
),
Temp2 as (
    Select
        t.ModelNumber,
        t.Categorytype ,
        Sum(case when sid.IncidentsSeverity is not null then 1 else 0 end ) as severityCount
    from temp t
    left  join SiteIncidentDetails sid
    on t.Categorytype = sid.IncidentsSeverity
    and  t.ModelNumber = sid .ModelNumber
    group by t.ModelNumber, t.Categorytype
    order by 1, 2 desc)
Select
    ModelNumber,
    100 - Sum (case when Categorytype='P1'
              then severityCount
              when Categorytype='P2'
              then severityCount *.75
              when Categorytype='P3'
              then severityCount *.5
              when Categorytype='P4'
              then severityCount *.25
              else 0 end
              ) as ClientThroughput
from temp2
group by ModelNumber;


