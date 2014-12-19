class c_324_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_324_12;
    c_324_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "110001zx0x1x0xxxz0z1zz11101x1z1xxzxzzzxxxzxxxzxzzxzzxzxzxzzzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
