class c_862_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_862_12;
    c_862_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z1z1z0zz0z1x011x0z0z0z01zz100z0xxxxzzxzxxxxzzzxzzzxxzxzzxxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
