class c_49_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_49_12;
    c_49_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0100xzzx0z0z000z0xx11100x0x10010xxxxxxxxxzzxzxxxzzzzxxxxzxzxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
