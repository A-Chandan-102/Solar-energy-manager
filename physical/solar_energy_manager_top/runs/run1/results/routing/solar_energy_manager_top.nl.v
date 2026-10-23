module solar_energy_manager_top (clear_stats,
    clk,
    critical_seen,
    essential_load_enable,
    nonessential_load_enable,
    rst_n,
    solar_available,
    solar_charge_enable,
    battery_level,
    operating_mode,
    stat_out,
    stat_sel);
 input clear_stats;
 input clk;
 output critical_seen;
 output essential_load_enable;
 output nonessential_load_enable;
 input rst_n;
 input solar_available;
 output solar_charge_enable;
 input [1:0] battery_level;
 output [1:0] operating_mode;
 output [7:0] stat_out;
 input [1:0] stat_sel;

 wire _000_;
 wire _001_;
 wire net28;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire _123_;
 wire _124_;
 wire _125_;
 wire _126_;
 wire _127_;
 wire _128_;
 wire _129_;
 wire _130_;
 wire _131_;
 wire _132_;
 wire _133_;
 wire _134_;
 wire _135_;
 wire _136_;
 wire _137_;
 wire _138_;
 wire _139_;
 wire _140_;
 wire _141_;
 wire _142_;
 wire _143_;
 wire _144_;
 wire _145_;
 wire _146_;
 wire _147_;
 wire _148_;
 wire _149_;
 wire _150_;
 wire _151_;
 wire _152_;
 wire \core.battery_level[0] ;
 wire \core.battery_level[1] ;
 wire \core.next_mode[0] ;
 wire \core.next_mode[1] ;
 wire \core.solar_available ;
 wire \core.solar_charge_enable ;
 wire \dcnt[0] ;
 wire \dcnt[1] ;
 wire \dcnt[2] ;
 wire clknet_0_clk;
 wire \presc[0] ;
 wire \presc[1] ;
 wire \presc[2] ;
 wire \presc[3] ;
 wire \prev[0] ;
 wire \prev[1] ;
 wire \prev[2] ;
 wire \sync1[0] ;
 wire \sync1[1] ;
 wire \sync1[2] ;
 wire \sync2[0] ;
 wire \sync2[1] ;
 wire \sync2[2] ;
 wire \t_crit[0] ;
 wire \t_crit[1] ;
 wire \t_crit[2] ;
 wire \t_crit[3] ;
 wire \t_crit[4] ;
 wire \t_crit[5] ;
 wire \t_crit[6] ;
 wire \t_crit[7] ;
 wire \t_norm[0] ;
 wire \t_norm[1] ;
 wire \t_norm[2] ;
 wire \t_norm[3] ;
 wire \t_norm[4] ;
 wire \t_norm[5] ;
 wire \t_norm[6] ;
 wire \t_norm[7] ;
 wire \t_save[0] ;
 wire \t_save[1] ;
 wire \t_save[2] ;
 wire \t_save[3] ;
 wire \t_save[4] ;
 wire \t_save[5] ;
 wire \t_save[6] ;
 wire \t_save[7] ;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire clknet_2_0__leaf_clk;
 wire clknet_2_1__leaf_clk;
 wire clknet_2_2__leaf_clk;
 wire clknet_2_3__leaf_clk;
 wire net29;
 wire net30;
 wire net31;
 wire net32;
 wire net33;

 sky130_fd_sc_hd__nor2_1 _153_ (.A(net11),
    .B(net10),
    .Y(net9));
 sky130_fd_sc_hd__a21boi_1 _154_ (.A1(\core.battery_level[0] ),
    .A2(\core.battery_level[1] ),
    .B1_N(\core.solar_available ),
    .Y(\core.solar_charge_enable ));
 sky130_fd_sc_hd__clkbuf_4 _155_ (.A(net3),
    .X(_152_));
 sky130_fd_sc_hd__nor2_1 _156_ (.A(_152_),
    .B(net32),
    .Y(_003_));
 sky130_fd_sc_hd__inv_2 _157_ (.A(net3),
    .Y(_038_));
 sky130_fd_sc_hd__clkbuf_4 _158_ (.A(_038_),
    .X(_039_));
 sky130_fd_sc_hd__o21ai_1 _159_ (.A1(\presc[1] ),
    .A2(\presc[0] ),
    .B1(_039_),
    .Y(_040_));
 sky130_fd_sc_hd__a21oi_1 _160_ (.A1(\presc[1] ),
    .A2(\presc[0] ),
    .B1(_040_),
    .Y(_004_));
 sky130_fd_sc_hd__and3_1 _161_ (.A(\presc[2] ),
    .B(\presc[1] ),
    .C(\presc[0] ),
    .X(_041_));
 sky130_fd_sc_hd__a21oi_1 _162_ (.A1(\presc[1] ),
    .A2(\presc[0] ),
    .B1(\presc[2] ),
    .Y(_042_));
 sky130_fd_sc_hd__nor3_1 _163_ (.A(_152_),
    .B(_041_),
    .C(_042_),
    .Y(_005_));
 sky130_fd_sc_hd__and4_1 _164_ (.A(\presc[2] ),
    .B(\presc[3] ),
    .C(\presc[1] ),
    .D(\presc[0] ),
    .X(_043_));
 sky130_fd_sc_hd__clkbuf_4 _165_ (.A(_043_),
    .X(_044_));
 sky130_fd_sc_hd__nor2_1 _166_ (.A(_152_),
    .B(_044_),
    .Y(_045_));
 sky130_fd_sc_hd__o21a_1 _167_ (.A1(net33),
    .A2(_041_),
    .B1(_045_),
    .X(_006_));
 sky130_fd_sc_hd__inv_2 _168_ (.A(\sync2[0] ),
    .Y(_046_));
 sky130_fd_sc_hd__inv_2 _169_ (.A(\prev[1] ),
    .Y(_047_));
 sky130_fd_sc_hd__inv_2 _170_ (.A(\prev[0] ),
    .Y(_048_));
 sky130_fd_sc_hd__inv_2 _171_ (.A(\sync2[1] ),
    .Y(_049_));
 sky130_fd_sc_hd__xnor2_1 _172_ (.A(\prev[2] ),
    .B(\sync2[2] ),
    .Y(_050_));
 sky130_fd_sc_hd__o221a_1 _173_ (.A1(_048_),
    .A2(\sync2[0] ),
    .B1(\prev[1] ),
    .B2(_049_),
    .C1(_050_),
    .X(_051_));
 sky130_fd_sc_hd__o221a_1 _174_ (.A1(\prev[0] ),
    .A2(_046_),
    .B1(_047_),
    .B2(\sync2[1] ),
    .C1(_051_),
    .X(_052_));
 sky130_fd_sc_hd__xor2_1 _175_ (.A(\sync2[2] ),
    .B(\core.solar_available ),
    .X(_053_));
 sky130_fd_sc_hd__a2bb2o_1 _176_ (.A1_N(_049_),
    .A2_N(\core.battery_level[1] ),
    .B1(\core.battery_level[0] ),
    .B2(_046_),
    .X(_054_));
 sky130_fd_sc_hd__a2bb2o_1 _177_ (.A1_N(_046_),
    .A2_N(\core.battery_level[0] ),
    .B1(\core.battery_level[1] ),
    .B2(_049_),
    .X(_055_));
 sky130_fd_sc_hd__or3_1 _178_ (.A(_053_),
    .B(_054_),
    .C(_055_),
    .X(_056_));
 sky130_fd_sc_hd__and4bb_1 _179_ (.A_N(\dcnt[0] ),
    .B_N(\dcnt[2] ),
    .C(_052_),
    .D(_056_),
    .X(_057_));
 sky130_fd_sc_hd__clkbuf_1 _180_ (.A(_057_),
    .X(_000_));
 sky130_fd_sc_hd__a21oi_1 _181_ (.A1(\dcnt[1] ),
    .A2(\dcnt[0] ),
    .B1(\dcnt[2] ),
    .Y(_058_));
 sky130_fd_sc_hd__o2111a_1 _182_ (.A1(\dcnt[1] ),
    .A2(\dcnt[0] ),
    .B1(_052_),
    .C1(_056_),
    .D1(_058_),
    .X(_001_));
 sky130_fd_sc_hd__buf_2 _183_ (.A(net6),
    .X(_059_));
 sky130_fd_sc_hd__nand2_1 _184_ (.A(_059_),
    .B(net7),
    .Y(_060_));
 sky130_fd_sc_hd__nor2_2 _185_ (.A(net6),
    .B(net7),
    .Y(_061_));
 sky130_fd_sc_hd__o21a_1 _186_ (.A1(\t_crit[0] ),
    .A2(_059_),
    .B1(net7),
    .X(_062_));
 sky130_fd_sc_hd__a221o_1 _187_ (.A1(\t_save[0] ),
    .A2(_059_),
    .B1(_061_),
    .B2(\t_norm[0] ),
    .C1(_062_),
    .X(_063_));
 sky130_fd_sc_hd__o21a_1 _188_ (.A1(\core.battery_level[0] ),
    .A2(_060_),
    .B1(_063_),
    .X(net13));
 sky130_fd_sc_hd__o21a_1 _189_ (.A1(\t_crit[1] ),
    .A2(_059_),
    .B1(net7),
    .X(_064_));
 sky130_fd_sc_hd__a221o_1 _190_ (.A1(\t_save[1] ),
    .A2(_059_),
    .B1(_061_),
    .B2(\t_norm[1] ),
    .C1(_064_),
    .X(_065_));
 sky130_fd_sc_hd__o21a_1 _191_ (.A1(\core.battery_level[1] ),
    .A2(_060_),
    .B1(_065_),
    .X(net14));
 sky130_fd_sc_hd__o21a_1 _192_ (.A1(\t_crit[2] ),
    .A2(_059_),
    .B1(net7),
    .X(_066_));
 sky130_fd_sc_hd__a221o_1 _193_ (.A1(\t_save[2] ),
    .A2(_059_),
    .B1(_061_),
    .B2(\t_norm[2] ),
    .C1(_066_),
    .X(_067_));
 sky130_fd_sc_hd__o21a_1 _194_ (.A1(\core.solar_available ),
    .A2(_060_),
    .B1(_067_),
    .X(net15));
 sky130_fd_sc_hd__o21a_1 _195_ (.A1(\t_crit[3] ),
    .A2(_059_),
    .B1(net7),
    .X(_068_));
 sky130_fd_sc_hd__a221o_1 _196_ (.A1(\t_save[3] ),
    .A2(_059_),
    .B1(_061_),
    .B2(\t_norm[3] ),
    .C1(_068_),
    .X(_069_));
 sky130_fd_sc_hd__o21a_1 _197_ (.A1(net8),
    .A2(_060_),
    .B1(_069_),
    .X(net16));
 sky130_fd_sc_hd__and2b_1 _198_ (.A_N(net7),
    .B(net6),
    .X(_070_));
 sky130_fd_sc_hd__and2b_1 _199_ (.A_N(_059_),
    .B(net7),
    .X(_071_));
 sky130_fd_sc_hd__a22o_1 _200_ (.A1(\t_save[4] ),
    .A2(_070_),
    .B1(_071_),
    .B2(\t_crit[4] ),
    .X(_072_));
 sky130_fd_sc_hd__a21o_1 _201_ (.A1(\t_norm[4] ),
    .A2(_061_),
    .B1(_072_),
    .X(net17));
 sky130_fd_sc_hd__a22o_1 _202_ (.A1(\t_save[5] ),
    .A2(_070_),
    .B1(_071_),
    .B2(\t_crit[5] ),
    .X(_073_));
 sky130_fd_sc_hd__a21o_1 _203_ (.A1(\t_norm[5] ),
    .A2(_061_),
    .B1(_073_),
    .X(net18));
 sky130_fd_sc_hd__a22o_1 _204_ (.A1(\t_save[6] ),
    .A2(_070_),
    .B1(_071_),
    .B2(\t_crit[6] ),
    .X(_074_));
 sky130_fd_sc_hd__a21o_1 _205_ (.A1(\t_norm[6] ),
    .A2(_061_),
    .B1(_074_),
    .X(net19));
 sky130_fd_sc_hd__a22o_1 _206_ (.A1(\t_save[7] ),
    .A2(_070_),
    .B1(_071_),
    .B2(\t_crit[7] ),
    .X(_075_));
 sky130_fd_sc_hd__a21o_1 _207_ (.A1(\t_norm[7] ),
    .A2(_061_),
    .B1(_075_),
    .X(net20));
 sky130_fd_sc_hd__inv_2 _208_ (.A(net11),
    .Y(_076_));
 sky130_fd_sc_hd__a21oi_1 _209_ (.A1(_076_),
    .A2(\core.solar_available ),
    .B1(\core.battery_level[1] ),
    .Y(_077_));
 sky130_fd_sc_hd__a22o_1 _210_ (.A1(net11),
    .A2(net10),
    .B1(\core.battery_level[0] ),
    .B2(_077_),
    .X(\core.next_mode[0] ));
 sky130_fd_sc_hd__a211oi_1 _211_ (.A1(net11),
    .A2(net10),
    .B1(\core.battery_level[0] ),
    .C1(\core.battery_level[1] ),
    .Y(\core.next_mode[1] ));
 sky130_fd_sc_hd__or2b_1 _212_ (.A(_058_),
    .B_N(_052_),
    .X(_078_));
 sky130_fd_sc_hd__mux2_1 _213_ (.A0(\sync2[0] ),
    .A1(\core.battery_level[0] ),
    .S(_078_),
    .X(_079_));
 sky130_fd_sc_hd__clkbuf_1 _214_ (.A(_079_),
    .X(_007_));
 sky130_fd_sc_hd__mux2_1 _215_ (.A0(\sync2[1] ),
    .A1(\core.battery_level[1] ),
    .S(_078_),
    .X(_080_));
 sky130_fd_sc_hd__clkbuf_1 _216_ (.A(_080_),
    .X(_008_));
 sky130_fd_sc_hd__mux2_1 _217_ (.A0(\sync2[2] ),
    .A1(\core.solar_available ),
    .S(_078_),
    .X(_081_));
 sky130_fd_sc_hd__clkbuf_1 _218_ (.A(_081_),
    .X(_009_));
 sky130_fd_sc_hd__and2b_1 _219_ (.A_N(net10),
    .B(net11),
    .X(_082_));
 sky130_fd_sc_hd__o21a_1 _220_ (.A1(net8),
    .A2(_082_),
    .B1(_039_),
    .X(_010_));
 sky130_fd_sc_hd__and3_1 _221_ (.A(_038_),
    .B(net9),
    .C(_044_),
    .X(_083_));
 sky130_fd_sc_hd__and4_1 _222_ (.A(\t_norm[1] ),
    .B(\t_norm[0] ),
    .C(\t_norm[3] ),
    .D(\t_norm[2] ),
    .X(_084_));
 sky130_fd_sc_hd__and3_2 _223_ (.A(\t_norm[5] ),
    .B(\t_norm[4] ),
    .C(_084_),
    .X(_085_));
 sky130_fd_sc_hd__nand2_1 _224_ (.A(net9),
    .B(_044_),
    .Y(_086_));
 sky130_fd_sc_hd__a31oi_4 _225_ (.A1(\t_norm[6] ),
    .A2(\t_norm[7] ),
    .A3(_085_),
    .B1(_086_),
    .Y(_087_));
 sky130_fd_sc_hd__nor2_1 _226_ (.A(net3),
    .B(_087_),
    .Y(_088_));
 sky130_fd_sc_hd__mux2_1 _227_ (.A0(_083_),
    .A1(_088_),
    .S(\t_norm[0] ),
    .X(_089_));
 sky130_fd_sc_hd__clkbuf_1 _228_ (.A(_089_),
    .X(_011_));
 sky130_fd_sc_hd__a21oi_1 _229_ (.A1(\t_norm[0] ),
    .A2(_087_),
    .B1(\t_norm[1] ),
    .Y(_090_));
 sky130_fd_sc_hd__and3_1 _230_ (.A(\t_norm[1] ),
    .B(\t_norm[0] ),
    .C(_087_),
    .X(_091_));
 sky130_fd_sc_hd__nor3_1 _231_ (.A(_152_),
    .B(_090_),
    .C(_091_),
    .Y(_012_));
 sky130_fd_sc_hd__nand3_1 _232_ (.A(\t_norm[1] ),
    .B(\t_norm[0] ),
    .C(\t_norm[2] ),
    .Y(_092_));
 sky130_fd_sc_hd__a31o_2 _233_ (.A1(\t_norm[6] ),
    .A2(\t_norm[7] ),
    .A3(_085_),
    .B1(_086_),
    .X(_093_));
 sky130_fd_sc_hd__o221a_1 _234_ (.A1(_092_),
    .A2(_093_),
    .B1(_091_),
    .B2(\t_norm[2] ),
    .C1(_039_),
    .X(_013_));
 sky130_fd_sc_hd__inv_2 _235_ (.A(\t_norm[3] ),
    .Y(_094_));
 sky130_fd_sc_hd__or2_1 _236_ (.A(_094_),
    .B(_092_),
    .X(_095_));
 sky130_fd_sc_hd__nor2_1 _237_ (.A(_092_),
    .B(_093_),
    .Y(_096_));
 sky130_fd_sc_hd__o221a_1 _238_ (.A1(_095_),
    .A2(_093_),
    .B1(_096_),
    .B2(\t_norm[3] ),
    .C1(_039_),
    .X(_014_));
 sky130_fd_sc_hd__nand2_1 _239_ (.A(\t_norm[4] ),
    .B(_084_),
    .Y(_097_));
 sky130_fd_sc_hd__nor2_1 _240_ (.A(_095_),
    .B(_093_),
    .Y(_098_));
 sky130_fd_sc_hd__o221a_1 _241_ (.A1(_097_),
    .A2(_093_),
    .B1(_098_),
    .B2(\t_norm[4] ),
    .C1(_039_),
    .X(_015_));
 sky130_fd_sc_hd__inv_2 _242_ (.A(_085_),
    .Y(_099_));
 sky130_fd_sc_hd__nor2_1 _243_ (.A(_097_),
    .B(_093_),
    .Y(_100_));
 sky130_fd_sc_hd__o221a_1 _244_ (.A1(_099_),
    .A2(_093_),
    .B1(_100_),
    .B2(\t_norm[5] ),
    .C1(_039_),
    .X(_016_));
 sky130_fd_sc_hd__a21oi_1 _245_ (.A1(_085_),
    .A2(_087_),
    .B1(\t_norm[6] ),
    .Y(_101_));
 sky130_fd_sc_hd__a31o_1 _246_ (.A1(\t_norm[6] ),
    .A2(_085_),
    .A3(_087_),
    .B1(_152_),
    .X(_102_));
 sky130_fd_sc_hd__nor2_1 _247_ (.A(_101_),
    .B(_102_),
    .Y(_017_));
 sky130_fd_sc_hd__a41o_1 _248_ (.A1(\t_norm[6] ),
    .A2(net9),
    .A3(_044_),
    .A4(_085_),
    .B1(\t_norm[7] ),
    .X(_103_));
 sky130_fd_sc_hd__and2_1 _249_ (.A(_038_),
    .B(_103_),
    .X(_104_));
 sky130_fd_sc_hd__clkbuf_1 _250_ (.A(_104_),
    .X(_018_));
 sky130_fd_sc_hd__and4_2 _251_ (.A(\t_save[1] ),
    .B(\t_save[0] ),
    .C(\t_save[3] ),
    .D(\t_save[2] ),
    .X(_105_));
 sky130_fd_sc_hd__and4_1 _252_ (.A(\t_save[4] ),
    .B(\t_save[5] ),
    .C(\t_save[6] ),
    .D(_105_),
    .X(_106_));
 sky130_fd_sc_hd__a21oi_2 _253_ (.A1(\t_save[7] ),
    .A2(_106_),
    .B1(net11),
    .Y(_107_));
 sky130_fd_sc_hd__and4_2 _254_ (.A(net10),
    .B(_038_),
    .C(_044_),
    .D(_107_),
    .X(_108_));
 sky130_fd_sc_hd__a31oi_4 _255_ (.A1(net10),
    .A2(_044_),
    .A3(_107_),
    .B1(net3),
    .Y(_109_));
 sky130_fd_sc_hd__mux2_1 _256_ (.A0(_108_),
    .A1(_109_),
    .S(\t_save[0] ),
    .X(_110_));
 sky130_fd_sc_hd__clkbuf_1 _257_ (.A(_110_),
    .X(_019_));
 sky130_fd_sc_hd__nand2_1 _258_ (.A(\t_save[1] ),
    .B(\t_save[0] ),
    .Y(_111_));
 sky130_fd_sc_hd__or2_1 _259_ (.A(\t_save[1] ),
    .B(\t_save[0] ),
    .X(_112_));
 sky130_fd_sc_hd__a32o_1 _260_ (.A1(_111_),
    .A2(_108_),
    .A3(_112_),
    .B1(_109_),
    .B2(\t_save[1] ),
    .X(_020_));
 sky130_fd_sc_hd__and3_1 _261_ (.A(\t_save[1] ),
    .B(\t_save[0] ),
    .C(\t_save[2] ),
    .X(_113_));
 sky130_fd_sc_hd__inv_2 _262_ (.A(_113_),
    .Y(_114_));
 sky130_fd_sc_hd__a21o_1 _263_ (.A1(\t_save[1] ),
    .A2(\t_save[0] ),
    .B1(\t_save[2] ),
    .X(_115_));
 sky130_fd_sc_hd__a32o_1 _264_ (.A1(_114_),
    .A2(_108_),
    .A3(_115_),
    .B1(_109_),
    .B2(\t_save[2] ),
    .X(_021_));
 sky130_fd_sc_hd__nor2_1 _265_ (.A(net3),
    .B(_105_),
    .Y(_116_));
 sky130_fd_sc_hd__o21a_1 _266_ (.A1(\t_save[3] ),
    .A2(_113_),
    .B1(_116_),
    .X(_117_));
 sky130_fd_sc_hd__mux2_1 _267_ (.A0(_117_),
    .A1(\t_save[3] ),
    .S(_109_),
    .X(_118_));
 sky130_fd_sc_hd__clkbuf_1 _268_ (.A(_118_),
    .X(_022_));
 sky130_fd_sc_hd__nand2_1 _269_ (.A(\t_save[4] ),
    .B(_105_),
    .Y(_119_));
 sky130_fd_sc_hd__or2_1 _270_ (.A(\t_save[4] ),
    .B(_105_),
    .X(_120_));
 sky130_fd_sc_hd__a32o_1 _271_ (.A1(_119_),
    .A2(_108_),
    .A3(_120_),
    .B1(_109_),
    .B2(\t_save[4] ),
    .X(_023_));
 sky130_fd_sc_hd__inv_2 _272_ (.A(\t_save[5] ),
    .Y(_121_));
 sky130_fd_sc_hd__a31o_1 _273_ (.A1(\t_save[4] ),
    .A2(\t_save[5] ),
    .A3(_105_),
    .B1(net3),
    .X(_122_));
 sky130_fd_sc_hd__a21oi_1 _274_ (.A1(_121_),
    .A2(_119_),
    .B1(_122_),
    .Y(_123_));
 sky130_fd_sc_hd__mux2_1 _275_ (.A0(_123_),
    .A1(\t_save[5] ),
    .S(_109_),
    .X(_124_));
 sky130_fd_sc_hd__clkbuf_1 _276_ (.A(_124_),
    .X(_024_));
 sky130_fd_sc_hd__inv_2 _277_ (.A(_106_),
    .Y(_125_));
 sky130_fd_sc_hd__a31o_1 _278_ (.A1(\t_save[4] ),
    .A2(\t_save[5] ),
    .A3(_105_),
    .B1(\t_save[6] ),
    .X(_126_));
 sky130_fd_sc_hd__a32o_1 _279_ (.A1(_125_),
    .A2(_108_),
    .A3(_126_),
    .B1(_109_),
    .B2(\t_save[6] ),
    .X(_025_));
 sky130_fd_sc_hd__a41o_1 _280_ (.A1(_076_),
    .A2(net10),
    .A3(_044_),
    .A4(_106_),
    .B1(\t_save[7] ),
    .X(_127_));
 sky130_fd_sc_hd__and2_1 _281_ (.A(_038_),
    .B(_127_),
    .X(_128_));
 sky130_fd_sc_hd__clkbuf_1 _282_ (.A(_128_),
    .X(_026_));
 sky130_fd_sc_hd__nand2_1 _283_ (.A(_044_),
    .B(_082_),
    .Y(_129_));
 sky130_fd_sc_hd__and4_1 _284_ (.A(\t_crit[0] ),
    .B(\t_crit[1] ),
    .C(\t_crit[3] ),
    .D(\t_crit[2] ),
    .X(_130_));
 sky130_fd_sc_hd__and2_1 _285_ (.A(\t_crit[5] ),
    .B(\t_crit[4] ),
    .X(_131_));
 sky130_fd_sc_hd__and4_1 _286_ (.A(\t_crit[7] ),
    .B(\t_crit[6] ),
    .C(_130_),
    .D(_131_),
    .X(_132_));
 sky130_fd_sc_hd__nor2_2 _287_ (.A(_129_),
    .B(_132_),
    .Y(_133_));
 sky130_fd_sc_hd__a21oi_1 _288_ (.A1(\t_crit[0] ),
    .A2(_133_),
    .B1(_152_),
    .Y(_134_));
 sky130_fd_sc_hd__o21a_1 _289_ (.A1(\t_crit[0] ),
    .A2(_133_),
    .B1(_134_),
    .X(_027_));
 sky130_fd_sc_hd__a21oi_1 _290_ (.A1(\t_crit[0] ),
    .A2(_133_),
    .B1(\t_crit[1] ),
    .Y(_135_));
 sky130_fd_sc_hd__and4bb_1 _291_ (.A_N(_132_),
    .B_N(_129_),
    .C(\t_crit[1] ),
    .D(\t_crit[0] ),
    .X(_136_));
 sky130_fd_sc_hd__nor3_1 _292_ (.A(_152_),
    .B(_135_),
    .C(_136_),
    .Y(_028_));
 sky130_fd_sc_hd__o21ai_1 _293_ (.A1(\t_crit[2] ),
    .A2(_136_),
    .B1(_039_),
    .Y(_137_));
 sky130_fd_sc_hd__a21oi_1 _294_ (.A1(\t_crit[2] ),
    .A2(_136_),
    .B1(_137_),
    .Y(_029_));
 sky130_fd_sc_hd__o2111a_1 _295_ (.A1(net3),
    .A2(_133_),
    .B1(\t_crit[2] ),
    .C1(\t_crit[1] ),
    .D1(\t_crit[0] ),
    .X(_138_));
 sky130_fd_sc_hd__or3b_1 _296_ (.A(_129_),
    .B(_132_),
    .C_N(_130_),
    .X(_139_));
 sky130_fd_sc_hd__o211a_1 _297_ (.A1(\t_crit[3] ),
    .A2(_138_),
    .B1(_139_),
    .C1(_039_),
    .X(_030_));
 sky130_fd_sc_hd__inv_2 _298_ (.A(\t_crit[4] ),
    .Y(_140_));
 sky130_fd_sc_hd__a21o_1 _299_ (.A1(_140_),
    .A2(_139_),
    .B1(_152_),
    .X(_141_));
 sky130_fd_sc_hd__o21ba_1 _300_ (.A1(_140_),
    .A2(_139_),
    .B1_N(_141_),
    .X(_031_));
 sky130_fd_sc_hd__nand2_1 _301_ (.A(\t_crit[4] ),
    .B(_130_),
    .Y(_142_));
 sky130_fd_sc_hd__o21ba_1 _302_ (.A1(_152_),
    .A2(_133_),
    .B1_N(_142_),
    .X(_143_));
 sky130_fd_sc_hd__or4b_1 _303_ (.A(_129_),
    .B(_132_),
    .C(_142_),
    .D_N(\t_crit[5] ),
    .X(_144_));
 sky130_fd_sc_hd__o211a_1 _304_ (.A1(\t_crit[5] ),
    .A2(_143_),
    .B1(_144_),
    .C1(_039_),
    .X(_032_));
 sky130_fd_sc_hd__inv_2 _305_ (.A(\t_crit[6] ),
    .Y(_145_));
 sky130_fd_sc_hd__a21oi_1 _306_ (.A1(_145_),
    .A2(_144_),
    .B1(_152_),
    .Y(_146_));
 sky130_fd_sc_hd__o21a_1 _307_ (.A1(_145_),
    .A2(_144_),
    .B1(_146_),
    .X(_033_));
 sky130_fd_sc_hd__and3_1 _308_ (.A(\t_crit[6] ),
    .B(_130_),
    .C(_131_),
    .X(_147_));
 sky130_fd_sc_hd__and3_1 _309_ (.A(_044_),
    .B(_082_),
    .C(_147_),
    .X(_148_));
 sky130_fd_sc_hd__o21a_1 _310_ (.A1(\t_crit[7] ),
    .A2(_148_),
    .B1(_039_),
    .X(_034_));
 sky130_fd_sc_hd__clkbuf_1 _311_ (.A(\sync2[0] ),
    .X(_149_));
 sky130_fd_sc_hd__clkbuf_1 _312_ (.A(_149_),
    .X(_035_));
 sky130_fd_sc_hd__clkbuf_1 _313_ (.A(\sync2[1] ),
    .X(_150_));
 sky130_fd_sc_hd__clkbuf_1 _314_ (.A(_150_),
    .X(_036_));
 sky130_fd_sc_hd__clkbuf_1 _315_ (.A(\sync2[2] ),
    .X(_151_));
 sky130_fd_sc_hd__clkbuf_1 _316_ (.A(_151_),
    .X(_037_));
 sky130_fd_sc_hd__dfstp_2 _317_ (.CLK(clknet_2_2__leaf_clk),
    .D(_007_),
    .SET_B(net23),
    .Q(\core.battery_level[0] ));
 sky130_fd_sc_hd__dfrtp_4 _318_ (.CLK(clknet_2_2__leaf_clk),
    .D(_008_),
    .RESET_B(net23),
    .Q(\core.battery_level[1] ));
 sky130_fd_sc_hd__dfrtp_2 _319_ (.CLK(clknet_2_2__leaf_clk),
    .D(_009_),
    .RESET_B(net23),
    .Q(\core.solar_available ));
 sky130_fd_sc_hd__dfrtp_2 _320_ (.CLK(clknet_2_0__leaf_clk),
    .D(_003_),
    .RESET_B(net21),
    .Q(\presc[0] ));
 sky130_fd_sc_hd__dfrtp_1 _321_ (.CLK(clknet_2_0__leaf_clk),
    .D(_004_),
    .RESET_B(net21),
    .Q(\presc[1] ));
 sky130_fd_sc_hd__dfrtp_1 _322_ (.CLK(clknet_2_0__leaf_clk),
    .D(_005_),
    .RESET_B(net21),
    .Q(\presc[2] ));
 sky130_fd_sc_hd__dfrtp_1 _323_ (.CLK(clknet_2_0__leaf_clk),
    .D(_006_),
    .RESET_B(net21),
    .Q(\presc[3] ));
 sky130_fd_sc_hd__dfrtp_1 _324_ (.CLK(clknet_2_1__leaf_clk),
    .D(_010_),
    .RESET_B(net22),
    .Q(net8));
 sky130_fd_sc_hd__dfrtp_2 _325_ (.CLK(clknet_2_0__leaf_clk),
    .D(_011_),
    .RESET_B(net21),
    .Q(\t_norm[0] ));
 sky130_fd_sc_hd__dfrtp_1 _326_ (.CLK(clknet_2_1__leaf_clk),
    .D(_012_),
    .RESET_B(net21),
    .Q(\t_norm[1] ));
 sky130_fd_sc_hd__dfrtp_1 _327_ (.CLK(clknet_2_0__leaf_clk),
    .D(_013_),
    .RESET_B(net21),
    .Q(\t_norm[2] ));
 sky130_fd_sc_hd__dfrtp_1 _328_ (.CLK(clknet_2_1__leaf_clk),
    .D(_014_),
    .RESET_B(net22),
    .Q(\t_norm[3] ));
 sky130_fd_sc_hd__dfrtp_1 _329_ (.CLK(clknet_2_1__leaf_clk),
    .D(_015_),
    .RESET_B(net22),
    .Q(\t_norm[4] ));
 sky130_fd_sc_hd__dfrtp_1 _330_ (.CLK(clknet_2_1__leaf_clk),
    .D(_016_),
    .RESET_B(net22),
    .Q(\t_norm[5] ));
 sky130_fd_sc_hd__dfrtp_4 _331_ (.CLK(clknet_2_0__leaf_clk),
    .D(_017_),
    .RESET_B(net21),
    .Q(\t_norm[6] ));
 sky130_fd_sc_hd__dfrtp_2 _332_ (.CLK(clknet_2_0__leaf_clk),
    .D(_018_),
    .RESET_B(net21),
    .Q(\t_norm[7] ));
 sky130_fd_sc_hd__dfrtp_2 _333_ (.CLK(clknet_2_2__leaf_clk),
    .D(_019_),
    .RESET_B(net23),
    .Q(\t_save[0] ));
 sky130_fd_sc_hd__dfrtp_2 _334_ (.CLK(clknet_2_2__leaf_clk),
    .D(_020_),
    .RESET_B(net23),
    .Q(\t_save[1] ));
 sky130_fd_sc_hd__dfrtp_1 _335_ (.CLK(clknet_2_2__leaf_clk),
    .D(_021_),
    .RESET_B(net23),
    .Q(\t_save[2] ));
 sky130_fd_sc_hd__dfrtp_1 _336_ (.CLK(clknet_2_2__leaf_clk),
    .D(_022_),
    .RESET_B(net23),
    .Q(\t_save[3] ));
 sky130_fd_sc_hd__dfrtp_2 _337_ (.CLK(clknet_2_3__leaf_clk),
    .D(_023_),
    .RESET_B(net24),
    .Q(\t_save[4] ));
 sky130_fd_sc_hd__dfrtp_2 _338_ (.CLK(clknet_2_3__leaf_clk),
    .D(_024_),
    .RESET_B(net24),
    .Q(\t_save[5] ));
 sky130_fd_sc_hd__dfrtp_1 _339_ (.CLK(clknet_2_1__leaf_clk),
    .D(_025_),
    .RESET_B(net24),
    .Q(\t_save[6] ));
 sky130_fd_sc_hd__dfrtp_1 _340_ (.CLK(clknet_2_0__leaf_clk),
    .D(_026_),
    .RESET_B(net21),
    .Q(\t_save[7] ));
 sky130_fd_sc_hd__dfrtp_1 _341_ (.CLK(clknet_2_2__leaf_clk),
    .D(\core.solar_charge_enable ),
    .RESET_B(net22),
    .Q(net12));
 sky130_fd_sc_hd__dfrtp_2 _342_ (.CLK(clknet_2_3__leaf_clk),
    .D(_027_),
    .RESET_B(net24),
    .Q(\t_crit[0] ));
 sky130_fd_sc_hd__dfrtp_1 _343_ (.CLK(clknet_2_3__leaf_clk),
    .D(_028_),
    .RESET_B(net24),
    .Q(\t_crit[1] ));
 sky130_fd_sc_hd__dfrtp_1 _344_ (.CLK(clknet_2_3__leaf_clk),
    .D(_029_),
    .RESET_B(net24),
    .Q(\t_crit[2] ));
 sky130_fd_sc_hd__dfrtp_1 _345_ (.CLK(clknet_2_3__leaf_clk),
    .D(_030_),
    .RESET_B(net24),
    .Q(\t_crit[3] ));
 sky130_fd_sc_hd__dfrtp_1 _346_ (.CLK(clknet_2_1__leaf_clk),
    .D(_031_),
    .RESET_B(net22),
    .Q(\t_crit[4] ));
 sky130_fd_sc_hd__dfrtp_1 _347_ (.CLK(clknet_2_1__leaf_clk),
    .D(_032_),
    .RESET_B(net22),
    .Q(\t_crit[5] ));
 sky130_fd_sc_hd__dfrtp_1 _348_ (.CLK(clknet_2_1__leaf_clk),
    .D(_033_),
    .RESET_B(net22),
    .Q(\t_crit[6] ));
 sky130_fd_sc_hd__dfrtp_1 _349_ (.CLK(clknet_2_1__leaf_clk),
    .D(_034_),
    .RESET_B(net22),
    .Q(\t_crit[7] ));
 sky130_fd_sc_hd__dfstp_1 _350_ (.CLK(clknet_2_3__leaf_clk),
    .D(_035_),
    .SET_B(net24),
    .Q(\prev[0] ));
 sky130_fd_sc_hd__dfrtp_1 _351_ (.CLK(clknet_2_3__leaf_clk),
    .D(_036_),
    .RESET_B(net24),
    .Q(\prev[1] ));
 sky130_fd_sc_hd__dfrtp_1 _352_ (.CLK(clknet_2_3__leaf_clk),
    .D(_037_),
    .RESET_B(net24),
    .Q(\prev[2] ));
 sky130_fd_sc_hd__dfrtp_1 _353_ (.CLK(clknet_2_2__leaf_clk),
    .D(_000_),
    .RESET_B(net23),
    .Q(\dcnt[0] ));
 sky130_fd_sc_hd__dfrtp_1 _354_ (.CLK(clknet_2_2__leaf_clk),
    .D(_001_),
    .RESET_B(net26),
    .Q(\dcnt[1] ));
 sky130_fd_sc_hd__dfrtp_1 _355_ (.CLK(clknet_2_2__leaf_clk),
    .D(net27),
    .RESET_B(net26),
    .Q(\dcnt[2] ));
 sky130_fd_sc_hd__dfstp_1 _356_ (.CLK(clknet_2_3__leaf_clk),
    .D(net1),
    .SET_B(net25),
    .Q(\sync1[0] ));
 sky130_fd_sc_hd__dfrtp_1 _357_ (.CLK(clknet_2_3__leaf_clk),
    .D(net2),
    .RESET_B(net25),
    .Q(\sync1[1] ));
 sky130_fd_sc_hd__dfrtp_1 _358_ (.CLK(clknet_2_3__leaf_clk),
    .D(net5),
    .RESET_B(net25),
    .Q(\sync1[2] ));
 sky130_fd_sc_hd__dfstp_1 _359_ (.CLK(clknet_2_3__leaf_clk),
    .D(net31),
    .SET_B(net25),
    .Q(\sync2[0] ));
 sky130_fd_sc_hd__dfrtp_1 _360_ (.CLK(clknet_2_3__leaf_clk),
    .D(net30),
    .RESET_B(net25),
    .Q(\sync2[1] ));
 sky130_fd_sc_hd__dfrtp_2 _361_ (.CLK(clknet_2_3__leaf_clk),
    .D(net29),
    .RESET_B(net25),
    .Q(\sync2[2] ));
 sky130_fd_sc_hd__dfstp_2 _362_ (.CLK(clknet_2_2__leaf_clk),
    .D(\core.next_mode[0] ),
    .SET_B(net23),
    .Q(net10));
 sky130_fd_sc_hd__dfrtp_4 _363_ (.CLK(clknet_2_2__leaf_clk),
    .D(\core.next_mode[1] ),
    .RESET_B(net23),
    .Q(net11));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__conb_1 solar_energy_manager_top_28 (.HI(net28));
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
 sky130_fd_sc_hd__decap_3 PHY_10 ();
 sky130_fd_sc_hd__decap_3 PHY_11 ();
 sky130_fd_sc_hd__decap_3 PHY_12 ();
 sky130_fd_sc_hd__decap_3 PHY_13 ();
 sky130_fd_sc_hd__decap_3 PHY_14 ();
 sky130_fd_sc_hd__decap_3 PHY_15 ();
 sky130_fd_sc_hd__decap_3 PHY_16 ();
 sky130_fd_sc_hd__decap_3 PHY_17 ();
 sky130_fd_sc_hd__decap_3 PHY_18 ();
 sky130_fd_sc_hd__decap_3 PHY_19 ();
 sky130_fd_sc_hd__decap_3 PHY_20 ();
 sky130_fd_sc_hd__decap_3 PHY_21 ();
 sky130_fd_sc_hd__decap_3 PHY_22 ();
 sky130_fd_sc_hd__decap_3 PHY_23 ();
 sky130_fd_sc_hd__decap_3 PHY_24 ();
 sky130_fd_sc_hd__decap_3 PHY_25 ();
 sky130_fd_sc_hd__decap_3 PHY_26 ();
 sky130_fd_sc_hd__decap_3 PHY_27 ();
 sky130_fd_sc_hd__decap_3 PHY_28 ();
 sky130_fd_sc_hd__decap_3 PHY_29 ();
 sky130_fd_sc_hd__decap_3 PHY_30 ();
 sky130_fd_sc_hd__decap_3 PHY_31 ();
 sky130_fd_sc_hd__decap_3 PHY_32 ();
 sky130_fd_sc_hd__decap_3 PHY_33 ();
 sky130_fd_sc_hd__decap_3 PHY_34 ();
 sky130_fd_sc_hd__decap_3 PHY_35 ();
 sky130_fd_sc_hd__decap_3 PHY_36 ();
 sky130_fd_sc_hd__decap_3 PHY_37 ();
 sky130_fd_sc_hd__decap_3 PHY_38 ();
 sky130_fd_sc_hd__decap_3 PHY_39 ();
 sky130_fd_sc_hd__decap_3 PHY_40 ();
 sky130_fd_sc_hd__decap_3 PHY_41 ();
 sky130_fd_sc_hd__decap_3 PHY_42 ();
 sky130_fd_sc_hd__decap_3 PHY_43 ();
 sky130_fd_sc_hd__decap_3 PHY_44 ();
 sky130_fd_sc_hd__decap_3 PHY_45 ();
 sky130_fd_sc_hd__decap_3 PHY_46 ();
 sky130_fd_sc_hd__decap_3 PHY_47 ();
 sky130_fd_sc_hd__decap_3 PHY_48 ();
 sky130_fd_sc_hd__decap_3 PHY_49 ();
 sky130_fd_sc_hd__decap_3 PHY_50 ();
 sky130_fd_sc_hd__decap_3 PHY_51 ();
 sky130_fd_sc_hd__decap_3 PHY_52 ();
 sky130_fd_sc_hd__decap_3 PHY_53 ();
 sky130_fd_sc_hd__decap_3 PHY_54 ();
 sky130_fd_sc_hd__decap_3 PHY_55 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_56 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_57 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_58 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_59 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_60 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_61 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_62 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_63 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_64 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_65 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_66 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_67 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_68 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_69 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_70 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_71 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_72 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_73 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_74 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_75 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_76 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_77 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_78 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_79 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_80 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_81 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_82 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_83 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_84 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_85 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_86 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_87 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_88 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_89 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_90 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_91 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_92 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_93 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_94 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_95 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_96 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_97 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_98 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_99 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_100 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_101 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_102 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_103 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_104 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_105 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_106 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_107 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_108 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_109 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_110 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_111 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_112 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_113 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_114 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_115 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_116 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_117 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_118 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_119 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_120 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_121 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_122 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_123 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_124 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_125 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_126 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_127 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_128 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_129 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_130 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_131 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_132 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_133 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_134 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_135 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_136 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_137 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_138 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_139 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_140 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_141 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_142 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_143 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_144 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_145 ();
 sky130_fd_sc_hd__clkbuf_1 input1 (.A(battery_level[0]),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_1 input2 (.A(battery_level[1]),
    .X(net2));
 sky130_fd_sc_hd__clkbuf_4 input3 (.A(clear_stats),
    .X(net3));
 sky130_fd_sc_hd__buf_1 input4 (.A(rst_n),
    .X(net4));
 sky130_fd_sc_hd__clkbuf_1 input5 (.A(solar_available),
    .X(net5));
 sky130_fd_sc_hd__buf_1 input6 (.A(stat_sel[0]),
    .X(net6));
 sky130_fd_sc_hd__buf_2 input7 (.A(stat_sel[1]),
    .X(net7));
 sky130_fd_sc_hd__clkbuf_4 output8 (.A(net8),
    .X(critical_seen));
 sky130_fd_sc_hd__clkbuf_4 output9 (.A(net9),
    .X(nonessential_load_enable));
 sky130_fd_sc_hd__buf_2 output10 (.A(net10),
    .X(operating_mode[0]));
 sky130_fd_sc_hd__clkbuf_4 output11 (.A(net11),
    .X(operating_mode[1]));
 sky130_fd_sc_hd__clkbuf_4 output12 (.A(net12),
    .X(solar_charge_enable));
 sky130_fd_sc_hd__clkbuf_4 output13 (.A(net13),
    .X(stat_out[0]));
 sky130_fd_sc_hd__clkbuf_4 output14 (.A(net14),
    .X(stat_out[1]));
 sky130_fd_sc_hd__clkbuf_4 output15 (.A(net15),
    .X(stat_out[2]));
 sky130_fd_sc_hd__clkbuf_4 output16 (.A(net16),
    .X(stat_out[3]));
 sky130_fd_sc_hd__clkbuf_4 output17 (.A(net17),
    .X(stat_out[4]));
 sky130_fd_sc_hd__clkbuf_4 output18 (.A(net18),
    .X(stat_out[5]));
 sky130_fd_sc_hd__clkbuf_4 output19 (.A(net19),
    .X(stat_out[6]));
 sky130_fd_sc_hd__clkbuf_4 output20 (.A(net20),
    .X(stat_out[7]));
 sky130_fd_sc_hd__clkbuf_4 fanout21 (.A(net22),
    .X(net21));
 sky130_fd_sc_hd__clkbuf_4 fanout22 (.A(net4),
    .X(net22));
 sky130_fd_sc_hd__clkbuf_4 fanout23 (.A(net26),
    .X(net23));
 sky130_fd_sc_hd__clkbuf_4 fanout24 (.A(net26),
    .X(net24));
 sky130_fd_sc_hd__clkbuf_2 fanout25 (.A(net26),
    .X(net25));
 sky130_fd_sc_hd__clkbuf_2 fanout26 (.A(net4),
    .X(net26));
 sky130_fd_sc_hd__conb_1 _355__27 (.LO(net27));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_0__f_clk (.A(clknet_0_clk),
    .X(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_1__f_clk (.A(clknet_0_clk),
    .X(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_2__f_clk (.A(clknet_0_clk),
    .X(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_3__f_clk (.A(clknet_0_clk),
    .X(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__dlygate4sd3_1 hold1 (.A(\sync1[2] ),
    .X(net29));
 sky130_fd_sc_hd__dlygate4sd3_1 hold2 (.A(\sync1[1] ),
    .X(net30));
 sky130_fd_sc_hd__dlygate4sd3_1 hold3 (.A(\sync1[0] ),
    .X(net31));
 sky130_fd_sc_hd__dlygate4sd3_1 hold4 (.A(\presc[0] ),
    .X(net32));
 sky130_fd_sc_hd__dlygate4sd3_1 hold5 (.A(\presc[3] ),
    .X(net33));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_6 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_18 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_29 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_41 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_0_50 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_0_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_63 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_70 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_82 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_97 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_125 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_137 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_149 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_0_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_167 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_0_169 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_177 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_184 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_1_27 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_35 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_69 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_1_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_1_103 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_119 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_131 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_143 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_155 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_169 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_1_181 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_189 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_9 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_2_21 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_27 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_2_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_33 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_64 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_2_76 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_2_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_89 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_2_134 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_2_153 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_177 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_189 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_15 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_3_37 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_44 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_73 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_3_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_91 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_3_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_123 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_135 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_147 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_159 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_3_164 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_169 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_3_181 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_189 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_42 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_70 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_4_75 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_83 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_4_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_92 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_4_97 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_124 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_4_136 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_4_153 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_4_181 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_189 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_5_27 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_5_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_5_53 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_5_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_65 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_87 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_5_99 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_103 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_5_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_137 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_5_149 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_157 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_189 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_53 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_6_65 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_71 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_6_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_83 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_6_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_6_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_141 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_6_153 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_166 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_177 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_189 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_7_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_7_11 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_38 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_7_50 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_7_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_7_73 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_7_94 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_102 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_134 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_7_146 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_152 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_156 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_175 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_7_187 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_47 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_8_55 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_61 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_69 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_80 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_8_102 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_8_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_139 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_8_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_168 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_180 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_188 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_9_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_11 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_9_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_93 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_9_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_130 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_142 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_9_154 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_176 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_188 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_9 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_10_40 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_44 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_10_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_83 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_97 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_10_104 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_10_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_141 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_10_153 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_10_182 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_11_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_23 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_55 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_11_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_92 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_138 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_11_150 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_11_186 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_27 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_12_36 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_66 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_12_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_89 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_98 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_12_110 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_12_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_141 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_12_153 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_12_178 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_27 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_13_52 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_13_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_13_104 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_13_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_124 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_136 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_148 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_13_160 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_13_181 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_189 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_14_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_14_23 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_65 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_14_77 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_14_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_14_98 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_14_119 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_14_127 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_14_136 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_153 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_14_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_172 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_14_184 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_15_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_15_46 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_54 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_15_69 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_77 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_15_84 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_88 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_15_106 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_128 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_149 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_15_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_167 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_169 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_15_182 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_16_9 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_16_38 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_16_50 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_16_62 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_68 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_76 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_16_85 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_16_114 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_16_145 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_157 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_17_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_17_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_17_48 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_17_57 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_17_69 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_17_87 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_17_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_17_111 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_17_113 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_17_166 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_18_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_18_7 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_18_38 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_18_46 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_18_67 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_18_71 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_18_79 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_18_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_18_92 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_18_104 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_18_116 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_18_124 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_18_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_18_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_18_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_18_153 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_18_183 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_18_189 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_19_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_19_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_68 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_19_80 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_19_88 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_95 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_19_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_19_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_137 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_149 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_19_161 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_19_179 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_19_183 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_20_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_53 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_20_65 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_20_76 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_97 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_20_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_20_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_153 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_177 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_20_189 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_21_27 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_21_35 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_44 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_21_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_82 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_21_94 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_21_100 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_21_108 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_133 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_145 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_21_157 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_21_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_169 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_21_181 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_21_189 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_22_27 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_22_49 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_22_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_22_82 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_22_92 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_116 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_128 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_153 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_22_186 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_23_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_23_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_23_27 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_23_39 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_23_45 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_23_90 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_23_103 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_23_110 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_23_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_23_145 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_23_166 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_24_6 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_24_18 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_24_26 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_24_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_24_37 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_24_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_24_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_24_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_24_139 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_24_145 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_24_183 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_24_189 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_25_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_25_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_25_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_25_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_25_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_25_55 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_25_63 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_25_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_25_89 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_25_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_25_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_25_153 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_25_165 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_25_189 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_26_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_26_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_26_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_97 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_26_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_26_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_153 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_26_165 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_26_173 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_27_9 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_13 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_27_25 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_27_41 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_27_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_27_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_27_81 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_27_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_90 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_27_102 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_27_110 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_27_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_27_121 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_128 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_141 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_27_153 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_27_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_27_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_169 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_27_181 ();
 assign essential_load_enable = net28;
endmodule
