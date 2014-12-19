class c_220_16;
    integer y_pos = 1;
    integer x_pos = 3;
    rand bit[15:0] l_arb_address_i = 16'hd6a8; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_220_16;
    c_220_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz001zz110z111xxx0x1x0z1zx1z01z0xzzxzxzxxzzxzzzxxxxzxzzzzxzzxxxz";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
