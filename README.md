# Assignment1

1)	The build should trigger as soon as anyone in the dev team checks in code to master branch.

Asnwer - While creating the build pipeline, we will enable the ci option as enabled.
2) There will be test projects which will create and maintained in the solution along the Web and API. The trigger should build all the 3 projects - Web, API and test.
   The build should not be successful if any test fails.
 Answer-
1.	Create a new git repository and place the code files there (.net and web api). 
2.	Also include the test file. Commit the change.
3.	Have a new project created into Azure and select the git as source repository. 
4.	For CI, add a build task select the repository, select the template, select the 
5.	Add a push task.
6.	Trigger the build.
2)	The deployment of code and artifacts should be automated to Dev environment. 
War or jar file that will be directed to dev environment.

Answer - While creating the build pipeline in azure devops, we will enable the ci option as enabled.

3)	Upon successful deployment to the Dev environment, deployment should be easily promoted to QA and Prod through automated process.
Asnwer-
Create the release pipeline, select the artifact as current build (add the approval cycle for QA and prod)). 
Save the release pipeline and check the console


6)	The deployments to QA and Prod should be enabled with Approvals from approvers only.
Answer - 
Create the release pipeline, select the artifact as current build (add the approval cycle for QA and prod)). 

