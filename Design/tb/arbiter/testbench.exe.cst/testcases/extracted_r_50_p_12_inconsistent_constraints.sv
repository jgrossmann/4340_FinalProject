class c_50_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_50_12;
    c_50_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "001zxz1xx1x0z0z1x10zx11z0101x0z1zzzxxzzzxxzxxzxzzxzxxxzzxzxzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
