class c_1085_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_1085_12;
    c_1085_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01z01x010z1xx00z0zx00xzz01x1x0xxzzxxzzxxxzzzzzzxxzzzzxxzxzzzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
