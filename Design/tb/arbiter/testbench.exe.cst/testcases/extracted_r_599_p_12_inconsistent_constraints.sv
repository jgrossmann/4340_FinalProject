class c_599_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_599_12;
    c_599_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z00110z001x1zz00z110zz100z0zz0z1zxzzxzzzzzxzxxzzzxzxzxzxzzxxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
