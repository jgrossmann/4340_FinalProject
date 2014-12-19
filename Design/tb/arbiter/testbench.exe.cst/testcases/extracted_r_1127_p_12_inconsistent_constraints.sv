class c_1127_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_1127_12;
    c_1127_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzx11xz0zzx11010xzzxz11001xz01xxzxzxzzxxxzxzxxzxzzzxxxzxzzzzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
