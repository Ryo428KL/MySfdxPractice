// 権限セット割り当て
String permissionSetName = 'developPermissionSet';
PermissionSet ps = [SELECT Id FROM PermissionSet WHERE Name = :permissionSetName];
PermissionSetAssignment psa = new PermissionSetAssignment(PermissionSetId=ps.Id, AssigneeId=UserInfo.getUserId());
insert psa;
