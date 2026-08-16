back-archive - Create backup of files or directories.
=====================================================

### Syntax:

```shell
$ back-archive -new <name-backup>  --> Create new backup config (no spaces)
$ back-archive -shw <name-backup>  --> Show configuration of backup config
$ back-archive -edt <name-backup>  --> Edit configuration of backup config
$ back-archive -del <name-backup>  --> Remove configuration of backup config
$ back-archive -log <name-backup>  --> Show logging of backup configuration
$ back-archive -bck <name-backup>  --> Restore backup of backup configuration
$ back-archive -run <name-backup>  --> Run backup of selected backup config
$ back-archive -run-all            --> Run backup of all backup configurations
$ back-archive -bck-all            --> Restore all created backups
$ back-archive -list               --> List all backup configurations
$ back-archive -list-bck           --> List all backup files
$ back-archive -help               --> Show help
$ back-archive -about              --> Show about
```

### Default configuration:

  * The directory where the `backup settings` are stored:
    
    ```shell
    <back-archive-installation>/conf
    ````
    
  * The directory where the `backups` are stored:
  
    ```shell
    <back-archive-installation>/archive
    ````

  * The directory where the `backup logs` are stored:
  
    ```shell
    <back-archive-installation>/logs

    ````

### Back to README.md
    
* [Go back](/README.md)
  
