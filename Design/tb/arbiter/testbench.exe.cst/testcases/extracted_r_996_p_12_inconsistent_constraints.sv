class c_996_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_996_12;
    c_996_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z011xx0010zx1zz1z1zxxzzx10x00x1xxxxzxxxxzxzzxzzzzzxzxxxzzzzzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
