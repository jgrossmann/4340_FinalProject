class c_219_12;
    integer y_pos = 0;
    rand bit[15:0] n_arb_address_i = 16'h5f7d; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((n_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_219_12;
    c_219_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11z1x0000x11zzxx1xz1x1xxxz0zxxz0xxxxxxzxxxxxzxxzzxzzxzzzxzxzzxzx";
            obj.set_randstate(randState);
            obj.n_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
