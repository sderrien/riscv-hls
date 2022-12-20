-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2020.1
-- Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity get_digit is
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
end;


architecture behav of get_digit is 
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
    constant ap_const_lv32_2F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101111";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111010";
    constant ap_const_lv8_D0 : STD_LOGIC_VECTOR (7 downto 0) := "11010000";
    constant ap_const_lv32_40 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000000";
    constant ap_const_lv32_47 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000111";
    constant ap_const_lv8_C9 : STD_LOGIC_VECTOR (7 downto 0) := "11001001";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal grp_read_byte_fu_44_ap_return : STD_LOGIC_VECTOR (31 downto 0);
    signal digit_reg_119 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal grp_read_byte_fu_44_ap_ready : STD_LOGIC;
    signal grp_read_byte_fu_44_ap_done : STD_LOGIC;
    signal trunc_ln175_fu_52_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln175_reg_127 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_read_byte_fu_44_ap_start : STD_LOGIC;
    signal grp_read_byte_fu_44_ap_idle : STD_LOGIC;
    signal grp_read_byte_fu_44_m_axi_uart_AWVALID : STD_LOGIC;
    signal grp_read_byte_fu_44_m_axi_uart_AWADDR : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_WVALID : STD_LOGIC;
    signal grp_read_byte_fu_44_m_axi_uart_WDATA : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_WSTRB : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_WLAST : STD_LOGIC;
    signal grp_read_byte_fu_44_m_axi_uart_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_ARVALID : STD_LOGIC;
    signal grp_read_byte_fu_44_m_axi_uart_ARADDR : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_read_byte_fu_44_m_axi_uart_RREADY : STD_LOGIC;
    signal grp_read_byte_fu_44_m_axi_uart_BREADY : STD_LOGIC;
    signal grp_read_byte_fu_44_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal icmp_ln167_fu_56_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln167_1_fu_61_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln169_fu_77_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln169_1_fu_82_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln169_fu_87_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln175_1_fu_93_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal and_ln167_fu_66_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln175_fu_72_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln175_fu_98_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);

    component read_byte IS
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
    end component;



