class c_864_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_864_12;
    c_864_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1110x101xz11xxx0z0z1x110zzxx1z0zxzzzzzzzzzxzzzxzzxxzxxzzzzzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
