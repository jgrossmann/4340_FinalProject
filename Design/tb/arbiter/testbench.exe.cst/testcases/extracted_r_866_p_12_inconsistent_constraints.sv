class c_866_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_866_12;
    c_866_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxz0xxxxz10z1x11x1zz1z10x0zxz11zzxxzzzxxxzzxzzxxzxxzxxzxzzzxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
