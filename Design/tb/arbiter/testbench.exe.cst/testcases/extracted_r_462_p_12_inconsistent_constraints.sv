class c_462_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_462_12;
    c_462_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xxx1zz1z0z0zx1z111000z10z1100zxxzxzxxxxxxxzzxxxxxzxxxxxxxzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
