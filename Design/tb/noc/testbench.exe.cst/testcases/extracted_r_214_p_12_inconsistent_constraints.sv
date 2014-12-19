class c_214_12;
    integer y_pos = 3;
    rand bit[15:0] n_arb_address_i = 16'h899d; // rand_mode = OFF 

    constraint c_this    // (constraint_mode = ON) (../arbiter/arbiter_transaction.sv:51)
    {
       ((n_arb_address_i[3:0]) <= 4'h3);
    }
endclass

program p_214_12;
    c_214_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zz0z0zxxzzzx0z010zx0110011011zxxzxxzxxzxzzzzzxzxzzzzxzxxxxxxxxx";
            obj.set_randstate(randState);
            obj.n_arb_address_i.rand_mode(0);
            obj.randomize();
        end
endprogram
