class c_204_12;
    integer y_pos = 2;
    rand bit[15:0] n_arb_address_i = 16'h6e95; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((n_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_204_12;
    c_204_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxxx0000xzx0zz0z10z101xzzz0xz10xxzxzxxzzxzzxzxzxxzxzxxzxzzzxzzzz";
            obj.set_randstate(randState);
            obj.n_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
