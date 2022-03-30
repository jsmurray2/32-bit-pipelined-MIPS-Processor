onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Reset and Clocks}
add wave -noupdate /mips_pipelined_processor/MIPSclock
add wave -noupdate /mips_pipelined_processor/reset_n
add wave -noupdate -divider {IF stage}
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/InstructionMemOut
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/PCValue
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/pcmuxout
add wave -noupdate -label {Instruction Register} -radix hexadecimal /mips_pipelined_processor/b2v_IFIDIMem/Q
add wave -noupdate -radix decimal /mips_pipelined_processor/RegFileData
add wave -noupdate -divider {ID stage}
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/ReadData1Out
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/ReadData2Out
add wave -noupdate -divider {Ex stage}
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/ALUResult
add wave -noupdate -divider {Mem stage}
add wave -noupdate /mips_pipelined_processor/DMemWren
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/DMemAddress
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/DMemData
add wave -noupdate -divider {WB stage}
add wave -noupdate -radix decimal /mips_pipelined_processor/datamemoryMuxout
add wave -noupdate /mips_pipelined_processor/WriteEnable
add wave -noupdate /mips_pipelined_processor/RegisterAddress
add wave -noupdate -divider {Data outputs}
add wave -noupdate -divider Register
add wave -noupdate /mips_pipelined_processor/b2v_regfile/reset0
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/DataMemOut
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_regfile/writeEn
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_regfile/Read1Register
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_regfile/Read2Register
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_regfile/WriteData
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_regfile/WriteReg
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_regfile/Read1Data
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_regfile/Read2Data
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_regfile/clock
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_regfile/data
add wave -noupdate -divider ALU
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/ALUa
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_alu/controla
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_alu/controlb
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_alu/cin
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_alu/a
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_alu/b
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_alu/controlop
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_alu/cout
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_alu/overflow
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_alu/zflag
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_alu/NFlag
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/b2v_alu/result
add wave -noupdate -divider MISC
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/dmemin
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/dmemout
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/extend
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/filewrite
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/Instruction
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/ju
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/PCfour
add wave -noupdate /mips_pipelined_processor/wbin
add wave -noupdate /mips_pipelined_processor/wbout
add wave -noupdate /mips_pipelined_processor/wdata
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/ALUMUXbvalue
add wave -noupdate -radix hexadecimal /mips_pipelined_processor/result
add wave -noupdate /mips_pipelined_processor/EXout
add wave -noupdate /mips_pipelined_processor/regmuxout
add wave -noupdate -divider Controls
add wave -noupdate /mips_pipelined_processor/RegDst
add wave -noupdate /mips_pipelined_processor/ALUSrc
add wave -noupdate /mips_pipelined_processor/MemToReg
add wave -noupdate /mips_pipelined_processor/RegWrite
add wave -noupdate /mips_pipelined_processor/MemRead
add wave -noupdate /mips_pipelined_processor/MemWrite
add wave -noupdate /mips_pipelined_processor/Branch
add wave -noupdate /mips_pipelined_processor/Jump
add wave -noupdate /mips_pipelined_processor/ALUOP
add wave -noupdate -divider Registers
add wave -noupdate -label 1 -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg1/Q
add wave -noupdate -label 2 -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg2/Q
add wave -noupdate -label 3 -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg3/Q
add wave -noupdate -label 4 -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg4/Q
add wave -noupdate -label 5 -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg5/Q
add wave -noupdate -label 9 -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg9/Q
add wave -noupdate -label {Register 11} -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg11/Q
add wave -noupdate -label 12 -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg12/Q
add wave -noupdate -label 13 -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg13/Q
add wave -noupdate -label 14 -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg14/Q
add wave -noupdate -label 15 -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg15/Q
add wave -noupdate -label 16 -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg16/Q
add wave -noupdate -label 17 -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg17/Q
add wave -noupdate -label 18 -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg18/Q
add wave -noupdate -label 19 -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg19/Q
add wave -noupdate -label 20 -radix decimal /mips_pipelined_processor/b2v_regfile/b2v_reg20/Q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {289819 ps} 0} {{Cursor 2} {310000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {275510 ps} {323020 ps}
