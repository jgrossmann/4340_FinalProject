class c_151_16;
    integer y_pos = 2;
    integer x_pos = 2;
    rand bit[15:0] l_arb_address_i = 16'h6e95; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_151_16;
    c_151_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxx11zxz10zx1xxzzzx0z111zz1x00zxxxxzxxzzxxxxzzzxzxxxxzzxxxxxxxxz";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
