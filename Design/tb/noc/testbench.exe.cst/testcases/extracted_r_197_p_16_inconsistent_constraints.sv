class c_197_16;
    integer y_pos = 3;
    integer x_pos = 1;
    rand bit[15:0] l_arb_address_i = 16'hf6f; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_197_16;
    c_197_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z11z1x1x0z1z0zx001xxzz10111z101xzzxzxzzxxxzzzzxxzzzzxxxxxxxxzxx";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
