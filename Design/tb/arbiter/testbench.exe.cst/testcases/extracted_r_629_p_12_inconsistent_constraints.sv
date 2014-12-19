class c_629_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_629_12;
    c_629_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1011110zx010x1x10x1011xx00111100xzzzzxzzzxxxzzzxzzzzxxzxzxxzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
