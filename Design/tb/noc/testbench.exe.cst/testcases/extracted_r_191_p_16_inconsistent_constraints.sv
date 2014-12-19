class c_191_16;
    integer y_pos = 1;
    integer x_pos = 0;
    rand bit[15:0] l_arb_address_i = 16'hbf0e; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_191_16;
    c_191_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x1x0z010010xxxx1zx01z11x1z1z101zxxxxxzxzxxzzzxxzzxzxxxxzxxzxzzx";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
