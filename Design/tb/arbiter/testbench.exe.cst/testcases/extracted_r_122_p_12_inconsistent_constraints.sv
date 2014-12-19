class c_122_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_122_12;
    c_122_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzx11x0zzzxzz1x0x000000z1xx11xz0zzzxxzxzzzzzzxxxzxzzxzzxxzxxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
