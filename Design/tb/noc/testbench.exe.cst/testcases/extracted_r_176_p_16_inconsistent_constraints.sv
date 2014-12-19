class c_176_16;
    integer y_pos = 0;
    integer x_pos = 2;
    rand bit[15:0] l_arb_address_i = 16'h5f7d; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_176_16;
    c_176_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xz111x0x11xx1xz0xzx0xz110zx0xx1xzzzzzzxxzzxxxzzxzxxzzxzzxxxxzzz";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
