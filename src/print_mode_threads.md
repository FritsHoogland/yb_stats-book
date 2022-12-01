# print-threads
Print current threads from a snapshot.

- `--print-threads <snapshot number>`: print current threads from a snapshot.

Additional switches:
- `--hostname-match`: filter by hostname or port regular expression.

Example:
```
% yb_stats --print-threads 27 --hostname-match 80:9000
--------------------------------------------------------------------------------------------------------------------------------------
Host: 192.168.66.80:9000, Snapshot number: 27, Snapshot time: 2022-12-01 11:24:08.436165 +01:00
--------------------------------------------------------------------------------------------------------------------------------------
hostname_port        thread_name                          cum_user_cpu_s     cum_kernel_cpu_s     cum_iowait_cpu_s stack
--------------------------------------------------------------------------------------------------------------------------------------
192.168.66.80:9000   pg_supervisorxx-7789                         0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::pgwrapper::PgSupervisor::RunThread();yb::Subprocess::DoWait();__GI___waitpid
192.168.66.80:9000   CQLServer_reactor-7801                       0.070s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::Reactor::RunThread();ev_run;epoll_poll;__GI_epoll_wait
192.168.66.80:9000   RedisServer_reactor-7794                     0.280s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::Reactor::RunThread();ev_run;epoll_poll;__GI_epoll_wait
192.168.66.80:9000   TabletServer_reactor-7732                    0.070s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::Reactor::RunThread();ev_run;epoll_poll;__GI_epoll_wait
192.168.66.80:9000   acceptorxxxxxxx-7803                         0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::Acceptor::RunThread();ev_run;epoll_poll;__GI_epoll_wait
192.168.66.80:9000   acceptorxxxxxxx-7796                         0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::Acceptor::RunThread();ev_run;epoll_poll;__GI_epoll_wait
192.168.66.80:9000   acceptorxxxxxxx-7739                         0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::Acceptor::RunThread();ev_run;epoll_poll;__GI_epoll_wait
192.168.66.80:9000   heartbeatxxxxxx-7743                         0.190s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::tserver::Heartbeater::Thread::RunThread();__pthread_cond_timedwait
192.168.66.80:9000   iotp_CQLServer_3-7800                        0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::IoThreadPool::Impl::Execute();boost::asio::detail::scheduler::run();__pthread_cond_wait
192.168.66.80:9000   iotp_CQLServer_2-7799                        0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::IoThreadPool::Impl::Execute();boost::asio::detail::scheduler::run();__pthread_cond_wait
192.168.66.80:9000   iotp_CQLServer_1-7798                        0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::IoThreadPool::Impl::Execute();boost::asio::detail::scheduler::run();__pthread_cond_wait
192.168.66.80:9000   iotp_CQLServer_0-7797                        0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::IoThreadPool::Impl::Execute();boost::asio::detail::scheduler::run();boost::asio::detail::epoll_reactor::run();__GI_epoll_wait
192.168.66.80:9000   iotp_RedisServer_1-7791                      0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::IoThreadPool::Impl::Execute();boost::asio::detail::scheduler::run();__pthread_cond_wait
192.168.66.80:9000   iotp_RedisServer_2-7792                      0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::IoThreadPool::Impl::Execute();boost::asio::detail::scheduler::run();__pthread_cond_wait
192.168.66.80:9000   iotp_RedisServer_3-7793                      0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::IoThreadPool::Impl::Execute();boost::asio::detail::scheduler::run();__pthread_cond_wait
192.168.66.80:9000   iotp_RedisServer_0-7790                      0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::IoThreadPool::Impl::Execute();boost::asio::detail::scheduler::run();boost::asio::detail::epoll_reactor::run();__GI_epoll_wait
192.168.66.80:9000   iotp_TabletServer_0-7728                     0.150s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::IoThreadPool::Impl::Execute();boost::asio::detail::scheduler::run();__pthread_cond_wait
192.168.66.80:9000   iotp_TabletServer_2-7730                     0.320s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::IoThreadPool::Impl::Execute();boost::asio::detail::scheduler::run();__pthread_cond_wait
192.168.66.80:9000   iotp_TabletServer_3-7731                     0.310s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::IoThreadPool::Impl::Execute();boost::asio::detail::scheduler::run();__pthread_cond_wait
192.168.66.80:9000   iotp_TabletServer_1-7729                     0.210s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::IoThreadPool::Impl::Execute();boost::asio::detail::scheduler::run();boost::asio::detail::epoll_reactor::run();__GI_epoll_wait
192.168.66.80:9000   iotp_call_home_0-7748                        0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::rpc::IoThreadPool::Impl::Execute();boost::asio::detail::scheduler::run();boost::asio::detail::epoll_reactor::run();__GI_epoll_wait
192.168.66.80:9000   maintenance_scheduler-7745                   0.330s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::MaintenanceManager::RunSchedulerThread();__pthread_cond_timedwait
192.168.66.80:9000   rb-session-expx-7736                         0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::tserver::RemoteBootstrapServiceImpl::EndExpiredSessions();yb::CountDownLatch::WaitFor();yb::ConditionVariable::WaitUntil();__pthread_cond_timedwait
192.168.66.80:9000   rpc_tp_TabletServer-high-pri_4-7782               0.230s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer-high-pri_3-7774               0.170s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer-high-pri_2-7773               0.250s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer-high-pri_1-7768               0.210s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer-high-pri_0-7767               0.170s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer_11-7761                  0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer_10-7760                  0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer_9-7759                   0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer_8-7758                   0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer_7-7757                   0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer_6-7756                   0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer_5-7755                   0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer_4-7754                   0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer_3-7753                   0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer_2-7747                   0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer_1-7746                   0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   rpc_tp_TabletServer_0-7741                   0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();__pthread_cond_wait
192.168.66.80:9000   flush scheduler bgtask-7733                  0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::BackgroundTask::Run();__pthread_cond_wait
192.168.66.80:9000   server_clientcb [worker]-7744                0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::ThreadPool::DispatchThread();__pthread_cond_wait
192.168.66.80:9000   cdc_clientcb [worker]-7737                   0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::ThreadPool::DispatchThread();__pthread_cond_wait
192.168.66.80:9000   MaintenanceMgr [worker]-7129                 0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::ThreadPool::DispatchThread();__pthread_cond_wait
192.168.66.80:9000   log-alloc [worker]-7128                      0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::ThreadPool::DispatchThread();__pthread_cond_wait
192.168.66.80:9000   append [worker]-7127                         0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::ThreadPool::DispatchThread();__pthread_cond_wait
192.168.66.80:9000   prepare [worker]-7126                        0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::ThreadPool::DispatchThread();__pthread_cond_wait
192.168.66.80:9000   log-sync [worker]-7125                       0.000s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::ThreadPool::DispatchThread();__pthread_cond_wait
192.168.66.80:9000   consensus [worker]-7124                      0.830s               0.000s               0.000s __clone;start_thread;yb::Thread::SuperviseThread();yb::ThreadPool::DispatchThread();__pthread_cond_wait
```