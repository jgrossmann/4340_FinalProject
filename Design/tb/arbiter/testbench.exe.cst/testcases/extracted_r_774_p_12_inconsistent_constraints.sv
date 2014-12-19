class c_774_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_774_12;
    c_774_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "100xx1xz11x1x0x10z0xzzz1zzz0x0z0zxxzzzxxxzzxxxxxzzxzzzzzzzzzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
