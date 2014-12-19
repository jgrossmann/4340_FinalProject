class c_752_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_752_12;
    c_752_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxz1z0001z10x111z100xz0x1100zx01zzzxxzzzzzzxxxzxxxxzzxxzxzxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
