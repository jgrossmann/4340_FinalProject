class c_1156_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_1156_12;
    c_1156_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1zx10110zx01xx0xxz1x0xx0zx11z10zxxzxzxzxzzzzxxzxzxzzzxxxzxzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
