class c_210_16;
    integer y_pos = 3;
    integer x_pos = 0;
    rand bit[15:0] l_arb_address_i = 16'h899d; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((l_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_210_16;
    c_210_16 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11xx00001x000xz0z00xxzzzx10x0x01zzxzzzxxzzxzzzzxzxxxxzzxxzxzxxzx";
            obj.set_randstate(randState);
            obj.l_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
