; ModuleID = 'block5.c'
source_filename = "block5.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__block_descriptor = type { i64, i64 }
%struct.__block_literal_generic = type { i8*, i32, i32, i8*, %struct.__block_descriptor* }

@_NSConcreteGlobalBlock = external global i8*
@.str = private unnamed_addr constant [9 x i8] c"v12@?0i8\00", align 1
@__block_descriptor_tmp = internal constant { i64, i64, i8*, i8* } { i64 0, i64 32, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i8* null }, align 8
@__block_literal_global = internal constant { i8**, i32, i32, i8*, %struct.__block_descriptor* } { i8** @_NSConcreteGlobalBlock, i32 1342177280, i32 0, i8* bitcast (void (i8*, i32)* @__main_block_invoke to i8*), %struct.__block_descriptor* bitcast ({ i64, i64, i8*, i8* }* @__block_descriptor_tmp to %struct.__block_descriptor*) }, align 8
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"v8@?0\00", align 1
@__block_descriptor_tmp.3 = internal constant { i64, i64, i8*, i8* } { i64 0, i64 32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* null }, align 8
@__block_literal_global.4 = internal constant { i8**, i32, i32, i8*, %struct.__block_descriptor* } { i8** @_NSConcreteGlobalBlock, i32 1342177280, i32 0, i8* bitcast (void (i8*)* @__main_block_invoke_2 to i8*), %struct.__block_descriptor* bitcast ({ i64, i64, i8*, i8* }* @__block_descriptor_tmp.3 to %struct.__block_descriptor*) }, align 8
@.str.5 = private unnamed_addr constant [8 x i8] c"block51\00", align 1

; Function Attrs: noinline nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca void (i32)*, align 8
  %4 = alloca void (...)*, align 8
  store i32 0, i32* %1, align 4
  store i32 100, i32* %2, align 4
  store void (i32)* bitcast ({ i8**, i32, i32, i8*, %struct.__block_descriptor* }* @__block_literal_global to void (i32)*), void (i32)** %3, align 8
  %5 = load void (i32)*, void (i32)** %3, align 8
  %6 = bitcast void (i32)* %5 to %struct.__block_literal_generic*
  %7 = getelementptr inbounds %struct.__block_literal_generic, %struct.__block_literal_generic* %6, i32 0, i32 3
  %8 = bitcast %struct.__block_literal_generic* %6 to i8*
  %9 = load i32, i32* %2, align 4
  %10 = load i8*, i8** %7, align 8
  %11 = bitcast i8* %10 to void (i8*, i32)*
  call void %11(i8* %8, i32 %9)
  store void (...)* bitcast ({ i8**, i32, i32, i8*, %struct.__block_descriptor* }* @__block_literal_global.4 to void (...)*), void (...)** %4, align 8
  %12 = load void (...)*, void (...)** %4, align 8
  %13 = bitcast void (...)* %12 to %struct.__block_literal_generic*
  %14 = getelementptr inbounds %struct.__block_literal_generic, %struct.__block_literal_generic* %13, i32 0, i32 3
  %15 = bitcast %struct.__block_literal_generic* %13 to i8*
  %16 = load i8*, i8** %14, align 8
  %17 = bitcast i8* %16 to void (i8*, ...)*
  call void (i8*, ...) %17(i8* %15)
  ret i32 0
}

; Function Attrs: noinline nounwind ssp uwtable
define internal void @__main_block_invoke(i8*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>*, align 8
  store i8* %0, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = bitcast i8* %0 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>*
  store i32 %1, i32* %4, align 4
  store <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>* %7, <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>** %5, align 8
  %8 = load i32, i32* %4, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %8)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind ssp uwtable
define internal void @__main_block_invoke_2(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>*, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = bitcast i8* %0 to <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>*
  store <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>* %5, <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>** %3, align 8
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0))
  ret void
}

attributes #0 = { noinline nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !2}
!llvm.ident = !{!3}

!0 = !{i32 6, !"Linker Options", !1}
!1 = !{}
!2 = !{i32 1, !"PIC Level", i32 2}
!3 = !{!"Apple LLVM version 9.0.0 (clang-900.0.39.2)"}
