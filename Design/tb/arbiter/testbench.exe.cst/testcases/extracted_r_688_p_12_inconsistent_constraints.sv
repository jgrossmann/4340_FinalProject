class c_688_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_688_12;
    c_688_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0100x01x0x0xzzx00zz1zzx11100x1zxxzzzzxzxzxzxzxxxxxxxxxzzzzxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
