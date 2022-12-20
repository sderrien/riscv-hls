-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2020.1
-- Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity read_u8 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axi_uart_AWVALID : OUT STD_LOGIC;
    m_axi_uart_AWREADY : IN STD_LOGIC;
    m_axi_uart_AWADDR : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_uart_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_uart_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_uart_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_uart_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_uart_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_uart_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_uart_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_uart_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_uart_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_uart_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_uart_WVALID : OUT STD_LOGIC;
    m_axi_uart_WREADY : IN STD_LOGIC;
    m_axi_uart_WDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_uart_WSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_uart_WLAST : OUT STD_LOGIC;
    m_axi_uart_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_uart_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_uart_ARVALID : OUT STD_LOGIC;
    m_axi_uart_ARREADY : IN STD_LOGIC;
    m_axi_uart_ARADDR : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_uart_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_uart_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_uart_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_uart_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_uart_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_uart_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_uart_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_uart_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_uart_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_uart_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_uart_RVALID : IN STD_LOGIC;
    m_axi_uart_RREADY : OUT STD_LOGIC;
    m_axi_uart_RDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    m_axi_uart_RLAST : IN STD_LOGIC;
    m_axi_uart_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_uart_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_uart_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_uart_BVALID : IN STD_LOGIC;
    m_axi_uart_BREADY : OUT STD_LOGIC;
    m_axi_uart_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_uart_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_uart_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    uart_offset : IN STD_LOGIC_VECTOR (29 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of read_u8 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal k_fu_87_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal k_reg_155 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal value_fu_139_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal grp_get_digit_fu_74_ap_ready : STD_LOGIC;
    signal grp_get_digit_fu_74_ap_done : STD_LOGIC;
    signal grp_get_digit_fu_74_ap_start : STD_LOGIC;
    signal grp_get_digit_fu_74_ap_idle : STD_LOGIC;
    signal grp_get_digit_fu_74_m_axi_uart_AWVALID : STD_LOGIC;
    signal grp_get_digit_fu_74_m_axi_uart_AWADDR : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_WVALID : STD_LOGIC;
    signal grp_get_digit_fu_74_m_axi_uart_WDATA : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_WSTRB : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_WLAST : STD_LOGIC;
    signal grp_get_digit_fu_74_m_axi_uart_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_ARVALID : STD_LOGIC;
    signal grp_get_digit_fu_74_m_axi_uart_ARADDR : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_get_digit_fu_74_m_axi_uart_RREADY : STD_LOGIC;
    signal grp_get_digit_fu_74_m_axi_uart_BREADY : STD_LOGIC;
    signal grp_get_digit_fu_74_ap_return : STD_LOGIC_VECTOR (7 downto 0);
    signal k_0_reg_50 : STD_LOGIC_VECTOR (1 downto 0);
    signal value_0_reg_62 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_get_digit_fu_74_ap_start_reg : STD_LOGIC := '0';
    signal icmp_ln181_fu_81_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln183_fu_97_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal shl_ln_fu_101_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal zext_ln183_fu_93_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal zext_ln183_1_fu_109_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal trunc_ln183_1_fu_119_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal shl_ln183_fu_113_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_fu_129_p4 : STD_LOGIC_VECTOR (19 downto 0);
    signal or_ln183_fu_123_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_return_preg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);

    component get_digit IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        m_axi_uart_AWVALID : OUT STD_LOGIC;
        m_axi_uart_AWREADY : IN STD_LOGIC;
        m_axi_uart_AWADDR : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_uart_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_uart_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_uart_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_uart_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_uart_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_uart_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_uart_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_uart_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_uart_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_uart_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_uart_WVALID : OUT STD_LOGIC;
        m_axi_uart_WREADY : IN STD_LOGIC;
        m_axi_uart_WDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_uart_WSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_uart_WLAST : OUT STD_LOGIC;
        m_axi_uart_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_uart_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_uart_ARVALID : OUT STD_LOGIC;
        m_axi_uart_ARREADY : IN STD_LOGIC;
        m_axi_uart_ARADDR : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_uart_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_uart_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_uart_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_uart_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_uart_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_uart_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_uart_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_uart_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_uart_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_uart_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_uart_RVALID : IN STD_LOGIC;
        m_axi_uart_RREADY : OUT STD_LOGIC;
        m_axi_uart_RDATA : IN STD_LOGIC_VECTOR (31 downto 0);
        m_axi_uart_RLAST : IN STD_LOGIC;
        m_axi_uart_RID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_uart_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_uart_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_uart_BVALID : IN STD_LOGIC;
        m_axi_uart_BREADY : OUT STD_LOGIC;
        m_axi_uart_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_uart_BID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_uart_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        uart_offset : IN STD_LOGIC_VECTOR (29 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (7 downto 0) );
    end component;



