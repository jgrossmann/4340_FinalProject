class c_44_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_44_12;
    c_44_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1z1x1110z0z11x00z1xxx1z0z110z11xxxzxxxzzzzxzxxxzzzxzzxzxzzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
