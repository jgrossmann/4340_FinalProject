class c_174_16;
    integer y_pos = 2;
    integer x_pos = 1;
    rand bit[15:0] l_arb_address_i = 16'h37; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_174_16;
    c_174_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z11z10xz0x0111100xz100zx0x01xxzxzzzxxxxxxzxzxxzzzzxzzzxxxxzzzxzx";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