begin
    grp_get_digit_fu_74 : component get_digit
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_get_digit_fu_74_ap_start,
        ap_done => grp_get_digit_fu_74_ap_done,
        ap_idle => grp_get_digit_fu_74_ap_idle,
        ap_ready => grp_get_digit_fu_74_ap_ready,
        m_axi_uart_AWVALID => grp_get_digit_fu_74_m_axi_uart_AWVALID,
        m_axi_uart_AWREADY => ap_const_logic_0,
        m_axi_uart_AWADDR => grp_get_digit_fu_74_m_axi_uart_AWADDR,
        m_axi_uart_AWID => grp_get_digit_fu_74_m_axi_uart_AWID,
        m_axi_uart_AWLEN => grp_get_digit_fu_74_m_axi_uart_AWLEN,
        m_axi_uart_AWSIZE => grp_get_digit_fu_74_m_axi_uart_AWSIZE,
        m_axi_uart_AWBURST => grp_get_digit_fu_74_m_axi_uart_AWBURST,
        m_axi_uart_AWLOCK => grp_get_digit_fu_74_m_axi_uart_AWLOCK,
        m_axi_uart_AWCACHE => grp_get_digit_fu_74_m_axi_uart_AWCACHE,
        m_axi_uart_AWPROT => grp_get_digit_fu_74_m_axi_uart_AWPROT,
        m_axi_uart_AWQOS => grp_get_digit_fu_74_m_axi_uart_AWQOS,
        m_axi_uart_AWREGION => grp_get_digit_fu_74_m_axi_uart_AWREGION,
        m_axi_uart_AWUSER => grp_get_digit_fu_74_m_axi_uart_AWUSER,
        m_axi_uart_WVALID => grp_get_digit_fu_74_m_axi_uart_WVALID,
        m_axi_uart_WREADY => ap_const_logic_0,
        m_axi_uart_WDATA => grp_get_digit_fu_74_m_axi_uart_WDATA,
        m_axi_uart_WSTRB => grp_get_digit_fu_74_m_axi_uart_WSTRB,
        m_axi_uart_WLAST => grp_get_digit_fu_74_m_axi_uart_WLAST,
        m_axi_uart_WID => grp_get_digit_fu_74_m_axi_uart_WID,
        m_axi_uart_WUSER => grp_get_digit_fu_74_m_axi_uart_WUSER,
        m_axi_uart_ARVALID => grp_get_digit_fu_74_m_axi_uart_ARVALID,
        m_axi_uart_ARREADY => m_axi_uart_ARREADY,
        m_axi_uart_ARADDR => grp_get_digit_fu_74_m_axi_uart_ARADDR,
        m_axi_uart_ARID => grp_get_digit_fu_74_m_axi_uart_ARID,
        m_axi_uart_ARLEN => grp_get_digit_fu_74_m_axi_uart_ARLEN,
        m_axi_uart_ARSIZE => grp_get_digit_fu_74_m_axi_uart_ARSIZE,
        m_axi_uart_ARBURST => grp_get_digit_fu_74_m_axi_uart_ARBURST,
        m_axi_uart_ARLOCK => grp_get_digit_fu_74_m_axi_uart_ARLOCK,
        m_axi_uart_ARCACHE => grp_get_digit_fu_74_m_axi_uart_ARCACHE,
        m_axi_uart_ARPROT => grp_get_digit_fu_74_m_axi_uart_ARPROT,
        m_axi_uart_ARQOS => grp_get_digit_fu_74_m_axi_uart_ARQOS,
        m_axi_uart_ARREGION => grp_get_digit_fu_74_m_axi_uart_ARREGION,
        m_axi_uart_ARUSER => grp_get_digit_fu_74_m_axi_uart_ARUSER,
        m_axi_uart_RVALID => m_axi_uart_RVALID,
        m_axi_uart_RREADY => grp_get_digit_fu_74_m_axi_uart_RREADY,
        m_axi_uart_RDATA => m_axi_uart_RDATA,
        m_axi_uart_RLAST => m_axi_uart_RLAST,
        m_axi_uart_RID => m_axi_uart_RID,
        m_axi_uart_RUSER => m_axi_uart_RUSER,
        m_axi_uart_RRESP => m_axi_uart_RRESP,
        m_axi_uart_BVALID => ap_const_logic_0,
        m_axi_uart_BREADY => grp_get_digit_fu_74_m_axi_uart_BREADY,
        m_axi_uart_BRESP => ap_const_lv2_0,
        m_axi_uart_BID => ap_const_lv1_0,
        m_axi_uart_BUSER => ap_const_lv1_0,
        uart_offset => uart_offset,
        ap_return => grp_get_digit_fu_74_ap_return);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_return_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_preg <= ap_const_lv32_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln181_fu_81_p2 = ap_const_lv1_1))) then 
                    ap_return_preg <= value_0_reg_62;
                end if; 
            end if;
        end if;
    end process;


    grp_get_digit_fu_74_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_get_digit_fu_74_ap_start_reg <= ap_const_logic_0;
            else
                if (((icmp_ln181_fu_81_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    grp_get_digit_fu_74_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_get_digit_fu_74_ap_ready = ap_const_logic_1)) then 
                    grp_get_digit_fu_74_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    k_0_reg_50_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_get_digit_fu_74_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                k_0_reg_50 <= k_reg_155;
            elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                k_0_reg_50 <= ap_const_lv2_0;
            end if; 
        end if;
    end process;

    value_0_reg_62_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_get_digit_fu_74_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                value_0_reg_62 <= value_fu_139_p3;
            elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                value_0_reg_62 <= ap_const_lv32_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                k_reg_155 <= k_fu_87_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, ap_CS_fsm_state3, grp_get_digit_fu_74_ap_done, icmp_ln181_fu_81_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln181_fu_81_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                if (((grp_get_digit_fu_74_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln181_fu_81_p2)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln181_fu_81_p2 = ap_const_lv1_1)) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln181_fu_81_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln181_fu_81_p2 = ap_const_lv1_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_assign_proc : process(ap_CS_fsm_state2, value_0_reg_62, icmp_ln181_fu_81_p2, ap_return_preg)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln181_fu_81_p2 = ap_const_lv1_1))) then 
            ap_return <= value_0_reg_62;
        else 
            ap_return <= ap_return_preg;
        end if; 
    end process;

    grp_get_digit_fu_74_ap_start <= grp_get_digit_fu_74_ap_start_reg;
    icmp_ln181_fu_81_p2 <= "1" when (k_0_reg_50 = ap_const_lv2_2) else "0";
    k_fu_87_p2 <= std_logic_vector(unsigned(k_0_reg_50) + unsigned(ap_const_lv2_1));
    m_axi_uart_ARADDR <= grp_get_digit_fu_74_m_axi_uart_ARADDR;
    m_axi_uart_ARBURST <= grp_get_digit_fu_74_m_axi_uart_ARBURST;
    m_axi_uart_ARCACHE <= grp_get_digit_fu_74_m_axi_uart_ARCACHE;
    m_axi_uart_ARID <= grp_get_digit_fu_74_m_axi_uart_ARID;
    m_axi_uart_ARLEN <= grp_get_digit_fu_74_m_axi_uart_ARLEN;
    m_axi_uart_ARLOCK <= grp_get_digit_fu_74_m_axi_uart_ARLOCK;
    m_axi_uart_ARPROT <= grp_get_digit_fu_74_m_axi_uart_ARPROT;
    m_axi_uart_ARQOS <= grp_get_digit_fu_74_m_axi_uart_ARQOS;
    m_axi_uart_ARREGION <= grp_get_digit_fu_74_m_axi_uart_ARREGION;
    m_axi_uart_ARSIZE <= grp_get_digit_fu_74_m_axi_uart_ARSIZE;
    m_axi_uart_ARUSER <= grp_get_digit_fu_74_m_axi_uart_ARUSER;

    m_axi_uart_ARVALID_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state3, grp_get_digit_fu_74_m_axi_uart_ARVALID, icmp_ln181_fu_81_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or ((icmp_ln181_fu_81_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            m_axi_uart_ARVALID <= grp_get_digit_fu_74_m_axi_uart_ARVALID;
        else 
            m_axi_uart_ARVALID <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_uart_AWADDR <= ap_const_lv32_0;
    m_axi_uart_AWBURST <= ap_const_lv2_0;
    m_axi_uart_AWCACHE <= ap_const_lv4_0;
    m_axi_uart_AWID <= ap_const_lv1_0;
    m_axi_uart_AWLEN <= ap_const_lv32_0;
    m_axi_uart_AWLOCK <= ap_const_lv2_0;
    m_axi_uart_AWPROT <= ap_const_lv3_0;
    m_axi_uart_AWQOS <= ap_const_lv4_0;
    m_axi_uart_AWREGION <= ap_const_lv4_0;
    m_axi_uart_AWSIZE <= ap_const_lv3_0;
    m_axi_uart_AWUSER <= ap_const_lv1_0;
    m_axi_uart_AWVALID <= ap_const_logic_0;
    m_axi_uart_BREADY <= ap_const_logic_0;

    m_axi_uart_RREADY_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state3, grp_get_digit_fu_74_m_axi_uart_RREADY, icmp_ln181_fu_81_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or ((icmp_ln181_fu_81_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            m_axi_uart_RREADY <= grp_get_digit_fu_74_m_axi_uart_RREADY;
        else 
            m_axi_uart_RREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_uart_WDATA <= ap_const_lv32_0;
    m_axi_uart_WID <= ap_const_lv1_0;
    m_axi_uart_WLAST <= ap_const_logic_0;
    m_axi_uart_WSTRB <= ap_const_lv4_0;
    m_axi_uart_WUSER <= ap_const_lv1_0;
    m_axi_uart_WVALID <= ap_const_logic_0;
    or_ln183_fu_123_p2 <= (trunc_ln183_1_fu_119_p1 or shl_ln183_fu_113_p2);
    shl_ln183_fu_113_p2 <= std_logic_vector(shift_left(unsigned(zext_ln183_fu_93_p1),to_integer(unsigned('0' & zext_ln183_1_fu_109_p1(12-1 downto 0)))));
    shl_ln_fu_101_p3 <= (trunc_ln183_fu_97_p1 & ap_const_lv2_0);
    tmp_fu_129_p4 <= value_0_reg_62(31 downto 12);
    trunc_ln183_1_fu_119_p1 <= value_0_reg_62(12 - 1 downto 0);
    trunc_ln183_fu_97_p1 <= k_0_reg_50(1 - 1 downto 0);
    value_fu_139_p3 <= (tmp_fu_129_p4 & or_ln183_fu_123_p2);
    zext_ln183_1_fu_109_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln_fu_101_p3),12));
    zext_ln183_fu_93_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_get_digit_fu_74_ap_return),12));
end behav;
