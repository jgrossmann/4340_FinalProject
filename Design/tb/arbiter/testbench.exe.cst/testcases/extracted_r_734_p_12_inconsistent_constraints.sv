class c_734_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_734_12;
    c_734_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10x0101110z0101z0z01xxzx0zzx1z01xxxzzxxzxzxxxxzxzzxxxxzzzzxzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
