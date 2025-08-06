import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services_application/data/repositories/job_repository.dart';
import 'package:services_application/presentation/bloc/job/job_event.dart';
import 'package:services_application/presentation/bloc/job/job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final JobRepository repository;

  JobBloc(this.repository) : super(JobInitial()) {
  
    on<LoadJobs>((event, emit) async {
      emit(JobLoading());
      try {
        final jobs = await repository.getJobsByUserType(event.userType);
        emit(JobLoaded(jobs));
      } catch (e) {
        emit(JobError('Failed uploading'));
      }
    });

 
    on<ApplyToJobPressed>(_onApplyToJob);

 
    on<PostJobPressed>((event, emit) async {
      emit(JobLoading());
      try {
        await repository.postJob(event.jobData);
        emit(JobPostedSuccessfully());
      } catch (e) {
        emit(JobError("Fail posting a job"));
      }
    });
  on<SaveJobDraft>((event, emit) {
  emit(JobDraftSaved(event.jobData));
});
on<LoadMyJobs>((event, emit) async {
  emit(MyJobsLoading());
  try {
    final allJobs = await repository.getMyJobs(event.userId, event.userType);

    final inProgress = allJobs.where((job) => job.status == 'in_progress').toList();
    final done = allJobs.where((job) => job.status == 'done').toList();

    emit(MyJobsLoaded(inProgress:inProgress, done:done));
  } catch (e) {
    emit(JobError("Failing uploading jobs"));
  }
});


  }

  Future<void> _onApplyToJob(ApplyToJobPressed event, Emitter<JobState> emit) async {
    emit(JobLoading());
    try {
      await repository.applyToJob(event.application);
      emit(JobApplySuccess());
    } catch (e) {
      emit(JobError(e.toString()));
    }
  }


}
