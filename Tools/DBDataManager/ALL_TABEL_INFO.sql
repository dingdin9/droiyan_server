--Begin
SELECT 表名=case when a.colorder=1 then d.name else '' end,
表说明=case when a.colorder=1 then isnull(f.value,'') else '' end,
字段序号=a.colorder,
字段名=a.name,
标识=case when COLUMNPROPERTY( a.id,a.name,'IsIdentity')=1 then '√'else '' end,
主键=case when exists(SELECT 1 FROM sysobjects where xtype='PK' and parent_obj=a.id and name in (
SELECT name FROM sysindexes WHERE indid in(
SELECT indid FROM sysindexkeys WHERE id = a.id AND colid=a.colid
))) then '√' else '' end,
类型=b.name,
占用字节数=a.length,
长度=COLUMNPROPERTY(a.id,a.name,'PRECISION'),
小数位数=isnull(COLUMNPROPERTY(a.id,a.name,'Scale'),0),
允许空=case when a.isnullable=1 then '√'else '' end,
默认值=isnull(e.text,''),
字段说明=isnull(g.[value],'')
FROM syscolumns a
left join systypes b on a.xusertype=b.xusertype
inner join sysobjects d on a.id=d.id  and d.xtype='U' and  d.name<>'dtproperties'
left join syscomments e on a.cdefault=e.id
left join sysproperties g on a.id=g.id and a.colid=g.smallid
left join sysproperties f on d.id=f.id and f.smallid=0
--where d.name=@ConfigurationTablName
order by a.id,a.colorder
--END