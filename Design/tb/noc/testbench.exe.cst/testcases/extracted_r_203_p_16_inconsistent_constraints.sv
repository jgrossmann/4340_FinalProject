class c_203_16;
    integer y_pos = 1;
    integer x_pos = 3;
    rand bit[15:0] l_arb_address_i = 16'hd6a8; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_203_16;
    c_203_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1xzz0zxx110z0xzx0x110z1x1z00x10xzxxzxxzxxzxzzzxzxxxzzxxzxxzzzxz";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
