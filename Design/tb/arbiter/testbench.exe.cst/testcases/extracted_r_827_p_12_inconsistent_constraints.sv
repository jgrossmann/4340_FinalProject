class c_827_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_827_12;
    c_827_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0110z0xx0x00xz1110zx1x1xx1x1x0z1zzxxzxzzxzzxzxzzzxzzzxxzxxzxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
