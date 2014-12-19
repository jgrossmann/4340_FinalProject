class c_23_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_23_12;
    c_23_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1x00z0x01zxz100z101z01xxx0z111xxxzzzxxzzxzxxxzzxxzxzxxxxxzzxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
