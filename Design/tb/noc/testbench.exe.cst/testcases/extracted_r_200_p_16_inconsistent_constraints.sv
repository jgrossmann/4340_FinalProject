class c_200_16;
    integer y_pos = 2;
    integer x_pos = 2;
    rand bit[15:0] l_arb_address_i = 16'h6e95; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_200_16;
    c_200_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1zx111zx100x1x0zz1zx01zxzz01x00zxxzxxzxxxxxxxzzzzxxxzzxxzzzzzxx";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
