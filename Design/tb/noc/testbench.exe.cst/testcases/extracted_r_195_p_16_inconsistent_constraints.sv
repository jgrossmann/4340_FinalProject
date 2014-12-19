class c_195_16;
    integer y_pos = 1;
    integer x_pos = 1;
    rand bit[15:0] l_arb_address_i = 16'ha462; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[7:4]) <= 4'h3);
    }
endclass

program p_195_16;
    c_195_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10z010001010xz000x11011000zxxzx1xzxzxxzxxxzxzzzzzzzxxzzxxzxxxxzx";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
