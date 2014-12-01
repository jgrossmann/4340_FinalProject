#ifndef __DO_RMAHDR_
#define __DO_RMAHDR_

#ifdef __cplusplus
  extern "C" {
#endif

typedef unsigned long UP;
typedef unsigned U;
typedef unsigned char UB;
typedef unsigned short US;
typedef unsigned char SVAL;
typedef unsigned char TYPEB;
typedef unsigned char scalar;
typedef struct vec32 vec32;
typedef struct qird QIRD;
typedef unsigned char UST_e;
typedef unsigned uscope_t;
typedef U  NumLibs_t;
struct vec32 {
    U  I1;
    U  I2;
};
typedef unsigned long RP;
typedef unsigned long RO;
typedef unsigned short HsimEdge;
typedef unsigned char HsimExprChar;
typedef U  FlatNodeNum;
typedef U  InstNum;
typedef unsigned long long TimeStamp64;
typedef unsigned long long TimeStamp;
typedef TimeStamp  RmaTimeStamp;
typedef TimeStamp64  RmaTimeStamp64;
typedef union {
    double I495;
    unsigned long long I478;
    unsigned  I496[2];
} rma_clock_struct;
typedef struct eblk EBLK;
typedef int (* E_fn)(void);
struct eblk {
    struct eblk * I483;
    E_fn  I484;
    struct iptmpl * I485;
    unsigned I493;
    struct eblk * I494;
};
typedef struct {
    RP  I483;
    RP  I484;
    RP  I485;
    unsigned I493;
    RP  I494;
} RmaEblk;
typedef union {
    double I495;
    unsigned long long I478;
    unsigned  I496[2];
} clock_struct;
typedef clock_struct  RmaClockStruct;
typedef enum {
    PD_SING = 0,
    PD_RF = 1,
    PD_PLSE = 2,
    PD_PLSE_RF = 3,
    PD_NULL = 4
} PD_e;
typedef struct RmaRetain_t RmaRetain;
struct RmaRetain_t {
    RmaEblk  I482;
    RP  I515;
    RP  I516;
    U  I517;
    US  I518 :1;
    US  I519 :4;
    US  newval :2;
    US  I521 :2;
    US  I167 :2;
};
typedef struct MPSched MPS;
typedef struct RmaMPSched RmaMps;
struct MPSched {
    scalar  I506;
    scalar  I507;
    US  fHsim :1;
    US  I167 :6;
    U  I509;
    MPS  * I510;
    EBLK  I511;
    void * I512;
    UP   I513[1];
};
struct RmaMPSched {
    scalar  I506;
    scalar  I507;
    US  fHsim :1;
    US  I167 :6;
    U  I509;
    RP  I510;
    RmaEblk  I511;
    RP  I512;
    RP   I513[1];
};
typedef struct RmaMPSchedPulse RmaMpsp;
struct RmaMPSchedPulse {
    scalar  I506;
    scalar  I507;
    US  I167;
    U  I509;
    RP  I510;
    RmaEblk  I511;
    scalar  I525;
    scalar  I526;
    scalar  I527;
    scalar  I528;
    U  I529;
    RmaClockStruct  I530;
    RmaClockStruct  I531;
    U  state;
    U  I533;
    RP  I485;
    RP  I534;
    RP  I535;
    RP   I513[1];
};
typedef struct MPItem MPI;
struct MPItem {
    U  * I537;
    void * I538;
};
typedef struct MPOPTSched MPSO;
struct MPOPTSched {
    scalar  I506;
    scalar  I507;
    US  I495;
    U  I509;
    MPS  * I540;
    EBLK  I511;
    RO  I541;
    U  state;
    U  * ptable;
    scalar  * I543;
    MPI   I513[1];
};
typedef struct {
    RmaEblk  I482;
    RP  I544;
    scalar  I545;
    scalar  I525;
    scalar  I546;
} RmaTransEventHdr;
typedef struct RmaMPSchedPulseNewCsdf RmaMpspNewCsdf;
struct RmaMPSchedPulseNewCsdf {
    scalar  I506;
    scalar  I507;
    US  fHsim :1;
    US  I167 :6;
    U  I509;
    RP  I510;
    RmaEblk  I511;
    scalar  I525;
    scalar  I526;
    scalar  I527;
    scalar  I528;
    U  state :4;
    U  I548 :28;
    RmaClockStruct  I530;
    RmaClockStruct  I531;
    RP  I549;
    RP  I485;
    RP  I550;
    RP   I513[1];
};
typedef struct red_t {
    U  I551;
    U  I552;
    U  I553;
} RED;
typedef struct predd {
    PD_e  I167;
    RED   I554[1];
} PREDD;
typedef unsigned long long ULL;
typedef struct {
    RP  I555;
    RP  I534;
    RP  I485;
    RP  I535;
    RmaEblk  I482;
    RmaEblk  I556;
    RP  I557;
    scalar  I545;
    scalar  I525;
    char state;
    uscope_t  I558;
    U  I559;
    RP  I560;
    scalar  I526;
    scalar  I527;
    scalar  I528;
    RmaClockStruct  I530;
    RmaClockStruct  I531;
    RP  I512;
} RmaPulse;
typedef enum {
    QIRDModuleC = 1,
    QIRDSVPackageC = 2
} QIRDModuleType;
typedef struct {
    U  I561 :1;
    U  I562 :1;
    U  I563 :1;
    U  I564 :1;
    U  I565 :1;
    U  I566 :1;
    U  I567 :1;
    U  I568 :1;
    U  I569 :1;
    U  I570 :1;
    U  I571 :1;
    U  I572 :1;
    U  I573 :1;
    U  I574 :1;
    U  I575 :1;
    U  I576 :1;
    U  I577 :1;
    U  I578 :1;
    U  I579 :1;
    U  I580 :1;
    QIRDModuleType  I581 :2;
    U  I582 :1;
    U  I583 :1;
    U  I584 :1;
    U  I585 :1;
    U  I586 :1;
    U  I587 :1;
    U  I588 :1;
    U  I589 :1;
    U  I590 :1;
    U  I591 :1;
    U  I592 :1;
    U  I593 :1;
} BitFlags;
struct qird {
    US  I4;
    US  I5;
    U  I6;
    U  I7;
    char * I8;
    char * I9;
    U  * I10;
    char * I11;
    U  I12;
    U  I13;
    struct vcd_rt * I14;
    U  I16;
    struct _vcdOffset_rt * I17;
    UP  * I19;
    U  I20;
    UP  * I21;
    U  I22;
    U  I23;
    U  I24;
    U  * I25;
    U  * I26;
    void * I27;
    U  I28;
    int I29;
    UP  I30;
    U  I31;
    U  I32;
    U  I33;
    UP  I34;
    U  * I35;
    BitFlags  I36;
    U  I37;
    U  I38;
    U  I39;
    U  I40;
    U  I41;
    U  * I42;
    U  I43;
    U  * I44;
    U  I45;
    U  I46;
    U  I47;
    U  I48;
    U  I49;
    U  I50;
    U  I51;
    U  * I52;
    U  I53;
    U  I54;
    U  * I55;
    U  I56;
    U  * I57;
    U  I58;
    U  I59;
    U  I60;
    U  I61;
    U  * I62;
    U  I63;
    U  * I64;
    U  I65;
    U  I66;
    U  I67;
    U  I68;
    U  I69;
    U  I70;
    U  * I71;
    char * I72;
    U  I73;
    U  I74;
    U  I75;
    U  I76;
    U  I77;
    U  * I78;
    U  I79;
    U  I80;
    UP  * I81;
    U  I82;
    U  I83;
    UP  * I84;
    U  I85;
    U  I86;
    U  I87;
    U  I88;
    U  I89;
    U  I90;
    U  * I91;
    U  I92;
    U  I93;
    U  * I94;
    U  * I95;
    U  * I96;
    U  * I97;
    U  * I98;
    U  I99;
    U  I100;
    struct taskInfo * I101;
    U  I103;
    U  I104;
    int * I105;
    U  I106;
    U  I107;
    U  I108;
    U  I109;
    U  I110;
    struct qrefer * I111;
    U  * I113;
    unsigned * I114;
    void * I115;
    U  I116;
    U  I117;
    U  I118;
    U  I119;
    U  * I120;
    U  I121;
    U  * I122;
    U  I123;
    U  I124;
    U  I125;
    U  * I126;
    U  I127;
    U  * I128;
    U  I129;
    U  I130;
    U  * I131;
    U  I132;
    U  I133;
    U  * I134;
    U  * I135;
    U  * I136;
    U  I137;
    U  I138;
    U  I139;
    U  I140;
    U  I141;
    struct qrefee * I142;
    U  * I144;
    U  I145;
    struct qdefrefee * I146;
    U  * I148;
    int (* I149)(void);
    char * I150;
    U  I151;
    U  I152;
    void * I153;
    NumLibs_t  I154;
    char * I155;
    U  * I156;
    U  I157;
    U  I158;
    U  I159;
    U  I160;
    U  I161;
    U  * I162;
    U  * I163;
    int I164;
    struct clock_load * I165;
    int I180;
    struct clock_data * I181;
    int I197;
    struct clock_hiconn * I198;
    U  I202;
    int I203;
    U  I204;
    int I205;
    U  * I206;
    U  * I207;
    U  I208;
    void * I209;
    U  I210;
    U  I211;
    UP  * I212;
    void * I213;
    U  I214;
    UP  * I215;
    U  * I216;
    int (* I217)(void);
    U  * I218;
    UP  * I219;
    U  * I220;
    U  I221;
    U  I222;
    U  I223;
    UP  * I224;
    U  * I225;
    U  I226 :1;
    U  I227 :1;
    U  I228 :1;
    U  I229 :1;
    U  I230 :28;
    U  I231;
    U  I232;
    U  I233;
    U  I234;
    UP  * I235;
    UP  * I236;
    U  * I237;
    U  * I238;
    UP  * I239;
    UP  * I240;
    UP  * I241;
    U  * I242;
    UP  * I243;
    UP  * I244;
    U  I245;
    U  I246;
    U  I247;
    U  * I248;
    U  * I249;
    U  * I250;
    U  * I251;
    U  * I252;
    U  * I253;
    U  * I254;
    U  * I255;
    U  * I256;
    U  * I257;
    U  I258;
    U  I259;
    U  I260;
    U  I261;
    U  I262;
    U  I263;
    U  I264;
    U  I265;
    U  I266;
    struct daidirInfo * I267;
    struct vcs_tftable * I269;
    U  I271;
    UP  (* I272)(void);
    UP  (* I273)(void);
    UP  (* I274)(void);
    UP  (* I275)(void);
    int * I276;
    int (* I277)(void);
    char * I278;
    UP  * I279;
    UP  * I280;
    int (* I281)(void);
    int * I282;
    U  * I283;
    void * I284;
    U  I285;
    U  I286;
    U  I287;
    U  I288;
    U  I289;
    U  I290;
    UP  * I291;
    U  * I292;
    U  * I293;
    U  I294 :15;
    U  I295 :14;
    U  I296 :1;
    U  I297 :1;
    U  I298 :1;
    U  I299 :3;
    U  I300 :1;
    U  I301 :28;
    struct scope * I302;
    U  I304;
    U  I305;
    U  I306;
    U  * I307;
    U  * I308;
    U  * I309;
    U  I310;
    U  I311;
    U  I312;
    struct pcbt * I313;
    U  I322;
    U  I323;
    void * I324;
    int I325;
    U  I326;
    U  I327;
    U  I328;
    U  I329;
    U  I330;
    void * I331;
    UP  * I332;
    U  I333;
    U  I334;
    void * I335;
    U  I336;
    void * I337;
    U  I338;
    void * I339;
    U  I340;
    int (* I341)(void);
    int (* I342)(void);
    void * I343;
    void * I344;
    void * I345;
    U  I346;
    U  I347;
    char * I348;
    U  I349;
    U  * I350;
    U  I351;
    U  * I352;
    U  I353;
    U  I354;
    U  I355;
    U  I356;
    U  I357;
    U  I358;
    U  * I359;
    U  I360;
    U  I361;
    U  * I362;
    U  I363;
    U  * I364;
    char * I365;
    U  I366;
    U  I367;
    U  I368;
    U  I369;
    U  * I370;
    U  I371;
    U  I372;
    struct cosim_info * I373;
    U  I375;
    U  * I376;
    U  I377;
    U  I378;
    U  * I379;
    U  I380;
    U  * I381;
    U  I382;
    U  I383;
    U  * I384;
    U  I385;
    U  I386;
    U  I387;
    U  * I388;
    U  I389;
    U  I390;
    U  I391;
    U  I392;
    U  I393;
    U  I394;
    U  I395;
    U  I396;
    U  * I397;
    U  * I398;
    void (* I399)(void);
    U  * I400;
    UP  * I401;
    struct mhdl_outInfo * I402;
    UP  * I404;
    U  I405;
    UP  * I406;
    U  I407;
    void * I408;
    U  * I409;
    void * I410;
    U  I411;
    U  I412;
    void * I413;
    void * I414;
    U  * I415;
    U  * I416;
    U  * I417;
    U  * I418;
    void * I419;
    U  I420;
    void * I421;
    U  * I422;
    char * I423;
    int (* I424)(void);
    U  * I425;
    char * I426;
    char * I427;
    U  I428;
    U  * I429;
    struct regInitInfo * I430;
    UP  * I432;
    U  * I433;
    char * I434;
    U  I435;
    U  I436;
    U  I437;
    U  I438;
    U  I439;
    U  I440;
    U  I441;
    U  * I442;
    U  * I443;
    U  I444;
    U  I445;
    U  I446;
    UP  * I447;
    U  I448;
    UP  * I449;
    U  I450;
    U  I451;
    U  I452;
    U  * I453;
    U  * I454;
    UP  * I455;
    UP  * I456;
    void * I457;
    UP  I458;
    void * I459;
    void * I460;
    void * I461;
    U  I462;
    U  I463;
    U  I464;
    U  I465;
    U  * I466;
    U  I467;
    U  * I468;
    U  I469;
    U  I470;
    U  * I471;
};
typedef struct pcbt {
    U  * I315;
    UP  I316;
    U  I317;
    U  I318;
    U  I319;
    U  I320;
    U  I321;
} PCBT;
struct iptmpl {
    QIRD  * I487;
    struct vcs_globals_t * I488;
    void * I490;
    UP  I491;
    UP  I492;
    struct iptmpl * I485[2];
};
typedef unsigned long long FileOffset;
typedef struct _hsimPeriodL {
    char  I617[256];
    struct _hsimPeriodL * I595;
} HsimPeriodL;
typedef struct {
    U   I619[2];
    U  I620 :1;
    U  I621 :1;
    U  I622 :8;
    U  I623 :8;
    U  I624 :8;
    U  I625 :4;
    unsigned long long I626;
    unsigned long long I627;
    unsigned long long I628;
    unsigned long long I629;
    unsigned long long I630;
    U  I631;
    U  I632;
    U  I633;
    U  I634;
    HsimPeriodL  * I635;
    HsimPeriodL  * I636;
    U  I637;
} HsimSignalMonitor;
typedef struct {
    scalar  I638;
    U  I639;
    U  I640;
    U  I641;
    U  I642;
    U  I643;
    U  I644;
    U  I645;
    HsimSignalMonitor  * I646;
    RmaTimeStamp64  I647;
    U  I648;
    FlatNodeNum  I649;
    InstNum  I650;
} HsimNodeRecord;
typedef struct {
    RP  I651;
    RP  I485;
} RmaIbfIp;
typedef struct {
    RP  I651;
    RP  I652;
} RmaIbfPcode;
typedef struct {
    RmaEblk  I482;
} RmaEvTriggeredOrSyncLoadCg;
typedef struct {
    RmaEblk  I482;
    RP  I653;
    vec32  I654;
} RmaAnySchedVCg;
typedef struct {
    RmaEblk  I482;
    RP  I653;
    vec32   I655[1];
} RmaAnySchedWCg;
typedef struct {
    RmaEblk  I482;
    RP  I653;
    scalar   I656[1];
} RmaAnySchedECg;
typedef struct {
    RP  I657;
} RmaRootCbkCg;
typedef struct {
    U  I658;
} RmaRootVcdCg;
typedef struct {
    RP  I659;
} RmaRootForceCbkCg;
typedef struct {
    RmaEblk  I482;
    RP  I660;
} RmaForceCbkJmpCg;
typedef struct {
    RP  ptable;
    RP  pfn;
    RP  I652;
} Rma1InputGateFaninCgS;
typedef struct {
    U  I5;
    U  iinput;
    RP  I665;
} RmaCondOptLoad;
typedef struct {
    U  iinput;
    RP  I666;
} RmaMultiInputLogicGateCg;
typedef struct {
    U  iinput;
    RP  ptable;
    RP  I666;
} RmaSeqPrimEdgeInputCg;
typedef struct {
    RmaEblk  I482;
    RP  I652;
} RmaSched0GateCg;
typedef struct {
    scalar  I667;
    RmaEblk  I482;
    RP  I652;
    RP  pfn;
} RmaSchedDeltaGateCg;
typedef struct {
    UB  I668;
    RP  I669;
    RP  I670;
} RmaPropNodeSeqLhsSCg;
typedef struct {
    RmaEblk  I482;
    RP  I652;
    U  I671;
    U   I475[1];
} RmaBitEdgeEblk;
typedef struct {
    U  I5;
    RP  I554;
    RmaEblk  I482;
    RmaIbfPcode  I672;
} RmaGateDelay;
typedef struct {
    U  I5;
    union {
        RP  I820;
        RP  I940;
        RP  I946;
    } I515;
    RmaIbfPcode  I672;
} RmaMPDelay;
typedef struct {
    U  I5;
    RmaPulse  I673;
    RmaIbfPcode  I672;
} RmaMPPulseHybridDelay;
typedef struct {
    U  I5;
    RmaIbfPcode  I672;
    RmaMps  I674;
} RmaMPHybridDelay;
typedef struct {
    U  I5;
    U  I675;
    RmaIbfPcode  I672;
    RmaEblk  I511;
} RmaMPHybridDelayPacked;
typedef struct {
    U  I5;
    RmaIbfPcode  I672;
    RmaMpspNewCsdf  I676;
} RmaMPPulseDelay;
typedef struct {
    U  I5;
    RmaMpsp  I676;
    RmaIbfPcode  I672;
} RmaMPPulseOptHybridDelay;
typedef struct {
    U  I5;
    U  I553;
    RmaTransEventHdr  I596;
    RP  I550;
    RmaIbfPcode  I672;
} RmaNtcTransDelay;
typedef struct {
    U  I5;
    U  I553;
    RmaEblk  I482;
    RmaIbfPcode  I672;
} RmaNtcTransMpwOptDelay;
typedef struct {
    U  I5;
    RmaEblk  I482;
    RmaIbfPcode  I672;
} RmaNtcTransZeroDelay;
typedef struct {
    U  I5;
    U  I677;
    U  I678;
    RmaTransEventHdr  I596;
    RP  I550;
    RmaIbfPcode  I672;
} RmaNtcTransDelayRF;
typedef struct {
    U  I5;
    U  I677;
    U  I678;
    RmaEblk  I482;
    RmaIbfPcode  I672;
} RmaNtcTransMpwOptDelayRF;
typedef struct {
    U  I5;
    RP  I679;
    RmaTransEventHdr  I596;
    RP  I550;
    RmaIbfPcode  I672;
} RmaICTransDelay;
typedef struct {
    U  I5;
    RP  I679;
    RmaEblk  I482;
    RmaIbfPcode  I672;
} RmaICTransMpwOptDelay;
typedef struct {
    U  I5;
    RmaEblk  I482;
    RmaIbfPcode  I672;
} RmaICTransZeroDelay;
typedef struct {
    U  I5;
    RP  I554;
    RmaEblk  I482;
    RmaIbfPcode  I672;
} RmaICSimpleDelay;
typedef struct {
    U  I5;
    union {
        RP  psimple;
        RP  I940;
        RP  I946;
    } I515;
    RmaIbfPcode  I672;
} RmaICDelay;
typedef struct {
    U  I5;
    RP  I554;
    RmaEblk  I482;
    RmaIbfPcode  I672;
} RmaPortDelay;
typedef struct TableAssign_ {
    struct TableAssign_ * I595;
    struct TableAssign_ * I544;
    U  I5;
    U  iinput;
    RP  ptable;
    RP  I666;
} TableAssign;
typedef struct TableAssignList_ {
    U  I5;
    TableAssign  * I544;
    struct TableAssignList_ * I681;
    TableAssign   arr[1];
} TableAssignList;
typedef struct {
    RP  I684;
} RmaWakeupListCg;
typedef struct {
    RP  I595;
    RP  I685;
    RP  I479;
    U  I686;
    U  I687 :1;
    U  I688 :1;
    U  I689 :1;
    U  I690 :29;
} RmaTcCoreSimple;
typedef struct {
    RP  I595;
    RP  I685;
    RP  I479;
    U  I686;
    U  I687 :1;
    U  I688 :1;
    U  I689 :1;
    U  I690 :29;
    RP  I691;
} RmaTcCoreConditional;
typedef struct {
    RP  I685;
    RP  I479;
    U  I686;
    U  I687 :1;
    U  I688 :1;
    U  I689 :1;
    U  I690 :29;
} RmaTcCoreSimpleNoList;
typedef struct {
    RP  I685;
    RP  I479;
    U  I686;
    U  I687 :1;
    U  I688 :1;
    U  I689 :1;
    U  I690 :29;
    RP  I692;
} RmaTcCoreSimpleNoListMdb;
typedef struct {
    RP  I685;
    RP  I479;
    U  I686;
    U  I687 :1;
    U  I688 :1;
    U  I689 :1;
    U  I690 :29;
    RP  I691;
} RmaTcCoreConditionalNoList;
typedef struct {
    RP  I685;
    RP  I479;
    U  I686;
    U  I687 :1;
    U  I688 :1;
    U  I689 :1;
    U  I690 :29;
    RP  I691;
    RP  I692;
} RmaTcCoreConditionalNoListMdb;
typedef struct {
    RP  I693;
    RmaTimeStamp  I694;
    scalar  I695;
} RmaConditionalTSLoadNoList;
typedef struct {
    RP  I595;
    RP  I693;
    RmaTimeStamp  I694;
    scalar  I695;
} RmaConditionalTSLoad;
typedef struct {
    US  I696;
    scalar  val;
    RmaIbfPcode  I672;
} RmaScanSwitchData;
struct clock_load {
    U  I167 :5;
    U  I168 :12;
    U  I169 :1;
    U  I170 :2;
    U  I171 :1;
    U  I172 :1;
    U  I173 :1;
    U  I174 :9;
    U  I175;
    U  I176;
    void (* pfn)(void * I178, char val);
};
typedef struct clock_data {
    U  I183 :1;
    U  I184 :1;
    U  I185 :1;
    U  I186 :1;
    U  I167 :5;
    U  I168 :12;
    U  I187 :6;
    U  I188 :1;
    U  I170 :2;
    U  I171 :1;
    U  I174 :1;
    U  I189;
    U  I190;
    U  I191;
    U  I175;
    U  I192;
    U  I193;
    U  I194;
    U  I195;
    U  I196;
} HdbsClockData;
struct clock_hiconn {
    U  I200;
    U  I201;
    U  I175;
    U  I170;
};
typedef struct _RmaDaiCg {
    RP  I697;
    RP  I698;
    U  I699;
} RmaDaiCg;
typedef union _RmaCbkMemOptUnion {
    RP  I697;
    RP  I700;
    RP  I701;
} RmaCbkMemOptUnion;
typedef struct _RmaDaiOptCg {
    RmaCbkMemOptUnion  I702;
} RmaDaiOptCg;
struct futq {
    struct futq * I497;
    struct futq * I499;
    RmaEblk  * I500;
    RmaEblk  * I501;
    U  I493;
};
struct sched_table {
    struct futq * I502;
    struct futq I503;
    struct hash_bucket * I504;
};
struct dummyq_struct {
    clock_struct  I703;
    EBLK  * I704;
    EBLK  * I705;
    struct futq * I706;
    struct futq * I707;
    struct sched_table * I708;
    struct millenium * I710;
    EBLK  * I712;
    EBLK  * I713;
    EBLK  * I714;
    EBLK  * I715;
    EBLK  * I716;
    EBLK  * I717;
    EBLK  * I718;
    EBLK  * I719;
    EBLK  * I720;
    EBLK  * I721;
    EBLK  * I722;
    EBLK  * I723;
    EBLK  * I724;
    EBLK  * I725;
    EBLK  * I726;
    EBLK  * I727;
    MPS  * I728;
};
typedef void (* FP)(void *  , scalar   );
typedef void (* FP1)(void *  );
typedef U  (* FPU1)(void *  );
typedef void (* FPV)(void *  , UB  *  );
typedef void (* FPLSEL)(void *  , scalar   , U   );
typedef void (* FPLSELV)(void *  , vec32  *  , U   , U   );
typedef void (* FPFPV)(UB  *  , UB  *  , U   , U   , U   , U   , U   , UB  *  , U   );
typedef void (* FPRPV)(UB  *  , U   , U   , U   );
extern UB   Xvalchg[];
extern UB   X4val[];
extern UB   X3val[];
extern UB   XcvtstrTR[];
extern UB   Xbuf[];
extern UB   Xbitnot[];
extern UB   Xwor[];
extern UB   Xwand[];
extern U   Xbitnot4val[];
extern UB   globalTable1Input[];
extern unsigned long long vcs_clocks;
extern UB   Xunion[];
extern U  fRTFrcRelCbk;
extern FP  txpFnPtr;
extern FP   rmaFunctionArray[];
extern UB  dummyScalar;
extern UB  fScalarIsForced;
extern UB  fScalarIsReleased;
extern U  fNotimingchecks;
extern RP  * iparr;
extern FP1  * rmaPostAnySchedFnPtr;
extern FP1  * rmaPostAnySchedVFnPtr;
extern FP1  * rmaPostAnySchedWFnPtr;
extern FP1  * rmaPostAnySchedEFnPtr;
extern FP1  * rmaPostSchedUpdateClockStatusFnPtr;
extern FP1  * rmaPostSchedUpdateEvTrigFnPtr;
extern FP1  * rmaSched0UpdateEvTrigFnPtr;
extern FP1  * rmaPostSchedRecoveryResetDbsFnPtr;
extern U  fGblDataOrTime0Prop;
extern UB   rmaEdgeStatusValArr[];
extern FP1  * propForceCbkSPostSchedCgFnPtr;
extern FP1  * propForceCbkMemoptSPostSchedCgFnPtr;
extern UB  * ptableGbl;
extern U  mhdl_delta_count;
extern int fZeroUser;


extern void *mempcpy(void* s1, void* s2, unsigned n);
extern UB* rmaEvalDelays(UB* pcode, scalar val);
extern UB* rmaEvalDelaysV(UB* pcode, vec32* pval);
extern void rmaPopTransEvent(UB* pcode);
extern void rmaSetupFuncArray(UP* ra);
extern void SinitHsimPats(void);
extern void VVrpDaicb(void* ip, U nIndex);
extern int SDaicb(void *ip, U nIndex);
extern void SDaicbForHsimNoFlagScalar(void* pDaiCb, unsigned char value);
extern void SDaicbForHsimNoFlagStrengthScalar(void* pDaiCb, unsigned char value);
extern void SDaicbForHsimNoFlag(void* pRmaDaiCg, unsigned char value);
extern void SDaicbForHsimNoFlag2(void* pRmaDaiCg, unsigned char value);
extern void SDaicbForHsimWithFlag(void* pRmaDaiCg, unsigned char value);
extern void SDaicbForHsimNoFlagFrcRel(void* pRmaDaiCg, unsigned char reason, int msb, int lsb, int ndx);
extern void SDaicbForHsimNoFlagFrcRel2(void* pRmaDaiCg, unsigned char reason, int msb, int lsb, int ndx);
extern void VcsHsimValueChangeCB(void* pRmaDaiCg, void* pValue, unsigned int valueFormat);
extern U isNonDesignNodeCallbackList(void* pRmaDaiCg);
extern void SDaicbForHsimCbkMemOptNoFlagScalar(void* pDaiCb, unsigned char value, unsigned char isStrength);
extern void SDaicbForHsimCbkMemOptWithFlagScalar(void* pDaiCb, unsigned char value, unsigned char isStrength);
extern void SDaicbForHsimCbkMemOptNoFlagScalar(void* pDaiCb, unsigned char value, unsigned char isStrength);
extern void SDaicbForHsimCbkMemOptWithFlagScalar(void* pDaiCb, unsigned char value, unsigned char isStrength);
extern void VVrpNonEventNonRegdScalarForHsimOptCbkMemopt(void* ip, U nIndex);
extern void SDaicbForHsimCbkMemOptNoFlagDynElabScalar(U* mem, unsigned char value, unsigned char isStrength);
extern void SDaicbForHsimCbkMemOptWithFlagDynElabScalar(U* mem, unsigned char value, unsigned char isStrength);
extern void SDaicbForHsimCbkMemOptNoFlagDynElabFrcRel(U* mem, unsigned char reason, int msb, int lsb, int ndx);
extern void SDaicbForHsimCbkMemOptNoFlagFrcRel(void* pDaiCb, unsigned char reason, int msb, int lsb, int ndx);
extern void hsimDispatchCbkMemOptForVcd(RP p, U val);
extern void* hsimGetCbkMemOptCallback(RP p);
extern void hsimDispatchCbkMemOptNoDynElabS(RP* p, U val, U isStrength);
extern void* hsimGetCbkPtrNoDynElab(RP p);
extern void hsimDispatchCbkMemOptDynElabS(U** pvcdarr, U** pcbkarr, U val, U isStrength);
extern void hsimDispatchCbkMemOptNoDynElabVector(RP* /*RmaDaiOptCg* */p, void* pval, U /*RmaValueType*/ vt, U cbits);
extern void copyAndPropRootCbkCgS(RmaRootCbkCg* pRootCbk, scalar val);
extern void copyAndPropRootCbkCgV(RmaRootCbkCg* rootCbk, vec32* pval);
extern void copyAndPropRootCbkCgW(RmaRootCbkCg* rootCbk, vec32* pval);
extern void copyAndPropRootCbkCgE(RmaRootCbkCg* rootCbk, scalar* pval);
extern void dumpRootVcdCg(RmaRootVcdCg* pRootVcd, scalar val);
extern void Wsvvar_callback_non_dynamic1(RP* ptr, int);
extern void rmaExecEvSyncList(RP plist);
extern void Wsvvar_callback_virt_intf(RP* ptr);
extern void Wsvvar_callback_hsim_var(RP* ptr);
extern void checkAndConvertVec32To2State(vec32* value, vec32* svalue, U cbits, U* pforcedBits);
extern unsigned int fGblDataOrTime0Prop;
extern void SchedSemiLerMP1(UB* pmps, U partId);
extern void SchedSemiLerMPO(UB* pmpso, U partId);
extern void rmaDummyPropagate(void);
extern void hsUpdateModpathTimeStamp(UB* pmps);
extern void doMpd32One(UB* pmps);
extern void SchedSemiLerMP(UB* ppulse, U partId);
extern void scheduleuna(UB *e, U t);
extern void scheduleuna_mp(EBLK *e, unsigned t);
extern void schedule(UB *e, U t);
extern void sched_hsopt(struct dummyq_struct * pQ, EBLK *e, U t);
extern void sched_millenium(struct dummyq_struct * pQ, void *e, U thigh, U t);
extern void schedule_1(EBLK *e);
extern void sched0(UB *e);
extern void sched0Raptor(UB *e);
extern void sched0lq(UB *e);
extern void sched0una(UB *e);
extern void sched0una_th(struct dummyq_struct *pq, UB *e);
extern void scheduleuna_mp_th(struct dummyq_struct *pq, EBLK *e, unsigned t);
extern void schedal(UB *e);
extern void sched0_th(struct dummyq_struct * pQ, UB *e);
extern void sched0_hsim_front_th(struct dummyq_struct * pQ, UB *e);
extern void sched0_hsim_frontlq_th(struct dummyq_struct * pQ, UB *e);
extern void sched0lq_th(struct dummyq_struct * pQ, UB *e);
extern void schedal_th(struct dummyq_struct * pQ, UB *e);
extern void scheduleuna_th(struct dummyq_struct * pQ, UB *e, U t);
extern void schedule_th(struct dummyq_struct * pQ, UB *e, U t);
extern void schedule_1_th(struct dummyq_struct * pQ, EBLK *peblk);
extern void SetupLER_th(struct dummyq_struct * pQ, UB *e);
extern void SchedSemiLer_th(struct dummyq_struct * pQ, EBLK *e);
extern void SchedSemiLerTXP_th(struct dummyq_struct * pQ, EBLK *e);
extern void SchedSemiLerTXPFreeVar_th(struct dummyq_struct * pQ, EBLK *e);
extern U getVcdFlags(UB *ip);
extern void VVrpNonEventNonRegdScalarForHsimOpt(void* ip, U nIndex);
extern void VVrpNonEventNonRegdScalarForHsimOpt2(void* ip, U nIndex);
extern void SchedSemiLerTBReactiveRegion(struct eblk* peblk);
extern void SchedSemiLerTBReactiveRegion_th(struct eblk* peblk, U partId);
extern void SchedSemiLerTr(UB* peblk, U partId);
extern void sched0sd_hsim(UB* peblk);
extern void appendNtcEvent(UB* phdr, scalar s, U schedDelta);
extern void hsimRegisterEdge(void* sm,  scalar s);
extern U pvcsGetPartId();
extern void HsimPVCSPartIdCheck(U instNo);
extern void debug_func(U partId, struct dummyq_struct* pQ, EBLK* EblkLastEventx); 
extern struct dummyq_struct* pvcsGetQ(U thid);
extern EBLK* pvcsGetLastEventEblk(U thid);
extern void insertTransEvent(RmaTransEventHdr* phdr, scalar s, scalar pv,	scalar resval, U schedDelta, int re, UB* predd, U fpdd);
extern void insertNtcEventRF(RmaTransEventHdr* phdr, scalar s, scalar pv, scalar resval, U schedDelta, U* delays);
extern U doTimingViolation(RmaTimeStamp ts,RP* pdata, U fskew, U limit, U floaded);
extern void sched_gate_hsim(EBLK* peblk, unsigned t, RP* offset);
extern int getCurSchedRegion();
extern FP getRoutPtr(RP, U);
extern U rmaChangeCheckAndUpdateE(scalar* pvalDst, scalar* pvalSrc, U cbits);
extern void rmaUpdateE(scalar* pvalDst, scalar* pvalSrc, U cbits);
extern U rmaChangeCheckAndUpdateEFromW(scalar* pvalDst, vec32* pvalSrc, U cbits);
extern void rmaLhsPartSelUpdateE(scalar* pvalDst, scalar* pvalSrc, U index, U width);
extern void rmaUpdateWithForceSelectorE(scalar* pvalDst, scalar* pvalSrc, U cbits, U* pforceSelector);
extern void rmaUpdateWFromE(vec32* pvalDst, scalar* pvalSrc, U cbits);
extern U rmaLhsPartSelWithChangeCheckE(scalar* pvalDst, scalar* pvalSrc, U index, U width);
extern void rmaLhsPartSelWFromE(vec32* pvalDst, scalar* pvalSrc, U index,U width);
extern U rmaChangeCheckAndUpdateW(vec32* pvalDst, vec32* pvalSrc, U cbits);
extern void rmaUpdateW(vec32* pvalDst, vec32* pvalSrc, U cbits);
extern void rmaUpdateEFromW(scalar* pvalDst, vec32* pvalSrc, U cbits);
extern U rmaLhsPartSelWithChangeCheckW(vec32* pvalDst, vec32* pvalSrc, U index,U width);
extern void rmaLhsPartSelEFromW(scalar* pvalDst, vec32* pvalSrc, U index,U width);
extern U rmaLhsPartSelWithChangeCheckEFromW(scalar* pvalDst, vec32* pvalSrc, U index,U width);
extern void rmaLhsPartSelUpdateW(vec32* pvalDst, vec32* pvalSrc, U index, U width);
extern void rmaEvalWunionW(vec32* dst, vec32* src, U cbits, U count);
extern void rmaEvalWorW(vec32* dst, vec32* src, U cbits, U count);
extern void rmaEvalWandW(vec32* dst, vec32* src, U cbits, U count);
extern void rmaEvalUnionE(scalar* dst, scalar* src, U cbits, U count, RP ptable);
typedef U RmaCgFunctionType;
extern RmaIbfPcode* rmaEvalPartSelectsW(vec32* pvec32, U startIndex, U onWidth, U offWidth, U count, RmaIbfPcode* pibfPcode, U fnonRootForce);
extern RmaIbfPcode* rmaEvalPartSelectsEToE(scalar* pv, U startIndex, U onWidth, U offWidth, U count, RmaIbfPcode* pibfPcode, U fnonRootForce);
extern RmaIbfPcode* rmaEvalPartSelectsEToW(scalar* pv, U startIndex, U onWidth, U offWidth, U count, RmaIbfPcode* pibfPcode, U fnonRootForce);
extern U rmaEvalBitPosEdgeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitNegEdgeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitChangeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitPosEdgeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitNegEdgeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitChangeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U VcsForceVecVCg(UB* pcode, UB* pval, UB* pvDst, UB* pvCur, U fullcbits, U ibeginSrc, U ibeginDst, U width, U/*RmaValueConvType*/ convtype, U/*RmaForceType*/ frcType, UB* prhs, UB* prhsDst, U frhs, U* pforcedbits, U fisRoot);
extern U VcsReleaseVecVCg(UB* pcode, UB* pvDst, U fullcbits, U ibeginDst, U width, UB* prhsDst, U frhs, U* pforcedbits, U fisRoot);
extern U VcsForceVecWCg(UB* pcode, UB* pval, UB* pvDst, UB* pvCur, U fullcbits, U ibeginSrc, U ibeginDst, U width, U/*RmaValueConvType*/ convtype, U /*RmaForceType*/ frcType, UB* prhs, UB* prhsDst, U frhs, U* pforcedbits, U fisRoot);
extern U VcsReleaseVecWCg(UB* pcode, UB* pvDst, U fullcbits, U ibeginDst, U width, UB* prhsDst, U frhs, U* pforcedbits, U fisRoot);
extern U VcsForceVecECg(UB* pcode, UB* pval, UB* pvDst, UB* pvCur, U fullcbits, U ibeginSrc, U ibeginDst, U width, U /*RmaValueConvType*/ convtype, U /*RmaForceType*/ frcType,UB* prhs, UB* prhsDst, U frhs, U* pforcedbits, U fisRoot);
extern U VcsReleaseVecCg(UB* pcode, UB* pvDst, U ibeginDst, U width, U /*RmaValueType*/ type,U fisRoot, UB* prhsDst, U frhs, U* pforcedbits);
extern U VcsDriveBitsAndDoChangeCheckV(vec32* pvSel, vec32* pvCur, U fullcbits, U* pforcedbits, U isRoot);
extern U VcsDriveBitsAndDoChangeCheckW(vec32* pvSel, vec32* pvCur, U fullcbits, U* pforcedbits, U isRoot);
extern U VcsDriveBitsAndDoChangeCheckE(scalar* pvSel, scalar* pvCur, U fullcbits, U* pforcedbits, U isRoot);
extern void cgvecDebug_Eblk(UB* pcode);
extern U rmaCmpW(vec32* pvalDst, vec32* pvalSrc, U index, U width);
extern void copyVec32ArrMask(vec32* pv1, vec32* pv2, U len, U* mask);
extern void* memcpy(void*, void*, U);
extern int memcmp(void*, void*, U);
extern UB* rmaProcessScanSwitches(UB* pcode, scalar val);
extern UB* rmaProcessScanChainOptSeqPrims(UB* pcode, scalar val);
extern void schedResetRecoveryDbs(U cedges, EBLK* peblkFirst);
extern UB* rmaEvalUnaryOpV(UB* pcode, vec32* pval);
extern UB* rmaEvalBinaryOpV(UB* pcode, vec32* pval);
extern UB* rmaEvalBinaryOpVOneFanoutCount(UB* pcode, vec32* pval);
extern UB* rmaEvalBinaryOpVLargeFanoutCount(UB* pcode, vec32* pval);
extern UB* rmaEvalAndOpVOneFanoutCount(UB* pcode, vec32* value);
extern UB* rmaEvalAndOpVLargeFanoutCount(UB* pcode, vec32* value);
extern UB* rmaEvalAndOpV(UB* pcode, vec32* value);
extern UB* rmaEvalOrOpVOneFanoutCount(UB* pcode, vec32* value);
extern UB* rmaEvalOrOpVLargeFanoutCount(UB* pcode, vec32* value);
extern UB* rmaEvalOrOpV(UB* pcode, vec32* value);
extern UB* rmaEvalTernaryOpV(UB* pcode, vec32* pval);
extern UB* rmaEvalUnaryOpW(UB* pcode, vec32* pval);
extern UB* rmaEvalBinaryOpW(UB* pcode, vec32* pval);
extern UB* rmaEvalTernaryOpW(UB* pcode, vec32* pval);
extern UB* rmaEvalUnaryOpE(UB* pcode, scalar* pv);
extern UB* rmaEvalBinaryOpE(UB* pcode, scalar* pv);
extern UB* rmaEvalTernaryOpE(UB* pcode, scalar* pv);
extern UB* rmaEvalTernaryOpS(UB* pcode, scalar val);
extern scalar rmaGetScalarFromWCg(vec32* pval, U index);
extern void rmaSetScalarInWCg(vec32* pval, U index, scalar s);
extern void rmaCountRaptorBits(void* pval, void* pvalPrev, U cbits, U vt);
extern void setHsimFunc(void* ip);
extern void unsetHsimFunc(void* ip);
extern UB* getEvcdValue(scalar* pfevcdStatus, U cdrivers, UB* table, U fevcdLoad);
extern UB* getEvcdStatusE(scalar* pscalar, UB* pevcdTBDriverFlags, U cdrivers, UB* table, U cbits);
extern UB* getEvcdStatusV(vec32* pvec32, UB* pevcdTBDriverFlags, U cdrivers, UB* table, U cbits);
extern void evcdCallback(UP pcode, U cbits);
extern UB* getSingleDrvEvcdValueS(UB val, U fTBDriver);
extern UB* getSingleDrvEvcdValueE(scalar* pscalars, U fTBDriver, U cbits);
extern UB* getSingleDrvEvcdValueV(vec32* pvec32, U fTBDriver, U cbits);
extern UB* getMultiDrvEvcdValueS(scalar* pscalars, UB* pevcdTBDriverFlags, U cdrivers, UB* table);
extern UB* getMultiDrvEvcdValueE(scalar* pscalars, UB* pevcdTBDriverFlags, U cdrivers, UB* table, U cbits);
extern UB* getMultiDrvEvcdValueV(vec32* pvec32, UB* pevcdTBDriverFlags, U cdrivers, UB* table, U cbits);
extern UB* getEvcdValOrStatus(void);
extern void saveEvcdValOrStatus(UB*);
extern void mhdlMarkExport(void*, U);
extern void CallMhdlCoercedPort(void*, UP);


#ifdef __cplusplus
extern "C" {
#endif
void  hsF_0_0_0_(UB  * I652, vec32  * I653, U  I671);
void  hsF_0_1_0_(UB  * I652, vec32  * I653, U  I671);
void  hsF_0_2_0_(UB  * I652, vec32  * I653, U  I671);
void  hsF_0_3_0_(UB  * I652, vec32  * I653, U  I671);
void  hsF_0_3_5_(UB  * I652, U  I671);
void  schedNewEvent(struct dummyq_struct * I734, EBLK  * I735, U  I553);
#ifdef __cplusplus
}
#endif

#ifdef __cplusplus
  }
#endif
#endif /*__DO_RMAHDR_*/

