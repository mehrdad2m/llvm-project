; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 2
; RUN: llc < %s -mtriple=x86_64-unknown-linux-gnu | FileCheck %s

define half @use_tanf16(half %a) nounwind {
; CHECK-LABEL: use_tanf16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pushq %rax
; CHECK-NEXT:    callq __extendhfsf2@PLT
; CHECK-NEXT:    callq tanf@PLT
; CHECK-NEXT:    callq __truncsfhf2@PLT
; CHECK-NEXT:    popq %rax
; CHECK-NEXT:    retq
  %x = call half @llvm.tan.f16(half %a)
  ret half %x
}

define float @use_tanf32(float %a) nounwind {
; CHECK-LABEL: use_tanf32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    jmp tanf@PLT # TAILCALL
  %x = call float @llvm.tan.f32(float %a)
  ret float %x
}

define double @use_tanf64(double %a) nounwind {
; CHECK-LABEL: use_tanf64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    jmp tan@PLT # TAILCALL
  %x = call double @llvm.tan.f64(double %a)
  ret double %x
}

define x86_fp80 @use_tanf80(x86_fp80 %a) nounwind {
; CHECK-LABEL: use_tanf80:
; CHECK:       # %bb.0:
; CHECK-NEXT:    subq $24, %rsp
; CHECK-NEXT:    fldt 32(%rsp)
; CHECK-NEXT:    fstpt (%rsp)
; CHECK-NEXT:    callq tanl@PLT
; CHECK-NEXT:    addq  $24, %rsp
; CHECK-NEXT:    retq
  %x = call x86_fp80 @llvm.tan.f80(x86_fp80 %a)
  ret x86_fp80 %x
}

define fp128 @use_tanfp128(fp128 %a) nounwind {
; CHECK-LABEL: use_tanfp128:
; CHECK:       # %bb.0:
; CHECK-NEXT:    jmp  tanf128@PLT # TAILCALL
  %x = call fp128 @llvm.tan.f128(fp128 %a)
  ret fp128 %x
}

define ppc_fp128 @use_tanppc_fp128(ppc_fp128 %a) nounwind {
; CHECK-LABEL: use_tanppc_fp128:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pushq %rax
; CHECK-NEXT:    callq tanl@PLT
; CHECK-NEXT:    popq %rax
; CHECK-NEXT:    retq
  %x = call ppc_fp128 @llvm.tan.ppcf128(ppc_fp128 %a)
  ret ppc_fp128 %x
}

declare half @llvm.tan.f16(half)
declare float @llvm.tan.f32(float)
declare double @llvm.tan.f64(double)
declare x86_fp80 @llvm.tan.f80(x86_fp80)
declare fp128 @llvm.tan.f128(fp128)
declare ppc_fp128 @llvm.tan.ppcf128(ppc_fp128)
