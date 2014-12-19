class c_888_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_888_12;
    c_888_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x00xz0zzx11x0z11x1z1xx1z1z0z100zxxzxzzzzxxxzzxzxxxzzxzxzzzxxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
