# Overview:

In operating systems, a round robin arbiter is a scheduling algorithm used to manage resource allocation, particularly CPU time among multiple processes.

It is one of the simplest and most widely used CPU scheduling algorithms, particularly in time-sharing systems.

# Key Features

Time Slicing:

Each process is assigned a fixed time slice or quantum. After this time has elapsed, the CPU is allocated to the next process in the queue.

Fairness: 

Every process gets an equal opportunity to execute, preventing any single process from monopolizing the CPU. This makes it well-suited for multi-user systems.

Preemptive: 

The round robin arbiter can preempt a running process when its time slice expires, allowing for responsive multitasking.

Simplicity: 

The algorithm is straightforward to implement, with a clear structure that is easy to understand and manage.

Starvation-Free: 

Unlike some scheduling algorithms, round robin ensures that all processes will eventually get CPU time, thus preventing starvation.

# Key Components:
  # Inputs:
  
  clk: Clock signal for synchronization.
  
  reset_n: Active low reset signal.
  
  req: 4-bit input vector representing request signals from four different modules.
  
  # Outputs:
  
  grant: 4-bit output vector indicating which of the four requestors is granted access to the resource.
  
  # Ring Counter:
  
  A ring counter generates a rotating token that indicates which requestor’s turn it is to be considered for granting access. This token rotates through four states, ensuring a fair distribution of access.
  
  # Priority Logic:

  Four instances of Priority_Logic are used to determine which requestor can be granted access based on the current token state and incoming requests.
  
  Each instance takes the current token and the request inputs to generate priority outputs.

  
  # Grant Logic:
  The final grant signals are assigned based on the outputs of the priority logic. Each grant signal is a combination of outputs from the different priority logic instances, ensuring that only one requestor is granted access at any given time.
  Operation


