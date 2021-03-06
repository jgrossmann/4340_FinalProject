class c_213_12;
    integer y_pos = 2;
    rand bit[15:0] n_arb_address_i = 16'ha1dd; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((n_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_213_12;
    c_213_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz1111000xzz0z00z1xxzzx0001z01x1zxxzxzzzzxzzzzzzxzzxzzzxzxxzzzzz";
            obj.set_randstate(randState);
            obj.n_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
