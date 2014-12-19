class c_732_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_732_12;
    c_732_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z000x10000x1xz010x0zzzx0zxzzx0zxxxxzxxzxxxzxzxzzxxzxzzzxxxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
