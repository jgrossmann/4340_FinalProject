class c_1147_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_1147_12;
    c_1147_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxx11zx0zx1zxxxzxx1xxz1x1xz00xx1xxzxzzzxzzzxzxzzzxzxxzxxzxxxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
