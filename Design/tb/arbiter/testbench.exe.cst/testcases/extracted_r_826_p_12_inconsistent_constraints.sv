class c_826_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_826_12;
    c_826_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x00z100zzz0zzx1zz10111z00x100x0xzzxzzxzxxzzzzzzxzzxxxxxxxxxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
