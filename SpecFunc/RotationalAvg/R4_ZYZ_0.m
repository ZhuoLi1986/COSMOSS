function R3_ZYZ = R4_ZYZ_0(Phi,Psi,Theta)
%R4_ZYZ_0
%    R3_ZYZ = R4_ZYZ_0(PHI,PSI,THETA)

%    This function was generated by the Symbolic Math Toolbox version 5.10.
%    08-Nov-2014 13:20:59

t4 = cos(Psi);
t5 = sin(Phi);
t6 = cos(Phi);
t7 = cos(Theta);
t8 = sin(Psi);
t9 = t5.*t8;
t10 = t4.*t6.*t7;
t2 = t9-t10;
t3 = t2.^2;
t11 = t6.*t8;
t12 = t4.*t5.*t7;
t13 = t11+t12;
t14 = t4.*t5;
t15 = t6.*t7.*t8;
t16 = t14+t15;
t17 = sin(Theta);
t18 = t4.*t6;
t20 = t5.*t7.*t8;
t19 = t18-t20;
t21 = t7.^2;
t22 = t21-1.0;
t23 = t3.*t6.*t17;
t24 = t2.*t6.*t16.*t17;
t25 = t3.*t13;
t26 = t2.*t13.*t16;
t27 = t13.^2;
t28 = t16.^2;
t29 = t6.^2;
t30 = t2.*t4.*t13.*t17;
t31 = t4.*t13.*t16.*t17;
t32 = t4.*t6.*t13.*t22;
t33 = t4.^2;
t34 = t17.^2;
t35 = t3.*t19;
t36 = t3.*t5.*t17;
t37 = t2.*t4.*t17.*t19;
t38 = t2.*t16.*t19;
t39 = t2.*t5.*t16.*t17;
t40 = t2.*t5.*t6.*t22;
t41 = t19.*t27;
t42 = t19.^2;
t43 = t6.*t17.*t27;
t44 = t6.*t13.*t17.*t19;
t45 = t5.*t17.*t27;
t46 = t5.*t13.*t17.*t19;
t47 = t29-1.0;
t48 = t4.*t5.*t13.*t22;
t49 = t4.*t16.*t17.*t19;
t50 = t4.*t6.*t19.*t22;
t51 = t4.*t5.*t19.*t22;
t52 = t3.*t8.*t17;
t53 = t3.*t7;
t54 = t2.*t22.*t33;
t55 = t2.*t4.*t7.*t17;
t56 = t2.*t8.*t16.*t17;
t57 = t2.*t7.*t16;
t58 = t2.*t6.*t8.*t22;
t59 = t2.*t5.*t8.*t22;
t60 = t8.*t17.*t27;
t61 = t7.*t27;
t62 = t4.*t8.*t13.*t22;
t63 = t8.*t13.*t17.*t19;
t64 = t7.*t13.*t19;
t65 = t33-1.0;
t66 = t6.*t7.*t13.*t17;
t67 = t5.*t7.*t13.*t17;
t68 = t7.*t8.*t13.*t17;
t69 = Theta.*2.0;
t70 = sin(t69);
t71 = t16.*t22.*t33;
t72 = t4.*t8.*t19.*t22;
t73 = t8.^2;
t74 = t73-1.0;
t75 = t6.*t17.*t33.*t34;
t76 = t4.*t6.*t7.*t22;
t77 = t5.*t17.*t33.*t34;
t78 = Psi.*2.0;
t79 = sin(t78);
t80 = t4.*t5.*t7.*t22;
t138 = Psi.*(1.0./2.0);
t81 = cos(t138);
t82 = t13.*t28;
t83 = t6.*t17.*t28;
t84 = t19.*t28;
t85 = t8.*t17.*t28;
t86 = t6.*t8.*t16.*t22;
t87 = t5.*t17.*t28;
t88 = t5.*t8.*t16.*t22;
t89 = t5.*t6.*t16.*t22;
t90 = t13.*t42;
t91 = t6.*t17.*t42;
t92 = t5.*t17.*t42;
t93 = t8.*t17.*t42;
t94 = t13.*t22.*t65;
t95 = t5.*t6.*t8.*t17.*t34;
t96 = t5.^2;
t97 = t4.*t7.*t16.*t17;
t98 = t7.*t28;
t99 = t7.*t42;
t100 = t19.*t22.*t65;
t101 = t7.*t8.*t17.*t19;
t102 = t6.*t7.*t17.*t19;
t103 = t5.*t7.*t17.*t19;
t104 = t4.*t7.*t8.*t22;
t105 = t6.*t17.*t34.*t73;
t106 = t5.*t17.*t34.*t73;
t107 = t7.*t22.*t79.*(1.0./2.0);
t108 = t34-1.0;
t109 = t2.*t22.*t29;
t110 = t16.*t22.*t29;
t111 = t8.*t17.*t29.*t34;
t112 = Phi.*2.0;
t113 = sin(t112);
t114 = t96-1.0;
t115 = t4.*t6.*t7.*t21;
t137 = t5.*t8.*t21;
t116 = t115-t137;
t144 = t4.*t5.*t21;
t145 = t6.*t7.*t8.*t21;
t117 = -t144-t145;
t131 = Phi.*(1.0./2.0);
t118 = sin(t131);
t119 = t8.*t17.*t34.*t113.*(1.0./2.0);
t120 = t6.*t17.*t34.*t96;
t121 = t13.*t22.*t47;
t122 = t19.*t22.*t47;
t123 = t8.*t17.*t34.*t96;
t124 = t6.*t8.*t21;
t125 = t4.*t5.*t7.*t21;
t126 = t124+t125;
t127 = t4.*t6.*t21;
t146 = t5.*t7.*t8.*t21;
t128 = t127-t146;
t129 = t6.*t13.*t70.*(1.0./2.0);
t130 = t6.*t19.*t70.*(1.0./2.0);
t132 = t118.^2;
t133 = t132.*2.0;
t134 = t133-1.0;
t135 = t17.*t108.*t134;
t136 = t2.*t4.*t70.*(1.0./2.0);
t139 = t81.^2;
t140 = t139.*2.0;
t141 = t140-1.0;
t142 = t17.*t108.*t141;
t143 = t4.*t16.*t70.*(1.0./2.0);
R3_ZYZ = reshape([-t2.*t3,t25,-t3.*t4.*t17,t25,-t2.*t27,t30,-t3.*t4.*t17,t30,t54,-t3.*t16,t35,t52,t26,-t2.*t13.*t19,-t2.*t8.*t13.*t17,-t2.*t4.*t16.*t17,t37,-t2.*t4.*t8.*t22,t23,t36,t53,-t2.*t6.*t13.*t17,-t2.*t5.*t13.*t17,-t2.*t7.*t13,-t2.*t4.*t6.*t22,-t2.*t4.*t5.*t22,t136,-t3.*t16,t26,-t2.*t4.*t16.*t17,t35,-t2.*t13.*t19,t37,t52,-t2.*t8.*t13.*t17,-t2.*t4.*t8.*t22,-t2.*t28,t38,t56,t38,-t2.*t42,-t2.*t8.*t17.*t19,t56,-t2.*t8.*t17.*t19,-t2.*t22.*t65,t24,t39,t57,-t2.*t6.*t17.*t19,-t2.*t5.*t17.*t19,-t2.*t7.*t19,t58,t59,-t2.*t7.*t8.*t17,t23,-t2.*t6.*t13.*t17,-t2.*t4.*t6.*t22,t36,-t2.*t5.*t13.*t17,-t2.*t4.*t5.*t22,t53,-t2.*t7.*t13,t136,t24,-t2.*t6.*t17.*t19,t58,t39,-t2.*t5.*t17.*t19,t59,t57,-t2.*t7.*t19,-t2.*t7.*t8.*t17,t109,t40,t2.*t6.*t70.*(-1.0./2.0),t40,-t2.*t22.*t47,-t2.*t5.*t7.*t17,t2.*t6.*t70.*(-1.0./2.0),-t2.*t5.*t7.*t17,t116,t25,-t2.*t27,t30,-t2.*t27,t13.*t27,-t4.*t17.*t27,t30,-t4.*t17.*t27,-t13.*t22.*t33,t26,-t2.*t13.*t19,-t2.*t8.*t13.*t17,-t16.*t27,t41,t60,t31,-t4.*t13.*t17.*t19,t62,-t2.*t6.*t13.*t17,-t2.*t5.*t13.*t17,-t2.*t7.*t13,t43,t45,t61,t32,t48,t4.*t13.*t70.*(-1.0./2.0),t26,-t16.*t27,t31,-t2.*t13.*t19,t41,-t4.*t13.*t17.*t19,-t2.*t8.*t13.*t17,t60,t62,t82,-t13.*t16.*t19,-t8.*t13.*t16.*t17,-t13.*t16.*t19,t90,t63,-t8.*t13.*t16.*t17,t63,t94,-t6.*t13.*t16.*t17,-t5.*t13.*t16.*t17,-t7.*t13.*t16,t44,t46,t64,-t6.*t8.*t13.*t22,-t5.*t8.*t13.*t22,t68,-t2.*t6.*t13.*t17,t43,t32,-t2.*t5.*t13.*t17,t45,t48,-t2.*t7.*t13,t61,t4.*t13.*t70.*(-1.0./2.0),-t6.*t13.*t16.*t17,t44,-t6.*t8.*t13.*t22,-t5.*t13.*t16.*t17,t46,-t5.*t8.*t13.*t22,-t7.*t13.*t16,t64,t68,-t13.*t22.*t29,-t5.*t6.*t13.*t22,t129,-t5.*t6.*t13.*t22,t121,t67,t129,t67,t126,-t3.*t4.*t17,t30,t54,t30,-t4.*t17.*t27,-t13.*t22.*t33,t54,-t13.*t22.*t33,-t4.*t17.*t33.*t34,-t2.*t4.*t16.*t17,t37,-t2.*t4.*t8.*t22,t31,-t4.*t13.*t17.*t19,t62,t71,-t19.*t22.*t33,-t8.*t17.*t34.*t74,-t2.*t4.*t6.*t22,-t2.*t4.*t5.*t22,t55,t32,t48,-t4.*t7.*t13.*t17,t75,t77,-t7.*t22.*t33,-t2.*t4.*t16.*t17,t31,t71,t37,-t4.*t13.*t17.*t19,-t19.*t22.*t33,-t2.*t4.*t8.*t22,t62,-t8.*t17.*t34.*t74,-t4.*t17.*t28,t49,-t4.*t8.*t16.*t22,t49,-t4.*t17.*t42,t72,-t4.*t8.*t16.*t22,t72,-t4.*t17.*t34.*t73,-t4.*t6.*t16.*t22,-t4.*t5.*t16.*t22,t97,t50,t51,-t4.*t7.*t17.*t19,-t4.*t6.*t8.*t17.*t34,-t4.*t5.*t8.*t17.*t34,t104,-t2.*t4.*t6.*t22,t32,t75,-t2.*t4.*t5.*t22,t48,t77,t55,-t4.*t7.*t13.*t17,-t7.*t22.*t33,-t4.*t6.*t16.*t22,t50,-t4.*t6.*t8.*t17.*t34,-t4.*t5.*t16.*t22,t51,-t4.*t5.*t8.*t17.*t34,t97,-t4.*t7.*t17.*t19,t104,-t4.*t17.*t29.*t34,t4.*t17.*t34.*t113.*(-1.0./2.0),t76,t4.*t17.*t34.*t113.*(-1.0./2.0),-t4.*t17.*t34.*t96,t80,t76,t80,t142,-t3.*t16,t26,-t2.*t4.*t16.*t17,t26,-t16.*t27,t31,-t2.*t4.*t16.*t17,t31,t71,-t2.*t28,t38,t56,t82,-t13.*t16.*t19,-t8.*t13.*t16.*t17,-t4.*t17.*t28,t49,-t4.*t8.*t16.*t22,t24,t39,t57,-t6.*t13.*t16.*t17,-t5.*t13.*t16.*t17,-t7.*t13.*t16,-t4.*t6.*t16.*t22,-t4.*t5.*t16.*t22,t143,-t2.*t28,t82,-t4.*t17.*t28,t38,-t13.*t16.*t19,t49,t56,-t8.*t13.*t16.*t17,-t4.*t8.*t16.*t22,-t16.*t28,t84,t85,t84,-t16.*t42,-t8.*t16.*t17.*t19,t85,-t8.*t16.*t17.*t19,-t16.*t22.*t65,t83,t87,t98,-t6.*t16.*t17.*t19,-t5.*t16.*t17.*t19,-t7.*t16.*t19,t86,t88,-t7.*t8.*t16.*t17,t24,-t6.*t13.*t16.*t17,-t4.*t6.*t16.*t22,t39,-t5.*t13.*t16.*t17,-t4.*t5.*t16.*t22,t57,-t7.*t13.*t16,t143,t83,-t6.*t16.*t17.*t19,t86,t87,-t5.*t16.*t17.*t19,t88,t98,-t7.*t16.*t19,-t7.*t8.*t16.*t17,t110,t89,t6.*t16.*t70.*(-1.0./2.0),t89,-t16.*t22.*t47,-t5.*t7.*t16.*t17,t6.*t16.*t70.*(-1.0./2.0),-t5.*t7.*t16.*t17,t117,t35,-t2.*t13.*t19,t37,-t2.*t13.*t19,t41,-t4.*t13.*t17.*t19,t37,-t4.*t13.*t17.*t19,-t19.*t22.*t33,t38,-t2.*t42,-t2.*t8.*t17.*t19,-t13.*t16.*t19,t90,t63,t49,-t4.*t17.*t42,t72,-t2.*t6.*t17.*t19,-t2.*t5.*t17.*t19,-t2.*t7.*t19,t44,t46,t64,t50,t51,t4.*t19.*t70.*(-1.0./2.0),t38,-t13.*t16.*t19,t49,-t2.*t42,t90,-t4.*t17.*t42,-t2.*t8.*t17.*t19,t63,t72,t84,-t16.*t42,-t8.*t16.*t17.*t19,-t16.*t42,t19.*t42,t93,-t8.*t16.*t17.*t19,t93,t100,-t6.*t16.*t17.*t19,-t5.*t16.*t17.*t19,-t7.*t16.*t19,t91,t92,t99,-t6.*t8.*t19.*t22,-t5.*t8.*t19.*t22,t101,-t2.*t6.*t17.*t19,t44,t50,-t2.*t5.*t17.*t19,t46,t51,-t2.*t7.*t19,t64,t4.*t19.*t70.*(-1.0./2.0),-t6.*t16.*t17.*t19,t91,-t6.*t8.*t19.*t22,-t5.*t16.*t17.*t19,t92,-t5.*t8.*t19.*t22,-t7.*t16.*t19,t99,t101,-t19.*t22.*t29,-t5.*t6.*t19.*t22,t130,-t5.*t6.*t19.*t22,t122,t103,t130,t103,t128,t52,-t2.*t8.*t13.*t17,-t2.*t4.*t8.*t22,-t2.*t8.*t13.*t17,t60,t62,-t2.*t4.*t8.*t22,t62,-t8.*t17.*t34.*t74,t56,-t2.*t8.*t17.*t19,-t2.*t22.*t65,-t8.*t13.*t16.*t17,t63,t94,-t4.*t8.*t16.*t22,t72,-t4.*t17.*t34.*t73,t58,t59,-t2.*t7.*t8.*t17,-t6.*t8.*t13.*t22,-t5.*t8.*t13.*t22,t68,-t4.*t6.*t8.*t17.*t34,-t4.*t5.*t8.*t17.*t34,t104,t56,-t8.*t13.*t16.*t17,-t4.*t8.*t16.*t22,-t2.*t8.*t17.*t19,t63,t72,-t2.*t22.*t65,t94,-t4.*t17.*t34.*t73,t85,-t8.*t16.*t17.*t19,-t16.*t22.*t65,-t8.*t16.*t17.*t19,t93,t100,-t16.*t22.*t65,t100,t8.*t17.*t34.*t73,t86,t88,-t7.*t8.*t16.*t17,-t6.*t8.*t19.*t22,-t5.*t8.*t19.*t22,t101,t105,t106,-t7.*t22.*t73,t58,-t6.*t8.*t13.*t22,-t4.*t6.*t8.*t17.*t34,t59,-t5.*t8.*t13.*t22,-t4.*t5.*t8.*t17.*t34,-t2.*t7.*t8.*t17,t68,t104,t86,-t6.*t8.*t19.*t22,t105,t88,-t5.*t8.*t19.*t22,t106,-t7.*t8.*t16.*t17,t101,-t7.*t22.*t73,t111,t119,-t6.*t7.*t8.*t22,t119,t123,-t5.*t7.*t8.*t22,-t6.*t7.*t8.*t22,-t5.*t7.*t8.*t22,-t8.*t17.*t108,t23,-t2.*t6.*t13.*t17,-t2.*t4.*t6.*t22,-t2.*t6.*t13.*t17,t43,t32,-t2.*t4.*t6.*t22,t32,t75,t24,-t2.*t6.*t17.*t19,t58,-t6.*t13.*t16.*t17,t44,-t6.*t8.*t13.*t22,-t4.*t6.*t16.*t22,t50,t6.*t17.*t34.*t79.*(-1.0./2.0),t109,t40,-t2.*t6.*t7.*t17,-t13.*t22.*t29,-t5.*t6.*t13.*t22,t66,-t4.*t17.*t29.*t34,-t4.*t5.*t6.*t17.*t34,t76,t24,-t6.*t13.*t16.*t17,-t4.*t6.*t16.*t22,-t2.*t6.*t17.*t19,t44,t50,t58,-t6.*t8.*t13.*t22,t6.*t17.*t34.*t79.*(-1.0./2.0),t83,-t6.*t16.*t17.*t19,t86,-t6.*t16.*t17.*t19,t91,-t6.*t8.*t19.*t22,t86,-t6.*t8.*t19.*t22,t105,t110,t89,-t6.*t7.*t16.*t17,-t19.*t22.*t29,-t5.*t6.*t19.*t22,t102,t111,t95,-t6.*t7.*t8.*t22,t109,-t13.*t22.*t29,-t4.*t17.*t29.*t34,t40,-t5.*t6.*t13.*t22,-t4.*t5.*t6.*t17.*t34,-t2.*t6.*t7.*t17,t66,t76,t110,-t19.*t22.*t29,t111,t89,-t5.*t6.*t19.*t22,t95,-t6.*t7.*t16.*t17,t102,-t6.*t7.*t8.*t22,t6.*t17.*t29.*t34,-t5.*t17.*t34.*t114,-t7.*t22.*t29,-t5.*t17.*t34.*t114,t120,-t5.*t6.*t7.*t22,-t7.*t22.*t29,-t5.*t6.*t7.*t22,t135,t36,-t2.*t5.*t13.*t17,-t2.*t4.*t5.*t22,-t2.*t5.*t13.*t17,t45,t48,-t2.*t4.*t5.*t22,t48,t77,t39,-t2.*t5.*t17.*t19,t59,-t5.*t13.*t16.*t17,t46,-t5.*t8.*t13.*t22,-t4.*t5.*t16.*t22,t51,t5.*t17.*t34.*t79.*(-1.0./2.0),t40,-t2.*t22.*t47,-t2.*t5.*t7.*t17,-t5.*t6.*t13.*t22,t121,t67,-t4.*t5.*t6.*t17.*t34,-t4.*t17.*t34.*t96,t80,t39,-t5.*t13.*t16.*t17,-t4.*t5.*t16.*t22,-t2.*t5.*t17.*t19,t46,t51,t59,-t5.*t8.*t13.*t22,t5.*t17.*t34.*t79.*(-1.0./2.0),t87,-t5.*t16.*t17.*t19,t88,-t5.*t16.*t17.*t19,t92,-t5.*t8.*t19.*t22,t88,-t5.*t8.*t19.*t22,t106,t89,-t16.*t22.*t47,-t5.*t7.*t16.*t17,-t5.*t6.*t19.*t22,t122,t103,t95,t123,-t5.*t7.*t8.*t22,t40,-t5.*t6.*t13.*t22,-t4.*t5.*t6.*t17.*t34,-t2.*t22.*t47,t121,-t4.*t17.*t34.*t96,-t2.*t5.*t7.*t17,t67,t80,t89,-t5.*t6.*t19.*t22,t95,-t16.*t22.*t47,t122,t123,-t5.*t7.*t16.*t17,t103,-t5.*t7.*t8.*t22,-t5.*t17.*t34.*t114,t120,-t5.*t6.*t7.*t22,t120,t5.*t17.*t34.*t96,-t7.*t22.*t96,-t5.*t6.*t7.*t22,-t7.*t22.*t96,-t5.*t17.*t108,t53,-t2.*t7.*t13,t55,-t2.*t7.*t13,t61,-t4.*t7.*t13.*t17,t55,-t4.*t7.*t13.*t17,-t7.*t22.*t33,t57,-t2.*t7.*t19,-t2.*t7.*t8.*t17,-t7.*t13.*t16,t64,t68,t97,-t4.*t7.*t17.*t19,t107,-t2.*t6.*t7.*t17,-t2.*t5.*t7.*t17,t116,t66,t67,t126,t76,t80,t142,t57,-t7.*t13.*t16,t97,-t2.*t7.*t19,t64,-t4.*t7.*t17.*t19,-t2.*t7.*t8.*t17,t68,t107,t98,-t7.*t16.*t19,-t7.*t8.*t16.*t17,-t7.*t16.*t19,t99,t101,-t7.*t8.*t16.*t17,t101,-t7.*t22.*t73,-t6.*t7.*t16.*t17,-t5.*t7.*t16.*t17,t117,t102,t103,t128,-t6.*t7.*t8.*t22,-t5.*t7.*t8.*t22,-t8.*t17.*t108,-t2.*t6.*t7.*t17,t66,t76,-t2.*t5.*t7.*t17,t67,t80,t116,t126,t142,-t6.*t7.*t16.*t17,t102,-t6.*t7.*t8.*t22,-t5.*t7.*t16.*t17,t103,-t5.*t7.*t8.*t22,t117,t128,-t8.*t17.*t108,-t7.*t22.*t29,t7.*t22.*t113.*(-1.0./2.0),t135,t7.*t22.*t113.*(-1.0./2.0),-t7.*t22.*t96,-t5.*t17.*t108,t135,-t5.*t17.*t108,t7.*t21],[27, 27]);
