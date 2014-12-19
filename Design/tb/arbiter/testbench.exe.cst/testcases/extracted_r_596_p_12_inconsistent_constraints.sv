class c_596_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_596_12;
    c_596_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x010xxx0zx1x0z111zx1x0x1x1zxz0z0xxzzzxzzzxxxzxxxxzzxzzxzzzxxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
