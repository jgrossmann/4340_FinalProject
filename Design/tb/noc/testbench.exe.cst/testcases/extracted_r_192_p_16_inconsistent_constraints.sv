class c_192_16;
    integer y_pos = 2;
    integer x_pos = 0;
    rand bit[15:0] l_arb_address_i = 16'ha1dd; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_192_16;
    c_192_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z11zx11xxz0x0110z011x01xzx0zx1x1xxxzzxzzxxxzzzxxzzzzxzzxzxxzzxzx";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
