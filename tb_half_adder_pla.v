module tb_half_adder_pla;

    reg A, B;
    wire Sum, Carry;

    half_adder_pla uut (
        .A(A),
        .B(B),
        .Sum(Sum),
        .Carry(Carry)
    );

    task check_result;
        input a, b, exp_Sum, exp_Carry;
        begin
            A = a;
            B = b;
            #10;

            if (Sum !== exp_Sum || Carry !== exp_Carry)
                $fatal(1, "FAIL: A=%b B=%b Sum=%b Carry=%b",
                       A, B, Sum, Carry);
            else
                $display("PASS: A=%b B=%b Sum=%b Carry=%b",
                         A, B, Sum, Carry);
        end
    endtask

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_half_adder_pla);

        $display("1-Bit PLA Adder Verification");

        check_result(0, 0, 0, 0);
        check_result(0, 1, 1, 0);
        check_result(1, 0, 1, 0);
        check_result(1, 1, 0, 1);

        $display("ALL TESTS PASSED");

        $finish;
    end

endmodule
