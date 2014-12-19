class c_496_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_496_12;
    c_496_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x001z11x1xx01z11xz1zz1zzz10zz0z1zxxxxxzzzzzzzxxzzxzzzzxxxxxxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
