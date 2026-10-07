; ModuleID = 'start.c'
source_filename = "start.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.array = type { ptr, i64 }

; Function Attrs: nounwind uwtable
define dso_local void @start(ptr readonly captures(none) %0, i64 %1) local_unnamed_addr #0 {
  %3 = icmp sgt i64 %1, 0
  br i1 %3, label %4, label %12

4:                                                ; preds = %2, %4
  %5 = phi i64 [ %10, %4 ], [ 0, %2 ]
  %6 = getelementptr inbounds nuw %struct.array, ptr %0, i64 %5
  %7 = load ptr, ptr %6, align 8, !tbaa !5
  %8 = getelementptr inbounds nuw i8, ptr %6, i64 8
  %9 = load i64, ptr %8, align 8, !tbaa !12
  tail call void @write_syscall(i32 noundef 1, ptr noundef %7, i64 noundef %9) #2
  %10 = add nuw nsw i64 %5, 1
  %11 = icmp eq i64 %10, %1
  br i1 %11, label %12, label %4, !llvm.loop !13

12:                                               ; preds = %4, %2
  tail call void @exit_syscall(i8 noundef signext 0) #2
  ret void
}

declare void @write_syscall(i32 noundef, ptr noundef, i64 noundef) local_unnamed_addr #1

declare void @exit_syscall(i8 noundef signext) local_unnamed_addr #1

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 21.1.8"}
!5 = !{!6, !7, i64 0}
!6 = !{!"array", !7, i64 0, !11, i64 8}
!7 = !{!"p1 omnipotent char", !8, i64 0}
!8 = !{!"any pointer", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"long", !9, i64 0}
!12 = !{!6, !11, i64 8}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