begin
    grp_read_byte_fu_44 : component read_byte
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_read_byte_fu_44_ap_start,
        ap_done => grp_read_byte_fu_44_ap_done,
        ap_idle => grp_read_byte_fu_44_ap_idle,
        ap_ready => grp_read_byte_fu_44_ap_ready,
        m_axi_uart_AWVALID => grp_read_byte_fu_44_m_axi_uart_AWVALID,
        m_axi_uart_AWREADY => ap_const_logic_0,
        m_axi_uart_AWADDR => grp_read_byte_fu_44_m_axi_uart_AWADDR,
        m_axi_uart_AWID => grp_read_byte_fu_44_m_axi_uart_AWID,
        m_axi_uart_AWLEN => grp_read_byte_fu_44_m_axi_uart_AWLEN,
        m_axi_uart_AWSIZE => grp_read_byte_fu_44_m_axi_uart_AWSIZE,
        m_axi_uart_AWBURST => grp_read_byte_fu_44_m_axi_uart_AWBURST,
        m_axi_uart_AWLOCK => grp_read_byte_fu_44_m_axi_uart_AWLOCK,
        m_axi_uart_AWCACHE => grp_read_byte_fu_44_m_axi_uart_AWCACHE,
        m_axi_uart_AWPROT => grp_read_byte_fu_44_m_axi_uart_AWPROT,
        m_axi_uart_AWQOS => grp_read_byte_fu_44_m_axi_uart_AWQOS,
        m_axi_uart_AWREGION => grp_read_byte_fu_44_m_axi_uart_AWREGION,
        m_axi_uart_AWUSER => grp_read_byte_fu_44_m_axi_uart_AWUSER,
        m_axi_uart_WVALID => grp_read_byte_fu_44_m_axi_uart_WVALID,
        m_axi_uart_WREADY => ap_const_logic_0,
        m_axi_uart_WDATA => grp_read_byte_fu_44_m_axi_uart_WDATA,
        m_axi_uart_WSTRB => grp_read_byte_fu_44_m_axi_uart_WSTRB,
        m_axi_uart_WLAST => grp_read_byte_fu_44_m_axi_uart_WLAST,
        m_axi_uart_WID => grp_read_byte_fu_44_m_axi_uart_WID,
        m_axi_uart_WUSER => grp_read_byte_fu_44_m_axi_uart_WUSER,
        m_axi_uart_ARVALID => grp_read_byte_fu_44_m_axi_uart_ARVALID,
        m_axi_uart_ARREADY => m_axi_uart_ARREADY,
        m_axi_uart_ARADDR => grp_read_byte_fu_44_m_axi_uart_ARADDR,
        m_axi_uart_ARID => grp_read_byte_fu_44_m_axi_uart_ARID,
        m_axi_uart_ARLEN => grp_read_byte_fu_44_m_axi_uart_ARLEN,
        m_axi_uart_ARSIZE => grp_read_byte_fu_44_m_axi_uart_ARSIZE,
        m_axi_uart_ARBURST => grp_read_byte_fu_44_m_axi_uart_ARBURST,
        m_axi_uart_ARLOCK => grp_read_byte_fu_44_m_axi_uart_ARLOCK,
        m_axi_uart_ARCACHE => grp_read_byte_fu_44_m_axi_uart_ARCACHE,
        m_axi_uart_ARPROT => grp_read_byte_fu_44_m_axi_uart_ARPROT,
        m_axi_uart_ARQOS => grp_read_byte_fu_44_m_axi_uart_ARQOS,
        m_axi_uart_ARREGION => grp_read_byte_fu_44_m_axi_uart_ARREGION,
        m_axi_uart_ARUSER => grp_read_byte_fu_44_m_axi_uart_ARUSER,
        m_axi_uart_RVALID => m_axi_uart_RVALID,
        m_axi_uart_RREADY => grp_read_byte_fu_44_m_axi_uart_RREADY,
        m_axi_uart_RDATA => m_axi_uart_RDATA,
        m_axi_uart_RLAST => m_axi_uart_RLAST,
        m_axi_uart_RID => m_axi_uart_RID,
        m_axi_uart_RUSER => m_axi_uart_RUSER,
        m_axi_uart_RRESP => m_axi_uart_RRESP,
        m_axi_uart_BVALID => ap_const_logic_0,
        m_axi_uart_BREADY => grp_read_byte_fu_44_m_axi_uart_BREADY,
        m_axi_uart_BRESP => ap_const_lv2_0,
        m_axi_uart_BID => ap_const_lv1_0,
        m_axi_uart_BUSER => ap_const_lv1_0,
        uart_offset => uart_offset,
        ap_return => grp_read_byte_fu_44_ap_return);





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


    grp_read_byte_fu_44_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_read_byte_fu_44_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_read_byte_fu_44_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_read_byte_fu_44_ap_ready = ap_const_logic_1)) then 
                    grp_read_byte_fu_44_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_read_byte_fu_44_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                digit_reg_119 <= grp_read_byte_fu_44_ap_return;
                trunc_ln175_reg_127 <= trunc_ln175_fu_52_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, grp_read_byte_fu_44_ap_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_read_byte_fu_44_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    add_ln175_1_fu_93_p2 <= std_logic_vector(signed(ap_const_lv8_C9) + signed(trunc_ln175_reg_127));
    add_ln175_fu_72_p2 <= std_logic_vector(signed(ap_const_lv8_D0) + signed(trunc_ln175_reg_127));
    and_ln167_fu_66_p2 <= (icmp_ln167_fu_56_p2 and icmp_ln167_1_fu_61_p2);
    and_ln169_fu_87_p2 <= (icmp_ln169_fu_77_p2 and icmp_ln169_1_fu_82_p2);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
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


    ap_ready_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= 
        add_ln175_fu_72_p2 when (and_ln167_fu_66_p2(0) = '1') else 
        select_ln175_fu_98_p3;
    grp_read_byte_fu_44_ap_start <= grp_read_byte_fu_44_ap_start_reg;
    icmp_ln167_1_fu_61_p2 <= "1" when (signed(digit_reg_119) < signed(ap_const_lv32_3A)) else "0";
    icmp_ln167_fu_56_p2 <= "1" when (signed(digit_reg_119) > signed(ap_const_lv32_2F)) else "0";
    icmp_ln169_1_fu_82_p2 <= "1" when (signed(digit_reg_119) < signed(ap_const_lv32_47)) else "0";
    icmp_ln169_fu_77_p2 <= "1" when (signed(digit_reg_119) > signed(ap_const_lv32_40)) else "0";
    m_axi_uart_ARADDR <= grp_read_byte_fu_44_m_axi_uart_ARADDR;
    m_axi_uart_ARBURST <= grp_read_byte_fu_44_m_axi_uart_ARBURST;
    m_axi_uart_ARCACHE <= grp_read_byte_fu_44_m_axi_uart_ARCACHE;
    m_axi_uart_ARID <= grp_read_byte_fu_44_m_axi_uart_ARID;
    m_axi_uart_ARLEN <= grp_read_byte_fu_44_m_axi_uart_ARLEN;
    m_axi_uart_ARLOCK <= grp_read_byte_fu_44_m_axi_uart_ARLOCK;
    m_axi_uart_ARPROT <= grp_read_byte_fu_44_m_axi_uart_ARPROT;
    m_axi_uart_ARQOS <= grp_read_byte_fu_44_m_axi_uart_ARQOS;
    m_axi_uart_ARREGION <= grp_read_byte_fu_44_m_axi_uart_ARREGION;
    m_axi_uart_ARSIZE <= grp_read_byte_fu_44_m_axi_uart_ARSIZE;
    m_axi_uart_ARUSER <= grp_read_byte_fu_44_m_axi_uart_ARUSER;

    m_axi_uart_ARVALID_assign_proc : process(ap_CS_fsm_state1, ap_CS_fsm_state2, grp_read_byte_fu_44_m_axi_uart_ARVALID)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            m_axi_uart_ARVALID <= grp_read_byte_fu_44_m_axi_uart_ARVALID;
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

    m_axi_uart_RREADY_assign_proc : process(ap_CS_fsm_state1, ap_CS_fsm_state2, grp_read_byte_fu_44_m_axi_uart_RREADY)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            m_axi_uart_RREADY <= grp_read_byte_fu_44_m_axi_uart_RREADY;
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
    select_ln175_fu_98_p3 <= 
        add_ln175_1_fu_93_p2 when (and_ln169_fu_87_p2(0) = '1') else 
        ap_const_lv8_0;
    trunc_ln175_fu_52_p1 <= grp_read_byte_fu_44_ap_return(8 - 1 downto 0);
end behav;