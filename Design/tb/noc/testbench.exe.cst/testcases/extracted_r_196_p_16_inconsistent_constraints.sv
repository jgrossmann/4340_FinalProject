class c_196_16;
    integer y_pos = 2;
    integer x_pos = 1;
    rand bit[15:0] l_arb_address_i = 16'h37; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_196_16;
    c_196_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "011zz01x1z1xxzx1zzz0xxxx01z11101xzxxzzxzxxzzzzzzzxxxzzzxzzxzxzzz";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
