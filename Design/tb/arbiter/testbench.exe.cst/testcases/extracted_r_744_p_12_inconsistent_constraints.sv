class c_744_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_744_12;
    c_744_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxz1110z00z0100x0xzxzz110zxxx01zzxzxzzzxxxxxzzxxxzxxzxzxxzxxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
