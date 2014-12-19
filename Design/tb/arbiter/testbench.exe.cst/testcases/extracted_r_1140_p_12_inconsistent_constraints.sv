class c_1140_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_1140_12;
    c_1140_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01x0zzx0xzz0x1xx110x0z00xz0z0x10xzxxzxxxxzzxxzzxxxzxzzxxxxzzxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
