class c_201_16;
    integer y_pos = 3;
    integer x_pos = 2;
    rand bit[15:0] l_arb_address_i = 16'h6597; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_201_16;
    c_201_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0xx0xx1z0x11xx1z01xzzx0x0100x11xzzzzzxxzxzzzzzzxxxxzxxzxzxzxzzz";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
