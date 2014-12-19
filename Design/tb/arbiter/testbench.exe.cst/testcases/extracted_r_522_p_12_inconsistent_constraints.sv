class c_522_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_522_12;
    c_522_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x01zx0x1xz1000z1zx1x1z110z011z0zzzzxxxxxxxzxzxzzzzxxzzxxxzzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
