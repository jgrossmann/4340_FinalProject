class c_499_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_499_12;
    c_499_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz1xx1z0101x10z110x00xz1zzz0zz1xxxxxxxxxxzzxxzxzzzxzxzzzzxzzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
