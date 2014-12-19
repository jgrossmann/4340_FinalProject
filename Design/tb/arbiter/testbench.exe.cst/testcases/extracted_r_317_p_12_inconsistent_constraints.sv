class c_317_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_317_12;
    c_317_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xx1xzx1x1x0x1xx100zz0zzz01x1zz0xxxzxzxzzzzzxxzxzxxxxzxxzzzxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
